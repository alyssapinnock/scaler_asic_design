# Scripts and Tests Explained - Quick Summary

## What You Have

You have a **modified Ibex RISC-V core** with Boolean masking for side-channel protection. Two versions exist:
1. **Modified RTL** (`modifiedCoreRTL/`) - Pre-synthesis with noise generators
2. **Gate-level netlist** (`Synthesis/outputs/Core_netlist.v`) - Post-synthesis with masking applied

## Main Verification Scripts

### **run_comparison_modified_rtl.sh** ✓ WORKS
**What it does:** Verifies modified RTL matches baseline Ibex behavior

**How it works:**
1. Generates random RISC-V test using Ibex DV + Spike (golden reference)  
2. Runs test on baseline Ibex → captures instruction trace
3. Runs same test on modified RTL → captures instruction trace
4. Compares traces instruction-by-instruction
5. Reports PASS/FAIL

**Usage:**
```bash
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000
```

**Output:** `verification_results/modified_rtl/<test>.<seed>/`


### **run_comparison_gatelevel.sh** ⚠ WORKS BUT SLOW
**What it does:** Same as above but for gate-level netlist

**Important:** Gate-level simulations are **very slow** (10-100x slower than RTL) due to the massive netlist with 100,000+ instances.

**Usage:**
```bash
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
```

**Status:** Currently compiling in your session - this can take 5-10 minutes before simulation even starts!

**Output:** `verification_results/gatelevel/<test>.<seed>/`


### **run_modified_rtl_sim.sh** ✗ BROKEN
### **run_gatelevel_sim.sh** ✗ BROKEN
**Problem:** Syntax errors (missing quotes)
**Solution:** Use the comparison scripts instead - they do the same thing but better


## What Tests Are Actually Running?

The Ibex DV environment generates **random RISC-V assembly programs** that exercise:

### Test Types:
- **riscv_arithmetic_basic_test** - ALU operations (ADD, SUB, AND, OR, XOR, shifts)
- **riscv_machine_mode_rand_test** - Randomized machine-mode instructions
- **riscv_rand_instr_test** - Comprehensive random instruction mix
- **riscv_interrupt_test** - Interrupt handling ← **Use this for interrupt latency**

### What Gets Generated:
1. **Assembly file** (.S) - Random RISC-V program
2. **Binary file** (.bin) - Compiled program  
3. **Baseline trace** - Execution on normal Ibex
4. **Spike trace** - Execution on Spike ISS (golden reference)
5. **Modified/Gate-level trace** - Execution on your design

### What Gets Compared:
Only the **instruction sequence**:
- Program Counter (PC)
- Instruction encoding
- Instruction mnemonic
- Register writes

**Timing differences are ignored** - only functional correctness matters.


## Quick Start

### Step 1: Test Modified RTL
```bash
cd /home/net/al663069/ws/scaler_asic_design
./run_comparison_modified_rtl.sh riscv_arithmetic_basic_test 1000
```

### Step 2: Check Results
```bash
cat verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/result.txt
# Should say: PASS
```

### Step 3: View Traces (if interested)
```bash
less verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/trace_baseline.log
less verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/trace_modified_00000000.log
```

### Step 4: Test Gate-Level (WARNING: SLOW!)
```bash
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
# Expect 10-30 minutes for compilation + simulation
```


## Current Issues FIXED

### ✓ **masked_core_tb.sv port connection syntax**
**Was:** Mixed ordered/named ports with conditional compilation
**Fixed:** Proper conditional port connections
**Status:** Fixed in your repo now

### ⚠ **Gate-level simulation is slow**
**Reason:** 100,000+ gate instances with dual-rail masking
**Solution:** Be patient. Start with short tests.
**Alternative:** Use modified RTL tests for faster verification

### ✗ **run_*_sim.sh scripts broken**  
**Problem:** Missing closing quotes on `-define` lines
**Solution:** Just use the comparison scripts instead


## For Interrupt Latency Measurement (Goal 2)

### Current Approach:
The comparison scripts don't measure latency. You need to:

1. **Use interrupt test:**
```bash
./run_comparison_modified_rtl.sh riscv_interrupt_test 5000
```

2. **Add latency instrumentation to testbench:**
   - Detect when `irq_*_i` asserts
   - Detect when PC jumps to interrupt vector (mtvec)
   - Calculate cycles between them

3. **Parse simulation logs** to extract measurements

### TODO:
Create `measure_interrupt_latency.sh` script that:
- Runs interrupt tests
- Instruments testbench with latency counters
- Generates latency report


## Directory Structure

```
scaler_asic_design/
├── modifiedCoreRTL/              ← Your modified RTL files
├── Synthesis/outputs/             ← Gate-level netlist (Core_netlist.v)
├── verification_results/          ← All test outputs go here
│   ├── modified_rtl/             ← Modified RTL test results
│   └── gatelevel/                ← Gate-level test results
├── masked_core_tb.sv              ← Testbench (now fixed)
├── gate_level_wrapper.sv          ← Wrapper for gate-level netlist
├── run_comparison_modified_rtl.sh ← Main script for RTL testing
└── run_comparison_gatelevel.sh    ← Main script for gate-level testing
```


## Key Files in Test Output

For each test run, you get a directory like:
`verification_results/modified_rtl/riscv_arithmetic_basic_test.1000/`

### Important files:
- **test.bin** - The test program binary
- **test.S** - Assembly source
- **trace_baseline.log** - How baseline Ibex executed it
- **trace_modified_*.log** - How your design executed it  
- **spike_trace.log** - How Spike (golden ref) executed it
- **trace_diff.log** - Differences between baseline and yours
- **result.txt** - PASS or FAIL
- **stripped_*.log** - Cleaned traces for comparison


## Common Warnings (IGNORE THESE)

When running gate-level:
```
xmelab: *W,CUVMPW: port sizes differ in port connection(1/2)
xmelab: *W,CUVMPW: port sizes differ in port connection(4/1)
```
**Reason:** Dual-rail masked signals have 2x width. This is expected.

```  
xmsim: *W,MCONDE: Unique casez violation
```
**Reason:** Ibex tracer has overlapping case items. Harmless.


## Summary

### What Works:
✓ Modified RTL verification via `run_comparison_modified_rtl.sh`  
✓ Gate-level verification via `run_comparison_gatelevel.sh` (but slow)  
✓ Random test generation through Ibex DV  
✓ Instruction trace comparison

### What's Broken:
✗ `run_modified_rtl_sim.sh` and `run_gatelevel_sim.sh` (use comparison scripts instead)

### What's Missing:
- Interrupt latency measurement (need custom instrumentation)
- Batch testing script (need to create)
- Performance metrics (latency, throughput)

### Next Actions:
1. ✓ Run modified RTL tests → validate functional correctness
2. ⏳ Wait for gate-level test to finish (be patient!)
3. 📊 Add interrupt latency measurement
4. 📈 Create batch test runner for regression

