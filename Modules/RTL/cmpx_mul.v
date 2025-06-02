`timescale 1ns / 1ps

/* 
Module Description:

This module implements a 16-point complex number multiplication unit that performs 
element-wise multiplication of two 16-element complex number arrays (x and y).
Each complex number consists of 32-bit real and imaginary components.

Inputs:
- 16 pairs of 32-bit complex numbers from array x (x0_real/imag through x15_real/imag)
- 16 pairs of 32-bit complex numbers from array y (y0_real/imag through y15_real/imag)

Outputs:
- 16 pairs of 32-bit complex multiplication results (X0_real/imag through X15_real/imag)

The module uses cmpx_mul_2 submodules to perform individual complex multiplications,
where each multiplication follows the formula:
- Real part = (real0 * real1) - (imag0 * imag1)
- Imaginary part = (real0 * imag1) + (imag0 * real1)

Implementation uses floating-point multipliers (fp_mul) and adders (fp_add) for computations.
*/


module cmpx_mul
( 
  input [31:0] x0_real, x0_imag,
  input [31:0] x1_real, x1_imag,
  input [31:0] x2_real, x2_imag,
  input [31:0] x3_real, x3_imag,
  input [31:0] x4_real, x4_imag,
  input [31:0] x5_real, x5_imag,
  input [31:0] x6_real, x6_imag,
  input [31:0] x7_real, x7_imag,
  input [31:0] x8_real, x8_imag,
  input [31:0] x9_real, x9_imag,
  input [31:0] x10_real, x10_imag,
  input [31:0] x11_real, x11_imag,
  input [31:0] x12_real, x12_imag,
  input [31:0] x13_real, x13_imag,
  input [31:0] x14_real, x14_imag,
  input [31:0] x15_real, x15_imag,

  input [31:0] y0_real,  y0_imag,
  input [31:0] y1_real,  y1_imag,
  input [31:0] y2_real,  y2_imag,
  input [31:0] y3_real,  y3_imag,
  input [31:0] y4_real,  y4_imag,
  input [31:0] y5_real,  y5_imag,
  input [31:0] y6_real,  y6_imag,
  input [31:0] y7_real,  y7_imag,
  input [31:0] y8_real,  y8_imag,
  input [31:0] y9_real,  y9_imag,
  input [31:0] y10_real, y10_imag,
  input [31:0] y11_real, y11_imag,
  input [31:0] y12_real, y12_imag,
  input [31:0] y13_real, y13_imag,
  input [31:0] y14_real, y14_imag,
  input [31:0] y15_real, y15_imag,

  output [31:0] X0_real, X0_imag,
  output [31:0] X1_real, X1_imag,
  output [31:0] X2_real, X2_imag,
  output [31:0] X3_real, X3_imag,
  output [31:0] X4_real, X4_imag,
  output [31:0] X5_real, X5_imag,
  output [31:0] X6_real, X6_imag,
  output [31:0] X7_real, X7_imag,
  output [31:0] X8_real,  X8_imag,
  output [31:0] X9_real,  X9_imag,
  output [31:0] X10_real, X10_imag,
  output [31:0] X11_real, X11_imag,
  output [31:0] X12_real, X12_imag,
  output [31:0] X13_real, X13_imag,
  output [31:0] X14_real, X14_imag,
  output [31:0] X15_real, X15_imag);

//multiplication of kernal y with x image
//first row
cmpx_mul_2 d0(x0_real,y0_real,x0_imag,y0_imag,X0_real,X0_imag);
cmpx_mul_2 d1(x1_real,y1_real,x1_imag,y1_imag,X1_real,X1_imag);
cmpx_mul_2 d2(x2_real,y2_real,x2_imag,y2_imag,X2_real,X2_imag);
cmpx_mul_2 d3(x3_real,y3_real,x3_imag,y3_imag,X3_real,X3_imag);
cmpx_mul_2 d4(x4_real,y4_real,x4_imag,y4_imag,X4_real,X4_imag);
cmpx_mul_2 d5(x5_real,y5_real,x5_imag,y5_imag,X5_real,X5_imag);
cmpx_mul_2 d6(x6_real,y6_real,x6_imag,y6_imag,X6_real,X6_imag);
cmpx_mul_2 d7(x7_real,y7_real,x7_imag,y7_imag,X7_real,X7_imag);

//second row
cmpx_mul_2 d8(x8_real,y8_real,x8_imag,y8_imag,X8_real,X8_imag);
cmpx_mul_2 d9(x9_real,y9_real,x9_imag,y9_imag,X9_real,X9_imag);
cmpx_mul_2 d10(x10_real,y10_real,x10_imag,y10_imag,X10_real,X10_imag);
cmpx_mul_2 d11(x11_real,y11_real,x11_imag,y11_imag,X11_real,X11_imag);
cmpx_mul_2 d12(x12_real,y12_real,x12_imag,y12_imag,X12_real,X12_imag);
cmpx_mul_2 d13(x13_real,y13_real,x13_imag,y13_imag,X13_real,X13_imag);
cmpx_mul_2 d14(x14_real,y14_real,x14_imag,y14_imag,X14_real,X14_imag);
cmpx_mul_2 d15(x15_real,y15_real,x15_imag,y15_imag,X15_real,X15_imag);

//always@(*)begin
//$display("x0_imag %h",x0_imag);
//$display("x0_real %h",x0_real);
//$display("y1_real %h",y1_real);
//$display("y1_imag %h",y1_imag);
//end
endmodule

//multiplication module 
module cmpx_mul_2(
input [31:0] real0,real1,imag0,imag1,
output [31:0] out_r,out_imag
    );

wire [31:0]mul1,mul2,mul3,mul4;

fp_mul mult1(real0,real1,mul1);//real with real
fp_mul mult2(imag0,imag1,mul2);//imag with imag
fp_mul mult3(real0,imag1,mul3);//real with imag
fp_mul mult4(imag0,real1,mul4);//imag with real

fp_add add2(mul1,{~mul2[31],mul2[30:0]},out_r); //(real*real)-(imag*imag)
fp_add add1(mul3,mul4,out_imag);//(real*imag)+(imag*real)

endmodule
