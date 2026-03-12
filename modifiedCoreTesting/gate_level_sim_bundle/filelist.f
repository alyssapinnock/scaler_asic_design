// ======== Include paths ========
-incdir sources/modifiedCoreRTL
-incdir sources/vendor/lowrisc_ip/ip/prim/rtl
-incdir sources/vendor/lowrisc_ip/ip/prim_generic/rtl

// ======== Include paths ========

// ======== Packages (must be first) ========
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_count_pkg.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_pkg.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p_pkg.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p_pkg.sv
sources/modifiedCoreRTL/ibex_pkg.sv
sources/modifiedCoreRTL/ibex_tracer_pkg.sv

// ======== Assertion macros ========
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv

// ======== Standard cell behavioral models ========
sources/modifiedCoreTesting/tb/std_cells_functional.v

// ======== CMO gate definitions ========
sources/modifiedCoreRTL/gates_cmo.v

// ======== Synthesized netlist (provides ibex_core with _s1 ports) ========
// NOTE: Do NOT also compile ibex_core.sv - netlist provides ibex_core module
sources/Synthesis/outputs/Core_netlist.v

// ======== Primitives ========
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_buf.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_clock_gating.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_en.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_2sync.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p.sv
sources/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_flop_macros.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_check.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_count.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_sparse_fsm_flop.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_adv.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_scr.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_subst_perm.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_prince.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_blanker.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_buf.sv
sources/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_flop.sv

// ======== Ibex RTL (everything EXCEPT ibex_core.sv - netlist provides that) ========
sources/modifiedCoreRTL/ibex_alu.sv
sources/modifiedCoreRTL/ibex_branch_predict.sv
sources/modifiedCoreRTL/ibex_compressed_decoder.sv
sources/modifiedCoreRTL/ibex_controller.sv
sources/modifiedCoreRTL/ibex_counter.sv
sources/modifiedCoreRTL/ibex_cs_registers.sv
sources/modifiedCoreRTL/ibex_csr.sv
sources/modifiedCoreRTL/ibex_decoder.sv
sources/modifiedCoreRTL/ibex_dummy_instr.sv
sources/modifiedCoreRTL/ibex_ex_block.sv
sources/modifiedCoreRTL/ibex_fetch_fifo.sv
sources/modifiedCoreRTL/ibex_icache.sv
sources/modifiedCoreRTL/ibex_id_stage.sv
sources/modifiedCoreRTL/ibex_if_stage.sv
sources/modifiedCoreRTL/ibex_load_store_unit.sv
sources/modifiedCoreRTL/ibex_lockstep.sv
sources/modifiedCoreRTL/ibex_multdiv_fast.sv
sources/modifiedCoreRTL/ibex_multdiv_slow.sv
sources/modifiedCoreRTL/ibex_pmp.sv
sources/modifiedCoreRTL/ibex_prefetch_buffer.sv
sources/modifiedCoreRTL/ibex_register_file_ff.sv
sources/modifiedCoreRTL/ibex_register_file_fpga.sv
sources/modifiedCoreRTL/ibex_register_file_latch.sv
sources/modifiedCoreRTL/ibex_wb_stage.sv

// ======== Real ibex_core_wrapper (XOR share splitting, config block removed) ========
sources/modifiedCoreTesting/rtl_test/ibex_core_wrapper_netlist.sv

// ======== ibex_top (original - RVFI ports undriven, netlist has no RVFI) ========
sources/modifiedCoreRTL/ibex_top.sv

// ======== ibex_top_tracing and tracer ========
sources/modifiedCoreRTL/ibex_top_tracing.sv
sources/modifiedCoreRTL/ibex_tracer.sv

// ======== GNG random number generator ========
sources/modifiedCoreRTL/gng.v

// ======== Support modules ========
sources/shared/rtl/bus.sv
sources/shared/rtl/ram_1p.sv
sources/shared/rtl/ram_2p.sv
sources/shared/rtl/sim/simulator_ctrl.sv
sources/shared/rtl/timer.sv

// ======== ibex_simple_system (netlist version with stubbed DPI-C) ========
sources/modifiedCoreTesting/rtl_test/ibex_simple_system_netlist.sv
