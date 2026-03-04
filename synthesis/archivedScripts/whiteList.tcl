# Set libs and rtl path
set_db init_lib_search_path /home/net/jo634076/trialOneRun/lib/gpdk045_v_6_0/gsclib045/timing
set_db init_hdl_search_path ../rtl

set top                          "ibex_core"

# Read libs
#read_libs slow_vdd1v2_basicCells.lib

create_library_domain {masklib_dom}
# set_db library_domain:masklib_dom     .library {tech.lib}
set_db library_domain:masklib_dom     .library {slow_vdd1v2_basicCells.lib}

get_db lib_cells -foreach { set_db $object .avoid true }
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/INVX1      .avoid false
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/AND2X1     .avoid false
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/OR2X1      .avoid false
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/XOR2X1     .avoid false
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/DFFRHQX1   .avoid false
# set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/DFFSHQX1   .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/INVX1      .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/AND2X1     .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/OR2X1      .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/XOR2X1     .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/DFFRHQX1   .avoid false
set_db lib_cell:ls_of_ld_masklib_dom/slow_vdd1v2/DFFSHQX1   .avoid false

# Disables clock gating insertion
set_db / .lp_insert_clock_gating {false}

## Preserve hierarchies
set_db / .auto_ungroup {none}

# Read the design files
# read_hdl -sv ibex_pkg.sv
# read_hdl -sv prim_assert.sv
# read_hdl -sv ibex_alu.sv
# read_hdl -sv ibex_branch_predict.sv
# read_hdl -sv ibex_compressed_decoder.sv
# read_hdl -sv ibex_controller.sv
# read_hdl -sv ibex_csr.sv
# read_hdl -sv ibex_cs_registers.sv
# read_hdl -sv ibex_counter.sv
# read_hdl -sv ibex_decoder.sv
# read_hdl -sv ibex_dummy_instr.sv
# read_hdl -sv ibex_ex_block.sv
# read_hdl -sv ibex_wb_stage.sv
# read_hdl -sv ibex_id_stage.sv
# read_hdl -sv ibex_icache.sv
# read_hdl -sv ibex_if_stage.sv
# read_hdl -sv ibex_load_store_unit.sv
# read_hdl -sv ibex_lockstep.sv
# read_hdl -sv ibex_multdiv_slow.sv
# read_hdl -sv ibex_multdiv_fast.sv
# read_hdl -sv ibex_prefetch_buffer.sv
# read_hdl -sv ibex_fetch_fifo.sv
# read_hdl -sv ibex_register_file_ff.sv
# read_hdl -sv ibex_register_file_fpga.sv
# read_hdl -sv ibex_register_file_latch.sv
# read_hdl -sv ibex_pmp.sv
# read_hdl -sv ibex_core.sv
read_hdl -sv ibex_pkg.sv
read_hdl -sv prim_assert.sv
read_hdl -sv ibex_alu.sv
read_hdl -sv ibex_branch_predict.sv
read_hdl -sv ibex_compressed_decoder.sv
read_hdl -sv ibex_controller.sv
read_hdl -sv ibex_csr.sv
read_hdl -sv ibex_cs_registers.sv
read_hdl -sv ibex_counter.sv
read_hdl -sv ibex_decoder.sv
read_hdl -sv ibex_dummy_instr.sv
read_hdl -sv ibex_ex_block.sv
read_hdl -sv ibex_wb_stage.sv
read_hdl -sv ibex_id_stage.sv
read_hdl -sv ibex_icache.sv
read_hdl -sv ibex_if_stage.sv
read_hdl -sv ibex_load_store_unit.sv
read_hdl -sv ibex_lockstep.sv
read_hdl -sv ibex_multdiv_slow.sv
read_hdl -sv ibex_multdiv_fast.sv
read_hdl -sv ibex_prefetch_buffer.sv
read_hdl -sv ibex_fetch_fifo.sv
read_hdl -sv ibex_register_file_ff.sv
read_hdl -sv ibex_register_file_fpga.sv
read_hdl -sv ibex_register_file_latch.sv
read_hdl -sv ibex_pmp.sv
read_hdl -sv ibex_core.sv

# Elaborate top level
elaborate ibex_core

ungroup -all -flatten

# Read constraints
read_sdc ../constraints/ibex_constraints.sdc

# Syntesize
set_db syn_generic_effort   med
set_db syn_map_effort       med 
set_db syn_opt_effort       med 

syn_generic
syn_map
syn_opt

# Generate synthesis reports
report_timing > ../Synthesis/reports/Core_report_timing.rpt
report_power  > ../Synthesis/reports/Core_report_power.rpt
report_area   > ../Synthesis/reports/Core_report_area.rpt
report_qor    > ../Synthesis/reports/Core_report_qor.rpt

# Write the synthesized netlist and other output files
write_hdl > ../Synthesis/outputs/Core_netlist.v
write_sdc > ../Synthesis/outputs/Core_sdc.sdc

#ungroup -all -flatten
