#!/bin/bash
# Run modified RTL through Ibex DV/Co-sim

export PRJ_DIR=/home/net/al663069/ws/ibex
export LOWRISC_IP_DIR=/home/net/al663069/ws/ibex/vendor/lowrisc_ip

cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex

# Run simulation
xrun \
    -f /home/net/al663069/ws/scaler_asic_design/ibex_dv_modified_rtl.f \
    +UVM_TESTNAME=core_ibex_base_test \
    +UVM_VERBOSITY=UVM_LOW \
    -timescale 1ns/1ps \
    -access +rw \
    -define "BOOT_ADDR=32'h80000000" \
    -define "DM_ADDR=32'h1A110000" \
    -define "DM_ADDR_MASK=32'h1FFF0000" \
    -define "DEBUG_MODE_HALT_ADDR=32'h1A110800" \
    -define "DEBUG_MODE_EXCEPTION_ADDR=32'h1A110808" \
    -uvmhome CDNS-1.2 \
    "$@"
