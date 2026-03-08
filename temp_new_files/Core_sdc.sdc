# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Thu Feb 19 23:03:41 EST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design ibex_core

create_clock -name "MAIN_CLK" -period 8.0 -waveform {0.0 4.0} [get_ports clk_i]
set_max_delay 8 -from [list \
  [get_ports clk_i]  \
  [get_ports rst_ni]  \
  [get_ports {hart_id_i[31]}]  \
  [get_ports {hart_id_i[30]}]  \
  [get_ports {hart_id_i[29]}]  \
  [get_ports {hart_id_i[28]}]  \
  [get_ports {hart_id_i[27]}]  \
  [get_ports {hart_id_i[26]}]  \
  [get_ports {hart_id_i[25]}]  \
  [get_ports {hart_id_i[24]}]  \
  [get_ports {hart_id_i[23]}]  \
  [get_ports {hart_id_i[22]}]  \
  [get_ports {hart_id_i[21]}]  \
  [get_ports {hart_id_i[20]}]  \
  [get_ports {hart_id_i[19]}]  \
  [get_ports {hart_id_i[18]}]  \
  [get_ports {hart_id_i[17]}]  \
  [get_ports {hart_id_i[16]}]  \
  [get_ports {hart_id_i[15]}]  \
  [get_ports {hart_id_i[14]}]  \
  [get_ports {hart_id_i[13]}]  \
  [get_ports {hart_id_i[12]}]  \
  [get_ports {hart_id_i[11]}]  \
  [get_ports {hart_id_i[10]}]  \
  [get_ports {hart_id_i[9]}]  \
  [get_ports {hart_id_i[8]}]  \
  [get_ports {hart_id_i[7]}]  \
  [get_ports {hart_id_i[6]}]  \
  [get_ports {hart_id_i[5]}]  \
  [get_ports {hart_id_i[4]}]  \
  [get_ports {hart_id_i[3]}]  \
  [get_ports {hart_id_i[2]}]  \
  [get_ports {hart_id_i[1]}]  \
  [get_ports {hart_id_i[0]}]  \
  [get_ports {boot_addr_i[31]}]  \
  [get_ports {boot_addr_i[30]}]  \
  [get_ports {boot_addr_i[29]}]  \
  [get_ports {boot_addr_i[28]}]  \
  [get_ports {boot_addr_i[27]}]  \
  [get_ports {boot_addr_i[26]}]  \
  [get_ports {boot_addr_i[25]}]  \
  [get_ports {boot_addr_i[24]}]  \
  [get_ports {boot_addr_i[23]}]  \
  [get_ports {boot_addr_i[22]}]  \
  [get_ports {boot_addr_i[21]}]  \
  [get_ports {boot_addr_i[20]}]  \
  [get_ports {boot_addr_i[19]}]  \
  [get_ports {boot_addr_i[18]}]  \
  [get_ports {boot_addr_i[17]}]  \
  [get_ports {boot_addr_i[16]}]  \
  [get_ports {boot_addr_i[15]}]  \
  [get_ports {boot_addr_i[14]}]  \
  [get_ports {boot_addr_i[13]}]  \
  [get_ports {boot_addr_i[12]}]  \
  [get_ports {boot_addr_i[11]}]  \
  [get_ports {boot_addr_i[10]}]  \
  [get_ports {boot_addr_i[9]}]  \
  [get_ports {boot_addr_i[8]}]  \
  [get_ports {boot_addr_i[7]}]  \
  [get_ports {boot_addr_i[6]}]  \
  [get_ports {boot_addr_i[5]}]  \
  [get_ports {boot_addr_i[4]}]  \
  [get_ports {boot_addr_i[3]}]  \
  [get_ports {boot_addr_i[2]}]  \
  [get_ports {boot_addr_i[1]}]  \
  [get_ports {boot_addr_i[0]}]  \
  [get_ports instr_gnt_i]  \
  [get_ports instr_rvalid_i]  \
  [get_ports {instr_rdata_i[31]}]  \
  [get_ports {instr_rdata_i[30]}]  \
  [get_ports {instr_rdata_i[29]}]  \
  [get_ports {instr_rdata_i[28]}]  \
  [get_ports {instr_rdata_i[27]}]  \
  [get_ports {instr_rdata_i[26]}]  \
  [get_ports {instr_rdata_i[25]}]  \
  [get_ports {instr_rdata_i[24]}]  \
  [get_ports {instr_rdata_i[23]}]  \
  [get_ports {instr_rdata_i[22]}]  \
  [get_ports {instr_rdata_i[21]}]  \
  [get_ports {instr_rdata_i[20]}]  \
  [get_ports {instr_rdata_i[19]}]  \
  [get_ports {instr_rdata_i[18]}]  \
  [get_ports {instr_rdata_i[17]}]  \
  [get_ports {instr_rdata_i[16]}]  \
  [get_ports {instr_rdata_i[15]}]  \
  [get_ports {instr_rdata_i[14]}]  \
  [get_ports {instr_rdata_i[13]}]  \
  [get_ports {instr_rdata_i[12]}]  \
  [get_ports {instr_rdata_i[11]}]  \
  [get_ports {instr_rdata_i[10]}]  \
  [get_ports {instr_rdata_i[9]}]  \
  [get_ports {instr_rdata_i[8]}]  \
  [get_ports {instr_rdata_i[7]}]  \
  [get_ports {instr_rdata_i[6]}]  \
  [get_ports {instr_rdata_i[5]}]  \
  [get_ports {instr_rdata_i[4]}]  \
  [get_ports {instr_rdata_i[3]}]  \
  [get_ports {instr_rdata_i[2]}]  \
  [get_ports {instr_rdata_i[1]}]  \
  [get_ports {instr_rdata_i[0]}]  \
  [get_ports instr_err_i]  \
  [get_ports data_gnt_i]  \
  [get_ports data_rvalid_i]  \
  [get_ports {data_rdata_i[31]}]  \
  [get_ports {data_rdata_i[30]}]  \
  [get_ports {data_rdata_i[29]}]  \
  [get_ports {data_rdata_i[28]}]  \
  [get_ports {data_rdata_i[27]}]  \
  [get_ports {data_rdata_i[26]}]  \
  [get_ports {data_rdata_i[25]}]  \
  [get_ports {data_rdata_i[24]}]  \
  [get_ports {data_rdata_i[23]}]  \
  [get_ports {data_rdata_i[22]}]  \
  [get_ports {data_rdata_i[21]}]  \
  [get_ports {data_rdata_i[20]}]  \
  [get_ports {data_rdata_i[19]}]  \
  [get_ports {data_rdata_i[18]}]  \
  [get_ports {data_rdata_i[17]}]  \
  [get_ports {data_rdata_i[16]}]  \
  [get_ports {data_rdata_i[15]}]  \
  [get_ports {data_rdata_i[14]}]  \
  [get_ports {data_rdata_i[13]}]  \
  [get_ports {data_rdata_i[12]}]  \
  [get_ports {data_rdata_i[11]}]  \
  [get_ports {data_rdata_i[10]}]  \
  [get_ports {data_rdata_i[9]}]  \
  [get_ports {data_rdata_i[8]}]  \
  [get_ports {data_rdata_i[7]}]  \
  [get_ports {data_rdata_i[6]}]  \
  [get_ports {data_rdata_i[5]}]  \
  [get_ports {data_rdata_i[4]}]  \
  [get_ports {data_rdata_i[3]}]  \
  [get_ports {data_rdata_i[2]}]  \
  [get_ports {data_rdata_i[1]}]  \
  [get_ports {data_rdata_i[0]}]  \
  [get_ports data_err_i]  \
  [get_ports {rf_rdata_a_ecc_i[31]}]  \
  [get_ports {rf_rdata_a_ecc_i[30]}]  \
  [get_ports {rf_rdata_a_ecc_i[29]}]  \
  [get_ports {rf_rdata_a_ecc_i[28]}]  \
  [get_ports {rf_rdata_a_ecc_i[27]}]  \
  [get_ports {rf_rdata_a_ecc_i[26]}]  \
  [get_ports {rf_rdata_a_ecc_i[25]}]  \
  [get_ports {rf_rdata_a_ecc_i[24]}]  \
  [get_ports {rf_rdata_a_ecc_i[23]}]  \
  [get_ports {rf_rdata_a_ecc_i[22]}]  \
  [get_ports {rf_rdata_a_ecc_i[21]}]  \
  [get_ports {rf_rdata_a_ecc_i[20]}]  \
  [get_ports {rf_rdata_a_ecc_i[19]}]  \
  [get_ports {rf_rdata_a_ecc_i[18]}]  \
  [get_ports {rf_rdata_a_ecc_i[17]}]  \
  [get_ports {rf_rdata_a_ecc_i[16]}]  \
  [get_ports {rf_rdata_a_ecc_i[15]}]  \
  [get_ports {rf_rdata_a_ecc_i[14]}]  \
  [get_ports {rf_rdata_a_ecc_i[13]}]  \
  [get_ports {rf_rdata_a_ecc_i[12]}]  \
  [get_ports {rf_rdata_a_ecc_i[11]}]  \
  [get_ports {rf_rdata_a_ecc_i[10]}]  \
  [get_ports {rf_rdata_a_ecc_i[9]}]  \
  [get_ports {rf_rdata_a_ecc_i[8]}]  \
  [get_ports {rf_rdata_a_ecc_i[7]}]  \
  [get_ports {rf_rdata_a_ecc_i[6]}]  \
  [get_ports {rf_rdata_a_ecc_i[5]}]  \
  [get_ports {rf_rdata_a_ecc_i[4]}]  \
  [get_ports {rf_rdata_a_ecc_i[3]}]  \
  [get_ports {rf_rdata_a_ecc_i[2]}]  \
  [get_ports {rf_rdata_a_ecc_i[1]}]  \
  [get_ports {rf_rdata_a_ecc_i[0]}]  \
  [get_ports {rf_rdata_b_ecc_i[31]}]  \
  [get_ports {rf_rdata_b_ecc_i[30]}]  \
  [get_ports {rf_rdata_b_ecc_i[29]}]  \
  [get_ports {rf_rdata_b_ecc_i[28]}]  \
  [get_ports {rf_rdata_b_ecc_i[27]}]  \
  [get_ports {rf_rdata_b_ecc_i[26]}]  \
  [get_ports {rf_rdata_b_ecc_i[25]}]  \
  [get_ports {rf_rdata_b_ecc_i[24]}]  \
  [get_ports {rf_rdata_b_ecc_i[23]}]  \
  [get_ports {rf_rdata_b_ecc_i[22]}]  \
  [get_ports {rf_rdata_b_ecc_i[21]}]  \
  [get_ports {rf_rdata_b_ecc_i[20]}]  \
  [get_ports {rf_rdata_b_ecc_i[19]}]  \
  [get_ports {rf_rdata_b_ecc_i[18]}]  \
  [get_ports {rf_rdata_b_ecc_i[17]}]  \
  [get_ports {rf_rdata_b_ecc_i[16]}]  \
  [get_ports {rf_rdata_b_ecc_i[15]}]  \
  [get_ports {rf_rdata_b_ecc_i[14]}]  \
  [get_ports {rf_rdata_b_ecc_i[13]}]  \
  [get_ports {rf_rdata_b_ecc_i[12]}]  \
  [get_ports {rf_rdata_b_ecc_i[11]}]  \
  [get_ports {rf_rdata_b_ecc_i[10]}]  \
  [get_ports {rf_rdata_b_ecc_i[9]}]  \
  [get_ports {rf_rdata_b_ecc_i[8]}]  \
  [get_ports {rf_rdata_b_ecc_i[7]}]  \
  [get_ports {rf_rdata_b_ecc_i[6]}]  \
  [get_ports {rf_rdata_b_ecc_i[5]}]  \
  [get_ports {rf_rdata_b_ecc_i[4]}]  \
  [get_ports {rf_rdata_b_ecc_i[3]}]  \
  [get_ports {rf_rdata_b_ecc_i[2]}]  \
  [get_ports {rf_rdata_b_ecc_i[1]}]  \
  [get_ports {rf_rdata_b_ecc_i[0]}]  \
  [get_ports {ic_tag_rdata_i[1][21]}]  \
  [get_ports {ic_tag_rdata_i[1][20]}]  \
  [get_ports {ic_tag_rdata_i[1][19]}]  \
  [get_ports {ic_tag_rdata_i[1][18]}]  \
  [get_ports {ic_tag_rdata_i[1][17]}]  \
  [get_ports {ic_tag_rdata_i[1][16]}]  \
  [get_ports {ic_tag_rdata_i[1][15]}]  \
  [get_ports {ic_tag_rdata_i[1][14]}]  \
  [get_ports {ic_tag_rdata_i[1][13]}]  \
  [get_ports {ic_tag_rdata_i[1][12]}]  \
  [get_ports {ic_tag_rdata_i[1][11]}]  \
  [get_ports {ic_tag_rdata_i[1][10]}]  \
  [get_ports {ic_tag_rdata_i[1][9]}]  \
  [get_ports {ic_tag_rdata_i[1][8]}]  \
  [get_ports {ic_tag_rdata_i[1][7]}]  \
  [get_ports {ic_tag_rdata_i[1][6]}]  \
  [get_ports {ic_tag_rdata_i[1][5]}]  \
  [get_ports {ic_tag_rdata_i[1][4]}]  \
  [get_ports {ic_tag_rdata_i[1][3]}]  \
  [get_ports {ic_tag_rdata_i[1][2]}]  \
  [get_ports {ic_tag_rdata_i[1][1]}]  \
  [get_ports {ic_tag_rdata_i[1][0]}]  \
  [get_ports {ic_tag_rdata_i[0][21]}]  \
  [get_ports {ic_tag_rdata_i[0][20]}]  \
  [get_ports {ic_tag_rdata_i[0][19]}]  \
  [get_ports {ic_tag_rdata_i[0][18]}]  \
  [get_ports {ic_tag_rdata_i[0][17]}]  \
  [get_ports {ic_tag_rdata_i[0][16]}]  \
  [get_ports {ic_tag_rdata_i[0][15]}]  \
  [get_ports {ic_tag_rdata_i[0][14]}]  \
  [get_ports {ic_tag_rdata_i[0][13]}]  \
  [get_ports {ic_tag_rdata_i[0][12]}]  \
  [get_ports {ic_tag_rdata_i[0][11]}]  \
  [get_ports {ic_tag_rdata_i[0][10]}]  \
  [get_ports {ic_tag_rdata_i[0][9]}]  \
  [get_ports {ic_tag_rdata_i[0][8]}]  \
  [get_ports {ic_tag_rdata_i[0][7]}]  \
  [get_ports {ic_tag_rdata_i[0][6]}]  \
  [get_ports {ic_tag_rdata_i[0][5]}]  \
  [get_ports {ic_tag_rdata_i[0][4]}]  \
  [get_ports {ic_tag_rdata_i[0][3]}]  \
  [get_ports {ic_tag_rdata_i[0][2]}]  \
  [get_ports {ic_tag_rdata_i[0][1]}]  \
  [get_ports {ic_tag_rdata_i[0][0]}]  \
  [get_ports {ic_data_rdata_i[1][63]}]  \
  [get_ports {ic_data_rdata_i[1][62]}]  \
  [get_ports {ic_data_rdata_i[1][61]}]  \
  [get_ports {ic_data_rdata_i[1][60]}]  \
  [get_ports {ic_data_rdata_i[1][59]}]  \
  [get_ports {ic_data_rdata_i[1][58]}]  \
  [get_ports {ic_data_rdata_i[1][57]}]  \
  [get_ports {ic_data_rdata_i[1][56]}]  \
  [get_ports {ic_data_rdata_i[1][55]}]  \
  [get_ports {ic_data_rdata_i[1][54]}]  \
  [get_ports {ic_data_rdata_i[1][53]}]  \
  [get_ports {ic_data_rdata_i[1][52]}]  \
  [get_ports {ic_data_rdata_i[1][51]}]  \
  [get_ports {ic_data_rdata_i[1][50]}]  \
  [get_ports {ic_data_rdata_i[1][49]}]  \
  [get_ports {ic_data_rdata_i[1][48]}]  \
  [get_ports {ic_data_rdata_i[1][47]}]  \
  [get_ports {ic_data_rdata_i[1][46]}]  \
  [get_ports {ic_data_rdata_i[1][45]}]  \
  [get_ports {ic_data_rdata_i[1][44]}]  \
  [get_ports {ic_data_rdata_i[1][43]}]  \
  [get_ports {ic_data_rdata_i[1][42]}]  \
  [get_ports {ic_data_rdata_i[1][41]}]  \
  [get_ports {ic_data_rdata_i[1][40]}]  \
  [get_ports {ic_data_rdata_i[1][39]}]  \
  [get_ports {ic_data_rdata_i[1][38]}]  \
  [get_ports {ic_data_rdata_i[1][37]}]  \
  [get_ports {ic_data_rdata_i[1][36]}]  \
  [get_ports {ic_data_rdata_i[1][35]}]  \
  [get_ports {ic_data_rdata_i[1][34]}]  \
  [get_ports {ic_data_rdata_i[1][33]}]  \
  [get_ports {ic_data_rdata_i[1][32]}]  \
  [get_ports {ic_data_rdata_i[1][31]}]  \
  [get_ports {ic_data_rdata_i[1][30]}]  \
  [get_ports {ic_data_rdata_i[1][29]}]  \
  [get_ports {ic_data_rdata_i[1][28]}]  \
  [get_ports {ic_data_rdata_i[1][27]}]  \
  [get_ports {ic_data_rdata_i[1][26]}]  \
  [get_ports {ic_data_rdata_i[1][25]}]  \
  [get_ports {ic_data_rdata_i[1][24]}]  \
  [get_ports {ic_data_rdata_i[1][23]}]  \
  [get_ports {ic_data_rdata_i[1][22]}]  \
  [get_ports {ic_data_rdata_i[1][21]}]  \
  [get_ports {ic_data_rdata_i[1][20]}]  \
  [get_ports {ic_data_rdata_i[1][19]}]  \
  [get_ports {ic_data_rdata_i[1][18]}]  \
  [get_ports {ic_data_rdata_i[1][17]}]  \
  [get_ports {ic_data_rdata_i[1][16]}]  \
  [get_ports {ic_data_rdata_i[1][15]}]  \
  [get_ports {ic_data_rdata_i[1][14]}]  \
  [get_ports {ic_data_rdata_i[1][13]}]  \
  [get_ports {ic_data_rdata_i[1][12]}]  \
  [get_ports {ic_data_rdata_i[1][11]}]  \
  [get_ports {ic_data_rdata_i[1][10]}]  \
  [get_ports {ic_data_rdata_i[1][9]}]  \
  [get_ports {ic_data_rdata_i[1][8]}]  \
  [get_ports {ic_data_rdata_i[1][7]}]  \
  [get_ports {ic_data_rdata_i[1][6]}]  \
  [get_ports {ic_data_rdata_i[1][5]}]  \
  [get_ports {ic_data_rdata_i[1][4]}]  \
  [get_ports {ic_data_rdata_i[1][3]}]  \
  [get_ports {ic_data_rdata_i[1][2]}]  \
  [get_ports {ic_data_rdata_i[1][1]}]  \
  [get_ports {ic_data_rdata_i[1][0]}]  \
  [get_ports {ic_data_rdata_i[0][63]}]  \
  [get_ports {ic_data_rdata_i[0][62]}]  \
  [get_ports {ic_data_rdata_i[0][61]}]  \
  [get_ports {ic_data_rdata_i[0][60]}]  \
  [get_ports {ic_data_rdata_i[0][59]}]  \
  [get_ports {ic_data_rdata_i[0][58]}]  \
  [get_ports {ic_data_rdata_i[0][57]}]  \
  [get_ports {ic_data_rdata_i[0][56]}]  \
  [get_ports {ic_data_rdata_i[0][55]}]  \
  [get_ports {ic_data_rdata_i[0][54]}]  \
  [get_ports {ic_data_rdata_i[0][53]}]  \
  [get_ports {ic_data_rdata_i[0][52]}]  \
  [get_ports {ic_data_rdata_i[0][51]}]  \
  [get_ports {ic_data_rdata_i[0][50]}]  \
  [get_ports {ic_data_rdata_i[0][49]}]  \
  [get_ports {ic_data_rdata_i[0][48]}]  \
  [get_ports {ic_data_rdata_i[0][47]}]  \
  [get_ports {ic_data_rdata_i[0][46]}]  \
  [get_ports {ic_data_rdata_i[0][45]}]  \
  [get_ports {ic_data_rdata_i[0][44]}]  \
  [get_ports {ic_data_rdata_i[0][43]}]  \
  [get_ports {ic_data_rdata_i[0][42]}]  \
  [get_ports {ic_data_rdata_i[0][41]}]  \
  [get_ports {ic_data_rdata_i[0][40]}]  \
  [get_ports {ic_data_rdata_i[0][39]}]  \
  [get_ports {ic_data_rdata_i[0][38]}]  \
  [get_ports {ic_data_rdata_i[0][37]}]  \
  [get_ports {ic_data_rdata_i[0][36]}]  \
  [get_ports {ic_data_rdata_i[0][35]}]  \
  [get_ports {ic_data_rdata_i[0][34]}]  \
  [get_ports {ic_data_rdata_i[0][33]}]  \
  [get_ports {ic_data_rdata_i[0][32]}]  \
  [get_ports {ic_data_rdata_i[0][31]}]  \
  [get_ports {ic_data_rdata_i[0][30]}]  \
  [get_ports {ic_data_rdata_i[0][29]}]  \
  [get_ports {ic_data_rdata_i[0][28]}]  \
  [get_ports {ic_data_rdata_i[0][27]}]  \
  [get_ports {ic_data_rdata_i[0][26]}]  \
  [get_ports {ic_data_rdata_i[0][25]}]  \
  [get_ports {ic_data_rdata_i[0][24]}]  \
  [get_ports {ic_data_rdata_i[0][23]}]  \
  [get_ports {ic_data_rdata_i[0][22]}]  \
  [get_ports {ic_data_rdata_i[0][21]}]  \
  [get_ports {ic_data_rdata_i[0][20]}]  \
  [get_ports {ic_data_rdata_i[0][19]}]  \
  [get_ports {ic_data_rdata_i[0][18]}]  \
  [get_ports {ic_data_rdata_i[0][17]}]  \
  [get_ports {ic_data_rdata_i[0][16]}]  \
  [get_ports {ic_data_rdata_i[0][15]}]  \
  [get_ports {ic_data_rdata_i[0][14]}]  \
  [get_ports {ic_data_rdata_i[0][13]}]  \
  [get_ports {ic_data_rdata_i[0][12]}]  \
  [get_ports {ic_data_rdata_i[0][11]}]  \
  [get_ports {ic_data_rdata_i[0][10]}]  \
  [get_ports {ic_data_rdata_i[0][9]}]  \
  [get_ports {ic_data_rdata_i[0][8]}]  \
  [get_ports {ic_data_rdata_i[0][7]}]  \
  [get_ports {ic_data_rdata_i[0][6]}]  \
  [get_ports {ic_data_rdata_i[0][5]}]  \
  [get_ports {ic_data_rdata_i[0][4]}]  \
  [get_ports {ic_data_rdata_i[0][3]}]  \
  [get_ports {ic_data_rdata_i[0][2]}]  \
  [get_ports {ic_data_rdata_i[0][1]}]  \
  [get_ports {ic_data_rdata_i[0][0]}]  \
  [get_ports ic_scr_key_valid_i]  \
  [get_ports irq_software_i]  \
  [get_ports irq_timer_i]  \
  [get_ports irq_external_i]  \
  [get_ports {irq_fast_i[14]}]  \
  [get_ports {irq_fast_i[13]}]  \
  [get_ports {irq_fast_i[12]}]  \
  [get_ports {irq_fast_i[11]}]  \
  [get_ports {irq_fast_i[10]}]  \
  [get_ports {irq_fast_i[9]}]  \
  [get_ports {irq_fast_i[8]}]  \
  [get_ports {irq_fast_i[7]}]  \
  [get_ports {irq_fast_i[6]}]  \
  [get_ports {irq_fast_i[5]}]  \
  [get_ports {irq_fast_i[4]}]  \
  [get_ports {irq_fast_i[3]}]  \
  [get_ports {irq_fast_i[2]}]  \
  [get_ports {irq_fast_i[1]}]  \
  [get_ports {irq_fast_i[0]}]  \
  [get_ports irq_nm_i]  \
  [get_ports debug_req_i]  \
  [get_ports {fetch_enable_i[3]}]  \
  [get_ports {fetch_enable_i[2]}]  \
  [get_ports {fetch_enable_i[1]}]  \
  [get_ports {fetch_enable_i[0]}] ] -to [list \
  [get_ports instr_req_o]  \
  [get_ports {instr_addr_o[31]}]  \
  [get_ports {instr_addr_o[30]}]  \
  [get_ports {instr_addr_o[29]}]  \
  [get_ports {instr_addr_o[28]}]  \
  [get_ports {instr_addr_o[27]}]  \
  [get_ports {instr_addr_o[26]}]  \
  [get_ports {instr_addr_o[25]}]  \
  [get_ports {instr_addr_o[24]}]  \
  [get_ports {instr_addr_o[23]}]  \
  [get_ports {instr_addr_o[22]}]  \
  [get_ports {instr_addr_o[21]}]  \
  [get_ports {instr_addr_o[20]}]  \
  [get_ports {instr_addr_o[19]}]  \
  [get_ports {instr_addr_o[18]}]  \
  [get_ports {instr_addr_o[17]}]  \
  [get_ports {instr_addr_o[16]}]  \
  [get_ports {instr_addr_o[15]}]  \
  [get_ports {instr_addr_o[14]}]  \
  [get_ports {instr_addr_o[13]}]  \
  [get_ports {instr_addr_o[12]}]  \
  [get_ports {instr_addr_o[11]}]  \
  [get_ports {instr_addr_o[10]}]  \
  [get_ports {instr_addr_o[9]}]  \
  [get_ports {instr_addr_o[8]}]  \
  [get_ports {instr_addr_o[7]}]  \
  [get_ports {instr_addr_o[6]}]  \
  [get_ports {instr_addr_o[5]}]  \
  [get_ports {instr_addr_o[4]}]  \
  [get_ports {instr_addr_o[3]}]  \
  [get_ports {instr_addr_o[2]}]  \
  [get_ports {instr_addr_o[1]}]  \
  [get_ports {instr_addr_o[0]}]  \
  [get_ports data_req_o]  \
  [get_ports data_we_o]  \
  [get_ports {data_be_o[3]}]  \
  [get_ports {data_be_o[2]}]  \
  [get_ports {data_be_o[1]}]  \
  [get_ports {data_be_o[0]}]  \
  [get_ports {data_addr_o[31]}]  \
  [get_ports {data_addr_o[30]}]  \
  [get_ports {data_addr_o[29]}]  \
  [get_ports {data_addr_o[28]}]  \
  [get_ports {data_addr_o[27]}]  \
  [get_ports {data_addr_o[26]}]  \
  [get_ports {data_addr_o[25]}]  \
  [get_ports {data_addr_o[24]}]  \
  [get_ports {data_addr_o[23]}]  \
  [get_ports {data_addr_o[22]}]  \
  [get_ports {data_addr_o[21]}]  \
  [get_ports {data_addr_o[20]}]  \
  [get_ports {data_addr_o[19]}]  \
  [get_ports {data_addr_o[18]}]  \
  [get_ports {data_addr_o[17]}]  \
  [get_ports {data_addr_o[16]}]  \
  [get_ports {data_addr_o[15]}]  \
  [get_ports {data_addr_o[14]}]  \
  [get_ports {data_addr_o[13]}]  \
  [get_ports {data_addr_o[12]}]  \
  [get_ports {data_addr_o[11]}]  \
  [get_ports {data_addr_o[10]}]  \
  [get_ports {data_addr_o[9]}]  \
  [get_ports {data_addr_o[8]}]  \
  [get_ports {data_addr_o[7]}]  \
  [get_ports {data_addr_o[6]}]  \
  [get_ports {data_addr_o[5]}]  \
  [get_ports {data_addr_o[4]}]  \
  [get_ports {data_addr_o[3]}]  \
  [get_ports {data_addr_o[2]}]  \
  [get_ports {data_addr_o[1]}]  \
  [get_ports {data_addr_o[0]}]  \
  [get_ports {data_wdata_o[31]}]  \
  [get_ports {data_wdata_o[30]}]  \
  [get_ports {data_wdata_o[29]}]  \
  [get_ports {data_wdata_o[28]}]  \
  [get_ports {data_wdata_o[27]}]  \
  [get_ports {data_wdata_o[26]}]  \
  [get_ports {data_wdata_o[25]}]  \
  [get_ports {data_wdata_o[24]}]  \
  [get_ports {data_wdata_o[23]}]  \
  [get_ports {data_wdata_o[22]}]  \
  [get_ports {data_wdata_o[21]}]  \
  [get_ports {data_wdata_o[20]}]  \
  [get_ports {data_wdata_o[19]}]  \
  [get_ports {data_wdata_o[18]}]  \
  [get_ports {data_wdata_o[17]}]  \
  [get_ports {data_wdata_o[16]}]  \
  [get_ports {data_wdata_o[15]}]  \
  [get_ports {data_wdata_o[14]}]  \
  [get_ports {data_wdata_o[13]}]  \
  [get_ports {data_wdata_o[12]}]  \
  [get_ports {data_wdata_o[11]}]  \
  [get_ports {data_wdata_o[10]}]  \
  [get_ports {data_wdata_o[9]}]  \
  [get_ports {data_wdata_o[8]}]  \
  [get_ports {data_wdata_o[7]}]  \
  [get_ports {data_wdata_o[6]}]  \
  [get_ports {data_wdata_o[5]}]  \
  [get_ports {data_wdata_o[4]}]  \
  [get_ports {data_wdata_o[3]}]  \
  [get_ports {data_wdata_o[2]}]  \
  [get_ports {data_wdata_o[1]}]  \
  [get_ports {data_wdata_o[0]}]  \
  [get_ports dummy_instr_id_o]  \
  [get_ports dummy_instr_wb_o]  \
  [get_ports {rf_raddr_a_o[4]}]  \
  [get_ports {rf_raddr_a_o[3]}]  \
  [get_ports {rf_raddr_a_o[2]}]  \
  [get_ports {rf_raddr_a_o[1]}]  \
  [get_ports {rf_raddr_a_o[0]}]  \
  [get_ports {rf_raddr_b_o[4]}]  \
  [get_ports {rf_raddr_b_o[3]}]  \
  [get_ports {rf_raddr_b_o[2]}]  \
  [get_ports {rf_raddr_b_o[1]}]  \
  [get_ports {rf_raddr_b_o[0]}]  \
  [get_ports {rf_waddr_wb_o[4]}]  \
  [get_ports {rf_waddr_wb_o[3]}]  \
  [get_ports {rf_waddr_wb_o[2]}]  \
  [get_ports {rf_waddr_wb_o[1]}]  \
  [get_ports {rf_waddr_wb_o[0]}]  \
  [get_ports rf_we_wb_o]  \
  [get_ports {rf_wdata_wb_ecc_o[31]}]  \
  [get_ports {rf_wdata_wb_ecc_o[30]}]  \
  [get_ports {rf_wdata_wb_ecc_o[29]}]  \
  [get_ports {rf_wdata_wb_ecc_o[28]}]  \
  [get_ports {rf_wdata_wb_ecc_o[27]}]  \
  [get_ports {rf_wdata_wb_ecc_o[26]}]  \
  [get_ports {rf_wdata_wb_ecc_o[25]}]  \
  [get_ports {rf_wdata_wb_ecc_o[24]}]  \
  [get_ports {rf_wdata_wb_ecc_o[23]}]  \
  [get_ports {rf_wdata_wb_ecc_o[22]}]  \
  [get_ports {rf_wdata_wb_ecc_o[21]}]  \
  [get_ports {rf_wdata_wb_ecc_o[20]}]  \
  [get_ports {rf_wdata_wb_ecc_o[19]}]  \
  [get_ports {rf_wdata_wb_ecc_o[18]}]  \
  [get_ports {rf_wdata_wb_ecc_o[17]}]  \
  [get_ports {rf_wdata_wb_ecc_o[16]}]  \
  [get_ports {rf_wdata_wb_ecc_o[15]}]  \
  [get_ports {rf_wdata_wb_ecc_o[14]}]  \
  [get_ports {rf_wdata_wb_ecc_o[13]}]  \
  [get_ports {rf_wdata_wb_ecc_o[12]}]  \
  [get_ports {rf_wdata_wb_ecc_o[11]}]  \
  [get_ports {rf_wdata_wb_ecc_o[10]}]  \
  [get_ports {rf_wdata_wb_ecc_o[9]}]  \
  [get_ports {rf_wdata_wb_ecc_o[8]}]  \
  [get_ports {rf_wdata_wb_ecc_o[7]}]  \
  [get_ports {rf_wdata_wb_ecc_o[6]}]  \
  [get_ports {rf_wdata_wb_ecc_o[5]}]  \
  [get_ports {rf_wdata_wb_ecc_o[4]}]  \
  [get_ports {rf_wdata_wb_ecc_o[3]}]  \
  [get_ports {rf_wdata_wb_ecc_o[2]}]  \
  [get_ports {rf_wdata_wb_ecc_o[1]}]  \
  [get_ports {rf_wdata_wb_ecc_o[0]}]  \
  [get_ports {ic_tag_req_o[1]}]  \
  [get_ports {ic_tag_req_o[0]}]  \
  [get_ports ic_tag_write_o]  \
  [get_ports {ic_tag_addr_o[7]}]  \
  [get_ports {ic_tag_addr_o[6]}]  \
  [get_ports {ic_tag_addr_o[5]}]  \
  [get_ports {ic_tag_addr_o[4]}]  \
  [get_ports {ic_tag_addr_o[3]}]  \
  [get_ports {ic_tag_addr_o[2]}]  \
  [get_ports {ic_tag_addr_o[1]}]  \
  [get_ports {ic_tag_addr_o[0]}]  \
  [get_ports {ic_tag_wdata_o[21]}]  \
  [get_ports {ic_tag_wdata_o[20]}]  \
  [get_ports {ic_tag_wdata_o[19]}]  \
  [get_ports {ic_tag_wdata_o[18]}]  \
  [get_ports {ic_tag_wdata_o[17]}]  \
  [get_ports {ic_tag_wdata_o[16]}]  \
  [get_ports {ic_tag_wdata_o[15]}]  \
  [get_ports {ic_tag_wdata_o[14]}]  \
  [get_ports {ic_tag_wdata_o[13]}]  \
  [get_ports {ic_tag_wdata_o[12]}]  \
  [get_ports {ic_tag_wdata_o[11]}]  \
  [get_ports {ic_tag_wdata_o[10]}]  \
  [get_ports {ic_tag_wdata_o[9]}]  \
  [get_ports {ic_tag_wdata_o[8]}]  \
  [get_ports {ic_tag_wdata_o[7]}]  \
  [get_ports {ic_tag_wdata_o[6]}]  \
  [get_ports {ic_tag_wdata_o[5]}]  \
  [get_ports {ic_tag_wdata_o[4]}]  \
  [get_ports {ic_tag_wdata_o[3]}]  \
  [get_ports {ic_tag_wdata_o[2]}]  \
  [get_ports {ic_tag_wdata_o[1]}]  \
  [get_ports {ic_tag_wdata_o[0]}]  \
  [get_ports {ic_data_req_o[1]}]  \
  [get_ports {ic_data_req_o[0]}]  \
  [get_ports ic_data_write_o]  \
  [get_ports {ic_data_addr_o[7]}]  \
  [get_ports {ic_data_addr_o[6]}]  \
  [get_ports {ic_data_addr_o[5]}]  \
  [get_ports {ic_data_addr_o[4]}]  \
  [get_ports {ic_data_addr_o[3]}]  \
  [get_ports {ic_data_addr_o[2]}]  \
  [get_ports {ic_data_addr_o[1]}]  \
  [get_ports {ic_data_addr_o[0]}]  \
  [get_ports {ic_data_wdata_o[63]}]  \
  [get_ports {ic_data_wdata_o[62]}]  \
  [get_ports {ic_data_wdata_o[61]}]  \
  [get_ports {ic_data_wdata_o[60]}]  \
  [get_ports {ic_data_wdata_o[59]}]  \
  [get_ports {ic_data_wdata_o[58]}]  \
  [get_ports {ic_data_wdata_o[57]}]  \
  [get_ports {ic_data_wdata_o[56]}]  \
  [get_ports {ic_data_wdata_o[55]}]  \
  [get_ports {ic_data_wdata_o[54]}]  \
  [get_ports {ic_data_wdata_o[53]}]  \
  [get_ports {ic_data_wdata_o[52]}]  \
  [get_ports {ic_data_wdata_o[51]}]  \
  [get_ports {ic_data_wdata_o[50]}]  \
  [get_ports {ic_data_wdata_o[49]}]  \
  [get_ports {ic_data_wdata_o[48]}]  \
  [get_ports {ic_data_wdata_o[47]}]  \
  [get_ports {ic_data_wdata_o[46]}]  \
  [get_ports {ic_data_wdata_o[45]}]  \
  [get_ports {ic_data_wdata_o[44]}]  \
  [get_ports {ic_data_wdata_o[43]}]  \
  [get_ports {ic_data_wdata_o[42]}]  \
  [get_ports {ic_data_wdata_o[41]}]  \
  [get_ports {ic_data_wdata_o[40]}]  \
  [get_ports {ic_data_wdata_o[39]}]  \
  [get_ports {ic_data_wdata_o[38]}]  \
  [get_ports {ic_data_wdata_o[37]}]  \
  [get_ports {ic_data_wdata_o[36]}]  \
  [get_ports {ic_data_wdata_o[35]}]  \
  [get_ports {ic_data_wdata_o[34]}]  \
  [get_ports {ic_data_wdata_o[33]}]  \
  [get_ports {ic_data_wdata_o[32]}]  \
  [get_ports {ic_data_wdata_o[31]}]  \
  [get_ports {ic_data_wdata_o[30]}]  \
  [get_ports {ic_data_wdata_o[29]}]  \
  [get_ports {ic_data_wdata_o[28]}]  \
  [get_ports {ic_data_wdata_o[27]}]  \
  [get_ports {ic_data_wdata_o[26]}]  \
  [get_ports {ic_data_wdata_o[25]}]  \
  [get_ports {ic_data_wdata_o[24]}]  \
  [get_ports {ic_data_wdata_o[23]}]  \
  [get_ports {ic_data_wdata_o[22]}]  \
  [get_ports {ic_data_wdata_o[21]}]  \
  [get_ports {ic_data_wdata_o[20]}]  \
  [get_ports {ic_data_wdata_o[19]}]  \
  [get_ports {ic_data_wdata_o[18]}]  \
  [get_ports {ic_data_wdata_o[17]}]  \
  [get_ports {ic_data_wdata_o[16]}]  \
  [get_ports {ic_data_wdata_o[15]}]  \
  [get_ports {ic_data_wdata_o[14]}]  \
  [get_ports {ic_data_wdata_o[13]}]  \
  [get_ports {ic_data_wdata_o[12]}]  \
  [get_ports {ic_data_wdata_o[11]}]  \
  [get_ports {ic_data_wdata_o[10]}]  \
  [get_ports {ic_data_wdata_o[9]}]  \
  [get_ports {ic_data_wdata_o[8]}]  \
  [get_ports {ic_data_wdata_o[7]}]  \
  [get_ports {ic_data_wdata_o[6]}]  \
  [get_ports {ic_data_wdata_o[5]}]  \
  [get_ports {ic_data_wdata_o[4]}]  \
  [get_ports {ic_data_wdata_o[3]}]  \
  [get_ports {ic_data_wdata_o[2]}]  \
  [get_ports {ic_data_wdata_o[1]}]  \
  [get_ports {ic_data_wdata_o[0]}]  \
  [get_ports ic_scr_key_req_o]  \
  [get_ports irq_pending_o]  \
  [get_ports {crash_dump_o[exception_addr][31]}]  \
  [get_ports {crash_dump_o[exception_addr][30]}]  \
  [get_ports {crash_dump_o[exception_addr][29]}]  \
  [get_ports {crash_dump_o[exception_addr][28]}]  \
  [get_ports {crash_dump_o[exception_addr][27]}]  \
  [get_ports {crash_dump_o[exception_addr][26]}]  \
  [get_ports {crash_dump_o[exception_addr][25]}]  \
  [get_ports {crash_dump_o[exception_addr][24]}]  \
  [get_ports {crash_dump_o[exception_addr][23]}]  \
  [get_ports {crash_dump_o[exception_addr][22]}]  \
  [get_ports {crash_dump_o[exception_addr][21]}]  \
  [get_ports {crash_dump_o[exception_addr][20]}]  \
  [get_ports {crash_dump_o[exception_addr][19]}]  \
  [get_ports {crash_dump_o[exception_addr][18]}]  \
  [get_ports {crash_dump_o[exception_addr][17]}]  \
  [get_ports {crash_dump_o[exception_addr][16]}]  \
  [get_ports {crash_dump_o[exception_addr][15]}]  \
  [get_ports {crash_dump_o[exception_addr][14]}]  \
  [get_ports {crash_dump_o[exception_addr][13]}]  \
  [get_ports {crash_dump_o[exception_addr][12]}]  \
  [get_ports {crash_dump_o[exception_addr][11]}]  \
  [get_ports {crash_dump_o[exception_addr][10]}]  \
  [get_ports {crash_dump_o[exception_addr][9]}]  \
  [get_ports {crash_dump_o[exception_addr][8]}]  \
  [get_ports {crash_dump_o[exception_addr][7]}]  \
  [get_ports {crash_dump_o[exception_addr][6]}]  \
  [get_ports {crash_dump_o[exception_addr][5]}]  \
  [get_ports {crash_dump_o[exception_addr][4]}]  \
  [get_ports {crash_dump_o[exception_addr][3]}]  \
  [get_ports {crash_dump_o[exception_addr][2]}]  \
  [get_ports {crash_dump_o[exception_addr][1]}]  \
  [get_ports {crash_dump_o[exception_addr][0]}]  \
  [get_ports {crash_dump_o[exception_pc][31]}]  \
  [get_ports {crash_dump_o[exception_pc][30]}]  \
  [get_ports {crash_dump_o[exception_pc][29]}]  \
  [get_ports {crash_dump_o[exception_pc][28]}]  \
  [get_ports {crash_dump_o[exception_pc][27]}]  \
  [get_ports {crash_dump_o[exception_pc][26]}]  \
  [get_ports {crash_dump_o[exception_pc][25]}]  \
  [get_ports {crash_dump_o[exception_pc][24]}]  \
  [get_ports {crash_dump_o[exception_pc][23]}]  \
  [get_ports {crash_dump_o[exception_pc][22]}]  \
  [get_ports {crash_dump_o[exception_pc][21]}]  \
  [get_ports {crash_dump_o[exception_pc][20]}]  \
  [get_ports {crash_dump_o[exception_pc][19]}]  \
  [get_ports {crash_dump_o[exception_pc][18]}]  \
  [get_ports {crash_dump_o[exception_pc][17]}]  \
  [get_ports {crash_dump_o[exception_pc][16]}]  \
  [get_ports {crash_dump_o[exception_pc][15]}]  \
  [get_ports {crash_dump_o[exception_pc][14]}]  \
  [get_ports {crash_dump_o[exception_pc][13]}]  \
  [get_ports {crash_dump_o[exception_pc][12]}]  \
  [get_ports {crash_dump_o[exception_pc][11]}]  \
  [get_ports {crash_dump_o[exception_pc][10]}]  \
  [get_ports {crash_dump_o[exception_pc][9]}]  \
  [get_ports {crash_dump_o[exception_pc][8]}]  \
  [get_ports {crash_dump_o[exception_pc][7]}]  \
  [get_ports {crash_dump_o[exception_pc][6]}]  \
  [get_ports {crash_dump_o[exception_pc][5]}]  \
  [get_ports {crash_dump_o[exception_pc][4]}]  \
  [get_ports {crash_dump_o[exception_pc][3]}]  \
  [get_ports {crash_dump_o[exception_pc][2]}]  \
  [get_ports {crash_dump_o[exception_pc][1]}]  \
  [get_ports {crash_dump_o[exception_pc][0]}]  \
  [get_ports {crash_dump_o[last_data_addr][31]}]  \
  [get_ports {crash_dump_o[last_data_addr][30]}]  \
  [get_ports {crash_dump_o[last_data_addr][29]}]  \
  [get_ports {crash_dump_o[last_data_addr][28]}]  \
  [get_ports {crash_dump_o[last_data_addr][27]}]  \
  [get_ports {crash_dump_o[last_data_addr][26]}]  \
  [get_ports {crash_dump_o[last_data_addr][25]}]  \
  [get_ports {crash_dump_o[last_data_addr][24]}]  \
  [get_ports {crash_dump_o[last_data_addr][23]}]  \
  [get_ports {crash_dump_o[last_data_addr][22]}]  \
  [get_ports {crash_dump_o[last_data_addr][21]}]  \
  [get_ports {crash_dump_o[last_data_addr][20]}]  \
  [get_ports {crash_dump_o[last_data_addr][19]}]  \
  [get_ports {crash_dump_o[last_data_addr][18]}]  \
  [get_ports {crash_dump_o[last_data_addr][17]}]  \
  [get_ports {crash_dump_o[last_data_addr][16]}]  \
  [get_ports {crash_dump_o[last_data_addr][15]}]  \
  [get_ports {crash_dump_o[last_data_addr][14]}]  \
  [get_ports {crash_dump_o[last_data_addr][13]}]  \
  [get_ports {crash_dump_o[last_data_addr][12]}]  \
  [get_ports {crash_dump_o[last_data_addr][11]}]  \
  [get_ports {crash_dump_o[last_data_addr][10]}]  \
  [get_ports {crash_dump_o[last_data_addr][9]}]  \
  [get_ports {crash_dump_o[last_data_addr][8]}]  \
  [get_ports {crash_dump_o[last_data_addr][7]}]  \
  [get_ports {crash_dump_o[last_data_addr][6]}]  \
  [get_ports {crash_dump_o[last_data_addr][5]}]  \
  [get_ports {crash_dump_o[last_data_addr][4]}]  \
  [get_ports {crash_dump_o[last_data_addr][3]}]  \
  [get_ports {crash_dump_o[last_data_addr][2]}]  \
  [get_ports {crash_dump_o[last_data_addr][1]}]  \
  [get_ports {crash_dump_o[last_data_addr][0]}]  \
  [get_ports {crash_dump_o[next_pc][31]}]  \
  [get_ports {crash_dump_o[next_pc][30]}]  \
  [get_ports {crash_dump_o[next_pc][29]}]  \
  [get_ports {crash_dump_o[next_pc][28]}]  \
  [get_ports {crash_dump_o[next_pc][27]}]  \
  [get_ports {crash_dump_o[next_pc][26]}]  \
  [get_ports {crash_dump_o[next_pc][25]}]  \
  [get_ports {crash_dump_o[next_pc][24]}]  \
  [get_ports {crash_dump_o[next_pc][23]}]  \
  [get_ports {crash_dump_o[next_pc][22]}]  \
  [get_ports {crash_dump_o[next_pc][21]}]  \
  [get_ports {crash_dump_o[next_pc][20]}]  \
  [get_ports {crash_dump_o[next_pc][19]}]  \
  [get_ports {crash_dump_o[next_pc][18]}]  \
  [get_ports {crash_dump_o[next_pc][17]}]  \
  [get_ports {crash_dump_o[next_pc][16]}]  \
  [get_ports {crash_dump_o[next_pc][15]}]  \
  [get_ports {crash_dump_o[next_pc][14]}]  \
  [get_ports {crash_dump_o[next_pc][13]}]  \
  [get_ports {crash_dump_o[next_pc][12]}]  \
  [get_ports {crash_dump_o[next_pc][11]}]  \
  [get_ports {crash_dump_o[next_pc][10]}]  \
  [get_ports {crash_dump_o[next_pc][9]}]  \
  [get_ports {crash_dump_o[next_pc][8]}]  \
  [get_ports {crash_dump_o[next_pc][7]}]  \
  [get_ports {crash_dump_o[next_pc][6]}]  \
  [get_ports {crash_dump_o[next_pc][5]}]  \
  [get_ports {crash_dump_o[next_pc][4]}]  \
  [get_ports {crash_dump_o[next_pc][3]}]  \
  [get_ports {crash_dump_o[next_pc][2]}]  \
  [get_ports {crash_dump_o[next_pc][1]}]  \
  [get_ports {crash_dump_o[next_pc][0]}]  \
  [get_ports {crash_dump_o[current_pc][31]}]  \
  [get_ports {crash_dump_o[current_pc][30]}]  \
  [get_ports {crash_dump_o[current_pc][29]}]  \
  [get_ports {crash_dump_o[current_pc][28]}]  \
  [get_ports {crash_dump_o[current_pc][27]}]  \
  [get_ports {crash_dump_o[current_pc][26]}]  \
  [get_ports {crash_dump_o[current_pc][25]}]  \
  [get_ports {crash_dump_o[current_pc][24]}]  \
  [get_ports {crash_dump_o[current_pc][23]}]  \
  [get_ports {crash_dump_o[current_pc][22]}]  \
  [get_ports {crash_dump_o[current_pc][21]}]  \
  [get_ports {crash_dump_o[current_pc][20]}]  \
  [get_ports {crash_dump_o[current_pc][19]}]  \
  [get_ports {crash_dump_o[current_pc][18]}]  \
  [get_ports {crash_dump_o[current_pc][17]}]  \
  [get_ports {crash_dump_o[current_pc][16]}]  \
  [get_ports {crash_dump_o[current_pc][15]}]  \
  [get_ports {crash_dump_o[current_pc][14]}]  \
  [get_ports {crash_dump_o[current_pc][13]}]  \
  [get_ports {crash_dump_o[current_pc][12]}]  \
  [get_ports {crash_dump_o[current_pc][11]}]  \
  [get_ports {crash_dump_o[current_pc][10]}]  \
  [get_ports {crash_dump_o[current_pc][9]}]  \
  [get_ports {crash_dump_o[current_pc][8]}]  \
  [get_ports {crash_dump_o[current_pc][7]}]  \
  [get_ports {crash_dump_o[current_pc][6]}]  \
  [get_ports {crash_dump_o[current_pc][5]}]  \
  [get_ports {crash_dump_o[current_pc][4]}]  \
  [get_ports {crash_dump_o[current_pc][3]}]  \
  [get_ports {crash_dump_o[current_pc][2]}]  \
  [get_ports {crash_dump_o[current_pc][1]}]  \
  [get_ports {crash_dump_o[current_pc][0]}]  \
  [get_ports double_fault_seen_o]  \
  [get_ports alert_minor_o]  \
  [get_ports alert_major_internal_o]  \
  [get_ports alert_major_bus_o]  \
  [get_ports {core_busy_o[3]}]  \
  [get_ports {core_busy_o[2]}]  \
  [get_ports {core_busy_o[1]}]  \
  [get_ports {core_busy_o[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports rst_ni]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {hart_id_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {boot_addr_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_gnt_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_rvalid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_rdata_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_err_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_gnt_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_rvalid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_rdata_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_err_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_a_ecc_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_rdata_b_ecc_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[1][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_rdata_i[0][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][63]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][62]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][61]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][60]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][59]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][58]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][57]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][56]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][55]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][54]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][53]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][52]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][51]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][50]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][49]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][48]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][47]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][46]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][45]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][44]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][43]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][42]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][41]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][40]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][39]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][38]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][37]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][36]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][35]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][34]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][33]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][32]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[1][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][63]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][62]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][61]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][60]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][59]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][58]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][57]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][56]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][55]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][54]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][53]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][52]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][51]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][50]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][49]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][48]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][47]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][46]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][45]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][44]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][43]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][42]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][41]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][40]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][39]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][38]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][37]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][36]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][35]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][34]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][33]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][32]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][31]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][30]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][29]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][28]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][27]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][26]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][25]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][24]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][23]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][22]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][21]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][20]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][19]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][18]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][17]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][16]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][15]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_rdata_i[0][0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports ic_scr_key_valid_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_software_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_timer_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_external_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[14]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[13]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[12]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[11]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[10]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[9]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[8]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[7]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[6]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[5]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[4]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {irq_fast_i[0]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_nm_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports debug_req_i]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[3]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[2]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[1]}]
set_input_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {fetch_enable_i[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports instr_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {instr_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports data_we_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_be_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {data_wdata_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports dummy_instr_id_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports dummy_instr_wb_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_a_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_a_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_a_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_a_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_a_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_b_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_b_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_b_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_b_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_raddr_b_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_waddr_wb_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_waddr_wb_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_waddr_wb_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_waddr_wb_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_waddr_wb_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports rf_we_wb_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {rf_wdata_wb_ecc_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_req_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_req_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports ic_tag_write_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_tag_wdata_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_req_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_req_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports ic_data_write_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_addr_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[63]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[62]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[61]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[60]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[59]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[58]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[57]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[56]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[55]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[54]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[53]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[52]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[51]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[50]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[49]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[48]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[47]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[46]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[45]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[44]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[43]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[42]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[41]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[40]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[39]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[38]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[37]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[36]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[35]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[34]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[33]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[32]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {ic_data_wdata_o[0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports ic_scr_key_req_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports irq_pending_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_addr][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[exception_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[last_data_addr][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[next_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][31]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][30]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][29]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][28]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][27]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][26]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][25]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][24]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][23]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][22]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][21]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][20]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][19]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][18]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][17]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][16]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][15]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][14]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][13]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][12]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][11]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][10]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][9]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][8]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][7]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][6]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][5]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][4]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {crash_dump_o[current_pc][0]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports double_fault_seen_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_minor_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_major_internal_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports alert_major_bus_o]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {core_busy_o[3]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {core_busy_o[2]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {core_busy_o[1]}]
set_output_delay -clock [get_clocks MAIN_CLK] -add_delay 1.0 [get_ports {core_busy_o[0]}]
set_ideal_network [get_ports clk_i]
set_ideal_network [get_ports rst_ni]
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells slow_vdd1v2/ACHCONX2]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFHX1]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFHX2]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFHX4]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFHXL]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDHX1]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDHX2]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDHX4]
set_dont_use true [get_lib_cells slow_vdd1v2/ADDHXL]
set_dont_use false [get_lib_cells slow_vdd1v2/AND2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AND2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AND2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AND2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/AND2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/AND2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3X6]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3X8]
set_dont_use true [get_lib_cells slow_vdd1v2/AND3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4X6]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4X8]
set_dont_use true [get_lib_cells slow_vdd1v2/AND4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/ANTENNA]
set_dont_use true [get_lib_cells slow_vdd1v2/AO21X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AO21X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AO21X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AO21XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AO22X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AO22X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AO22X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AO22XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI211X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI211X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI211X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI211XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI21X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI21X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI21X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI21XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI221X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI221X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI221X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI221XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI222X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI222X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI222X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI222XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI22X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI22X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI22X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI22XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB1X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB1X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB1X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB1XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI2BB2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI31X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI31X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI31X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI31XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI32X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI32X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI32X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI32XL]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI33X1]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI33X2]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI33X4]
set_dont_use true [get_lib_cells slow_vdd1v2/AOI33XL]
set_dont_use true [get_lib_cells slow_vdd1v2/BMXIX2]
set_dont_use true [get_lib_cells slow_vdd1v2/BMXIX4]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX12]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX16]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX20]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX3]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX6]
set_dont_use true [get_lib_cells slow_vdd1v2/BUFX8]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X12]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X3]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKAND2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX12]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX16]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX20]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX3]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX6]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKBUFX8]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX1]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX12]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX16]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX2]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX20]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX3]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX4]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX6]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKINVX8]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X12]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X3]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKMX2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKXOR2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKXOR2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKXOR2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/CLKXOR2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFNSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFNSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFNSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFNSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFQXL]
set_dont_use false [get_lib_cells slow_vdd1v2/DFFRHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFSXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFTRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFTRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFTRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFTRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/DFFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY1X1]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY1X4]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/DLY4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFTRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFTRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFTRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFTRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/EDFFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/HOLDX1]
set_dont_use false [get_lib_cells slow_vdd1v2/INVX1]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX12]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX16]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX2]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX20]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX3]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX4]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX6]
set_dont_use true [get_lib_cells slow_vdd1v2/INVX8]
set_dont_use true [get_lib_cells slow_vdd1v2/INVXL]
set_dont_use true [get_lib_cells slow_vdd1v2/MDFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/MDFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/MDFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/MDFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/MX2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/MX3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MX3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MX3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MX3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/MX4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MX4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MX4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MX4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/MXI4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BBX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BBX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BBX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BBXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NAND4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BBX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BBX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BBX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BBXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BX1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BX2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BX4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4BXL]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4X6]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4X8]
set_dont_use true [get_lib_cells slow_vdd1v2/NOR4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OA21X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OA21X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OA21X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OA21XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OA22X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OA22X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OA22X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OA22XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI211X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI211X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI211X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI211XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI21X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI21X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI21X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI21XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI221X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI221X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI221X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI221XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI222X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI222X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI222X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI222XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI22X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI22X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI22X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI22XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB1X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB1X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB1X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB1XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI2BB2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI31X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI31X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI31X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI31XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI32X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI32X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI32X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI32XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI33X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI33X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI33X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OAI33XL]
set_dont_use false [get_lib_cells slow_vdd1v2/OR2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OR2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OR2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OR2X6]
set_dont_use true [get_lib_cells slow_vdd1v2/OR2X8]
set_dont_use true [get_lib_cells slow_vdd1v2/OR2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3X6]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3X8]
set_dont_use true [get_lib_cells slow_vdd1v2/OR3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4X1]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4X2]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4X4]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4X6]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4X8]
set_dont_use true [get_lib_cells slow_vdd1v2/OR4XL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFNSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFNSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFNSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFNSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFQXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFSXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFTRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFTRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFTRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFTRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SDFFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFTRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFTRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFTRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFTRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SEDFFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/SMDFFHQX1]
set_dont_use true [get_lib_cells slow_vdd1v2/SMDFFHQX2]
set_dont_use true [get_lib_cells slow_vdd1v2/SMDFFHQX4]
set_dont_use true [get_lib_cells slow_vdd1v2/SMDFFHQX8]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX1]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX12]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX16]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX20]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX3]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX6]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFX8]
set_dont_use true [get_lib_cells slow_vdd1v2/TBUFXL]
set_dont_use true [get_lib_cells slow_vdd1v2/TIEHI]
set_dont_use true [get_lib_cells slow_vdd1v2/TIELO]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX12]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX16]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX20]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX3]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX6]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNCAX8]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX12]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX16]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX20]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX3]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX6]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNTSCAX8]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNX1]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATNXL]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATSRX1]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATSRX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATSRX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATSRXL]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATX1]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATX2]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATX4]
set_dont_use true [get_lib_cells slow_vdd1v2/TLATXL]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/XNOR3XL]
set_dont_use false [get_lib_cells slow_vdd1v2/XOR2X1]
set_dont_use true [get_lib_cells slow_vdd1v2/XOR2X2]
set_dont_use true [get_lib_cells slow_vdd1v2/XOR2X4]
set_dont_use true [get_lib_cells slow_vdd1v2/XOR2XL]
set_dont_use true [get_lib_cells slow_vdd1v2/XOR3X1]
set_dont_use true [get_lib_cells slow_vdd1v2/XOR3XL]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP10]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP2]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP3]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP4]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP5]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP6]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP7]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP8]
set_dont_use true [get_lib_cells slow_vdd1v2/DECAP9]
set_clock_uncertainty -setup 0.5 [get_clocks MAIN_CLK]
set_clock_uncertainty -hold 0.5 [get_clocks MAIN_CLK]
