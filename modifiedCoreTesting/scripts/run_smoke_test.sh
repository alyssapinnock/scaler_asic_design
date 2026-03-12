#!/bin/bash
# run_smoke_test.sh — End-to-end smoke test for the GLS verification flow
#
# This script:
#   1. Compiles the hello_test program into a VMEM file
#   2. Runs the gate-level simulation with the VMEM
#   3. Checks for successful termination
#
# If this passes, it means:
#   - The netlist + standard cell library compile correctly
#   - The config cfg binding resolves coreLibCMO.ibex_core properly
#   - The GNG generates randbits, share splitting/recombining works
#   - The masked ibex_core (netlist) can fetch instructions from SRAM
#   - The core executes the hello_test program to completion
#   - simulator_ctrl terminates the simulation via $finish
#
# Usage:
#   ./run_smoke_test.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   GLS Smoke Test — Masked Ibex Netlist       ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# ─── Step 1: Compile hello_test ───
echo ">>> Step 1: Compiling hello_test..."
echo ""

bash "${SCRIPT_DIR}/compile_test.sh" hello_test
COMPILE_EXIT=$?

if [ $COMPILE_EXIT -ne 0 ]; then
    echo ""
    echo "SMOKE TEST FAILED: Compilation error (exit code $COMPILE_EXIT)"
    exit 1
fi

VMEM_FILE="${SCRIPT_DIR}/../logs/compiled_tests/hello_test.vmem"
if [ ! -f "$VMEM_FILE" ]; then
    echo "SMOKE TEST FAILED: hello_test.vmem not found at $VMEM_FILE"
    exit 1
fi

echo ""
echo ">>> Step 2: Running GLS..."
echo ""

# Run with a reasonable timeout for a simple test
# hello_test should finish quickly — 500K cycles should be plenty
# (even at GLS speed which is ~10-100x slower than RTL)
bash "${SCRIPT_DIR}/run_gls_test.sh" "$VMEM_FILE" +timeout_cycles=2000000
GLS_EXIT=$?

# ─── Step 3: Check results ───
echo ""
echo ">>> Step 3: Checking results..."
echo ""

# Find the most recent run directory
LATEST_RUN=$(ls -td "${SCRIPT_DIR}/../logs/hello_test_"* 2>/dev/null | head -1)

if [ -z "$LATEST_RUN" ]; then
    echo "SMOKE TEST FAILED: No run directory found"
    exit 1
fi

RESULT_FILE="${LATEST_RUN}/result.txt"
XR_LOG="${LATEST_RUN}/xrun.log"
BUS_TRACE="${LATEST_RUN}/gls_bus_trace.log"
SIM_LOG="${LATEST_RUN}/ibex_simple_system.log"

echo "  Run directory: $LATEST_RUN"
echo ""

# Check result
if [ -f "$RESULT_FILE" ]; then
    RESULT=$(cat "$RESULT_FILE")
else
    RESULT="NO_RESULT_FILE"
fi

# Print the simulator_ctrl output log if it exists
if [ -f "$SIM_LOG" ]; then
    echo "  simulator_ctrl output (ibex_simple_system.log):"
    echo "  ------------------------------------------------"
    head -20 "$SIM_LOG" | sed 's/^/    /'
    echo "  ------------------------------------------------"
    echo ""
fi

# Print bus trace summary
if [ -f "$BUS_TRACE" ]; then
    IFETCH_COUNT=$(grep -c "^[0-9]* IF " "$BUS_TRACE" 2>/dev/null || echo "0")
    DWRITE_COUNT=$(grep -c "^[0-9]* DW " "$BUS_TRACE" 2>/dev/null || echo "0")
    DREAD_COUNT=$(grep -c "^[0-9]* DR " "$BUS_TRACE" 2>/dev/null || echo "0")
    echo "  Bus trace summary:"
    echo "    Instruction fetches: $IFETCH_COUNT"
    echo "    Data writes:         $DWRITE_COUNT"
    echo "    Data reads:          $DREAD_COUNT"
    echo ""
fi

echo ""
echo "╔══════════════════════════════════════════════╗"
if [ "$RESULT" = "PASS" ]; then
    echo "║   SMOKE TEST: PASS                            ║"
    echo "║   The masked Ibex netlist executed hello_test  ║"
    echo "║   and terminated successfully!                 ║"
else
    echo "║   SMOKE TEST: FAIL ($RESULT)                   "
    echo "║   Check: $XR_LOG"
    if [ -f "$XR_LOG" ]; then
        echo "║"
        echo "║   Last 10 lines of xrun.log:"
        tail -10 "$XR_LOG" | sed 's/^/║     /'
    fi
fi
echo "╚══════════════════════════════════════════════╝"
echo ""

if [ "$RESULT" = "PASS" ]; then
    exit 0
else
    exit 1
fi
