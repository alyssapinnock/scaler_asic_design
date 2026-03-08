# Comprehensive Guide: Scaler ASIC Design Verification

## Overview

This repository contains a modified Ibex RISC-V core with Boolean masking applied post-synthesis for side-channel protection. The verification flow compares the modified design against the baseline Ibex core using the Ibex DV/Co-simulation environment.

## Repository Structure

```
scaler_asic_design/
├── modifiedCoreRTL/          # Pre-synthesis RTL with noise generators and masking hooks
├── Synthesis/outputs/         # Gate-level netlist (Core_netlist.v) after synthesis and masking
├── gate_level_wrapper.sv      # Wrapper to adapt gate-level netlist to Ibex interface
├── masked_core_tb.sv          # Testbench for both RTL and gate-level simulations
├── modified_rtl_tb.sv         # Testbench specifically for modified RTL
├── stdcell_models.v           # Standard cell library models for gate-level simulation
├── verification_results/      # Output directory for all verification runs
│   ├── modified_rtl/         # Results from modified RTL tests
│   └── gatelevel/            # Results from gate-level tests
└── scripts (see below)
```

## Verification Scripts

### 1. `run_comparison_modified_rtl.sh`
**Purpose:** Verify that the modified RTL (pre-synthesis) behaves identically to the baseline Ibex core.

**What it does:**
1. Generates a randomized RISC-V test program using Ibex DV
2. Runs the test on baseline Ibex with Spike co-simulation (golden reference)
3. Runs the same test binary on your modified RTL core
4. Compares instruction-level traces between baseline and modified designs
5. Reports PASS/FAIL based on trace comparison

**Usage:**
```bash
./run_comparison_modified_rtl.sh <test_name> [seed]

# Examples:
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000
./run_comparison_modified_rtl.sh riscv_machine_mode_rand_test
```

**Test Types Available:**
- `riscv_arithmetic_basic_test` - Basic ALU operations
- `riscv_machine_mode_rand_test` - Randomized M-mode operations
- `riscv_rand_instr_test` - Comprehensive random instruction mix
- `riscv_rand_jump_test` - Jump and branch intensive
- `riscv_mmu_stress_test` - Memory access patterns
- `riscv_interrupt_test` - Interrupt handling

**Output:**
- `verification_results/modified_rtl/<test>.<seed>/`
  - `test.bin` - Test binary
  - `trace_baseline.log` - Baseline Ibex execution trace
  - `trace_modified_00000000.log` - Modified RTL execution trace
  - `spike_trace.log` - Spike ISS golden reference
  - `trace_diff.log` - Differences between traces
  - `result.txt` - PASS or FAIL

### 2. `run_comparison_gatelevel.sh`
**Purpose:** Verify that the gate-level netlist (post-synthesis, post-masking) behaves correctly.

**What it does:**
1. Generates a randomized RISC-V test program using Ibex DV
2. Runs the test on baseline Ibex with Spike co-simulation
3. Runs the same test binary on your gate-level netlist
4. Compares instruction-level traces
5. Reports PASS/FAIL

**Usage:**
```bash
./run_comparison_gatelevel.sh <test_name> [seed]

# Examples:
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
./run_comparison_gatelevel.sh riscv_machine_mode_rand_test
```

**Output:**
- `verification_results/gatelevel/<test>.<seed>/`
  - Same structure as modified_rtl comparison

### 3. `run_batch_comparison.sh`
**Purpose:** Run multiple tests in sequence for comprehensive verification.

**What it does:**
- Runs a predefined list of tests with different seeds
- Generates a summary report of all test results
- Useful for regression testing

**Usage:**
```bash
./run_batch_comparison.sh [modified_rtl|gatelevel]
```

### 4. `run_modified_rtl_sim.sh` and `run_gatelevel_sim.sh`
**Purpose:** These scripts were intended for standalone simulations but have syntax errors.

**Status:** **NOT WORKING** - Need fixing (see Known Issues below)

## Ibex DV/Co-Simulation Environment

### What is Ibex DV?
The Ibex Design Verification (DV) environment is a UVM-based testbench provided by lowRISC. It includes:
- Random instruction generators (RISCV-DV framework)
- Spike ISS (Instruction Set Simulator) for co-simulation
- Comprehensive test suites covering all RV32IMC instructions
- Interrupt and exception handling tests
- Memory stress tests

### How Tests Are Generated
When you run a comparison script:
1. **RISCV-DV** generates a random assembly program based on the test type
2. The program is compiled into a binary (`test.bin`)
3. **Baseline Ibex core** executes the binary in simulation
4. **Spike ISS** executes the same binary in parallel
5. Instruction traces are compared cycle-by-cycle
6. The same binary is then run on your modified/gate-level core

### What Tests Are Running
The tests exercise different aspects of the RISC-V ISA:

- **Arithmetic tests**: ADD, SUB, AND, OR, XOR, shifts, etc.
- **Control flow**: Branches, jumps, function calls
- **Memory**: Loads/stores with different alignments and sizes
- **Interrupts**: Software, timer, external interrupts
- **Exceptions**: Illegal instructions, misaligned accesses
- **CSR operations**: Control and Status Register reads/writes
- **Privilege modes**: Machine mode operations

### Trace Comparison
The comparison looks at:
- **Program Counter (PC)**: Instruction fetch address
- **Instruction encoding**: The actual instruction bits
- **Decoded instruction**: Mnemonic (e.g., "ADD x1, x2, x3")
- **Register updates**: Which registers were written and their values

Differences in timing (cycle count) are ignored - only the instruction sequence matters.

## Known Issues and Fixes

### Issue 1: Script Syntax Errors

**Error:**
```bash
./run_modified_rtl_sim.sh: line 20: unexpected EOF while looking for matching `''
```

**Cause:** Missing closing quote on line 16 (should be `-define "BOOT_ADDR=32'h80000000"` not `-define "BOOT_ADDR=32'h80000000`)

**Status:** These scripts are broken. Use the comparison scripts instead.

### Issue 2: Gate-Level Port Mismatches

**Errors:**
```
xmelab: *E,CUVPOM: Port name 'alert_major_o' of instance 'masked_core_tb.u_dut' is invalid
xmelab: *E,CUVPOM: Port name 'randbits_i' of instance 'masked_core_tb.u_dut' is invalid  
xmelab: *W,CUVUKP: The name 'ICacheScramble' is not declared in the instantiated module
```

**Cause:** The gate-level wrapper and testbench have interface mismatches.

**Solution:** The gate-level wrapper needs to match the ibex_top_tracing interface more closely. See fixes below.

### Issue 3: Port Connection Syntax Error

**Error:**
```
xmvlog: *E,PLMIXU: ordered and named port list mixed syntax
```

**Cause:** In masked_core_tb.sv line 160-167, there's a mix of named ports with conditional compilation that creates invalid syntax.

**Solution:** See fixes below.

## Fixes Required

### Fix 1: Update masked_core_tb.sv Port Connections

The gate-level wrapper is missing some ports. Update the port connections:

```systemverilog
// Around line 156-167 in masked_core_tb.sv
.fetch_enable_i         (ibex_pkg::IbexMuBiOn),
.alert_minor_o          (),
.alert_major_internal_o (),
.alert_major_bus_o      (),
`ifdef GATE_LEVEL
.core_busy_o            (),
.scan_rst_ni            (1'b1),
.double_fault_seen_o    ()
`else
.core_sleep_o           ()
`endif
```

### Fix 2: Update gate_level_wrapper.sv

The wrapper needs to include the randbits interface internally (not as a port) since the GNG is instantiated inside.

## Correct Workflow

### For Modified RTL Verification:

1. **First run a simple test:**
```bash
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000
```

2. **Check the results:**
```bash
cat verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/result.txt
```

3. **If FAIL, examine the differences:**
```bash
less verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/trace_diff.log
```

4. **Run more comprehensive tests:**
```bash
./run_comparison_modified_rtl.sh riscv_machine_mode_rand_test 2000
./run_comparison_modified_rtl.sh riscv_rand_instr_test 3000
```

### For Gate-Level Verification:

1. **Fix the port connection issues first** (see above)

2. **Run simple test:**
```bash
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
```

3. **Expect warnings about port width mismatches** - these are normal for dual-rail masked signals

4. **Check functional correctness** by examining traces

## Interrupt Latency Measurement

**Goal 2:** Measure interrupt latency

**Approach:**
1. Use `riscv_interrupt_test` which exercises interrupt handling
2. Modify testbench to capture timestamps:
   - When interrupt request asserts (`irq_*_i`)
   - When interrupt handler starts executing (PC jumps to mtvec)
3. Calculate latency = handler_start_time - request_time

**TODO:** Create dedicated interrupt latency measurement script

## Directory Cleanup

The following files/directories are temporary and can be removed:
- `xcelium.d/` - Xcelium compilation database
- `temp_new_files/` - Temporary files during development
- `XCELIUM*/` - Xcelium run directories
- `*.log`, `*.key` - Old simulation logs

## Quick Reference Commands

```bash
# Run modified RTL test
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000

# Run gate-level test (after fixing port issues)
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000

# Check test result
cat verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/result.txt

# View execution trace
less verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/trace_baseline.log

# Compare traces manually
diff verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/stripped_baseline.log \
     verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/stripped_modified.log

# Clean up
rm -rf xcelium.d XCELIUM* *.log *.key
```

## Next Steps

1. **Fix port connection issues** in masked_core_tb.sv (lines 156-167)
2. **Run modified RTL tests** to establish baseline functionality
3. **Fix gate-level wrapper** if needed based on test results
4. **Run gate-level tests** to verify post-synthesis correctness
5. **Implement interrupt latency measurement**
6. **Document any timing or functional issues discovered**

## Contact/Support

For questions about:
- Ibex core: https://github.com/lowRISC/ibex
- RISCV-DV: https://github.com/chipsalliance/riscv-dv  
- Spike: https://github.com/riscv-software-src/riscv-isa-sim

