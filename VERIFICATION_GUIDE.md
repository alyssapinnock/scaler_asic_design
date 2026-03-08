# Ibex Gate-Level and Pre-Synthesis RTL Verification Guide

## Overview
This document provides instructions for running both the gate-level netlist and pre-synthesis RTL 
through the Ibex DV/Co-sim environment.

## Directory Structure
```
/home/net/al663069/ws/
├── scaler_asic_design/           # Your repository with modified RTL and gate-level netlist
│   ├── modifiedCoreRTL/          # Pre-synthesis RTL with masking
│   ├── Synthesis/outputs/        # Gate-level netlist (Core_netlist.v)
│   ├── gate_level_wrapper.sv     # Wrapper to adapt gate-level to standard interface
│   └── ibex_dv_gatelevel.f       # File list for gate-level simulation
├── ibex/                         # Standard Ibex repository with DV/Co-sim environment
│   └── dv/uvm/core_ibex/         # UVM testbench
└── new_ibex_files/               # GNG module and other utilities
    └── gng.v                     # Gaussian Noise Generator for randbits
```

## Goal 1: Run Gate-Level Netlist (PRIORITY)

The gate-level netlist has been synthesized with boolean masking, creating dual-rail signals:
- Each signal has two versions: _s0 and _s1
- The actual value is: signal = s0 XOR s1
- Additional input: randbits[15:0] for mask randomization

### Approach

We have two options:

#### Option A: Use Gate-Level Wrapper (Created)
A wrapper module (`gate_level_wrapper.sv`) adapts the dual-rail gate-level netlist to match 
the standard Ibex interface, allowing it to drop into the existing testbench.

**Pros:**
- Minimal changes to existing testbench
- Transparent to the test environment
- Handles dual-rail conversion automatically

**Cons:**
- Adds an extra layer
- May not expose masking details for advanced verification

#### Option B: Modify Testbench for Direct Gate-Level Instantiation
Modify the Ibex testbench to directly instantiate the gate-level `ibex_core` with dual-rail signals.

**Pros:**
- Direct visibility into masked signals
- Better for power/glitch analysis

**Cons:**
- Requires significant testbench modifications
- May break some assertions/monitors

### Recommended: Option A for Initial Verification

### Setup Steps:

1. **Standard Cell Library**
   The gate-level netlist uses standard cells (XOR2X1, DFFRHQX1, etc.). You need to provide 
   functional models for these cells. Check if you have:
   - Verilog behavioral models (*.v)
   - Liberty files with timing info (*.lib)
   
   Common locations:
   ```bash
   # Search for standard cell libraries
   find /path/to/pdk -name "*.v" | grep -i "stdcell\|saed"
   ```

2. **File List Setup**
   The file `ibex_dv_gatelevel.f` has been created but needs updates:
   - Add path to standard cell library Verilog models
   - Verify all paths are correct

3. **Run Simulation**
   ```bash
   cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex
   
   # Set environment variables
   export PRJ_DIR=/home/net/al663069/ws/ibex
   export LOWRISC_IP_DIR=/home/net/al663069/ws/ibex/vendor/lowrisc_ip
   
   # Run with xrun (Cadence Xcelium)
   xrun -f /home/net/al663069/ws/scaler_asic_design/ibex_dv_gatelevel.f \
        +UVM_TESTNAME=core_ibex_base_test \
        +boot_addr=0x80000000 \
        -timescale 1ns/1ps \
        -access +rw \
        -gui  # For GUI mode, remove for batch
   ```

### Known Issues and Solutions:

1. **Timing Issues**: Gate-level netlists may have X's due to timing. Use:
   ```
   +delay_mode_zero
   +no_notifier
   +notimingcheck
   ```

2. **Standard Cell Library**: If cells are undefined, you'll see errors like:
   ```
   Error: Unknown module 'XOR2X1'
   ```
   Solution: Find and include the standard cell Verilog library.

3. **Signal Width Mismatches**: The wrapper handles dual-rail conversion. If you see width 
   mismatches, check the wrapper's signal declarations.

## Goal 2: Run Pre-Synthesis RTL

The `modifiedCoreRTL/` directory contains the pre-synthesis RTL with modifications for:
- Noise generators
- Masking wrapper hooks
- Additional debug signals

### Setup Steps:

1. **Create File List for Modified RTL**
   Copy and modify the standard `ibex_dv.f`:
   ```bash
   cp /home/net/al663069/ws/ibex/dv/uvm/core_ibex/ibex_dv.f \
      /home/net/al663069/ws/scaler_asic_design/ibex_dv_modified_rtl.f
   ```
   
   Then edit to replace RTL file paths:
   - Change: `${PRJ_DIR}/rtl/ibex_*.sv`
   - To: `/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_*.sv`

2. **Ensure GNG Module is Included**
   The testbench already includes the GNG module connection. Verify it's in the file list.

3. **Run Simulation**
   ```bash
   cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex
   
   # Run with modified RTL
   xrun -f /home/net/al663069/ws/scaler_asic_design/ibex_dv_modified_rtl.f \
        +UVM_TESTNAME=core_ibex_base_test \
        -gui
   ```

### Measuring Interrupt Latency:

To measure interrupt latency, you can:

1. **Use Directed Tests**
   ```bash
   # Run interrupt-specific tests
   xrun -f ibex_dv_modified_rtl.f \
        +UVM_TESTNAME=core_ibex_irq_test
   ```

2. **Add Custom Monitors**
   Create a SystemVerilog monitor to track:
   - Interrupt assertion time (irq_*_i = 1)
   - Interrupt handler entry time (PC jumps to interrupt vector)
   - Calculate latency = entry_time - assertion_time

3. **Use Existing Traces**
   The tracer module already logs instruction execution. Parse the trace to find:
   ```
   grep "interrupt" trace_*.log
   ```

## Running Co-Simulation

The Ibex DV environment supports co-simulation with Spike ISS for functional verification.

### Enable Co-Simulation:

```bash
# Make sure Spike is built
cd /home/net/al663069/ws/riscv-isa-sim-cosim
make

# Run with co-simulation enabled
cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex
make SIMULATOR=xlm ISS=spike TEST=smoke COV=0 WAVES=1
```

## Debugging Tips

1. **Enable Waveform Dumping**
   ```bash
   -input "@database -open waves -default; probe -create -all -depth all"
   ```

2. **Check for X's**
   ```bash
   # Add runtime check
   +xm_check_initial_x
   ```

3. **Verbose Logging**
   ```bash
   +UVM_VERBOSITY=UVM_HIGH
   ```

4. **Trace Comparison**
   Compare traces between RTL and gate-level:
   ```bash
   diff trace_rtl.log trace_gatelevel.log
   ```

## Next Steps

1. Locate standard cell library for gate-level simulation
2. Test gate-level wrapper with simple smoke test
3. Run full regression on gate-level netlist
4. Set up interrupt latency measurement infrastructure
5. Run pre-synthesis RTL through same tests for comparison

## Files Created

- `/home/net/al663069/ws/scaler_asic_design/gate_level_wrapper.sv` - Dual-rail to single-rail adapter
- `/home/net/al663069/ws/scaler_asic_design/ibex_dv_gatelevel.f` - File list for gate-level sim
- This README file

## Contact/Notes

The testbench at `/home/net/al663069/ws/ibex/dv/uvm/core_ibex/tb/core_ibex_tb_top.sv` already 
has the GNG module instantiated and randbits connected (line 181), which is good for both 
approaches.
