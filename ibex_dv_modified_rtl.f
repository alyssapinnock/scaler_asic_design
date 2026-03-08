// File list for running modified pre-synthesis RTL through Ibex DV/Co-sim
// Based on ibex_dv.f from Ibex repository

// GNG (Random Number Generator) for masking
$/home/net/al663069/ws/new_ibex_files/gng.v

// Include directories
+incdir+${LOWRISC_IP_DIR}/ip/prim/rtl
+incdir+${PRJ_DIR}/rtl
+incdir+/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL

// Prim package and basic modules
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_assert.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_util_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_count_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_count.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_22_16_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_22_16_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_64_57_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_64_57_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_22_16_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_22_16_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_mubi_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_adv.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_scr.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_ram_1p.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_ram_1p.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_clock_gating.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_clock_gating.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_buf.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_buf.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_clock_mux2.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_clock_mux2.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_flop.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_flop.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_and2.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_and2.sv

// Shared lowRISC code
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_cipher_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_lfsr.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_28_22_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_28_22_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_prince.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_subst_perm.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_28_22_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_28_22_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_check.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_mux.sv

// Modified Ibex CORE RTL files - using modifiedCoreRTL instead of baseline rtl
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_pkg.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer_pkg.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_alu.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_branch_predict.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_compressed_decoder.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_controller.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_csr.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_cs_registers.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_counter.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_decoder.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_dummy_instr.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_ex_block.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_fetch_fifo.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_id_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_if_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_load_store_unit.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_fast.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_slow.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_prefetch_buffer.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_pmp.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_wb_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_core.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_ff.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_fpga.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_latch.sv

// ICache
${PRJ_DIR}/rtl/ibex_icache.sv

// Top-level files - using modifiedCoreRTL versions if available
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_top.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_top_tracing.sv

// DV files
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent
+incdir+${PRJ_DIR}/vendor/google_riscv-dv/src
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/env
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/tests

${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf_agent_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_if.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_agent_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/env/core_ibex_env_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/tests/core_ibex_test_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/tb/core_ibex_tb_top.sv
