`default_nettype none

module XOR2X1_CMO(
  input wire A1_S0,
  input wire A1_S1,
  input wire A2_S0,
  input wire A2_S1,
  output wire Z_S0,
  output wire Z_S1
);
  XOR2X1 cmo_xor0(.A(A1_S0), .B(A2_S0), .Y(Z_S0));
  XOR2X1 cmo_xor1(.A(A1_S1), .B(A2_S1), .Y(Z_S1));
endmodule

module INVX1_CMO(
  input wire I_S0,
  input wire I_S1,
  output wire ZN_S0,
  output wire ZN_S1
);
  INVX1  cmo_inv0(.A(I_S0), .Y(ZN_S0));
  BUFX2  cmo_buf0(.A(I_S1), .Y(ZN_S1));
endmodule

// From: Biryukov2018
module AND2X1_CMO(
  input wire A1_S0,
  input wire A1_S1,
  input wire A2_S0,
  input wire A2_S1,
  output wire Z_S0,
  output wire Z_S1
);
  wire X1, X2, Y1, Y2;

  wire Y2N;
  wire X1_AN_Y1, X1_OR_Y2N;
  wire X2_AN_Y1, X2_OR_Y2N;

  assign X1 = A1_S0;
  assign X2 = A1_S1;
  assign Y1 = A2_S0;
  assign Y2 = A2_S1;

  INVX1  g0(.A(Y2), .Y(Y2N));

  // z1 = (x1 & y1) xor (x1 | ~y2)
  AND2X1  cmo_and0(.A(X1),       .B(Y1),        .Y(X1_AN_Y1));
  OR2X1   cmo_or0(.A(X1),       .B(Y2N),       .Y(X1_OR_Y2N));
  XOR2X1  cmo_xor0(.A(X1_AN_Y1), .B(X1_OR_Y2N), .Y(Z_S0));

  // z2 = (x2 & y1) xor (x2 | ~y2)
  AND2X1  cmo_and1(.A(X2),       .B(Y1),        .Y(X2_AN_Y1));
  OR2X1   cmo_or1(.A(X2),       .B(Y2N),       .Y(X2_OR_Y2N));
  XOR2X1  cmo_xor1(.A(X2_AN_Y1), .B(X2_OR_Y2N), .Y(Z_S1));
endmodule

// From: Biryukov2018
module OR2X1_CMO(
  input wire A1_S0,
  input wire A1_S1,
  input wire A2_S0,
  input wire A2_S1,
  output wire Z_S0,
  output wire Z_S1
);
  wire X1, X2, Y1, Y2;
  wire X1_AN_Y1, X1_OR_Y2;
  wire X2_OR_Y1, X2_AN_Y2;

  assign X1 = A1_S0;
  assign X2 = A1_S1;
  assign Y1 = A2_S0;
  assign Y2 = A2_S1;

  // z1 = (x1 & y1) xor (x1 | y2)
  AND2X1  cmo_and0(.A(X1),       .B(Y1),       .Y(X1_AN_Y1));
  OR2X1   cmo_or0(.A(X1),       .B(Y2),       .Y(X1_OR_Y2));
  XOR2X1  cmo_xor0(.A(X1_AN_Y1), .B(X1_OR_Y2), .Y(Z_S0));

  // z2 = (x2 | y1) xor (x2 & y2)
  OR2X1   cmo_or1(.A(X2),       .B(Y1),       .Y(X2_OR_Y1));
  AND2X1  cmo_and1(.A(X2),       .B(Y2),       .Y(X2_AN_Y2));
  XOR2X1  cmo_xor1(.A(X2_OR_Y1), .B(X2_AN_Y2), .Y(Z_S1));
endmodule

module DFFRHQX1_CMO(
  input wire CP,
  input wire CDN,
  input wire D_S0,
  input wire D_S1,
  input wire R,
  output wire Q_S0,
  output wire Q_S1
);
  wire X_S0, X_S1;
  XOR2X1 cmo_r0(.A(D_S0), .B(R), .Y(X_S0));
  XOR2X1 cmo_r1(.A(D_S1), .B(R), .Y(X_S1));

  DFFRHQX1 cmo_flop0(.CK(CP), .RN(CDN), .D(X_S0), .Q(Q_S0));
  DFFRHQX1 cmo_flop1(.CK(CP), .RN(CDN), .D(X_S1), .Q(Q_S1));
endmodule

