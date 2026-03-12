#!/bin/bash
# =============================================================================
# Compile test programs for ibex_simple_system
# =============================================================================
# Usage: ./compile_tests.sh               (compile all tests)
#        ./compile_tests.sh test_name.c   (compile one test)
# =============================================================================

set -e

IBEX="/home/net/al663069/SD2_ws/ibex"
TOOLCHAIN="/home/net/al663069/SD2_ws/SD2_ws/riscv-toolchain/bin"
TESTDIR="$(cd "$(dirname "$0")" && pwd)"
OUTDIR="${TESTDIR}/compiled"

# Check for toolchain
GCC="${TOOLCHAIN}/riscv32-unknown-elf-gcc"
OBJCOPY="${TOOLCHAIN}/riscv32-unknown-elf-objcopy"
if [ ! -x "${GCC}" ]; then
    # Try other locations
    GCC="/home/net/al663069/SD2_ws/riscv-toolchain/bin/riscv32-unknown-elf-gcc"
    OBJCOPY="/home/net/al663069/SD2_ws/riscv-toolchain/bin/riscv32-unknown-elf-objcopy"
fi
if [ ! -x "${GCC}" ]; then
    echo "ERROR: Cannot find riscv32-unknown-elf-gcc"
    exit 1
fi

# Check for srec_cat, fall back to Python script
SREC_CAT=""
BIN2VMEM="${TESTDIR}/bin2vmem.py"
if command -v srec_cat &>/dev/null; then
    SREC_CAT="srec_cat"
elif [ -f "${BIN2VMEM}" ]; then
    echo "Using Python bin2vmem.py (srec_cat not found)"
else
    echo "ERROR: Cannot find srec_cat or bin2vmem.py"
    exit 1
fi

LINKER="${IBEX}/examples/sw/simple_system/common/link.ld"
COMMON_DIR="${IBEX}/examples/sw/simple_system/common"
COMMON_C="${COMMON_DIR}/simple_system_common.c"
CRT0="${COMMON_DIR}/crt0.S"

mkdir -p "${OUTDIR}"

compile_test() {
    local src="$1"
    local name="$(basename "${src}" .c)"

    echo "Compiling: ${name}"

    # Compile
    ${GCC} -march=rv32imc -mabi=ilp32 -Os -nostdlib \
        -T "${LINKER}" \
        -I "${COMMON_DIR}" \
        "${CRT0}" "${COMMON_C}" "${src}" \
        -o "${OUTDIR}/${name}.elf"

    # Create binary
    ${OBJCOPY} -O binary "${OUTDIR}/${name}.elf" "${OUTDIR}/${name}.bin"

    # Create VMEM (no offset - RAM is indexed from 0 internally by $readmemh)
    if [ -n "${SREC_CAT}" ]; then
        ${SREC_CAT} "${OUTDIR}/${name}.bin" -binary \
            -byte-swap 4 -o "${OUTDIR}/${name}.vmem" -vmem
    else
        python3 "${BIN2VMEM}" "${OUTDIR}/${name}.bin" "${OUTDIR}/${name}.vmem"
    fi

    echo "  -> ${OUTDIR}/${name}.vmem"
}

if [ -n "$1" ]; then
    # Compile specific test
    compile_test "$1"
else
    # Compile all .c files in the tests directory
    for src in "${TESTDIR}"/*.c; do
        if [ -f "${src}" ]; then
            compile_test "${src}"
        fi
    done
fi

echo ""
echo "=== Compilation complete ==="
echo "Output directory: ${OUTDIR}"
ls -la "${OUTDIR}"/*.vmem 2>/dev/null
