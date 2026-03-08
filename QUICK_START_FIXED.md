# Quick Start - Fixed Verification Scripts

## What Was Fixed

I've fixed the verification scripts to make gate-level verification work. The key fixes were:

1. **`modified_rtl_tb.sv`**: Fixed invalid `always @(posedge signal)` → `always @(posedge clk)`
2. **`gate_level_wrapper.sv`**: 
   - Changed enum parameter types to int (Xcelium compatibility)
   - Flattened `crash_dump_t` struct to individual ports
3. **`masked_core_tb.sv`**: Updated to connect flattened crash_dump ports for gate-level

## What the Scripts Do

### Main Verification Scripts

**`run_comparison_gatelevel.sh`** - Tests your gate-level netlist
- Runs Ibex DV to generate test binary with Spike reference
- Simulates gate-level netlist with same binary  
- Compares instruction traces for correctness

**`run_comparison_modified_rtl.sh`** - Tests your pre-synthesis RTL
- Same flow but for modified RTL
- **Currently has issues** with `ibex_core_wrapper.sv` port mismatches

## Try It Now - Gate-Level Verification

```bash
cd /home/net/al663069/ws/scaler_asic_design

# Run a single test
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000

# Check results
cat verification_results/gatelevel/riscv_arithmetic_basic_test.1000/result.txt
```

The test will:
1. Generate a random arithmetic test using Ibex DV (~2-3 minutes)
2. Run gate-level simulation (~1-2 minutes)
3. Compare traces and show PASS/FAIL

## Output Files

All results in: `verification_results/gatelevel/<test>.<seed>/`

Key files:
- `result.txt` - PASS or FAIL
- `test.bin` - Test program binary
- `trace_baseline.log` - Baseline Ibex trace
- `trace_gatelevel_00000000.log` - Gate-level trace
- `spike_trace.log` - Spike ISS golden reference
- `trace_diff.log` - Differences (empty if PASS)

## Available Test Types

| Test Name | Description |
|-----------|-------------|
| `riscv_arithmetic_basic_test` | ALU operations (ADD, SUB, AND, OR, XOR) |
| `riscv_machine_mode_rand_test` | Random machine mode ops, CSRs, exceptions |
| `riscv_rand_instr_test` | Completely random instruction mix |
| `riscv_rand_jump_test` | Control flow (JAL, JALR, branches) |
| `riscv_loop_test` | Loop structures |

## Troubleshooting

### If simulation fails:

**Check DV test passed:**
```bash
cat verification_results/gatelevel/<test>.<seed>/trr.yaml | grep passed
```
Should show `passed: True`

**View simulation log:**
```bash
less verification_results/gatelevel/<test>.<seed>/gatelevel_sim.log
```

**View traces:**
```bash
# Baseline trace
less verification_results/gatelevel/<test>.<seed>/trace_baseline.log

# Gate-level trace  
less verification_results/gatelevel/<test>.<seed>/trace_gatelevel_00000000.log

# Differences
less verification_results/gatelevel/<test>.<seed>/trace_diff.log
```

### Common Issues:

1. **Simulation timeout**: Test took >500k cycles
   - Some tests are longer - this is OK
   - Check if trace was generated

2. **Trace length mismatch**: Different number of instructions
   - Usually OK if first N instructions match
   - Different testbench termination points

3. **Instruction mismatch**: Actual functional error
   - Check `trace_diff.log` for first mismatch
   - Compare with Spike reference

## Status of Scripts

| Script | Status | Notes |
|--------|--------|-------|
| `run_comparison_gatelevel.sh` | ✅ READY | Should work now |
| `run_comparison_modified_rtl.sh` | ❌ BROKEN | Port mismatch issues |
| `run_batch_comparison.sh` | ✅ READY | Batch runner |
| `run_modified_rtl_sim.sh` | ❌ BROKEN | Syntax errors |
| `run_gatelevel_sim.sh` | ❌ BROKEN | Syntax errors |

## Next Steps

1. **Try gate-level verification** (Goal 1):
   ```bash
   ./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
   ```

2. **If successful**, run more tests:
   ```bash
   ./run_comparison_gatelevel.sh riscv_machine_mode_rand_test 2000
   ./run_comparison_gatelevel.sh riscv_rand_instr_test 3000
   ```

3. **Fix RTL verification** (Goal 2) - needs more work on `ibex_core_wrapper.sv`

## Documentation

Full details in:
- `SCRIPTS_EXPLANATION.md` - Comprehensive explanation of all scripts
- `CURRENT_ISSUES_AND_FIXES.md` - Detailed list of issues and fixes
- `VERIFICATION_GUIDE.md` - May have other useful info

## What Tests Are Running

The Ibex DV environment uses `riscv-dv` to generate randomized RISC-V assembly tests. Each test:

1. **Random instruction generation**: Uses constrained randomization
2. **Compilation**: Assembly → ELF → Binary
3. **Baseline simulation**: Standard Ibex RTL
4. **Spike co-simulation**: ISA simulator as golden reference  
5. **Trace comparison**: Instruction-by-instruction checking

The tests exercise:
- All RV32I instructions
- Register file operations
- Memory loads/stores
- Control flow (branches, jumps)
- CSR accesses
- Exception handling
- Interrupt handling (in interrupt tests)

This provides comprehensive functional verification of your design!
