# Current Issues and Fixes

## Summary

You have created verification scripts to compare your modified/gate-level designs against the baseline Ibex core using the Ibex DV/Co-sim environment. However, there are several issues preventing the scripts from working.

## Fixed Issues

### 1. ✅ `modified_rtl_tb.sv` - Syntax Error (FIXED)
**Issue**: Line 247 used `always @(posedge sig_write_detected)` which is invalid
**Fix**: Changed to `always @(posedge clk)` 
**Status**: FIXED

### 2. ✅ `gate_level_wrapper.sv` - Parameter Type Issues (FIXED)
**Issue**: Xcelium doesn't support enum types in parameter lists with hierarchical references
**Fix**: Changed `rv32m_e`, `rv32b_e`, `regfile_e` to `int` parameters
**Status**: FIXED

### 3. ✅ `gate_level_wrapper.sv` - crash_dump_t Port Issue (FIXED)
**Issue**: Package typedef in port list not supported
**Fix**: Flattened to individual ports:
- `crash_dump_o_current_pc`
- `crash_dump_o_next_pc`
- `crash_dump_o_last_data_addr`
- `crash_dump_o_exception_pc`
- `crash_dump_o_exception_addr`
**Status**: FIXED

### 4. ✅ `masked_core_tb.sv` - Updated for flattened crash_dump ports (FIXED)
**Status**: FIXED

## Remaining Issues

### 5. ❌ `modifiedCoreRTL/ibex_core_wrapper.sv` - Port Mismatch
**Issue**: The `ibex_core_wrapper.sv` in your modified RTL is trying to instantiate a masked/dual-rail `ibex_core` with ports that don't exist in the actual `ibex_core.sv`:

Ports that don't exist in standard `ibex_core.sv`:
- `hart_id_i_s1`, `boot_addr_i_s1` (dual-rail inputs for share 1)
- `instr_gnt_i_s1`, `instr_rvalid_i_s1`, etc. (dual-rail memory interface)
- `ic_tag_rdata_i[1]`, `ic_tag_rdata_i[0]` (array index instead of scalar)
- `ic_data_rdata_i[1]`, `ic_data_rdata_i[0]`
- `crash_dump_o[current_pc]` (struct member access in port map)
- `randbits` input
- All the `_s1` suffixed ports for share 1
- etc.

**Root Cause**: Your `modifiedCoreRTL/ibex_core_wrapper.sv` was designed for a masked/dual-rail implementation but the actual `ibex_core.sv` in that directory doesn't support these dual-rail interfaces.

**Options to Fix**:

#### Option A: Use ibex_top_tracing directly (RECOMMENDED for RTL verification)
If your goal is to just verify the pre-synthesis RTL with noise generators, you don't need the wrapper. The `modified_rtl_tb.sv` already instantiates `ibex_top_tracing` which should work.

**Action**: 
- Skip using `ibex_core_wrapper.sv` 
- Use `modified_rtl_tb.sv` directly
- Make sure `ibex_top.sv` and `ibex_top_tracing.sv` exist in `modifiedCoreRTL/`

#### Option B: Fix the ibex_core_wrapper.sv
If you actually need the wrapper (for example, if you've modified `ibex_core.sv` to have dual-rail interfaces), then:

1. Check if `modifiedCoreRTL/ibex_core.sv` actually has these dual-rail ports
2. If not, remove the dual-rail port mappings from the wrapper
3. Make the wrapper just a pass-through or add noise injection at the wrapper level

#### Option C: Focus on Gate-Level Verification First
Since your primary goal is gate-level verification (Goal 1), you could:

1. Fix the gate-level simulation (almost working)
2. Come back to RTL verification later

## Gate-Level Status

The gate-level verification is very close to working. Remaining issues:

### Potential Issue: ibex_tracer compatibility
The gate-level wrapper instantiates `ibex_tracer` but the tracer expects to be inside `ibex_core` with access to internal signals. For gate-level, you may need to:

1. **Option A**: Connect external signals to tracer (if available from netlist)
2. **Option B**: Modify `masked_core_tb.sv` to not use tracer for gate-level
3. **Option C**: Use the wrapper's external interface signals for basic PC/instruction tracking

## Recommended Next Steps

### For Goal 1 (Gate-Level Verification) - ALMOST READY

1. Test the gate-level simulation with fixes:
   ```bash
   ./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
   ```

2. If tracer issues occur, modify `masked_core_tb.sv` to make tracer optional:
   ```systemverilog
   `ifndef GATE_LEVEL
     // ibex_tracer instantiation
   `endif
   ```

### For Goal 2 (Pre-Synthesis RTL Verification)

1. **Simplify approach**: Don't use the masking wrapper for pre-synthesis verification
   
2. **Create a simpler modified_rtl_tb.sv** that directly instantiates:
   - `ibex_top_tracing` (standard Ibex with tracer)
   - GNG noise generator (if needed externally)
   - Standard memory model
   
3. **OR** fix the `ibex_core_wrapper.sv` to match what's actually in `modifiedCoreRTL/ibex_core.sv`

## Test Command Status

| Script | Status | Issue |
|--------|--------|-------|
| `run_comparison_gatelevel.sh` | ⚠️ Mostly Fixed | May need tracer fixes |
| `run_comparison_modified_rtl.sh` | ❌ Broken | Port mismatch in wrapper |
| `run_modified_rtl_sim.sh` | ❌ Broken | Syntax errors (unclosed quotes) |
| `run_gatelevel_sim.sh` | ❌ Broken | Syntax errors (unclosed quotes) |

## Files Modified

1. ✅ `modified_rtl_tb.sv` - Fixed always block
2. ✅ `gate_level_wrapper.sv` - Fixed parameter types and crash_dump_o
3. ✅ `masked_core_tb.sv` - Updated for flattened crash_dump ports
4. ✅ `SCRIPTS_EXPLANATION.md` - Created comprehensive documentation

## Next Action

Try running the gate-level verification:

```bash
cd /home/net/al663069/ws/scaler_asic_design
./run_comparison_gatelevel.sh riscv_arithmetic_basic_test 1000
```

If this works, you've achieved Goal 1! Then we can address the RTL verification separately.
