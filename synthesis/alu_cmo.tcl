# Set libs and rtl path
set_db init_lib_search_path ../lib/gpdk045_v_6_0/gsclib045/timing
set_db init_hdl_search_path ../rtl

set top                          "ibex_ex_block"

# Read libs
read_libs slow_vdd1v2_basicCells.lib

get_db lib_cells -foreach { set_db $object .avoid true }
set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/INVX1      .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/AND2X1     .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/OR2X1      .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/XOR2X1     .avoid false
set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/DFFRHQX1   .avoid false
#set_db lib_cell:default_emulate_libset_max/slow_vdd1v2/DFFSHQX1   .avoid false

# Disables clock gating insertion
set_db / .lp_insert_clock_gating {false}

## Preserve hierarchies
set_db / .auto_ungroup {none}

# Read the design files
read_hdl -sv ibex_pkg.sv
read_hdl -sv ibex_alu.sv
read_hdl -sv ibex_multdiv_slow.sv
read_hdl -sv ibex_multdiv_fast.sv
read_hdl -sv ibex_ex_block.sv
read_hdl ../synthesis/gates_cmo.v
# Elaborate top level
elaborate
# read_hdl ../synthesis/gates_cmo.v
# elaborate XOR2_CMO
# read_hdl ../synthesis/gates_cmo.v
# elaborate INV_CMO
# read_hdl ../synthesis/gates_cmo.v
# elaborate AN2_CMO
# read_hdl ../synthesis/gates_cmo.v
# elaborate OR2_CMO
# read_hdl ../synthesis/gates_cmo.v
# elaborate DFCNQ_CMO

current_design $top
## Synthesize the design
set_db / .lbr_seq_in_out_phase_opto true
syn_generic
syn_map

write_hdl > netlist_unmasked.v

source ./test_masking_cmo.tcl

create_shared_top_ports $top
create_shared_hier_ports

set nregister [count_registers]
if {$nregister == 0} {
    puts "No registers found"
    suspend
}


set left_bit [expr $nregister - 1]
create_port_bus -left_bit $left_bit -right_bit 0 -name randbits -input $top
create_hport_everywhere "randbits" $left_bit
replace_cells_with_secure "CMO"

uniquify $top -verbose
connect_shared_wires $top "CMO"
connect_random_bus $nregister "CMO"

## generate verilog headers
write_synth_defines_vh  "CMO" $nregister "-1"
write_synth_defines_tcl "CMO" $nregister "-1"

# Generate synthesis reports
report_gates > ../Synthesis/reports/Core_report_gates.rpt
report_area   > ../Synthesis/reports/Core_report_area.rpt

# Write the synthesized netlist and other output files
write_hdl > ../Synthesis/outputs/Core_netlist.v

puts "DONE"
