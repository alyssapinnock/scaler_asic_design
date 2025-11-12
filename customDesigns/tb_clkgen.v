`timescale 1ns/1ps
module tb_clkgen;
    reg clk;
  	reg fakeClk;
    reg rst_n;
    wire outputClk;

    // DUT instance
    clkgen clock(
        .i_clk(clk),
        .rst_n(rst_n),
        .o_clk(outputClk)
    );

    // Clock generation: 100 MHz (10 ns period)
    initial clk = 0; 
  	initial #10 fakeClk = 0;
    always #5 clk = ~clk;
  	always #10 fakeClk = ~fakeClk;

    // Reset and simulation control
    initial begin
        // Create waveform dump file for GTKWave
        $dumpfile("clkgen_tb.vcd");   // name of the waveform file
        $dumpvars(0, tb_clkgen);      // dump all signals in this testbench hierarchy

        // Reset sequence
        rst_n = 0;
        #15 rst_n = 1;
        $display("Reset complete at time %0t", $time);

        // Run simulation for some time
        #6000;
        $display("Simulation finished at time %0t", $time);
        $finish;
    end

    // Monitor output every positive clock edge
  always @(posedge clk or negedge clk)
    $display("time=%0t : outputClk=%b when clk=%b", $time, outputClk, clk);

endmodule
