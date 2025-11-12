module ring_oscillator #(
    parameter N = 5  // number of stages, must be odd
)(
    input wire clk,
    input wire enable,   // enables the oscillator
    input wire rst_n          // synchronous reset
);

    // Internal stages of the ring
    reg [N-1:0] stages;

    integer i;

    always @(posedge rst or posedge clk) begin
        if (rst) begin
            stages <= 0;
        end else if (enable) begin
            // Toggle stages to form a ring oscillator
            for (i = 0; i < N; i = i + 1) begin
                if (i == 0)
                    stages[i] <= ~stages[N-1];  // first stage inverts last stage
                else
                    stages[i] <= ~stages[i-1];  // other stages invert previous stage
            end
        end
    end

    // Use stages internally so synthesis does not remove them
    wire unused = |stages;
endmodule
