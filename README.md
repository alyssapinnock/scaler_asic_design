# Ibex Gate-Level and Modified RTL Verification

This directory contains everything you need to run both the gate-level netlist and pre-synthesis modified RTL through the Ibex DV/Co-sim environment.

## Quick Start

### 1. Test the Setup
```bash
./test_setup.sh
```

### 2. Run Modified RTL Simulation (Goal 2)
```bash
./run_modified_rtl_sim.sh -gui
```

### 3. Run Gate-Level Simulation (Goal 1 - Priority)
```bash
./run_gatelevel_sim.sh -gui
```

## Files in This Directory

### Core Files
- **gate_level_wrapper.sv** - Adapts dual-rail gate-level netlist to standard Ibex interface
- **stdcell_models.v** - Behavioral models for standard cells (XOR2X1, DFFRHQX1, etc.)

### Configuration Files
- **ibex_dv_gatelevel.f** - File list for gate-level simulation
- **ibex_dv_modified_rtl.f** - File list for modified RTL simulation

### Scripts
- **setup_verification.sh** - Initial setup script (already run)
- **test_setup.sh** - Verify setup is correct
- **run_modified_rtl_sim.sh** - Run pre-synthesis RTL
- **run_gatelevel_sim.sh** - Run gate-level netlist

### Documentation
- **README.md** - This file (quick reference)
- **SETUP_SUMMARY.md** - Detailed setup information and how-to
- **VERIFICATION_GUIDE.md** - Comprehensive verification guide

## Your Goals

### Goal 1: Gate-Level Netlist Verification (PRIORITY)
Run the gate-level netlist (Synthesis/outputs/Core_netlist.v) through the Ibex DV/Co-sim environment to ensure correctness after boolean masking.

**Status:** ✓ Ready to run
**Command:** `./run_gatelevel_sim.sh -gui`

**Key Points:**
- The gate-level netlist uses dual-rail signals (s0/s1) for masking
- A wrapper converts between dual-rail and single-rail
- Standard cell behavioral models are provided
- Functional verification only (no timing)

### Goal 2: Pre-Synthesis RTL Verification
Run the pre-synthesis RTL (modifiedCoreRTL/) through the Ibex DV/Co-sim environment for correctness and interrupt latency measurement.

**Status:** ✓ Ready to run
**Command:** `./run_modified_rtl_sim.sh -gui`

**Key Points:**
- Uses modified Ibex core with noise generators
- Includes masking wrapper hooks
- Can measure interrupt latency
- Compare with baseline Ibex if needed

## Common Commands

```bash
# Run with GUI (recommended for first time)
./run_modified_rtl_sim.sh -gui
./run_gatelevel_sim.sh -gui

# Run with waveforms
./run_modified_rtl_sim.sh -gui -input "@database -open waves -default"

# Run specific test
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_smoke_test

# Run interrupt test for latency measurement
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_irq_test
```

## Understanding the Gate-Level Netlist

Your gate-level netlist implements boolean masking with dual-rail signals:

```
Standard Signal:        Gate-Level Signals:
----------------        -------------------
instr_req_o       →     instr_req_o_s0 + instr_req_o_s1
                        (actual value = s0 XOR s1)
```

The wrapper handles this conversion automatically, so the testbench doesn't need to know about the masking.

## Verification Flow

1. **Start with Modified RTL**
   - Easier to debug
   - Faster simulation
   - Get baseline traces

2. **Move to Gate-Level**
   - Verify functional equivalence
   - Check for X propagation
   - Compare with RTL traces

3. **Measure Interrupt Latency** (Goal 2)
   - Run interrupt tests
   - Parse trace logs
   - Compare different scenarios

## Output Files

After simulation, check:
- `xrun.log` - Simulator log (check for errors)
- `trace_*.log` - Instruction trace (functional verification)
- `waves.shm/` - Waveform database (if enabled)
- UVM reports - Test results

## Troubleshooting

### Simulation fails with "Unknown module"
- Check if it's a standard cell: add to `stdcell_models.v`
- Check if it's an Ibex module: verify file list

### X propagation in gate-level
- Normal at time 0
- Check reset sequence
- Verify all inputs are driven
- May need `+notimingchecks +delay_mode_zero`

### Simulation hangs
- Check clock generation
- Verify reset is released
- Add timeout in testbench

### Assertion failures
- Some RTL assertions may not apply to gate-level
- Use `+DV_ASSERT_CTRL_DISABLE` to disable specific ones

## Next Steps

1. Run test_setup.sh to verify everything is ready
2. Start with modified RTL to verify basic functionality
3. Move to gate-level and compare results
4. Set up interrupt latency measurement
5. Run full regression suite on both

## Directory Structure

```
scaler_asic_design/
├── README.md                      ← You are here
├── SETUP_SUMMARY.md              ← Detailed guide
├── VERIFICATION_GUIDE.md          ← Comprehensive documentation
├── setup_verification.sh          ← Setup script
├── test_setup.sh                  ← Test script
├── run_modified_rtl_sim.sh       ← Run modified RTL
├── run_gatelevel_sim.sh          ← Run gate-level
├── gate_level_wrapper.sv          ← Dual-rail adapter
├── stdcell_models.v               ← Standard cell models
├── ibex_dv_gatelevel.f           ← Gate-level file list
├── ibex_dv_modified_rtl.f        ← Modified RTL file list
├── modifiedCoreRTL/               ← Pre-synthesis RTL
│   └── ibex_*.sv
└── Synthesis/outputs/
    └── Core_netlist.v             ← Gate-level netlist

External dependencies:
/home/net/al663069/ws/ibex/        ← Ibex DV environment
/home/net/al663069/ws/new_ibex_files/gng.v  ← Random number generator
```

## Getting Help

1. Check SETUP_SUMMARY.md for detailed instructions
2. Review VERIFICATION_GUIDE.md for in-depth information
3. Run test_setup.sh to diagnose issues
4. Check xrun.log for error messages

## Notes

- The testbench already has GNG (random number generator) support
- Randbits are automatically connected to the DUT
- Co-simulation with Spike ISS is available for functional verification
- The wrapper approach allows minimal changes to existing testbench

## Success Criteria

### Goal 1 (Gate-Level):
- [ ] Simulation completes without errors
- [ ] No X propagation after reset
- [ ] Trace matches RTL simulation
- [ ] UVM tests pass

### Goal 2 (Modified RTL):
- [ ] Simulation completes without errors
- [ ] Interrupt tests pass
- [ ] Latency measurements collected
- [ ] Comparison with baseline (optional)

---

**Ready to start?** Run `./test_setup.sh` to verify everything, then `./run_modified_rtl_sim.sh -gui` to begin!
