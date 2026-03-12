// ======== Include paths ========
-incdir /home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL
-incdir /home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl
-incdir /home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl

// ======== Packages (must be first) ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p_pkg.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_pkg.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer_pkg.sv

// ======== Assertion macros ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv

// ======== Standard cell behavioral models ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/tb/std_cells_functional.v

// ======== CMO gate definitions ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/gates_cmo.v

// ======== Synthesized netlist (provides ibex_core with _s1 ports) ========
// NOTE: Do NOT also compile ibex_core.sv - netlist provides ibex_core module
/home/net/al663069/SD2_ws/scaler_asic_design/Synthesis/outputs/Core_netlist.v

// ======== Primitives ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_buf.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_clock_gating.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_en.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_2sync.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_flop_macros.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_check.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sparse_fsm_flop.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_adv.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_scr.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_subst_perm.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_prince.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_blanker.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_buf.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_flop.sv

// ======== Ibex RTL (everything EXCEPT ibex_core.sv - netlist provides that) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_alu.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_branch_predict.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_compressed_decoder.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_controller.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_counter.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_cs_registers.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_csr.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_decoder.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_dummy_instr.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_ex_block.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_fetch_fifo.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_icache.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_id_stage.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_if_stage.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_load_store_unit.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_lockstep.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_fast.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_slow.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_pmp.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_prefetch_buffer.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_ff.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_fpga.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_latch.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_wb_stage.sv

// ======== Real ibex_core_wrapper (XOR share splitting, config block removed) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/ibex_core_wrapper_netlist.sv

// ======== ibex_top (original - RVFI ports undriven, netlist has no RVFI) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_top.sv

// ======== ibex_top_tracing and tracer ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_top_tracing.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer.sv

// ======== GNG random number generator ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/gng.v

// ======== Support modules ========
/home/net/al663069/SD2_ws/ibex/shared/rtl/bus.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/ram_1p.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/ram_2p.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/sim/simulator_ctrl.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/timer.sv

// ======== ibex_simple_system (netlist version with stubbed DPI-C) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/ibex_simple_system_netlist.sv
