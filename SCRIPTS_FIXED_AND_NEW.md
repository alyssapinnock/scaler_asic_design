# Scripts Fixed and New Comparison Scripts Created

## Issue Fixed

The original `run_modified_rtl_sim.sh` and `run_gatelevel_sim.sh` had syntax errors due to quote handling in the heredoc. These have been fixed.

## Your Workflow (Comparison-Based Testing)

Based on your existing `run_batch.sh` and `run_comparison.sh`, I now understand you want:

1. **Generate test binary** using baseline Ibex + Spike (via Ibex DV)
2. **Run same binary** on your modified core (RTL or gate-level)
3. **Compare traces** to verify functional equivalence

This is different from the UVM-based approach I initially set up.

## New Scripts Created

### 1. run_comparison_modified_rtl.sh
Compares baseline Ibex vs your modified RTL core.

**Usage:**
```bash
# With specific test and seed
./run_comparison_modified_rtl.sh riscv_machine_mode_rand_test 12345

# With random seed
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test

# Default test (riscv_machine_mode_rand_test) with random seed
./run_comparison_modified_rtl.sh
```

**What it does:**
1. Runs Ibex DV to generate test binary + baseline trace + Spike trace
2. Runs your modified RTL testbench (`modified_rtl_tb.sv`) with same binary
3. Compares instruction traces
4. Reports PASS/FAIL

**Output:**
```
verification_results/modified_rtl/<test>.<seed>/
├── test.bin                      - Test binary
├── trace_baseline.log            - Baseline Ibex trace
├── trace_modified_00000000.log   - Modified RTL trace
├── spike_trace.log               - Spike ISS trace (golden)
├── trace_diff.log                - Diff output
└── result.txt                    - PASS or FAIL
```

### 2. run_comparison_gatelevel.sh
Compares baseline Ibex vs your gate-level netlist.

**Usage:**
```bash
# Same as modified RTL script
./run_comparison_gatelevel.sh riscv_machine_mode_rand_test 12345
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test
./run_comparison_gatelevel.sh
```

**What it does:**
1. Runs Ibex DV to generate test binary + baseline trace + Spike trace
2. Runs gate-level netlist testbench (`masked_core_tb.sv`) with same binary
3. Compares instruction traces
4. Reports PASS/FAIL

**Output:**
```
verification_results/gatelevel/<test>.<seed>/
├── test.bin                        - Test binary
├── trace_baseline.log              - Baseline Ibex trace
├── trace_gatelevel_00000000.log    - Gate-level trace
├── spike_trace.log                 - Spike ISS trace (golden)
├── trace_diff.log                  - Diff output
└── result.txt                      - PASS or FAIL
```

### 3. run_batch_comparison.sh
Batch testing with multiple tests and seeds.

**Usage:**
```bash
# Test modified RTL
./run_batch_comparison.sh modified_rtl

# Test gate-level netlist
./run_batch_comparison.sh gatelevel
```

**What it does:**
1. Runs multiple tests with different seeds
2. Calls appropriate comparison script for each
3. Generates summary report

**Configuration:**
Edit the script to change:
```bash
SEEDS=(1000 2000 3000)  # Add more seeds

TESTS=(
    "riscv_arithmetic_basic_test"
    "riscv_machine_mode_rand_test"
    "riscv_rand_jump_test"
    # Add more tests
)
```

**Output:**
```
verification_results/modified_rtl_batch/  (or gatelevel_batch/)
├── batch_results.txt    - Detailed log
└── batch_summary.txt    - Summary table

Example summary:
TEST                                          SEED  RESULT
----                                          ----  ------
riscv_arithmetic_basic_test                   1000  PASS
riscv_arithmetic_basic_test                   2000  PASS
riscv_machine_mode_rand_test                  1000  PASS
...
==========================================
 3 passed, 0 failed out of 3 total
```

## Original Scripts (Also Fixed)

These still work for running simulations directly (without comparison):

### 4. run_modified_rtl_sim.sh
Runs modified RTL through Ibex DV/UVM environment.

**Usage:**
```bash
./run_modified_rtl_sim.sh
./run_modified_rtl_sim.sh -gui
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test
```

### 5. run_gatelevel_sim.sh
Runs gate-level netlist through Ibex DV/UVM environment.

**Usage:**
```bash
./run_gatelevel_sim.sh
./run_gatelevel_sim.sh -gui
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test
```

## Which Scripts to Use?

### For Goal 1 (Gate-Level Functional Verification)

**Recommended: Comparison-based approach**
```bash
# Single test
./run_comparison_gatelevel.sh riscv_machine_mode_rand_test 1000

# Batch testing
./run_batch_comparison.sh gatelevel
```

**Why:** Directly compares against baseline Ibex + Spike, proves functional equivalence.

### For Goal 2 (Modified RTL + Interrupt Latency)

**For functional verification:**
```bash
./run_comparison_modified_rtl.sh riscv_machine_mode_rand_test 1000
./run_batch_comparison.sh modified_rtl
```

**For interrupt latency measurement:**
Look at your existing `run_batch_interrupt.sh` - it's specifically designed for this.
I can help adapt it to work with the new file structure if needed.

## Available RISC-V Tests

From the Ibex DV environment:

**Basic Tests:**
- `riscv_arithmetic_basic_test` - Basic ALU operations
- `riscv_machine_mode_rand_test` - Random machine mode instructions
- `riscv_rand_instr_test` - Random instructions
- `riscv_rand_jump_test` - Random jumps/branches

**Interrupt Tests:**
- `riscv_single_interrupt_test`
- `riscv_multiple_interrupt_test`
- `riscv_interrupt_wfi_test`
- `riscv_nested_interrupt_test`
- `riscv_interrupt_csr_test`

**Stress Tests:**
- `riscv_jump_stress_test`
- `riscv_loop_test`
- `riscv_mmu_stress_test`

**Memory Tests:**
- `riscv_unaligned_load_store_test`

**Other:**
- `riscv_illegal_instr_test`
- `riscv_hint_instr_test`
- `riscv_ebreak_test`
- `riscv_user_mode_rand_test`
- `riscv_pmp_basic_test`

## Quick Start

### Test Modified RTL

```bash
cd /home/net/al663069/ws/scaler_asic_design

# Single test
./run_comparison_modified_rtl.sh riscv_machine_mode_rand_test 1000

# Check results
cat verification_results/modified_rtl/riscv_machine_mode_rand_test.1000/result.txt

# Batch test
./run_batch_comparison.sh modified_rtl
```

### Test Gate-Level Netlist

```bash
cd /home/net/al663069/ws/scaler_asic_design

# Single test (START HERE)
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000

# Check results
cat verification_results/gatelevel/riscv_arithmetic_basic_test.1000/result.txt

# If single test passes, run batch
./run_batch_comparison.sh gatelevel
```

## Troubleshooting

### Script Syntax Errors
Fixed! The quote handling issue in the heredoc has been resolved.

### Test Binary Not Generated
Check that Ibex DV is working:
```bash
cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex
make SIMULATOR=xlm TEST=riscv_arithmetic_basic_test SEED=1000 ITERATIONS=1
```

### Trace Comparison Fails
1. Check that both simulations completed
2. Look at `trace_diff.log` for details
3. Manually compare first few instructions
4. May be legitimate difference (investigate)

### Simulation Hangs
- Check xcelium.d directory (delete if corrupted)
- Verify binary is valid
- Check simulation logs

## Summary

You now have:
1. ✅ Fixed UVM simulation scripts (run_modified_rtl_sim.sh, run_gatelevel_sim.sh)
2. ✅ New comparison scripts matching your workflow (run_comparison_*.sh)
3. ✅ Batch testing script (run_batch_comparison.sh)
4. ✅ Clear documentation of what each does

**Recommended workflow:**
1. Test modified RTL with comparison: `./run_comparison_modified_rtl.sh`
2. Test gate-level with comparison: `./run_comparison_gatelevel.sh`
3. If both pass, run batch tests: `./run_batch_comparison.sh gatelevel`

All scripts are in `/home/net/al663069/ws/scaler_asic_design/` and ready to use!
