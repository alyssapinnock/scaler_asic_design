module casr37(input  wire        clk,
              input  wire        rst_n,
              input  wire        i_en,
              input  wire        i_ptb,
              input  wire        i_ptb_valid,
              output reg  [36:0] o_state);

  wire [36:0] nxt_state;

  integer idx;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) begin
      o_state <= 37'b0;
    end else begin 
      if (i_en)
        for (idx = 0; idx < 37; idx = idx+1)
          o_state[idx] <= nxt_state[idx];
      else begin
          o_state <= o_state;
      end
    end

  genvar  i;

  generate
    // From: Cattell 1995, JET, matches the model in `digital/python/casr.py`
    for (i = 1; i <= 37; i = i+1) begin : casr_blk
      wire left  = (i > 1)  ? o_state[37-i+1] : i_ptb & i_ptb_valid; // perturbed instead of null terminated
      wire right = (i < 37) ? o_state[37-i-1] : i_ptb & i_ptb_valid; // perturbed instead of null terminated
      assign nxt_state[37-i] = (i == 9) ? left ^ right ^ o_state[37-9] : left ^ right;
    end
  endgenerate

endmodule