#!/bin/bash
# run_gls_test.sh — Run a single gate-level simulation test
#
# Usage:
#   ./run_gls_test.sh <path_to_vmem_file>
#   ./run_gls_test.sh /path/to/hello_test.vmem
#   ./run_gls_test.sh hello_test.vmem +timeout_cycles=5000000
#
# This script:
#   1. Compiles the gate-level netlist + standard cells into coreLibCMO library
#   2. Compiles all RTL and the testbench from gls_sim.f
#   3. Runs the simulation with the test VMEM loaded into SRAM
#
# The 'config cfg' block in ibex_core_wrapper.sv tells the elaborator:
#   instance ibex_core_wrapper.u_masked use coreLibCMO.ibex_core;
# This swaps the RTL ibex_core for the gate-level netlist at elaboration time.
#
# Prerequisites:
#   - Cadence Xcelium (xrun) on PATH
#   - No sudo required

set -euo pipefail

# ─── Paths ───
# Resolve this script's directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"   # = scaler_asic_design
TEST_DIR="${SCRIPT_DIR}/../"                       # = modifiedCoreTesting
LOG_DIR="${TEST_DIR}/logs"

# Key source locations (all within SD2_ws/scaler_asic_design)
NETLIST="${PROJ_ROOT}/Synthesis/outputs/Core_netlist.v"
STD_CELLS="${TEST_DIR}/tb/std_cells_functional.v"
FILELIST="${TEST_DIR}/filelist/gls_sim.f"

# Export PROJ_ROOT so xrun can expand ${PROJ_ROOT} in the .f filelist
export PROJ_ROOT

# ─── Arguments ───
if [ $# -lt 1 ]; then
    echo "Usage: $0 <vmem_file> [+plusargs...]"
    echo ""
    echo "Example:"
    echo "  $0 /path/to/hello_test.vmem"
    echo "  $0 hello_test.vmem +timeout_cycles=5000000"
    exit 1
fi

VMEM_FILE="$1"
shift
EXTRA_ARGS="$@"

# Resolve VMEM to absolute path
if [[ ! "$VMEM_FILE" = /* ]]; then
    VMEM_FILE="$(pwd)/$VMEM_FILE"
fi

if [ ! -f "$VMEM_FILE" ]; then
    echo "ERROR: VMEM file not found: $VMEM_FILE"
    exit 1
fi

# ─── Verify key files exist ───
for f in "$NETLIST" "$STD_CELLS" "$FILELIST"; do
    if [ ! -f "$f" ]; then
        echo "ERROR: Required file not found: $f"
        exit 1
    fi
done

# ─── Setup ───
TEST_NAME="$(basename "$VMEM_FILE" .vmem)"
RUN_DIR="${LOG_DIR}/${TEST_NAME}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RUN_DIR"

echo "=============================================="
echo " GLS Test Runner"
echo "=============================================="
echo " Project:  $PROJ_ROOT"
echo " Netlist:  $NETLIST"
echo " Std Cells: $STD_CELLS"
echo " VMEM:     $VMEM_FILE"
echo " Run dir:  $RUN_DIR"
echo "=============================================="

# Work from the run directory so Xcelium outputs go there
cd "$RUN_DIR"

# ─── Run Xcelium ───
# The -makelib/-endlib block compiles the netlist and standard cells into
# the coreLibCMO library. The 'config cfg' in ibex_core_wrapper.sv then
# resolves: instance ibex_core_wrapper.u_masked use coreLibCMO.ibex_core
#
# Key flags:
#   -64bit          : 64-bit mode (for large designs)
#   -sv             : Enable SystemVerilog
#   -access rwc     : Full access for hierarchical references in TB
#   -timescale      : Default timescale
#   -defparam       : Override SRAMInitFile to load the test VMEM
#   -top cfg        : Tell elaborator to use the config block as top-level config
#
# Note: ${PROJ_ROOT} in gls_sim.f is expanded by xrun from the environment
# variable PROJ_ROOT (exported above).

echo ""
echo ">>> Compiling and running GLS..."
echo ""

xrun -64bit \
    -sv \
    -access rwc \
    -noassert \
    -timescale 1ns/1ps \
    +xminitReg+0 \
    "${STD_CELLS}" \
    "${NETLIST}" \
    -f "${FILELIST}" \
    -top gls_simple_system_tb \
    -defparam "gls_simple_system_tb.u_simple_sys.SRAMInitFile=\"${VMEM_FILE}\"" \
    +bus_trace_file="${RUN_DIR}/gls_bus_trace.log" \
    +ibex_tracer_file_base="${RUN_DIR}/trace_gls" \
    ${EXTRA_ARGS} \
    -l "${RUN_DIR}/xrun.log" \
    2>&1 | tee "${RUN_DIR}/console.log"

XRUN_EXIT=$?

# ─── Check results ───
echo ""
echo "=============================================="

if [ $XRUN_EXIT -eq 0 ]; then
    # Check for the normal termination message from simulator_ctrl
    if grep -q "Terminating simulation by software request" "${RUN_DIR}/xrun.log" 2>/dev/null; then
        echo " RESULT: PASS — Test completed normally"
        echo "PASS" > "${RUN_DIR}/result.txt"
    elif grep -q "TIMEOUT" "${RUN_DIR}/xrun.log" 2>/dev/null; then
        echo " RESULT: FAIL — Test timed out"
        echo "TIMEOUT" > "${RUN_DIR}/result.txt"
    else
        echo " RESULT: UNKNOWN — Simulation finished but no termination message found"
        echo " Check: ${RUN_DIR}/xrun.log"
        echo "UNKNOWN" > "${RUN_DIR}/result.txt"
    fi
else
    echo " RESULT: ERROR — xrun exited with code $XRUN_EXIT"
    echo " Check: ${RUN_DIR}/xrun.log"
    echo "ERROR" > "${RUN_DIR}/result.txt"
fi

echo "=============================================="
echo ""
echo "Outputs:"
echo "  Log:       ${RUN_DIR}/xrun.log"
echo "  Bus trace: ${RUN_DIR}/gls_bus_trace.log"
echo "  Console:   ${RUN_DIR}/console.log"
echo "  Result:    ${RUN_DIR}/result.txt"
echo ""
