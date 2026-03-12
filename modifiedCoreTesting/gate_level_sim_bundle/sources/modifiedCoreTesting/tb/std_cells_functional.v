// Functional-only standard cell models for GLS simulation
// These override the timing-annotated models in slow_vdd1v2_basicCells.v
// to avoid X-propagation from the altos_dff_r UDP and delayed_* signals.
//
// Only the cells actually used by Core_netlist.v are defined here:
//   AND2X1, BUFX2, DFFRHQX1, INVX1, OR2X1, XOR2X1

`timescale 1ns/1ps

// D flip-flop with active-low async reset, non-inverting output
// Functional equivalent of gsclib045 DFFRHQX1
module DFFRHQX1 (Q, D, RN, CK);
    output reg Q;
    input D, RN, CK;

    initial Q = 1'b0;

    always @(posedge CK or negedge RN) begin
        if (!RN)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

// 2-input AND gate
module AND2X1 (Y, A, B);
    output Y;
    input A, B;
    assign Y = A & B;
endmodule

// Non-inverting buffer
module BUFX2 (Y, A);
    output Y;
    input A;
    assign Y = A;
endmodule

// Inverter
module INVX1 (Y, A);
    output Y;
    input A;
    assign Y = ~A;
endmodule

// 2-input OR gate
module OR2X1 (Y, A, B);
    output Y;
    input A, B;
    assign Y = A | B;
endmodule

// 2-input XOR gate
module XOR2X1 (Y, A, B);
    output Y;
    input A, B;
    assign Y = A ^ B;
endmodule
