module lfsr43 (
    input  wire        clk,
    input  wire        rst_n,
    output reg         o_ptb,
    output reg         o_ptb_valid
);

  wire feedback;
  wire max_pulse_counter;
  reg  [42:0] o_state;

  // Example taps for a 43-bit maximal LFSR
  assign feedback = ~(o_state[42] ^
                       o_state[41] ^
                       o_state[37] ^
                       o_state[36]);

  counter_5bit ptbCounter (
    .clk(clk),
    .rst_n(rst_n),
    .max_pulse(max_pulse_counter)
  );

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin 
        o_state      <= 43'h1ABCDE12345; // non-zero seed
        o_ptb        <= 1'b0;
        o_ptb_valid  <= 1'b0;
    end else begin
        o_state <= {o_state[41:0], feedback};
        o_ptb   <= ^o_state[27:21];
        o_ptb_valid <= max_pulse_counter;
    end
  end
endmodule


module counter_5bit (
    input  wire clk,
    input  wire rst_n,
    output reg  max_pulse
);
    reg [4:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 5'd0;
            max_pulse <= 1'b0;
        end else begin
            if (count == 5'd31) begin
                count <= 5'd0;
                max_pulse <= 1'b1;
            end else begin
                count <= count + 1'b1;
                max_pulse <= 1'b0;
            end
        end
    end
endmodule
