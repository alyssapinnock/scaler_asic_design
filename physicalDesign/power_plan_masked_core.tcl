# Left Side
create_pg_pin -name VDD1 -net VDD -geometry Metal7 0 719.623 25 739.623
create_pg_pin -name VSS1 -net VSS -geometry Metal7 0 689.623 25 709.623

create_pg_pin -name VDD2 -net VDD -geometry Metal7 0 8.0065 25 28.7775
create_pg_pin -name VSS2 -net VSS -geometry Metal7 0 38.0065 25 58.7775

#Bottom Side
create_pg_pin -name VSS3 -net VSS -geometry Metal7 120 0 140 25
create_pg_pin -name VDD3 -net VDD -geometry Metal7 150 0 170 25

create_pg_pin -name VSS4 -net VSS -geometry Metal7 563 0 583 25
create_pg_pin -name VDD4 -net VDD -geometry Metal7 533 0 553 25

#Top Side
create_pg_pin -name VSS5 -net VSS -geometry Metal7 120 739 140 764.18
create_pg_pin -name VDD5 -net VDD -geometry Metal7 150 739 170 764.18

create_pg_pin -name VSS6 -net VSS -geometry Metal7 563 739 583 764.18
create_pg_pin -name VDD6 -net VDD -geometry Metal7 533 739 553 764.18

#Right Side
create_pg_pin -name VDD7 -net VDD -geometry Metal7 741 699.623 763 719.623
create_pg_pin -name VSS7 -net VSS -geometry Metal7 741 669.623 763 689.623

create_pg_pin -name VDD8 -net VDD -geometry Metal7 741 8.0065 763 28.7775
create_pg_pin -name VSS8 -net VSS -geometry Metal7 741 38.0065 763 58.7775

#Power Rings
set_db add_rings_target default ; set_db add_rings_extend_over_row 0 ; set_db add_rings_ignore_rows 0 ; set_db add_rings_avoid_short 0 ; set_db add_rings_skip_shared_inner_ring none ; set_db add_rings_stacked_via_top_layer Metal11 ; set_db add_rings_stacked_via_bottom_layer Metal1 ; set_db add_rings_via_using_exact_crossover_size 1 ; set_db add_rings_orthogonal_only true ; set_db add_rings_skip_via_on_pin {  standardcell } ; set_db add_rings_skip_via_on_wire_shape {  noshape }
add_rings -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 20 bottom 20 left 20 right 20} -spacing {top 10 bottom 10 left 10 right 10} -offset {top 10 bottom 10 left 10 right 10} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none

# Route p/g pins to ring
set_db route_special_via_connect_to_shape { noshape }
route_special -connect {pad_pin} -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target {nearest_target} -pad_pin_port_connect {all_port one_geom} -pad_pin_target {nearest_target} -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }

#Stripes
set_db add_stripes_ignore_block_check false ; set_db add_stripes_break_at none ; set_db add_stripes_route_over_rows_only false ; set_db add_stripes_rows_without_stripes_only false ; set_db add_stripes_extend_to_closest_target none ; set_db add_stripes_stop_at_last_wire_for_area false ; set_db add_stripes_partial_set_through_domain false ; set_db add_stripes_ignore_non_default_domains false ; set_db add_stripes_trim_antenna_back_to_shape none ; set_db add_stripes_spacing_type edge_to_edge ; set_db add_stripes_spacing_from_block 0 ; set_db add_stripes_stripe_min_length stripe_width ; set_db add_stripes_stacked_via_top_layer Metal11 ; set_db add_stripes_stacked_via_bottom_layer Metal1 ; set_db add_stripes_via_using_exact_crossover_size false ; set_db add_stripes_split_vias false ; set_db add_stripes_orthogonal_only true ; set_db add_stripes_allow_jog { padcore_ring  block_ring } ; set_db add_stripes_skip_via_on_pin {  standardcell } ; set_db add_stripes_skip_via_on_wire_shape {  noshape   }
add_stripes -nets {VDD VSS} -layer Metal10 -direction vertical -width 10 -spacing 15 -set_to_set_distance 125 -start_from left -start_offset 120 -stop_offset 140 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit Metal11 -pad_core_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid none

#Create power rails
set_db route_special_via_connect_to_shape { padring ring stripe blockring }
route_special -connect {block_pin pad_pin pad_ring core_pin} -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target {nearest_target} -pad_pin_port_connect {all_port one_geom} -pad_pin_target {nearest_target} -core_pin_target {first_after_row_end} -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -block_pin use_lef -target_via_layer_range { Metal1(1) Metal11(11) }

place_opt_design
time_design -pre_cts -report_prefix place_masked_core_pre_CTS -report_dir ../timing