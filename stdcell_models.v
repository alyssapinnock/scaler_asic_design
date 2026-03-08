// Simple behavioral models for standard cells
// This provides functional models for gate-level simulation
// Timing is not modeled - use for functional verification only

`timescale 1ns/1ps

// Basic logic gates

module AND2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A & B;
endmodule

module AND2X2 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A & B;
endmodule

module AND2X4 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A & B;
endmodule

module OR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A | B;
endmodule

module OR2X2 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A | B;
endmodule

module OR2X4 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A | B;
endmodule

module NAND2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A & B);
endmodule

module NAND2X2 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A & B);
endmodule

module NOR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A | B);
endmodule

module NOR2X2 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A | B);
endmodule

module XOR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A ^ B;
endmodule

module XOR2X2 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A ^ B;
endmodule

module XNOR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A ^ B);
endmodule

module INVX1 (A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module INVX2 (A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module INVX4 (A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module INVX8 (A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module BUFX1 (A, Y);
  input A;
  output Y;
  assign Y = A;
endmodule

module BUFX2 (A, Y);
  input A;
  output Y;
  assign Y = A;
endmodule

module BUFX4 (A, Y);
  input A;
  output Y;
  assign Y = A;
endmodule

module BUFX8 (A, Y);
  input A;
  output Y;
  assign Y = A;
endmodule

// Flip-flops

module DFFRHQX1 (CK, RN, D, Q);
  input CK, RN, D;
  output reg Q;
  
  always @(posedge CK or negedge RN) begin
    if (!RN)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

module DFFRHQX2 (CK, RN, D, Q);
  input CK, RN, D;
  output reg Q;
  
  always @(posedge CK or negedge RN) begin
    if (!RN)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

module DFFRHQX4 (CK, RN, D, Q);
  input CK, RN, D;
  output reg Q;
  
  always @(posedge CK or negedge RN) begin
    if (!RN)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

module DFFSHQX1 (CK, SN, D, Q);
  input CK, SN, D;
  output reg Q;
  
  always @(posedge CK or negedge SN) begin
    if (!SN)
      Q <= 1'b1;
    else
      Q <= D;
  end
endmodule

module DFFX1 (CK, D, Q);
  input CK, D;
  output reg Q;
  
  always @(posedge CK) begin
    Q <= D;
  end
endmodule

module DFFX2 (CK, D, Q);
  input CK, D;
  output reg Q;
  
  always @(posedge CK) begin
    Q <= D;
  end
endmodule

// MUX gates

module MUX2X1 (A, B, S, Y);
  input A, B, S;
  output Y;
  assign Y = S ? B : A;
endmodule

module MUX2X2 (A, B, S, Y);
  input A, B, S;
  output Y;
  assign Y = S ? B : A;
endmodule

module MUX4X1 (D0, D1, D2, D3, S0, S1, Y);
  input D0, D1, D2, D3, S0, S1;
  output Y;
  assign Y = S1 ? (S0 ? D3 : D2) : (S0 ? D1 : D0);
endmodule

// AOI/OAI gates

module AOI21X1 (A0, A1, B0, Y);
  input A0, A1, B0;
  output Y;
  assign Y = ~((A0 & A1) | B0);
endmodule

module AOI22X1 (A0, A1, B0, B1, Y);
  input A0, A1, B0, B1;
  output Y;
  assign Y = ~((A0 & A1) | (B0 & B1));
endmodule

module OAI21X1 (A0, A1, B0, Y);
  input A0, A1, B0;
  output Y;
  assign Y = ~((A0 | A1) & B0);
endmodule

module OAI22X1 (A0, A1, B0, B1, Y);
  input A0, A1, B0, B1;
  output Y;
  assign Y = ~((A0 | A1) & (B0 | B1));
endmodule

// 3-input gates

module AND3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = A & B & C;
endmodule

module OR3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = A | B | C;
endmodule

module NAND3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~(A & B & C);
endmodule

module NOR3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~(A | B | C);
endmodule

// 4-input gates

module AND4X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = A & B & C & D;
endmodule

module OR4X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = A | B | C | D;
endmodule

module NAND4X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = ~(A & B & C & D);
endmodule

module NOR4X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = ~(A | B | C | D);
endmodule

// Latch
module LATCHX1 (CLK, D, Q);
  input CLK, D;
  output reg Q;
  
  always @(CLK or D) begin
    if (CLK)
      Q <= D;
  end
endmodule

// Clock gating
module CLKGAT (CLK, EN, ENCLK);
  input CLK, EN;
  output ENCLK;
  reg en_lat;
  
  always @(CLK or EN) begin
    if (!CLK)
      en_lat <= EN;
  end
  
  assign ENCLK = CLK & en_lat;
endmodule

// Tie cells
module TIELO (Y);
  output Y;
  assign Y = 1'b0;
endmodule

module TIEHI (Y);
  output Y;
  assign Y = 1'b1;
endmodule
