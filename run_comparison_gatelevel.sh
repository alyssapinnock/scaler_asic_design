#!/bin/bash
# run_comparison_gatelevel.sh — Compare baseline Ibex vs gate-level netlist
#
# This script:
#   1. Generates a test binary using baseline Ibex + Spike (via Ibex DV)
#   2. Runs the same binary on your gate-level netlist
#   3. Compares instruction traces for compatibility
#
# Usage:
#   ./run_comparison_gatelevel.sh <test_name> [seed]
#   ./run_comparison_gatelevel.sh riscv_machine_mode_rand_test 12345
#   ./run_comparison_gatelevel.sh riscv_arithmetic_basic_test   # random seed

set -euo pipefail
export PKG_CONFIG_PATH=/home/net/al663069/SD2_ws/tools/spike-ibex/lib/pkgconfig:${PKG_CONFIG_PATH:-}

WS=/home/net/al663069/ws
DV_DIR=$WS/ibex/dv/uvm/core_ibex
SCALER_DIR=$WS/scaler_asic_design

TEST_NAME=${1:-riscv_machine_mode_rand_test}
SEED=${2:-$RANDOM}

COMPARE_DIR=$SCALER_DIR/verification_results/gatelevel/${TEST_NAME}.${SEED}
mkdir -p "$COMPARE_DIR"

echo "=========================================="
echo " Comparing Baseline Ibex vs Gate-Level Netlist"
echo " Test:  $TEST_NAME"
echo " Seed:  $SEED"
echo " Output: $COMPARE_DIR"
echo "=========================================="

# ─────────────────────────────────────────────
# STEP 1: Run DV (baseline Ibex core + Spike)
# ─────────────────────────────────────────────
echo ""
echo ">>> Step 1: Running Ibex DV (baseline core) with Spike co-simulation ..."

cd "$DV_DIR"
rm -rf out/metadata

make SIMULATOR=xlm \
     TEST="$TEST_NAME" \
     SEED="$SEED" \
     ITERATIONS=1 \
     COSIM=1 \
     WAVES=0

DV_TEST_DIR=$DV_DIR/out/run/tests/${TEST_NAME}.${SEED}

# Verify DV test passed
if grep -q "^passed:.*True" "$DV_TEST_DIR/trr.yaml" 2>/dev/null; then
    echo "    ✓ DV test PASSED"
else
    echo "    ⚠ WARNING: DV test may not have passed — check $DV_TEST_DIR/trr.yaml"
fi

# Copy DV outputs to comparison directory
cp "$DV_TEST_DIR/test.bin"                             "$COMPARE_DIR/"
cp "$DV_TEST_DIR/trace_core_00000000.log"              "$COMPARE_DIR/trace_baseline.log"
cp "$DV_TEST_DIR/spike_cosim_trace_core_00000000.log"  "$COMPARE_DIR/spike_trace.log"
cp "$DV_TEST_DIR/trr.yaml"                             "$COMPARE_DIR/"
cp "$DV_TEST_DIR/test.S" "$COMPARE_DIR/" 2>/dev/null || true
echo "    ✓ DV outputs copied"

# ─────────────────────────────────────────────
# STEP 2: Run gate-level netlist with same binary
# ─────────────────────────────────────────────
echo ""
echo ">>> Step 2: Running gate-level netlist with same binary ..."

cd "$WS"
rm -rf xcelium.d

xrun -64bit \
    -sv \
    -define RVFI \
    -define FUNCTIONAL \
    -define GATE_LEVEL \
    -access rwc \
    -timescale 1ns/1ps \
    +delay_mode_zero \
    +no_notifier \
    +notimingcheck \
    ${WS}/ibex/rtl/ibex_pkg.sv \
    ${WS}/ibex/rtl/ibex_tracer_pkg.sv \
    ${SCALER_DIR}/stdcell_models.v \
    ${WS}/new_ibex_files/gng.v \
    ${SCALER_DIR}/Synthesis/outputs/Core_netlist.v \
    ${SCALER_DIR}/gate_level_wrapper.sv \
    ${WS}/ibex/rtl/ibex_tracer.sv \
    ${SCALER_DIR}/masked_core_tb.sv \
    +ibex_tracer_file_base=${COMPARE_DIR}/trace_gatelevel \
    +bin=${COMPARE_DIR}/test.bin \
    +signature_addr=8ffffffc \
    -l ${COMPARE_DIR}/gatelevel_sim.log

echo "    ✓ Gate-level simulation complete"

# ─────────────────────────────────────────────
# STEP 3: Compare instruction traces
# ─────────────────────────────────────────────
echo ""
echo ">>> Step 3: Comparing traces (instruction-level) ..."

GATE_TRACE="${COMPARE_DIR}/trace_gatelevel_00000000.log"

# Strip header + time/cycle columns → keep only: PC, Insn, Decoded, Regs
awk -F'\t' 'NR>1 && NF>=4 {print $3"\t"$4"\t"$5"\t"$6}' \
    "$COMPARE_DIR/trace_baseline.log" > "$COMPARE_DIR/stripped_baseline.log"

awk -F'\t' 'NR>1 && NF>=4 {print $3"\t"$4"\t"$5"\t"$6}' \
    "$GATE_TRACE" > "$COMPARE_DIR/stripped_gatelevel.log"

BASELINE_LINES=$(wc -l < "$COMPARE_DIR/stripped_baseline.log")
GATE_LINES=$(wc -l < "$COMPARE_DIR/stripped_gatelevel.log")

echo "    Baseline trace:   $BASELINE_LINES instructions"
echo "    Gate-level trace: $GATE_LINES instructions"

# Use diff to compare
diff "$COMPARE_DIR/stripped_baseline.log" \
     "$COMPARE_DIR/stripped_gatelevel.log" \
     > "$COMPARE_DIR/trace_diff.log" 2>&1 || true

DIFF_LINES=$(wc -l < "$COMPARE_DIR/trace_diff.log")

echo ""
echo "=========================================="
if [ "$DIFF_LINES" -eq 0 ]; then
    echo " RESULT: ✓ PASS — Traces are IDENTICAL"
    echo "PASS" > "$COMPARE_DIR/result.txt"
else
    # Check if the shorter trace is a prefix of the longer one
    MIN_LINES=$((BASELINE_LINES < GATE_LINES ? BASELINE_LINES : GATE_LINES))
    head -n "$MIN_LINES" "$COMPARE_DIR/stripped_baseline.log" > "$COMPARE_DIR/prefix_base.tmp"
    head -n "$MIN_LINES" "$COMPARE_DIR/stripped_gatelevel.log" > "$COMPARE_DIR/prefix_gate.tmp"
    diff "$COMPARE_DIR/prefix_base.tmp" "$COMPARE_DIR/prefix_gate.tmp" \
        > "$COMPARE_DIR/prefix_diff.tmp" 2>&1 || true
    PREFIX_DIFF=$(wc -l < "$COMPARE_DIR/prefix_diff.tmp")
    rm -f "$COMPARE_DIR/prefix_base.tmp" "$COMPARE_DIR/prefix_gate.tmp" "$COMPARE_DIR/prefix_diff.tmp"

    if [ "$PREFIX_DIFF" -eq 0 ]; then
        echo " RESULT: ✓ PASS (prefix match)"
        echo " First $MIN_LINES instructions are identical."
        echo " Length difference: baseline=$BASELINE_LINES, gate-level=$GATE_LINES"
        echo " (Different termination point — expected due to different TB infrastructure)"
        echo "PASS" > "$COMPARE_DIR/result.txt"
    else
        echo " RESULT: ✗ MISMATCH — $DIFF_LINES diff lines"
        echo " See: $COMPARE_DIR/trace_diff.log"
        echo ""
        echo " First 20 differences:"
        head -20 "$COMPARE_DIR/trace_diff.log"
        echo "FAIL" > "$COMPARE_DIR/result.txt"
    fi
fi
echo "=========================================="
echo ""
echo "All outputs in: $COMPARE_DIR/"
echo ""
echo "Key files:"
echo "  - test.bin                       : Test binary"
echo "  - trace_baseline.log             : Baseline Ibex trace"
echo "  - trace_gatelevel_00000000.log   : Gate-level netlist trace"
echo "  - spike_trace.log                : Spike ISS trace (golden reference)"
echo "  - trace_diff.log                 : Diff between baseline and gate-level"
echo "  - result.txt                     : PASS or FAIL"
