// gls_config.v — Verilog-2001 config block for GLS
//
// This tells the elaborator to substitute the RTL ibex_core module
// inside ibex_core_wrapper with the gate-level netlist version from
// the coreLibCMO library.
//
// IMPORTANT: This must be compiled in Verilog mode (not -sv) because
// config/endconfig are Verilog-2001 constructs that xmvlog -sv
// does not recognize.
//
// The original config block lives at the end of
// modifiedCoreRTL/ibex_core_wrapper.sv but cannot be parsed there
// when the file is compiled with -sv.

config cfg;
  design work.ibex_core_wrapper;
  instance ibex_core_wrapper.u_masked use coreLibCMO.ibex_core;
endconfig
