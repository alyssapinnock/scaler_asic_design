`timescale 1ns/1ps
module clkgen(
    input  wire i_clk,
    input  wire rst_n,
    output reg  o_clk
);

    wire [7:0] lfsrOutput8;
    wire [1:0] selectLines;
    wire p25, p50, p75;
    reg  skip_clk;
    reg  skip_clk_r;  // Registered version of skip_clk for stability

    wire ptb_bit;
    wire ptb_bit_valid;
    // Instantiate 8-bit LFSR
    lfsr8 generateClockSkip(
        .clk(i_clk),
        .rst_n(rst_n),
        .i_ptb(ptb_bit),
        .i_ptb_valid(ptb_bit_valid),
        .o_state(lfsrOutput8)
    );

    lfsr43 generatePerturbation(
        .clk(i_clk),
        .rst_n(rst_n),
        .o_ptb(ptb_bit),
        .o_ptb_valid(ptb_bit_valid)
    );

    // Output signals for 25%, 50%, 75%
    assign p25 = lfsrOutput8[7] & lfsrOutput8[6];
    assign p50 = lfsrOutput8[7] ^ lfsrOutput8[6];
    assign p75 = lfsrOutput8[7] | lfsrOutput8[6];

    // Select lines based on parity of subsets of LFSR bits
    assign selectLines = {^lfsrOutput8[2:0], ^lfsrOutput8[5:3]};

    // Clock skip selection logic
    always @* begin
        case (selectLines)
            2'b00:   skip_clk = 1'b0;
            2'b01:   skip_clk = p25;
            2'b10:   skip_clk = p50;
            2'b11:   skip_clk = p75;
            default: skip_clk = 1'b0;
        endcase
    end

    // Register skip_clk to avoid race conditions with i_clk
    always @(posedge i_clk or negedge rst_n) begin
        if (!rst_n)
            skip_clk_r <= 1'b0;
        else
            skip_clk_r <= skip_clk;
    end

    // Main output clock generation
    always @(posedge i_clk or negedge rst_n) begin
      if (!rst_n) begin
            o_clk <= 1'b0;
      end else if (~skip_clk_r) begin
            $display("Clock edge skipped");
            o_clk <= ~o_clk; // Hold value (skip edge) 
      end else begin
            o_clk <= o_clk;
      end
    end
endmodule

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

module lfsr43 (
    input  wire        clk,
    input  wire        rst_n,
    output reg         o_ptb,
    output reg         o_ptb_valid,
    output reg  [42:0] o_state
);

  wire feedback;
  wire max_pulse_counter;

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
        o_ptb   <= ^o_state[37:21];
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