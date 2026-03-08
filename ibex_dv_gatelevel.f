// File list for running gate-level netlist through Ibex DV/Co-sim
// Based on ibex_dv.f from Ibex repository

// Timing and delay control
+define+FUNCTIONAL
+delay_mode_zero
+no_notifier
+notimingcheck

// Standard Cell Library behavioral models
/home/net/al663069/ws/scaler_asic_design/stdcell_models.v

// GNG (Random Number Generator) for masking
$/home/net/al663069/ws/new_ibex_files/gng.v

// Include directories
+incdir+${LOWRISC_IP_DIR}/ip/prim/rtl
+incdir+${PRJ_DIR}/rtl
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/common/prim

// Prim package and basic modules (needed for interfaces)
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_assert.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_util_pkg.sv

// Ibex package (needed for types and parameters)
${PRJ_DIR}/rtl/ibex_pkg.sv
${PRJ_DIR}/rtl/ibex_tracer_pkg.sv

// Gate-level netlist and wrapper
/home/net/al663069/ws/scaler_asic_design/Synthesis/outputs/Core_netlist.v
/home/net/al663069/ws/scaler_asic_design/gate_level_wrapper.sv

// If using ibex_top wrapper, include necessary support files
${PRJ_DIR}/rtl/ibex_tracer.sv

// Memory models and testbench infrastructure
${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf_agent_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_if.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_agent_pkg.sv

// UVM environment
${PRJ_DIR}/dv/uvm/core_ibex/env/core_ibex_env_pkg.sv

// Tests
${PRJ_DIR}/dv/uvm/core_ibex/tests/core_ibex_test_pkg.sv

// Top-level testbench
${PRJ_DIR}/dv/uvm/core_ibex/tb/core_ibex_tb_top.sv
