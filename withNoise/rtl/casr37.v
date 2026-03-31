module casr37(input  wire        clk,
              input  wire        rst_n,
              input  wire        i_en,
              output reg  [36:0] o_state);

  wire [36:0] nxt_state; // cadence syn_keep=1

  integer idx; // cadence syn_keep=1

  wire        i_ptb; // cadence syn_keep=1
  wire        i_ptb_valid;// cadence syn_keep=1


  lfsr43 generatePerturbation( // cadence syn_keep=1
        .clk(clk),
        .rst_n(rst_n),
        .o_ptb(i_ptb),
        .o_ptb_valid(i_ptb_valid)
  );



  always @(posedge clk or negedge rst_n) // cadence syn_keep=1
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
    for (i = 1; i <= 37; i = i+1) begin : casr_blk // cadence syn_keep=1
      wire left  = (i > 1)  ? o_state[37-i+1] : i_ptb & i_ptb_valid; // cadence syn_keep=1
// perturbed instead of null terminated
      wire right = (i < 37) ? o_state[37-i-1] : i_ptb & i_ptb_valid; // cadence syn_keep=1
// perturbed instead of null terminated
      assign nxt_state[37-i] = (i == 9) ? left ^ right ^ o_state[37-9] : left ^ right;
    end
  endgenerate

endmodule

