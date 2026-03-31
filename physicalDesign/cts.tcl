set_db design_process_node 45

source ./ndr.tcl

set_db cts_buffer_cells {CLKBUFX12 CLKBUFX16 CLKBUFX2 CLKBUFX20 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8}
set_db cts_inverter_cells {CLKINVX1 CLKINVX12 CLKINVX16 CLKINVX2 CLKINVX20 CLKINVX3 CLKINVX4 CLKINVX6 CLKINVX8 }

ccopt_design
time_design -post_cts -report_prefix ChipTop_post_CTS -report_dir timing

write_db post_CTS
