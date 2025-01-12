`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 11:51:06 AM
// Design Name: 
// Module Name: cmpx_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module cmpx_mul#(parameter N =32)
( input clk,
  input [N-1:0] x0_real, x0_imag,
  input [N-1:0] x1_real, x1_imag,
  input [N-1:0] x2_real, x2_imag,
  input [N-1:0] x3_real, x3_imag,
  input [N-1:0] x4_real, x4_imag,
  input [N-1:0] x5_real, x5_imag,
  input [N-1:0] x6_real, x6_imag,
  input [N-1:0] x7_real, x7_imag,
  input [N-1:0] x8_real, x8_imag,
  input [N-1:0] x9_real, x9_imag,
  input [N-1:0] x10_real, x10_imag,
  input [N-1:0] x11_real, x11_imag,
  input [N-1:0] x12_real, x12_imag,
  input [N-1:0] x13_real, x13_imag,
  input [N-1:0] x14_real, x14_imag,
  input [N-1:0] x15_real, x15_imag,

  input [N-1:0] y0_real,  y0_imag,
  input [N-1:0] y1_real,  y1_imag,
  input [N-1:0] y2_real,  y2_imag,
  input [N-1:0] y3_real,  y3_imag,
  input [N-1:0] y4_real,  y4_imag,
  input [N-1:0] y5_real,  y5_imag,
  input [N-1:0] y6_real,  y6_imag,
  input [N-1:0] y7_real,  y7_imag,
  input [N-1:0] y8_real,  y8_imag,
  input [N-1:0] y9_real,  y9_imag,
  input [N-1:0] y10_real, y10_imag,
  input [N-1:0] y11_real, y11_imag,
  input [N-1:0] y12_real, y12_imag,
  input [N-1:0] y13_real, y13_imag,
  input [N-1:0] y14_real, y14_imag,
  input [N-1:0] y15_real, y15_imag,

  output reg [N-1:0] X0_real, X0_imag,
  output reg [N-1:0] X1_real, X1_imag,
  output reg [N-1:0] X2_real, X2_imag,
  output reg [N-1:0] X3_real, X3_imag,
  output reg [N-1:0] X4_real, X4_imag,
  output reg [N-1:0] X5_real, X5_imag,
  output reg [N-1:0] X6_real, X6_imag,
  output reg [N-1:0] X7_real, X7_imag,
  output reg [N-1:0] X8_real,  X8_imag,
  output reg [N-1:0] X9_real,  X9_imag,
  output reg [N-1:0] X10_real, X10_imag,
  output reg [N-1:0] X11_real, X11_imag,
  output reg [N-1:0] X12_real, X12_imag,
  output reg [N-1:0] X13_real, X13_imag,
  output reg [N-1:0] X14_real, X14_imag,
  output reg [N-1:0] X15_real, X15_imag);

// wires for the clock 
    reg [N-1:0] mul_x0_real, mul_x0_imag;
    reg [N-1:0] mul_x1_real, mul_x1_imag;
    reg [N-1:0] mul_x2_real, mul_x2_imag;
    reg [N-1:0] mul_x3_real, mul_x3_imag;
    reg [N-1:0] mul_x4_real, mul_x4_imag;
    reg [N-1:0] mul_x5_real, mul_x5_imag;
    reg [N-1:0] mul_x6_real, mul_x6_imag;
    reg [N-1:0] mul_x7_real, mul_x7_imag;
    reg [N-1:0] mul_x8_real, mul_x8_imag;
    reg [N-1:0] mul_x9_real, mul_x9_imag;
    reg [N-1:0] mul_x10_real, mul_x10_imag;
    reg [N-1:0] mul_x11_real, mul_x11_imag;
    reg [N-1:0] mul_x12_real, mul_x12_imag;
    reg [N-1:0] mul_x13_real, mul_x13_imag;
    reg [N-1:0] mul_x14_real, mul_x14_imag;
    reg [N-1:0] mul_x15_real, mul_x15_imag;

    reg [N-1:0] mul_y0_real, mul_y0_imag;
    reg [N-1:0] mul_y1_real, mul_y1_imag;
    reg [N-1:0] mul_y2_real, mul_y2_imag;
    reg [N-1:0] mul_y3_real, mul_y3_imag;
    reg [N-1:0] mul_y4_real, mul_y4_imag;
    reg [N-1:0] mul_y5_real, mul_y5_imag;
    reg [N-1:0] mul_y6_real, mul_y6_imag;
    reg [N-1:0] mul_y7_real, mul_y7_imag;
    reg [N-1:0] mul_y8_real, mul_y8_imag;
    reg [N-1:0] mul_y9_real, mul_y9_imag;
    reg [N-1:0] mul_y10_real, mul_y10_imag;
    reg [N-1:0] mul_y11_real, mul_y11_imag;
    reg [N-1:0] mul_y12_real, mul_y12_imag;
    reg [N-1:0] mul_y13_real, mul_y13_imag;
    reg [N-1:0] mul_y14_real, mul_y14_imag;
    reg [N-1:0] mul_y15_real, mul_y15_imag;

    wire [N-1:0] mul_X0_real, mul_X0_imag;
    wire [N-1:0] mul_X1_real, mul_X1_imag;
    wire [N-1:0] mul_X2_real, mul_X2_imag;
    wire [N-1:0] mul_X3_real, mul_X3_imag;
    wire [N-1:0] mul_X4_real, mul_X4_imag;
    wire [N-1:0] mul_X5_real, mul_X5_imag;
    wire [N-1:0] mul_X6_real, mul_X6_imag;
    wire [N-1:0] mul_X7_real, mul_X7_imag;
    wire [N-1:0] mul_X8_real, mul_X8_imag;
    wire [N-1:0] mul_X9_real, mul_X9_imag;
    wire [N-1:0] mul_X10_real, mul_X10_imag;
    wire [N-1:0] mul_X11_real, mul_X11_imag;
    wire [N-1:0] mul_X12_real, mul_X12_imag;
    wire [N-1:0] mul_X13_real, mul_X13_imag;
    wire [N-1:0] mul_X14_real, mul_X14_imag;
    wire [N-1:0] mul_X15_real, mul_X15_imag;

always@(posedge clk)begin

    mul_x0_real <= x0_real;  mul_x0_imag <= x0_imag;
    mul_x1_real <= x1_real;  mul_x1_imag <= x1_imag;
    mul_x2_real <= x2_real;  mul_x2_imag <= x2_imag;
    mul_x3_real <= x3_real;  mul_x3_imag <= x3_imag;
    mul_x4_real <= x4_real;  mul_x4_imag <= x4_imag;
    mul_x5_real <= x5_real;  mul_x5_imag <= x5_imag;
    mul_x6_real <= x6_real;  mul_x6_imag <= x6_imag;
    mul_x7_real <= x7_real;  mul_x7_imag <= x7_imag;
    mul_x8_real <= x8_real;  mul_x8_imag <= x8_imag;
    mul_x9_real <= x9_real;  mul_x9_imag <= x9_imag;
    mul_x10_real <= x10_real; mul_x10_imag <= x10_imag;
    mul_x11_real <= x11_real; mul_x11_imag <= x11_imag;
    mul_x12_real <= x12_real; mul_x12_imag <= x12_imag;
    mul_x13_real <= x13_real; mul_x13_imag <= x13_imag;
    mul_x14_real <= x14_real; mul_x14_imag <= x14_imag;
    mul_x15_real <= x15_real; mul_x15_imag <= x15_imag;


    mul_y0_real <= y0_real;  mul_y0_imag <= y0_imag;
    mul_y1_real <= y1_real;  mul_y1_imag <= y1_imag;
    mul_y2_real <= y2_real;  mul_y2_imag <= y2_imag;
    mul_y3_real <= y3_real;  mul_y3_imag <= y3_imag;
    mul_y4_real <= y4_real;  mul_y4_imag <= y4_imag;
    mul_y5_real <= y5_real;  mul_y5_imag <= y5_imag;
    mul_y6_real <= y6_real;  mul_y6_imag <= y6_imag;
    mul_y7_real <= y7_real;  mul_y7_imag <= y7_imag;
    mul_y8_real <= y8_real;  mul_y8_imag <= y8_imag;
    mul_y9_real <= y9_real;  mul_y9_imag <= y9_imag;
    mul_y10_real <= y10_real; mul_y10_imag <= y10_imag;
    mul_y11_real <= y11_real; mul_y11_imag <= y11_imag;
    mul_y12_real <= y12_real; mul_y12_imag <= y12_imag;
    mul_y13_real <= y13_real; mul_y13_imag <= y13_imag;
    mul_y14_real <= y14_real; mul_y14_imag <= y14_imag;
    mul_y15_real <= y15_real; mul_y15_imag <= y15_imag;
    
    end
//multiplication of kernal y with x image
//first row
cmpx_mul_2 d0(mul_x0_real,mul_y0_real,mul_x0_imag,mul_y0_imag,mul_X0_real,mul_X0_imag);
cmpx_mul_2 d1(mul_x1_real,mul_y1_real,mul_x1_imag,mul_y1_imag,mul_X1_real,mul_X1_imag);
cmpx_mul_2 d2(mul_x2_real,mul_y2_real,mul_x2_imag,mul_y2_imag,mul_X2_real,mul_X2_imag);
cmpx_mul_2 d3(mul_x3_real,mul_y3_real,mul_x3_imag,mul_y3_imag,mul_X3_real,mul_X3_imag);
cmpx_mul_2 d4(mul_x4_real,mul_y4_real,mul_x4_imag,mul_y4_imag,mul_X4_real,mul_X4_imag);
cmpx_mul_2 d5(mul_x5_real,mul_y5_real,mul_x5_imag,mul_y5_imag,mul_X5_real,mul_X5_imag);
cmpx_mul_2 d6(mul_x6_real,mul_y6_real,mul_x6_imag,mul_y6_imag,mul_X6_real,mul_X6_imag);
cmpx_mul_2 d7(mul_x7_real,mul_y7_real,mul_x7_imag,mul_y7_imag,mul_X7_real,mul_X7_imag);

//second row
cmpx_mul_2 d8(mul_x8_real,mul_y8_real,mul_x8_imag,mul_y8_imag,mul_X8_real,mul_X8_imag);
cmpx_mul_2 d9(mul_x9_real,mul_y9_real,mul_x9_imag,mul_y9_imag,mul_X9_real,mul_X9_imag);
cmpx_mul_2 d10(mul_x10_real,mul_y10_real,mul_x10_imag,mul_y10_imag,mul_X10_real,mul_X10_imag);
cmpx_mul_2 d11(mul_x11_real,mul_y11_real,mul_x11_imag,mul_y11_imag,mul_X11_real,mul_X11_imag);
cmpx_mul_2 d12(mul_x12_real,mul_y12_real,mul_x12_imag,mul_y12_imag,mul_X12_real,mul_X12_imag);
cmpx_mul_2 d13(mul_x13_real,mul_y13_real,mul_x13_imag,mul_y13_imag,mul_X13_real,mul_X13_imag);
cmpx_mul_2 d14(mul_x14_real,mul_y14_real,mul_x14_imag,mul_y14_imag,mul_X14_real,mul_X14_imag);
cmpx_mul_2 d15(mul_x15_real,mul_y15_real,mul_x15_imag,mul_y15_imag,mul_X15_real,mul_X15_imag);


    always@(posedge clk)begin
//$display("mul_X0_imag %h",mul_X0_imag);
    X0_real <= mul_X0_real;  X0_imag <= mul_X0_imag;
    X1_real <= mul_X1_real;  X1_imag <= mul_X1_imag;
    X2_real <= mul_X2_real;  X2_imag <= mul_X2_imag;
    X3_real <= mul_X3_real;  X3_imag <= mul_X3_imag;
    X4_real <= mul_X4_real;  X4_imag <= mul_X4_imag;
    X5_real <= mul_X5_real;  X5_imag <= mul_X5_imag;
    X6_real <= mul_X6_real;  X6_imag <= mul_X6_imag;
    X7_real <= mul_X7_real;  X7_imag <= mul_X7_imag;
    X8_real <= mul_X8_real;  X8_imag <= mul_X8_imag;
    X9_real <= mul_X9_real;  X9_imag <= mul_X9_imag;
    X10_real <= mul_X10_real; X10_imag <= mul_X10_imag;
    X11_real <= mul_X11_real; X11_imag <= mul_X11_imag;
    X12_real <= mul_X12_real; X12_imag <= mul_X12_imag;
    X13_real <= mul_X13_real; X13_imag <= mul_X13_imag;
    X14_real <= mul_X14_real; X14_imag <= mul_X14_imag;
    X15_real <= mul_X15_real; X15_imag <= mul_X15_imag;
    
    end

endmodule

//multiplication module 
module cmpx_mul_2#(parameter N = 32)(
input [N-1:0] real0,real1,imag0,imag1,
output [N-1:0] out_r,out_imag
    );

wire [N-1:0]mul1,mul2,mul3,mul4;

fp_mul mult1(real0,real1,mul1);//real with real
fp_mul mult2(imag0,imag1,mul2);//imag with imag
fp_mul mult3(real0,imag1,mul3);//real with imag
fp_mul mult4(imag0,real1,mul4);//imag with real

fp_sub add2(mul1,mul2,out_r); //(real*real)-(imag*imag)
fp_add add1(mul3,mul4,out_imag);//(real*imag)+(imag*real)

endmodule
