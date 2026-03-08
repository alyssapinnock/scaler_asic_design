# Scripts and Tests Explanation

## Overview

This document explains all the verification scripts in the `scaler_asic_design` directory and describes what tests are running through the design.

## Script Categories

### 1. Comparison Scripts (Main Entry Points)

These scripts run the Ibex DV environment to generate test binaries using the baseline Ibex core with Spike co-simulation, then run those same binaries on your modified/gate-level design and compare traces.

#### `run_comparison_modified_rtl.sh`
**Purpose**: Compare baseline Ibex RTL vs your modified RTL (with noise generators and masking wrapper)

**Usage**:
```bash
./run_comparison_modified_rtl.sh <test_name> [seed]
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000
```

**What it does**:
1. **Step 1**: Runs Ibex DV environment
   - Uses baseline Ibex core from `/home/net/al663069/ws/ibex`
   - Generates random RISC-V test using `riscv-dv` test generator
   - Compiles test to binary (`test.bin`)
   - Simulates with Spike ISS for co-simulation (golden reference)
   - Produces instruction trace: `trace_core_00000000.log`
   
2. **Step 2**: Runs your modified RTL with the same binary
   - Uses RTL from `modifiedCoreRTL/` directory
   - Includes GNG noise generator
   - Simulates with same `test.bin` from Step 1
   - Uses `modified_rtl_tb.sv` testbench
   - Produces instruction trace: `trace_modified_00000000.log`
   
3. **Step 3**: Compares instruction traces
   - Strips timing information
   - Compares PC, instruction, decoded instruction, register values
   - Allows for length differences (different termination points)
   - Outputs: PASS or FAIL

**Output Location**: `verification_results/modified_rtl/<test_name>.<seed>/`

#### `run_comparison_gatelevel.sh`
**Purpose**: Compare baseline Ibex RTL vs your gate-level netlist (post-synthesis masked design)

**Usage**:
```bash
./run_comparison_gatelevel.sh <test_name> [seed]
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
```

**What it does**:
1. **Step 1**: Same as modified RTL script - runs Ibex DV environment
   
2. **Step 2**: Runs gate-level netlist with the same binary
   - Uses gate-level netlist: `Synthesis/outputs/Core_netlist.v`
   - Includes standard cell models: `stdcell_models.v`
   - Uses `gate_level_wrapper.sv` to adapt interface
   - Uses `masked_core_tb.sv` testbench with `GATE_LEVEL` define
   - Functional simulation (no timing checks)
   - Produces instruction trace: `trace_gatelevel_00000000.log`
   
3. **Step 3**: Compares instruction traces
   - Same comparison logic as modified RTL script

**Output Location**: `verification_results/gatelevel/<test_name>.<seed>/`

#### `run_batch_comparison.sh`
**Purpose**: Run multiple tests in batch mode

**Usage**:
```bash
./run_batch_comparison.sh <rtl|gatelevel> <test_name> <num_iterations>
```

### 2. Standalone Simulation Scripts

These scripts run simulations without the full DV environment comparison flow.

#### `run_modified_rtl_sim.sh`
**Purpose**: Run modified RTL directly through Ibex DV environment (for debugging)

**Issues**: This script has syntax errors (unclosed quotes on lines 20-21)

#### `run_gatelevel_sim.sh`
**Purpose**: Run gate-level netlist directly through Ibex DV environment (for debugging)

**Issues**: This script has syntax errors (unclosed quotes on line 21)

### 3. Setup Scripts

#### `setup_verification.sh`
**Purpose**: Sets up the verification environment, creates directory structure

#### `test_setup.sh`
**Purpose**: Tests that the environment is correctly set up

## Test Types

The verification uses random tests from `riscv-dv` (RISC-V Design Verification). Common test types:

### Available Tests

1. **`riscv_arithmetic_basic_test`**
   - Basic ALU operations: ADD, SUB, AND, OR, XOR, etc.
   - Immediate arithmetic
   - Simple register operations
   
2. **`riscv_machine_mode_rand_test`**
   - Random machine mode operations
   - CSR accesses
   - Exception handling
   - More comprehensive than arithmetic test
   
3. **`riscv_rand_instr_test`**
   - Completely random instruction mix
   - All RV32I instructions
   - Branch/jump patterns
   - Memory operations
   
4. **`riscv_rand_jump_test`**
   - Focus on control flow
   - JAL, JALR, branches
   - Return address stack exercise

5. **`riscv_loop_test`**
   - Loop structures
   - Counter patterns
   - Nested loops

6. **Interrupt tests** (from `/ws/run_batch_interrupt.sh`):
   - `riscv_irq_test`
   - Tests interrupt handling
   - Measures interrupt latency

## Testbenches

### `modified_rtl_tb.sv`
**Purpose**: Testbench for pre-synthesis modified RTL

**Features**:
- Instantiates `ibex_top_tracing` (standard Ibex top with tracer)
- Includes GNG noise generator
- Simple memory model (instruction + data memories)
- Signature-based test termination
- Automatic trace generation via `ibex_tracer`

**Memory Model**:
- Instruction memory: 256KB @ 0x80000000
- Data memory: 256KB @ 0x00000000
- Single-cycle memory (immediate grant/valid)

**Current Issue**: Line 247 has an `always @(posedge sig_write_detected)` which should be `always_ff` with proper sensitivity

### `masked_core_tb.sv`
**Purpose**: Unified testbench for both modified RTL and gate-level netlist

**Features**:
- Conditional compilation: `ifdef GATE_LEVEL`
- When `GATE_LEVEL` defined:
  - Instantiates `ibex_core_gatelevel_wrapper`
  - Skips RTL-only signals (test_en_i, scan_rst_ni, etc.)
- When not defined:
  - Instantiates `ibex_top_tracing` (same as modified_rtl_tb.sv)
- Includes GNG noise generator
- Same memory model as modified_rtl_tb.sv

**Current Issues**: Appears to be working for gate-level but needs port connection fixes

### `gate_level_wrapper.sv`
**Purpose**: Wrapper to adapt gate-level masked core to standard Ibex interface

**Features**:
- Takes standard Ibex `ibex_top` interface
- Adapts to dual-rail masked `ibex_core` netlist
- Handles signal splitting for share 0 and share 1
- Includes ibex_tracer for gate-level trace generation

**Current Issues**: Port type errors with `ibex_pkg::` types (parameters and crash_dump_o)

## Verification Flow

```
┌─────────────────────────────────────────────────────────────┐
│  Step 1: Ibex DV Environment (Baseline Core + Spike)       │
│                                                             │
│  1. riscv-dv generates random RISC-V assembly              │
│  2. Assembly compiled to binary (test.bin)                 │
│  3. Baseline Ibex core simulates binary                    │
│  4. Spike ISS co-simulates for golden reference           │
│  5. Produces trace_core_00000000.log                       │
│                                                             │
│  Output: test.bin, trace_baseline.log, spike_trace.log    │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Step 2: Modified/Gate-level Simulation                    │
│                                                             │
│  1. Load same test.bin from Step 1                        │
│  2. Simulate with modified RTL or gate-level netlist      │
│  3. ibex_tracer generates instruction trace automatically  │
│  4. Produces trace_modified_00000000.log or               │
│     trace_gatelevel_00000000.log                          │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│  Step 3: Trace Comparison                                  │
│                                                             │
│  1. Strip timing columns from both traces                  │
│  2. Compare PC, instruction, decoded, register values      │
│  3. Allow length differences (termination timing)          │
│  4. Output: PASS or FAIL                                   │
└─────────────────────────────────────────────────────────────┘
```

## Debugging Tips

### If tests fail:

1. **Check DV test passed first**:
   ```bash
   cat verification_results/<type>/<test>.<seed>/trr.yaml
   ```
   Look for `passed: True`

2. **View traces**:
   ```bash
   less verification_results/<type>/<test>.<seed>/trace_baseline.log
   less verification_results/<type>/<test>.<seed>/trace_modified_00000000.log
   ```

3. **View trace differences**:
   ```bash
   less verification_results/<type>/<test>.<seed>/trace_diff.log
   ```

4. **View simulation log**:
   ```bash
   less verification_results/<type>/<test>.<seed>/modified_sim.log
   less verification_results/<type>/<test>.<seed>/gatelevel_sim.log
   ```

### Common Issues:

1. **Simulation timeout**: Test took too long, may need longer timeout in testbench
2. **Trace length mismatch**: Different termination points - usually OK if prefix matches
3. **Instruction mismatch**: Actual functional error - check trace_diff.log
4. **Memory errors**: Check memory size is sufficient for test

## Environment Variables

Key paths used by scripts:

- `WS=/home/net/al663069/ws` - Workspace root
- `DV_DIR=$WS/ibex/dv/uvm/core_ibex` - Ibex DV environment
- `MOD_RTL=$WS/scaler_asic_design/modifiedCoreRTL` - Modified RTL sources
- `SCALER_DIR=$WS/scaler_asic_design` - This project directory

## Summary

**Goal 1** (Gate-level verification): Use `run_comparison_gatelevel.sh` to verify gate-level netlist correctness

**Goal 2** (Pre-synthesis RTL verification): Use `run_comparison_modified_rtl.sh` to verify modified RTL correctness

Both scripts leverage the Ibex DV/Co-sim environment to generate comprehensive random tests and provide a golden reference (Spike ISS) for comparison.
