#!/bin/bash
# run_standalone_gls.sh — Run standalone GLS test
#
# Usage:
#   ./run_standalone_gls.sh <vmem_file> [+plusargs...]
#
# This testbench directly instantiates the gate-level netlist ibex_core
# with a simple memory model, register file, and bus logger.
# No ibex_top / ibex_simple_system wrapper is used.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
TEST_DIR="${SCRIPT_DIR}/.."
LOG_DIR="${TEST_DIR}/logs"

NETLIST="${PROJ_ROOT}/Synthesis/outputs/Core_netlist.v"
STD_CELLS="${TEST_DIR}/tb/std_cells_functional.v"
TB="${TEST_DIR}/tb/standalone_gls_tb.sv"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <vmem_file> [+plusargs...]"
    exit 1
fi

VMEM_FILE="$1"
shift
EXTRA_ARGS="${@:-}"

# Resolve VMEM to absolute path
if [[ ! "$VMEM_FILE" = /* ]]; then
    VMEM_FILE="$(pwd)/$VMEM_FILE"
fi

if [ ! -f "$VMEM_FILE" ]; then
    echo "ERROR: VMEM file not found: $VMEM_FILE"
    exit 1
fi

TEST_NAME="$(basename "$VMEM_FILE" .vmem)"
RUN_DIR="${LOG_DIR}/standalone_${TEST_NAME}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RUN_DIR"

echo "=============================================="
echo " Standalone GLS Test"
echo "=============================================="
echo " Netlist:   $NETLIST"
echo " Std Cells: $STD_CELLS"
echo " VMEM:      $VMEM_FILE"
echo " Run dir:   $RUN_DIR"
echo "=============================================="

cd "$RUN_DIR"

xrun -64bit \
    -sv \
    -access rwc \
    -noassert \
    -timescale 1ns/1ps \
    +xminitReg+0 \
    "${STD_CELLS}" \
    "${NETLIST}" \
    "${TB}" \
    -top standalone_gls_tb \
    +SRAMInitFile="${VMEM_FILE}" \
    +bus_trace_file="${RUN_DIR}/gls_bus_trace.log" \
    +timeout_cycles=500000 \
    ${EXTRA_ARGS} \
    -l "${RUN_DIR}/xrun.log" \
    2>&1 | tee "${RUN_DIR}/console.log"

XRUN_EXIT=$?

echo ""
echo "=============================================="
if [ $XRUN_EXIT -eq 0 ]; then
    if grep -q "Simulation halt requested" "${RUN_DIR}/xrun.log" 2>/dev/null; then
        echo " RESULT: PASS — Test completed normally"
        echo "PASS" > "${RUN_DIR}/result.txt"
    elif grep -q "TIMEOUT" "${RUN_DIR}/xrun.log" 2>/dev/null; then
        echo " RESULT: FAIL — Test timed out"
        echo "TIMEOUT" > "${RUN_DIR}/result.txt"
    else
        echo " RESULT: UNKNOWN"
        echo "UNKNOWN" > "${RUN_DIR}/result.txt"
    fi
else
    echo " RESULT: ERROR — xrun exited with code $XRUN_EXIT"
    echo "ERROR" > "${RUN_DIR}/result.txt"
fi
echo "=============================================="
echo ""
echo "Outputs:"
echo "  Log:       ${RUN_DIR}/xrun.log"
echo "  Bus trace: ${RUN_DIR}/gls_bus_trace.log"
echo "  Console:   ${RUN_DIR}/console.log"
echo ""
