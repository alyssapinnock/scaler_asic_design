#!/bin/bash
# run_batch_comparison.sh — Batch comparison testing
#
# Runs multiple tests with different seeds, comparing baseline Ibex vs
# your modified RTL or gate-level netlist
#
# Usage:
#   ./run_batch_comparison.sh [modified_rtl|gatelevel]

set -euo pipefail

MODE=${1:-modified_rtl}
WS=/home/net/al663069/ws
SCALER_DIR=$WS/scaler_asic_design

if [ "$MODE" != "modified_rtl" ] && [ "$MODE" != "gatelevel" ]; then
    echo "Usage: $0 [modified_rtl|gatelevel]"
    exit 1
fi

echo "=========================================="
echo " Batch Comparison Testing"
echo " Mode: $MODE"
echo " $(date)"
echo "=========================================="

# ── Define your seeds here ──
SEEDS=(1000 2000 3000)

# ── Define tests ──
TESTS=(
    "riscv_arithmetic_basic_test"
    "riscv_machine_mode_rand_test"
    "riscv_rand_jump_test"
)

# ── Output directories ──
RESULTS_DIR=$SCALER_DIR/verification_results/${MODE}_batch
mkdir -p "$RESULTS_DIR"

RESULTS_FILE=$RESULTS_DIR/batch_results.txt
SUMMARY_FILE=$RESULTS_DIR/batch_summary.txt

echo "Batch comparison — $(date)" > "$RESULTS_FILE"
echo "Mode: $MODE" >> "$RESULTS_FILE"
echo "Tests: ${#TESTS[@]}, Seeds: ${SEEDS[*]}" >> "$RESULTS_FILE"
echo "==========================================" >> "$RESULTS_FILE"

# Summary header
printf "%-45s %6s %s\n" "TEST" "SEED" "RESULT" > "$SUMMARY_FILE"
printf "%-45s %6s %s\n" "----" "----" "------" >> "$SUMMARY_FILE"

PASS=0
FAIL=0
TOTAL=0

for TEST in "${TESTS[@]}"; do
    for SEED in "${SEEDS[@]}"; do
        TOTAL=$((TOTAL + 1))
        echo ""
        echo "===== [$TOTAL] $TEST  seed=$SEED ====="

        if [ "$MODE" == "modified_rtl" ]; then
            SCRIPT="$SCALER_DIR/run_comparison_modified_rtl.sh"
        else
            SCRIPT="$SCALER_DIR/run_comparison_gatelevel.sh"
        fi

        if "$SCRIPT" "$TEST" "$SEED" 2>&1 | tee -a "$RESULTS_FILE"; then
            RESULT_DIR=$SCALER_DIR/verification_results/${MODE}/${TEST}.${SEED}
            RESULT_FILE=$RESULT_DIR/result.txt
            if [ -f "$RESULT_FILE" ] && grep -q "PASS" "$RESULT_FILE"; then
                PASS=$((PASS + 1))
                echo "  >> ✓ PASS" | tee -a "$RESULTS_FILE"
                printf "%-45s %6s %s\n" "$TEST" "$SEED" "PASS" >> "$SUMMARY_FILE"
            else
                FAIL=$((FAIL + 1))
                echo "  >> ✗ FAIL (trace mismatch)" | tee -a "$RESULTS_FILE"
                printf "%-45s %6s %s\n" "$TEST" "$SEED" "FAIL (mismatch)" >> "$SUMMARY_FILE"
            fi
        else
            FAIL=$((FAIL + 1))
            echo "  >> ✗ FAIL (run error)" | tee -a "$RESULTS_FILE"
            printf "%-45s %6s %s\n" "$TEST" "$SEED" "FAIL (run error)" >> "$SUMMARY_FILE"
        fi

        echo "" >> "$RESULTS_FILE"
    done
done

# Summary footer
echo "" >> "$SUMMARY_FILE"
echo "==========================================" >> "$SUMMARY_FILE"
echo " $PASS passed, $FAIL failed out of $TOTAL total" >> "$SUMMARY_FILE"
echo " Seeds: ${SEEDS[*]}" >> "$SUMMARY_FILE"
echo " $(date)" >> "$SUMMARY_FILE"

echo ""
echo "==========================================" | tee -a "$RESULTS_FILE"
echo " BATCH SUMMARY: $PASS passed, $FAIL failed out of $TOTAL total" | tee -a "$RESULTS_FILE"
echo " Seeds used: ${SEEDS[*]}" | tee -a "$RESULTS_FILE"
echo "==========================================" | tee -a "$RESULTS_FILE"
echo ""
echo "Summary written to: $SUMMARY_FILE"
cat "$SUMMARY_FILE"
echo ""
echo "Detailed results in: $RESULTS_DIR/"
