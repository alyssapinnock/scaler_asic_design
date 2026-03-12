#!/bin/bash
# compile_test.sh — Compile a simple_system test into a VMEM file
#
# Usage:
#   ./compile_test.sh hello_test
#   ./compile_test.sh dit_test
#   ./compile_test.sh /path/to/custom_test.c
#
# This script uses the existing baseline_ibex simple_system build infrastructure
# (common.mk, link.ld, crt0.S) to compile a test program into:
#   - <test>.elf  (linked ELF)
#   - <test>.bin  (raw binary)
#   - <test>.vmem (Verilog hex memory file for $readmemh)
#
# The VMEM file can then be passed to run_gls_test.sh.
#
# Prerequisites:
#   - riscv32-unknown-elf-gcc (from SD2_ws/riscv-toolchain)
#   - srec_cat (from srecord package) OR Python 3 as fallback

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"   # = scaler_asic_design
OUTPUT_DIR="${SCRIPT_DIR}/../logs/compiled_tests"

# RISC-V toolchain (within SD2_ws)
RISCV_TOOLCHAIN="${PROJ_ROOT}/../../riscv-toolchain"
if [ -d "$RISCV_TOOLCHAIN/bin" ]; then
    export PATH="${RISCV_TOOLCHAIN}/bin:${PATH}"
fi

# Python (within SD2_ws, for VMEM fallback)
PYTHON_DIR="${PROJ_ROOT}/../../python-3.10"
if [ -d "$PYTHON_DIR/bin" ]; then
    export PATH="${PYTHON_DIR}/bin:${PATH}"
fi

# simple_system common infrastructure
SS_COMMON="${PROJ_ROOT}/baseline_ibex/examples/sw/simple_system/common"
SS_TESTS="${PROJ_ROOT}/baseline_ibex/examples/sw/simple_system"

# ─── Arguments ───
if [ $# -lt 1 ]; then
    echo "Usage: $0 <test_name_or_source_file>"
    echo ""
    echo "Built-in tests (from baseline_ibex/examples/sw/simple_system):"
    echo "  hello_test       - Prints 'Hello simple system', tests timer"
    echo "  dit_test         - Data-independent timing test"
    echo "  dummy_instr_test - Dummy instruction insertion test"
    echo "  pmp_smoke_test   - PMP basic functionality test"
    echo ""
    echo "Or provide a path to a custom .c or .S file."
    exit 1
fi

TEST_INPUT="$1"
shift

# ─── Determine test source ───
USE_BUILTIN_MAKE=0
if [ -f "$TEST_INPUT" ]; then
    # User provided a direct file path
    TEST_SOURCE="$(cd "$(dirname "$TEST_INPUT")" && pwd)/$(basename "$TEST_INPUT")"
    TEST_NAME="$(basename "$TEST_INPUT" .c)"
    TEST_NAME="$(basename "$TEST_NAME" .S)"
elif [ -d "${SS_TESTS}/${TEST_INPUT}" ]; then
    # Built-in test from baseline_ibex
    TEST_NAME="$TEST_INPUT"
    # Use the Makefile in that directory
    USE_BUILTIN_MAKE=1
else
    echo "ERROR: Cannot find test: $TEST_INPUT"
    echo "Looked for file: $TEST_INPUT"
    echo "Looked for directory: ${SS_TESTS}/${TEST_INPUT}"
    exit 1
fi

# ─── Verify toolchain ───
if ! command -v riscv32-unknown-elf-gcc &>/dev/null; then
    echo "ERROR: riscv32-unknown-elf-gcc not found on PATH"
    echo "Expected at: ${RISCV_TOOLCHAIN}/bin/"
    exit 1
fi

echo "=============================================="
echo " Simple System Test Compiler"
echo "=============================================="
echo " Test:     $TEST_NAME"
echo " Toolchain: $(which riscv32-unknown-elf-gcc)"
echo "=============================================="

mkdir -p "$OUTPUT_DIR"

# ─── Compile ───
if [ "${USE_BUILTIN_MAKE:-}" = "1" ]; then
    # Use the built-in Makefile but only build up to .bin
    # (skip .vmem target since srec_cat may not be installed)
    echo ">>> Using built-in Makefile for ${TEST_NAME}..."
    cd "${SS_TESTS}/${TEST_NAME}"
    make clean 2>/dev/null || true
    make "${TEST_NAME}.bin" PROGRAM="${TEST_NAME}"

    # Copy outputs
    cp "${TEST_NAME}.elf" "$OUTPUT_DIR/" 2>/dev/null || true
    cp "${TEST_NAME}.bin" "$OUTPUT_DIR/"

    if [ ! -f "$OUTPUT_DIR/${TEST_NAME}.bin" ]; then
        echo "ERROR: No .bin file produced"
        exit 1
    fi
else
    # Manual compilation for custom source files
    echo ">>> Compiling ${TEST_SOURCE}..."

    CC=riscv32-unknown-elf-gcc
    OBJCOPY=riscv32-unknown-elf-objcopy
    LINKER_SCRIPT="${SS_COMMON}/link.ld"
    CRT="${SS_COMMON}/crt0.S"
    ARCH="rv32im"
    CFLAGS="-march=${ARCH} -mabi=ilp32 -static -mcmodel=medany -Wall -g -Os \
            -fvisibility=hidden -nostdlib -nostartfiles -ffreestanding"
    COMMON_SRCS="${SS_COMMON}/simple_system_common.c"
    INCS="-I${SS_COMMON}"

    cd "$OUTPUT_DIR"

    # Compile CRT
    $CC $CFLAGS -MMD -c $INCS -o crt0.o "$CRT"

    # Compile common library
    $CC $CFLAGS -MMD -c $INCS -o simple_system_common.o "$COMMON_SRCS"

    # Compile test source
    EXT="${TEST_SOURCE##*.}"
    $CC $CFLAGS -MMD -c $INCS -o "${TEST_NAME}.o" "$TEST_SOURCE"

    # Link
    $CC $CFLAGS -T "$LINKER_SCRIPT" \
        crt0.o simple_system_common.o "${TEST_NAME}.o" \
        -o "${TEST_NAME}.elf"

    # Generate binary
    $OBJCOPY -O binary "${TEST_NAME}.elf" "${TEST_NAME}.bin"
fi

# ─── Generate VMEM if not already created ───
cd "$OUTPUT_DIR"
if [ ! -f "${TEST_NAME}.vmem" ]; then
    if command -v srec_cat &>/dev/null; then
        echo ">>> Generating VMEM via srec_cat..."
        srec_cat "${TEST_NAME}.bin" -binary -offset 0x0000 -byte-swap 4 \
                 -o "${TEST_NAME}.vmem" -vmem
    elif command -v python3 &>/dev/null; then
        echo ">>> Generating VMEM via Python 3 fallback..."
        python3 -c "
import sys
data = open('${TEST_NAME}.bin', 'rb').read()
# Pad to 4-byte alignment
while len(data) % 4 != 0:
    data += b'\\x00'
with open('${TEST_NAME}.vmem', 'w') as f:
    for i in range(0, len(data), 4):
        word = int.from_bytes(data[i:i+4], 'little')
        f.write(f'@{i//4:08X} {word:08X}\n')
print(f'Generated ${TEST_NAME}.vmem: {len(data)//4} words')
"
    else
        echo "ERROR: Neither srec_cat nor python3 available for VMEM generation"
        exit 1
    fi
fi

# ─── Report ───
VMEM_PATH="${OUTPUT_DIR}/${TEST_NAME}.vmem"
if [ -f "$VMEM_PATH" ]; then
    VMEM_WORDS=$(wc -l < "$VMEM_PATH")
    echo ""
    echo "=============================================="
    echo " Compilation successful!"
    echo "=============================================="
    echo " ELF:  ${OUTPUT_DIR}/${TEST_NAME}.elf"
    echo " BIN:  ${OUTPUT_DIR}/${TEST_NAME}.bin"
    echo " VMEM: ${VMEM_PATH} (${VMEM_WORDS} lines)"
    echo ""
    echo " To run GLS:"
    echo "   ${SCRIPT_DIR}/run_gls_test.sh ${VMEM_PATH}"
    echo ""
else
    echo "ERROR: VMEM file was not created"
    exit 1
fi
