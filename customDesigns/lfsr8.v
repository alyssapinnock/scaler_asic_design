// ---------------------------------------------------------------------------
// 8-bit XNOR-based LFSR
// ---------------------------------------------------------------------------
module lfsr8(
    input  wire       clk,
    input  wire       rst_n,
    input  wire        i_ptb,
    input  wire        i_ptb_valid,
    output reg [7:0]  o_state
);
    // Feedback taps for polynomial x^8 + x^6 + x^5 + x^4 + 1
    // Using XNOR instead of XOR
    wire feedback;
    assign feedback = ~(o_state[7] ^ o_state[5] ^ o_state[4] ^ o_state[3])^(i_ptb & i_ptb_valid);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            o_state <= 8'b01001100; // Non-zero seed
        else
            o_state <= {o_state[6:0], feedback};
    end

endmodule