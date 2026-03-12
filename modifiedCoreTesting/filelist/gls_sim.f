// gls_sim.f — Xcelium file list for GLS verification of masked Ibex
//
// This file is passed to xrun via: xrun -f gls_sim.f
// The variable PROJ_ROOT must be set to the scaler_asic_design directory.
//
// NOTE: The gate-level netlist (Core_netlist.v) and standard cell library
// (slow_vdd1v2_basicCells.v) are compiled into the coreLibCMO library via
// -makelib/-endlib in the run script, NOT listed here. This is required
// for the SystemVerilog 'config cfg' block in ibex_core_wrapper.sv to
// resolve the netlist correctly.
//
// Compile order:
//   1. Defines
//   2. Include paths
//   3. Packages (must come before modules that import them)
//   4. lowRISC IP prim modules (from baseline_ibex/vendor/lowrisc_ip)
//   5. DV prim shims (wrappers around prim_generic_*)
//   6. modifiedCoreRTL (masked Ibex RTL + supporting modules)
//   7. Shared RTL (bus, RAM, timer, simulator_ctrl)
//   8. Testbench

// ─── 1. Defines ───
+define+RVFI
+define+TRACE_EXECUTION

// ─── 2. Include paths ───
+incdir+${PROJ_ROOT}/modifiedCoreRTL
+incdir+${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl

// ─── 3. Packages ───
// modifiedCoreRTL packages (these include local copies / modified versions)
${PROJ_ROOT}/modifiedCoreRTL/prim_assert.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_pkg.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_tracer_pkg.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_ram_1p_pkg.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_secded_pkg.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_pkg.sv

// lowRISC IP packages (not duplicated in modifiedCoreRTL)
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_2p_pkg.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count_pkg.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv

// ─── 4. lowRISC IP prim modules ───
// These are instantiated by modifiedCoreRTL files (ibex_top, ibex_lockstep, etc.)
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_check.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_enc.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_mux.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_prince.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_subst_perm.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_adv.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_scr.sv

// prim_generic implementations (actual logic behind the shims)
// Note: prim_generic_clock_gating.sv and prim_generic_buf.sv are already in modifiedCoreRTL
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_flop.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_clock_mux2.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_and2.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_ram_1p.sv
${PROJ_ROOT}/baseline_ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_ram_2p.sv

// ─── 5. DV prim shims ───
// FuseSoC normally generates these; we use the DV stop-gap wrappers.
// prim_clock_gating, prim_buf are in modifiedCoreRTL (see section 6).
${PROJ_ROOT}/baseline_ibex/dv/uvm/core_ibex/common/prim/prim_flop.sv
${PROJ_ROOT}/baseline_ibex/dv/uvm/core_ibex/common/prim/prim_clock_mux2.sv
${PROJ_ROOT}/baseline_ibex/dv/uvm/core_ibex/common/prim/prim_and2.sv
${PROJ_ROOT}/baseline_ibex/dv/uvm/core_ibex/common/prim/prim_ram_1p.sv
${PROJ_ROOT}/modifiedCoreTesting/tb/prim_ram_2p.sv

// ─── 6. modifiedCoreRTL ───
// IMPORTANT: For GLS, we only include RTL modules that live OUTSIDE ibex_core.
// All modules INSIDE ibex_core are already defined in Core_netlist.v.
// Including RTL versions of those modules would shadow the netlist definitions
// (e.g., ibex_compressed_decoder exists with the exact same name in both RTL
// and netlist, causing the wrong module to bind and producing x-propagation).
//
// Modules needed outside ibex_core:
//   - prim infrastructure (buf, clock_gating, flop macros)
//   - gng.v (RNG in ibex_simple_system)
//   - ibex_register_file_ff (instantiated by ibex_top, outside ibex_core)
//   - ibex_lockstep (compiled but not elaborated when SecureIbex=0)
//   - ibex_top, ibex_core_wrapper, ibex_top_tracing, ibex_tracer
//   - ibex_simple_system_gls

// Prim infrastructure
${PROJ_ROOT}/modifiedCoreRTL/prim_flop_macros.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_buf.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_generic_buf.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_clock_gating.sv
${PROJ_ROOT}/modifiedCoreRTL/prim_generic_clock_gating.sv

// RNG for ibex_simple_system
${PROJ_ROOT}/modifiedCoreRTL/gng.v

// Register file (lives in ibex_top, OUTSIDE ibex_core)
${PROJ_ROOT}/modifiedCoreRTL/ibex_register_file_ff.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_register_file_fpga.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_register_file_latch.sv

// Lockstep (compiled but gated off for SecureIbex=0)
${PROJ_ROOT}/modifiedCoreRTL/ibex_lockstep.sv

// NOTE: The following are intentionally REMOVED for GLS — all are defined in
// Core_netlist.v and including them here would shadow the netlist versions:
//   ibex_alu.sv, ibex_branch_predict.sv, ibex_compressed_decoder.sv,
//   ibex_controller.sv, ibex_counter.sv, ibex_csr.sv, ibex_cs_registers.sv,
//   ibex_decoder.sv, ibex_dummy_instr.sv, ibex_ex_block.sv,
//   ibex_fetch_fifo.sv, ibex_icache.sv, ibex_id_stage.sv, ibex_if_stage.sv,
//   ibex_load_store_unit.sv, ibex_multdiv_fast.sv, ibex_multdiv_slow.sv,
//   ibex_pmp.sv, ibex_prefetch_buffer.sv, ibex_wb_stage.sv,
//   ibex_core.sv, gates_cmo.v

// Top-level integration
${PROJ_ROOT}/modifiedCoreTesting/rtl/ibex_core_wrapper_gls.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_top.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_tracer.sv
${PROJ_ROOT}/modifiedCoreRTL/ibex_top_tracing.sv
${PROJ_ROOT}/modifiedCoreTesting/rtl/ibex_simple_system_gls.sv

// ─── 7. Shared RTL (simple_system infrastructure) ───
${PROJ_ROOT}/baseline_ibex/shared/rtl/bus.sv
${PROJ_ROOT}/baseline_ibex/shared/rtl/ram_2p.sv
${PROJ_ROOT}/baseline_ibex/shared/rtl/timer.sv
${PROJ_ROOT}/baseline_ibex/shared/rtl/sim/simulator_ctrl.sv

// ─── 8. Testbench ───
${PROJ_ROOT}/modifiedCoreTesting/tb/gls_simple_system_tb.sv
