
set_db extract_rc_effort_level low

set_db route_design_with_timing_driven true
set_db route_design_with_si_driven false
route_design
write_db post_Route

set_db delaycal_enable_si false

opt_design -post_route
time_design -post_route -report_prefix masked_post_Route -report_dir timing
write_db post_Route_OPT
