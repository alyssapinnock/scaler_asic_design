#set_db [get_db modules casr*] .dont_touch true
#set_db hdl_preserve_unused_registers true
#set_db hdl_unconnected_value 1
## Set libs and rtl path
# Set libs and rtl path
set_db init_lib_search_path ../lib/gpdk045_v_6_0/gsclib045/timing
set_db init_hdl_search_path ../rtl

set top                          "ibex_core"

# Read libs
read_libs slow_vdd1v0_basicCells.lib

get_db lib_cells -foreach { set_db $object .avoid true }
set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/INVX1      .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/AND2X1     .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/OR2X1      .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/XOR2X1     .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/DFFRHQX1   .avoid false
#set_db lib_cell:default_emulate_libset_max/slow_vdd1v0/DFFSHQX1   .avoid false

# Disables clock gating insertion
set_db / .lp_insert_clock_gating {false}

## Preserve hierarchies
set_db / .auto_ungroup {none}


# Read the design files
#read_hdl ../synthesis/gates_cmo.v
read_hdl -sv ibex_pkg.sv
read_hdl -sv prim_assert.sv
read_hdl lfsr43.v
read_hdl clkgen.v
read_hdl ring_oscillator.v
read_hdl casr37.v
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
#error
#elaborate
#Elaborate top level
elaborate ibex_core
read_hdl ../synthesis/gates_cmo.v
elaborate XOR2_CMO
read_hdl ../synthesis/gates_cmo.v
elaborate INV_CMO
read_hdl ../synthesis/gates_cmo.v
elaborate AN2_CMO
read_hdl ../synthesis/gates_cmo.v
elaborate OR2_CMO
read_hdl ../synthesis/gates_cmo.v
elaborate DFCNQ_CMO

current_design $top
## Synthesize the design
set_db / .lbr_seq_in_out_phase_opto true
syn_generic
syn_map

write_hdl ibex_core > netlist_unmasked.v

source ./test_final_masking_cmo.tcl

create_shared_top_ports $top
create_shared_hier_ports

set nregister [count_registers]
if {$nregister == 0} {
    puts "No registers found"
    suspend
}

# Width of the randbits bus (can be smaller than number of registers)
set randbits_width 16
set left_bit [expr {$randbits_width - 1}]
create_port_bus -left_bit $left_bit -right_bit 0 -name randbits -input $top
create_hport_everywhere "randbits" $left_bit
replace_cells_with_secure "CMO"

uniquify $top -verbose
connect_shared_wires $top "CMO"
connect_random_bus $randbits_width "CMO"

## generate verilog headers
write_synth_defines_vh  "CMO" $randbits_width "-1"
write_synth_defines_tcl "CMO" $randbits_width "-1"

# Generate synthesis reports
report_gates > ../Synthesis/reports/noisyCore_report_gates.rpt
report_area   > ../Synthesis/reports/noisyCore_report_area.rpt

# Write the synthesized netlist and other output files
write_hdl > ../Synthesis/outputs/noisyCore_netlist.v

puts "DONE"
