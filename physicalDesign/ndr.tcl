
#############################
#     Non-Default Rules     #
#############################

# 2W 2S for CTS trunks
create_route_rule -width {Metal1 0.12 Metal2 0.16 Metal3 0.16 Metal4 0.16 Metal5 0.16 Metal6 0.16 Metal7 0.16 Metal8 0.16 Metal9 0.16 Metal10 0.44 Metal11 0.44} -spacing {Metal1 0.13 Metal2 0.14 Metal3 0.14 Metal4 0.28 Metal5 0.28 Metal6 0.28 Metal7 0.8 Metal8 0.8 Metal9 1.6 Metal10 1.6 } -name CTS_2W_2S_RULE
create_route_type -name CTS_TRUNK_2W_2S -route_rule CTS_2W_2S_RULE -top_preferred_layer Metal8 -bottom_preferred_layer Metal7

set_db cts_route_type_trunk CTS_TRUNK_2W_2S

# Use trunk rule for top
set_db cts_route_type_top CTS_TRUNK_2W_2S

# 2W for CTS leafs
create_route_rule -width {Metal1 0.12 Metal2 0.16 Metal3 0.16 Metal4 0.16 Metal5 0.16 Metal6 0.16 Metal7 0.16 Metal8 0.16 Metal9 0.16 Metal10 0.44 Metal11 0.44 } -spacing {Metal1 0.065 Metal2 0.07 Metal3 0.7 Metal4 0.14 Metal5 0.14 Metal6 0.14 Metal7 0.4 Metal8 0.4 Metal9 0.8 Metal10 0.8 Metal11 0.8} -name CTS_2W_RULE
create_route_type -name CTS_LEAF_2W -route_rule CTS_2W_RULE -top_preferred_layer Metal6 -bottom_preferred_layer Metal5
set_db cts_route_type_leaf CTS_LEAF_2W
