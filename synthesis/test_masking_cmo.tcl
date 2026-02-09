set InstDepthCache(NULL) 0

#Skip nets that have the word clk_i or rst_ni in their name
#And also the random bits bus
proc is_skip_net {name} {
    if {$name == "clk_i" || $name == "rst_ni"} {
        return 1
    }
    if {[regexp {^randbits\[\d+\]$} $name] == 1} {
        return 1
    }
    return 0
}

#This is just a helper function to append _s1 to a net name
proc append_s1 {name} {
    regexp {([^\[]+)(.*)} $name matchVar grp1 grp2
    return "${grp1}_s1${grp2}"
}

# Returns the base name without the library prefix
# This is done by splitting the string at the ':' and returning the second part
proc trim_type {name} {
    return [lindex [split $name :] 1]
}

# Checks if the given gate name is a secure gate with the given suffix
proc is_secure_gate {name suffix} {
    if { [string match "INV_${suffix}*"   $name] == 1 ||
         [string match "AN2_${suffix}*"   $name] == 1 ||
         [string match "OR2_${suffix}*"   $name] == 1 ||
         [string match "XOR2_${suffix}*"  $name] == 1 ||
         [string match "DFCNQ_${suffix}*" $name] == 1 } {
        return 1
    }
    return 0
}

#This find_inst_depth function is completely irrelevant since we are not using domino gates
#Returns the depth of the given instance
proc find_inst_depth {inst} {

    #This prints the instance that is being analyzed
    puts "find_inst_depth called for: $inst"

    #This just makes cache a local alias to the global variable InstDepthCache
    #So this can be used synonymously with InstDepthCache
    upvar #0 InstDepthCache cache

    #This checks if the depth for this instance is already calculated
    #If already cached it just returns the cached value
    if { [info exists cache($inst)] == 1 } {
        puts "    Depth (from cache): $cache($inst)"
        return $cache($inst)
    }

    #This prints a message indicating the start of the loop through instance pins
    puts "Looping through all instance pins to find depth"
    set depth 0

    #Pins refer to the inputs and outputs of the instance/which in this case is a gate
    #So for a NAND gate it would give inputs A and B and output Z
    set pins [get_db $inst .pins]
    #This just gets the name of the type of cell the instance is based on. In simpler terms it will be the type of gate
    set cell [get_db $inst .base_cell.base_name]

    #This loops through all the pins of the instance
    foreach pin $pins {
        puts "    Looking at pin: $pin"

        #Stores if teh pin is input or output
        set pin_dir       [get_db $pin .direction]

        #If the pin is an output pin we skip it since we are only interested in input pins
        if { $pin_dir == "out" } {
            puts "    Pin is output. Skiping."
            continue
        }

        #This returns the name of the output pin that is driving this input pin
        set driver        [get_db $pin .net.driver]
        #This returns the type of object that is driving this pin (could be port, pin, constant etc)
        set driver_type   [get_db $pin .net.driver.obj_type]

        #If the driver is a top level port
        if { $driver_type == "port" } {
            puts "    Pin is a top level port."
            #If the pin is driven by a top level port we set depth to at least 1
            if { $depth < 1 } { set depth 1 }
            continue
        }

        #Stores the instance that is driving this pin aka the name of the signal
        set driver_inst   [get_db $driver .inst]
        #Stores the type gate that is driving this pin
        set driver_cell   [get_db $driver_inst .base_cell.base_name]

        #If the driver cell is a flip flop or the driver type is a constant value
        if { $driver_cell == "DFFRHQX1" || $driver_type == "constant" } {
            #If the pin is driven by a flip flop or constant we set depth to at least 1
            puts "    Pin is driven by seq/constant: $driver_cell/$driver_type"
            if { $depth < 1 } { set depth 1 }
            continue
        } elseif { $driver_type == "pin" } {
            #If the driver is a pin we recursively call this function to find the depth of the driver instance
            set d [find_inst_depth $driver_inst]
            puts "    Came back from recursion with depth: $d"
            #If the cell is one of the domino gates we increment the depth by 1
            #This is do not apply to use because we are not using domino gates
            if { $cell == "XOR2_DLO_D0" } {
                puts "    Incrementing depth at XOR cell."
                incr d
            }

            #Update the value of depth if the returned depth is greater than the current depth
            if { $depth < $d } { set depth $d }
            continue
        #If the driver is neither a pin nor a port nor a constant nor a flip flop
        } elseif { $driver == "" } {
            puts "    Pin not connected: $pin"
            continue
        #Else we have an unknown driver type   
        } else {
            puts "    Unknown driver type: $driver_type"
            suspend
        }
    }
    #After looping through all pins we check if depth is still 0
    if { $depth == 0 } {
        puts "Unable to find depth for instance: $inst"
        suspend
    }
    puts "Depth: $depth"
    set cache($inst) $depth
    return $depth
}

#write_inst_depths is irrelevant since we are not using domino gates
proc write_inst_depths {} {
    puts "write_inst_depths was called"
    upvar #0 InstDepthCache cache
    set f [open "inst_depths.csv" w]
    puts "Looping through depth cache to write CSV file"
    foreach key [array names cache] {
        puts $f "$key,$cache($key)"
    }
    close $f
}

proc write_synth_defines_vh { suffix nregister max_depth } {
    set suffix_lower [string tolower $suffix]
    puts "Writing synth defines verilog header"
    set f [open "${suffix_lower}_synth_defines.vh" w]
    puts $f "`define ${suffix}_RANDBITS_LEN   $nregister"
    puts $f "`define ${suffix}_MAX_DEPTH      $max_depth"
    close $f
}

proc write_synth_defines_tcl { suffix nregister max_depth } {
    set suffix_lower [string tolower $suffix]
    puts "Writing synth defines verilog header"
    set f [open "${suffix_lower}_synth_defines.tcl" w]
    puts $f "set ${suffix}_RANDBITS_LEN   $nregister"
    puts $f "set ${suffix}_MAX_DEPTH      $max_depth"
    close $f
}

#This creates hport buses for the given name and left_bit in all hinsts
#In this case it is used to create hport buses for the random bits which is the size of all the registers in the processor
proc create_hport_everywhere { name left_bit } {
    puts "create_hport_everywhere was called"
    puts "Looping through all hinsts to create new hport"

    #Counts all hinsts in the design
    #An hinst is a hierarchical instance
    set hinsts [get_db hinsts ]
    foreach hinst $hinsts { 
        puts "    Hinstance: $hinst"
        puts "    Creating hport bus: $name\[$left_bit:0\]"
        create_hport_bus -left_bit $left_bit -right_bit 0 -name $name -input $hinst
    }
}

proc create_shared_top_ports {top} {
    puts "create_shared_top_ports was called"
    set port_busses [get_db port_busses]
    foreach port_bus $port_busses { 
        set direction [get_db $port_bus .direction]
        if {$direction == "out"} {
            set direction "-output"
        } else {
            set direction "-input"
        }
        set name [get_db $port_bus .base_name]
        if {[is_skip_net $name] == 0} {
            set shared_name [append_s1 $name]
            set left_bit [expr [llength [get_db $port_bus .bits] ] - 1 ]
            if {$left_bit > 0} {
                create_port_bus -left_bit $left_bit -right_bit 0 -name $shared_name $direction $top
            } else {
                create_port_bus -name $shared_name $direction $top
            }
        }
    }
}

proc create_shared_hier_ports {} {
    puts "create_shared_hier_ports was called"
    puts "Looping over hport_busses to create shared ports"
    set hport_busses [get_db hport_busses]
    foreach hport_bus $hport_busses { 
        set direction [get_db $hport_bus .direction]
        if {$direction == "out"} {
            set direction "-output"
        } else {
            set direction "-input"
        }
        set name [get_db $hport_bus .base_name]
        set hinst [get_db $hport_bus .hinst]
        if {[is_skip_net $name] == 0} {
            set shared_name [append_s1 $name]
            set left_bit [expr [llength [get_db $hport_bus .bits] ] - 1 ]
            if {$left_bit > 0} {
                create_hport_bus -left_bit $left_bit -right_bit 0 -name $shared_name $direction $hinst
            } else {
                create_hport_bus -name $shared_name $direction $hinst
            }
        }
    }
}

# Counts the number of registers in the design
proc count_registers {} {
    puts "count_registers was called"
    #Gets a list of all the instances that are flip flops, and then finds the lenght of that list
    return [llength [get_db insts -if {.is_flop == true}]]
}

proc replace_cells_with_secure {suffix} {
    puts "replace_cells_with_secure was called"
    #Creates associative arrays to map base cells to their secure counterparts and pin mappings
        set gates("base_cell:INVX1")     "design:INV_CMO"
        set pmaps("base_cell:INVX1")     {{A I_S0} {Y ZN_S0}}

    set gates("base_cell:AND2X1")     "design:AN2_CMO"
    set pmaps("base_cell:AND2X1")     {{A A1_S0} {B A2_S0} {Y Z_S0}}

    set gates("base_cell:OR2X1")     "design:OR2_CMO"
    set pmaps("base_cell:OR2X1")     {{A A1_S0} {B A2_S0} {Y Z_S0}}

    set gates("base_cell:XOR2X1")    "design:XOR2_CMO"
    set pmaps("base_cell:XOR2X1")    {{A A1_S0} {B A2_S0} {Y Z_S0}}
#gate below could cause some issues
    set gates("base_cell:DFFRHQX1")   "design:DFCNQ_CMO"
    set pmaps("base_cell:DFFRHQX1")   {{CK CP} {RN CDN} {D D_S0} {Q Q_S0}}

    puts "Change instance links"
    #Iterates over each gate type with secure counterpart pair
    #Your essentially iterating over the key,value pair in the associative array
    #Gate is the kind of gate to be replaced
    #Gate_replace is the secure version of that gate
    foreach {gate gate_replace} [array get gates] {
        puts "Gate: $gate -> $gate_replace"
        #Iterates over all instances of the current gate value
        get_db insts -if {.base_cell == $gate} -foreach {
            #$object is a special variable that holds the current object in the foreach loop
            set inst $object
            #Hierarchical name of the parent module of the instance
            set parent [get_db $inst .parent.module.base_name]
            #If the parent module is a secure gate we skip this instance
            if {[is_secure_gate $parent $suffix] == 1} {
                puts "    Skiped inst: $inst ($parent)"
                continue
            }

            #Replace the instance with its secure counterpart
            puts "    Masking: $inst ($gate)"
            change_link -instances $inst \
                        -design_name $gate_replace \
                        -change_in_non_uniq_subdesign \
                        -lenient \
                        -pin_map $pmaps($gate)
        }
    }
}

proc connect_shared_wires {top suffix} {
    puts "connect_shared_wires was called"

    puts "Iterating over all hnets"
    set hnets [get_db hnets]
    foreach hnet $hnets {

        set shared_net_created 0

        #Creates the shared version of the hierarchical net
        set hnet_share [append_s1 $hnet]

        #Gets the name of the net/wire
        set hnet_name        [get_db $hnet .base_name]
        set hnet_name_share  [append_s1 $hnet_name]

        #This returns the name of the module the wire belongs to
        set hnet_name_hinst  [get_db $hnet .hinst.module.base_name]

        #Checks if module is a secure gate
        if { [is_secure_gate $hnet_name_hinst $suffix] == 1 } {
            puts "    Skiped (base cell) hnet: $hnet_name"
            continue
        }

        #Skips clock and reset nets and the random bits bus
        if {[is_skip_net $hnet_name] == 1} {
            puts "    Skiped (clk/rst) hnet: $hnet_name"
            continue
        }

        puts "    Creating connections for hnet: $hnet"
        puts "    Hnet (share): $hnet_share"

        puts "    Looping over hnet loads"
        #Fetches the gates pins/ports that the wire/net drives
        set hnet_loads [get_db $hnet .loads]

        #Storing the driver wire/pin of the hnet (same for all loads)
        set check_drivers [get_db $hnet .drivers]
        #Prints the amount of drivers of the hnet for debugging purposes
        #By Josh
        puts "Driver count: [llength $check_drivers] and drivers: $check_drivers"
        if { [llength $check_drivers] == 0 } {
            puts "    Skipping hnet with no drivers: $hnet"
            continue
        }
        set hnet_driver           [lindex $check_drivers 0]

        #stores the name of the module the driver belongs to
        set hnet_driver_obj_type [get_object_type $hnet_driver]
        if { $hnet_driver_obj_type == "port" } {
            set hnet_driver_hinst     "$top"
            set hnet_driver_type      "port"
        } elseif { $hnet_driver_obj_type == "hpin" } {
            set hnet_driver_hinst     [get_db $hnet_driver .hinst.module.base_name]
            set hnet_driver_type      [get_db $hnet_driver .obj_type]
        } elseif { $hnet_driver_obj_type == "pin" } {
            set hnet_driver_inst      [get_db $hnet_driver .inst]
            set hnet_driver_hinst     [get_db $hnet_driver_inst .module.base_name]
            set hnet_driver_type      [get_db $hnet_driver .obj_type]
        } else {
            set hnet_driver_hinst     "$top"
            set hnet_driver_type      [get_db $hnet_driver .obj_type]
        }

        if { [is_secure_gate $hnet_driver_hinst $suffix] == 1 } {
            # "Option 3: Secure gate driver"
            set hnet_driver_share       "[string trimright ${hnet_driver} {_S0}]_S1"
        } else {
            if { $hnet_driver_type == "constant" } {
                #puts "Option 4: Constant driver"
                set old                     [get_db $hnet_driver .base_name]
                set new                     [expr $old == "1" ? "0" : "1"]
                set hnet_driver_share       [regsub "${old}\$" $hnet_driver $new]
            } else {
                #puts "Option 5: Non-secure gate driver"
                set hnet_driver_share       [append_s1 $hnet_driver]
            }
        }

        #If a shared port already exists, connect driver to it first to avoid net-name collisions
        set port_load ""
        foreach hnet_load $hnet_loads {
            if { [get_object_type $hnet_load] == "port" } {
                set port_load $hnet_load
                break
            }
        }

        if { $port_load != "" } {
            set hnet_load_hinst     "$top"
            set hnet_load_share     [append_s1 $port_load]
            set connect [list connect $hnet_driver_share $hnet_load_share]
            puts "        Hnet load:         $port_load"
            puts "        Hnet load hinst:   $hnet_load_hinst"
            puts "        Hnet driver:       $hnet_driver"
            puts "        Hnet driver hinst: $hnet_driver_hinst"
            puts "        Hnet driver type:  $hnet_driver_type"
            puts "        Hnet load share:   $hnet_load_share"
            puts "        Hnet driver share: $hnet_driver_share"
            puts "        Connecting: $connect"
            eval $connect
            set shared_net_created 1
        }

        foreach hnet_load $hnet_loads {
            if { $port_load != "" && $hnet_load == $port_load } {
                continue
            }

            set hnet_load_obj_type [get_object_type $hnet_load]
            if { $hnet_load_obj_type == "port" } {
                set hnet_load_hinst     "$top"
            } elseif { $hnet_load_obj_type == "hpin" } {
                #set hnet_load_hinst     [get_db $hnet_load .hinst.module.base_name]
                set hnet_load_hinst     [get_db $hnet_load .hinst.module.base_name]
            } elseif { $hnet_load_obj_type == "pin" } {
                set hnet_load_inst      [get_db $hnet_load .inst]
                set hnet_load_hinst     [get_db $hnet_load_inst .module.base_name]
            } else {
                set hnet_load_hinst     "$top"
            }

            puts "        Hnet load:         $hnet_load"
            puts "        Hnet load hinst:   $hnet_load_hinst"
            puts "        Hnet driver:       $hnet_driver"
            puts "        Hnet driver hinst: $hnet_driver_hinst"
            puts "        Hnet driver type:  $hnet_driver_type"

            if { [is_secure_gate $hnet_load_hinst $suffix] == 1 } {
                #puts "Option 1: Secure gate load"
                set hnet_load_share       "[string trimright ${hnet_load} {_S0}]_S1"
            } else {
                #puts "Option 2: Non-secure gate load"
                set hnet_load_share       [append_s1 $hnet_load]
            }

            puts "        Hnet load share:   $hnet_load_share"
            puts "        Hnet driver share: $hnet_driver_share"

            if { $shared_net_created == 0 } {
                set connect [list connect -net_name $hnet_name_share $hnet_driver_share $hnet_load_share]
                set shared_net_created 1
            } else {
                set connect [list connect $hnet_driver_share $hnet_load_share]
            }
            puts "        Connecting: $connect"
            eval $connect
        }
    }
}

proc connect_random_bus {nregister suffix} {
    puts "connect_random_bus was called"
    set i 0
    foreach hinst [get_db hinsts] {
        set module_name [get_db $hinst .module.base_name]
        if { [string match "DFCNQ_${suffix}*" $module_name] == 1 } {
            set busat   "randbits\[$i\]"
            set driver  [trim_type [get_db $hinst .parent]]/$busat
            set load    [trim_type $hinst]/R
            set connect [list connect -net_name $busat $driver $load]
            puts "    Connecting: $connect"
            eval $connect
            incr i
        }
    }

    puts "Intermidiate connections of random bus"
    set hports [get_db hports -if { .base_name == randbits[*] }]
    foreach hport $hports {
        set parent  [get_db $hport .hinst.parent]
        set busat   [get_db $hport .base_name]
        set driver  [trim_type $parent]/$busat
        set connect [list connect -net_name $busat $driver $hport]
        puts "    Connecting: $connect"
        eval $connect
    }
}

proc connect_precharge_clock {} {
    upvar #0 InstDepthCache cache
    puts "connect_precharge_clock was called"

    puts "Intermidiate connections of precharge clock"
    set hports [get_db hports -if { .base_name == clk_precharge[*] }]
    foreach hport $hports {
        set parent  [get_db $hport .hinst.parent]
        set busat   [get_db $hport .base_name]
        set driver  [trim_type $parent]/$busat
        set connect "connect -net_name $busat $driver $hport"
        puts "    Connecting: $connect"
        eval $connect
    }

    puts "Connecting the precharge clock to the domino gates"
    set insts [get_db insts -if {(.base_cell.name == XOR2_DLO_D0) || (.base_cell.name == AN2_DLO_D0) || (.base_cell.name == OR2_DLO_D0)} ]
    foreach inst $insts {
        set i [expr $cache($inst) - 1]
        set driver  "[trim_type [get_db $inst .parent]]/clk_precharge\[$i\]"
        set load    "[trim_type $inst]/CP"
        set connect "connect -net_name clk_precharge\[$i\] $driver $load"
        puts "    Connecting: $connect"
        eval $connect
    }
}

proc find_max_depth {} {
    puts "Loading depth cache and search for maximum depth"
    set insts [get_db insts -if {(.base_cell.name == XOR2_DLO_D0) || (.base_cell.name == AN2_DLO_D0) || (.base_cell.name == OR2_DLO_D0)} ]
    set max_depth 0
    foreach inst $insts {
        set depth [find_inst_depth $inst]
        if { $max_depth < $depth } {
            set max_depth $depth
        }
    }
    puts "Maximum depth found: $max_depth"

    write_inst_depths

    if { $max_depth == 0 } {
        puts "Invalid maximum depth: $max_depth"
        suspend
    }
    return $max_depth
}

proc resize_domino_cells {} {
    puts "Resizing domino logic gates according to wire capacitance"
    set insts [get_db insts -if {(.base_cell.name == XOR2_DLO_D0)}]

    foreach inst $insts {
        set pin_z     "pin:[trim_type $inst]/Z"
        set cap_z     [get_db $pin_z .wire_capacitance]
        set new_cell  ""

        if { $cap_z > 30 } {
            set new_cell "XOR2_DLO_D2"
        } elseif { $cap_z > 10 } {
            set new_cell "XOR2_DLO_D1"
        }
        if { $new_cell != "" } {
            puts "    Resize inst to cell $new_cell with cap=$cap_z fF: $inst"
            change_link -instances $inst \
                        -lib_cell $new_cell \
                        -pin_map {{A A} {B B} {CP CP} {Z Z}}
        }
    }
}