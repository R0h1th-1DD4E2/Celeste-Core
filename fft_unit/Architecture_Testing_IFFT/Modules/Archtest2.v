`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 06:21:31 PM
// Design Name: 
// Module Name: Archtest2
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


module Archtest2(
input clk,
input rst,
input [31:0] I0,I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15,I16,I17,I18,I19,I20,I21,I22,I23,I24,I25,I26,I27,I28,I29,I30,
input [31:0] I31,I32,I33,I34,I35,I36,I37,I38,I39,I40,I41,I42,I43,I44,I45,I46,I47,I48,I49,I50,I51,I52,I53,I54,I55,I56,I57,I58,I59,I60,I61,I62,I63,
output [31:0] O0,O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13, O14, O15,O16,O17,O18,O19,O20,O21,O22,O23,O24,O25,O26,O27,O28,O29,O30,
output [31:0] O31,O32,O33,O34,O35,O36,O37,O38,O39,O40,O41,O42,O43,O44,O45,O46,O47,O48,O49,O50,O51,O52,O53,O54,O55,O56,O57,O58,O59,O60,O61,O62,O63,
    
output [31:0] z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,
output [31:0] z16,z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31,
output [31:0] z32,z33,z34,z35,z36,z37,z38,z39,z40,z41,z42,z43,z44,z45,z46,z47,
output [31:0] z48,z49,z50,z51,z52,z53,z54,z55,z56,z57,z58,z59,z60,z61,z62,z63,
output [31:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,
output [31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,
output [31:0] u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,
output [31:0] v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,

output [31:0] e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,
output [31:0] f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,
output [31:0] g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,
output [31:0] h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15

);
/*
    Module Description:
    This module processes input signals through a series of transformations, 
    including filtering, IFFT (Inverse Fast Fourier Transform), and transposition. 
    The flow of data is as follows:

    1. Inputs:
       - I0 to I63: Input signals to the filteredFrequencyBuffer.

    2. Filtered Frequency Buffer:
       - Outputs z0 to z63: Processed signals from the filteredFrequencyBuffer.

    3. IFFT Processing:
       - Inputs to IFFT:
         * z0 to z15: Inputs to IFFT instance col_ins1.
         * z16 to z31: Inputs to IFFT instance col_ins2.
         * z32 to z47: Inputs to IFFT instance col_ins3.
         * z48 to z63: Inputs to IFFT instance col_ins4.
       - Outputs from IFFT:
         * s0 to s15: Outputs from IFFT instance col_ins1.
         * t0 to t15: Outputs from IFFT instance col_ins2.
         * u0 to u15: Outputs from IFFT instance col_ins3.
         * v0 to v15: Outputs from IFFT instance col_ins4.

    4. Transpose Buffer:
       - Inputs to the transpose buffer are s, t, u, and v signals from the IFFT outputs.
       - Outputs from the transpose buffer:
         * e0 to e15: Outputs from the transpose buffer.
         * f0 to f15: Outputs from the transpose buffer.
         * g0 to g15: Outputs from the transpose buffer.
         * h0 to h15: Outputs from the transpose buffer.

    Summary:
    The module performs a sequence of operations to transform input signals 
    into a final set of outputs through filtering, IFFT, and transposition stages.
*/
// I0-I63 go as inputs to  filteredFrequencyBuffer
// z0-z63 is the outputs from the  filteredFrequencyBuffer

//z0-z15 inputs of  IFFT col_ins1
//z16-z31 inputs of  IFFT col_ins2
//z32-z47 inputs of  IFFT col_ins3
//z48-z63 inputs of  IFFT col_ins4

//s0-s15 outputs of IFFT col_ins1
//t0-t15 outputs of IFFT col_ins2
//u0-u15 outputs of IFFT col_ins3
//v0-v15 outputs of IFFT col_ins4

//now s,t,u,v acts as inputs to trasnpose buffer giving  e,f,g,h
//e0-e15 outputs of trasnpose buffer
//f0-f15 outputs of trasnpose buffer
//g0-g15 outputs of trasnpose buffer
//h0-h15 outputs of trasnpose buffer
Register filteredFrequencyBuffer(
    .a0(I0),.a1(I1), .a2(I2), .a3(I3), .a4(I4), .a5(I5), .a6(I6), .a7(I7), .a8(I8), .a9(I9), .a10(I10), .a11(I11), .a12(I12), .a13(I13), .a14(I14), .a15(I15), .a16(I16), 
    .a17(I17), .a18(I18), .a19(I19), .a20(I20), .a21(I21), .a22(I22), .a23(I23), .a24(I24), .a25(I25), .a26(I26), .a27(I27), .a28(I28), .a29(I29), .a30(I30), .a31(I31),
    .a32(I32),.a33(I33), .a34(I34), .a35(I35), .a36(I36), .a37(I37), .a38(I38), .a39(I39), .a40(I40), .a41(I41), .a42(I42), .a43(I43), .a44(I44), .a45(I45), .a46(I46),
     .a47(I47), .a48(I48), .a49(I49), .a50(I50), .a51(I51), .a52(I52), .a53(I53), .a54(I54), .a55(I55), .a56(I56), .a57(I57), .a58(I58), .a59(I59), .a60(I60), .a61(I61),
      .a62(I62), .a63(I63),
    .clk(clk), .rst(rst),
    .b0(z0),.b1(z1), .b2(z2), .b3(z3), .b4(z4), .b5(z5), .b6(z6), .b7(z7), .b8(z8), .b9(z9), .b10(z10), .b11(z11), .b12(z12), .b13(z13), .b14(z14), .b15(z15), .b16(z16),
     .b17(z17), .b18(z18), .b19(z19), .b20(z20), .b21(z21), .b22(z22), .b23(z23), .b24(z24), .b25(z25), .b26(z26), .b27(z27), .b28(z28), .b29(z29), .b30(z30), .b31(z31),
    .b32(z32),.b33(z33), .b34(z34), .b35(z35), .b36(z36), .b37(z37), .b38(z38), .b39(z39), .b40(z40), .b41(z41), .b42(z42), .b43(z43), .b44(z44), .b45(z45), .b46(z46), 
    .b47(z47), .b48(z48), .b49(z49), .b50(z50), .b51(z51), .b52(z52), .b53(z53), .b54(z54), .b55(z55), .b56(z56), .b57(z57), .b58(z58), .b59(z59), .b60(z60), .b61(z61), 
    .b62(z62), .b63(z63)
);



top_IFFT col_ins1(
    .x0_real(z0), .x0_imag(z1), .x1_real(z2), .x1_imag(z3) ,.x2_real(z4), .x2_imag(z5), .x3_real(z6), .x3_imag(z7), 
    .x4_real(z8), .x4_imag(z9), .x5_real(z10), .x5_imag(z11),  .x6_real(z12), .x6_imag(z13), .x7_real(z14), .x7_imag(z15),
    .X0_real(s0), .X0_imag(s1), .X1_real(s2), .X1_imag(s3), .X2_real(s4), .X2_imag(s5), .X3_real(s6), .X3_imag(s7), 
    .X4_real(s8), .X4_imag(s9), .X5_real(s10), .X5_imag(s11), .X6_real(s12), .X6_imag(s13), .X7_real(s14), .X7_imag(s15)
);

top_IFFT col_ins2(
    .x0_real(z16), .x0_imag(z17), .x1_real(z18), .x1_imag(z19) ,.x2_real(z20), .x2_imag(z21), .x3_real(z22), .x3_imag(z23), 
    .x4_real(z24), .x4_imag(z25), .x5_real(z26), .x5_imag(z27),  .x6_real(z28), .x6_imag(z29), .x7_real(z30), .x7_imag(z31),
    .X0_real(t0), .X0_imag(t1), .X1_real(t2), .X1_imag(t3), .X2_real(t4), .X2_imag(t5), .X3_real(t6), .X3_imag(t7), 
    .X4_real(t8), .X4_imag(t9), .X5_real(t10), .X5_imag(t11), .X6_real(t12), .X6_imag(t13), .X7_real(t14), .X7_imag(t15)
);

top_IFFT col_ins3(
    .x0_real(z32), .x0_imag(z33), .x1_real(z34), .x1_imag(z35) ,.x2_real(z36), .x2_imag(z37), .x3_real(z38), .x3_imag(z39), 
    .x4_real(z40), .x4_imag(z41), .x5_real(z42), .x5_imag(z43),  .x6_real(z44), .x6_imag(z45), .x7_real(z46), .x7_imag(z47),
    .X0_real(u0), .X0_imag(u1), .X1_real(u2), .X1_imag(u3), .X2_real(u4), .X2_imag(u5), .X3_real(u6), .X3_imag(u7), 
    .X4_real(u8), .X4_imag(u9), .X5_real(u10), .X5_imag(u11), .X6_real(u12), .X6_imag(u13), .X7_real(u14), .X7_imag(u15)
);

top_IFFT col_ins4(
    .x0_real(z48), .x0_imag(z49), .x1_real(z50), .x1_imag(z51) ,.x2_real(z52), .x2_imag(z53), .x3_real(z54), .x3_imag(z55), 
    .x4_real(z56), .x4_imag(z57), .x5_real(z58), .x5_imag(z59),  .x6_real(z60), .x6_imag(z61), .x7_real(z62), .x7_imag(z63),
    .X0_real(v0), .X0_imag(v1), .X1_real(v2), .X1_imag(v3), .X2_real(v4), .X2_imag(v5), .X3_real(v6), .X3_imag(v7), 
    .X4_real(v8), .X4_imag(v9), .X5_real(v10), .X5_imag(v11), .X6_real(v12), .X6_imag(v13), .X7_real(v14), .X7_imag(v15)
);

Register transposeBuffer(
    .a0(s0), .a1(s1), .a2(s2), .a3(s3), .a4(s4), .a5(s5), .a6(s6), .a7(s7),
    .a8(s8), .a9(s9), .a10(s10), .a11(s11), .a12(s12), .a13(s13), .a14(s14), .a15(s15),
    .a16(t0), .a17(t1), .a18(t2), .a19(t3), .a20(t4), .a21(t5), .a22(t6), .a23(t7),
    .a24(t8), .a25(t9), .a26(t10), .a27(t11), .a28(t12), .a29(t13), .a30(t14), .a31(t15),
    .a32(u0), .a33(u1), .a34(u2), .a35(u3), .a36(u4), .a37(u5), .a38(u6), .a39(u7),
    .a40(u8), .a41(u9), .a42(u10), .a43(u11), .a44(u12), .a45(u13), .a46(u14), .a47(u15),
    .a48(v0), .a49(v1), .a50(v2), .a51(v3), .a52(v4), .a53(v5), .a54(v6), .a55(v7),
    .a56(v8), .a57(v9), .a58(v10), .a59(v11), .a60(v12), .a61(v13), .a62(v14), .a63(v15),
    .clk(clk), .rst(rst),
    .b0(e0), .b1(e1), .b2(e2), .b3(e3), .b4(e4), .b5(e5), .b6(e6), .b7(e7),
    .b8(e8), .b9(e9), .b10(e10), .b11(e11), .b12(e12), .b13(e13), .b14(e14), .b15(e15),
    .b16(f0), .b17(f1), .b18(f2), .b19(f3), .b20(f4), .b21(f5), .b22(f6), .b23(f7),
    .b24(f8), .b25(f9), .b26(f10), .b27(f11), .b28(f12), .b29(f13), .b30(f14), .b31(f15),
    .b32(g0), .b33(g1), .b34(g2), .b35(g3), .b36(g4), .b37(g5), .b38(g6), .b39(g7),
    .b40(g8), .b41(g9), .b42(g10), .b43(g11), .b44(g12), .b45(g13), .b46(g14), .b47(g15),
    .b48(h0), .b49(h1), .b50(h2), .b51(h3), .b52(h4), .b53(h5), .b54(h6), .b55(h7),
    .b56(h8), .b57(h9), .b58(h10), .b59(h11), .b60(h12), .b61(h13), .b62(h14), .b63(h15)
);
top_IFFT row_ins1(
    .x0_real(e0), .x0_imag(e1), .x1_real(e2), .x1_imag(e3) ,.x2_real(e4), .x2_imag(e5), .x3_real(e6), .x3_imag(e7), 
    .x4_real(e8), .x4_imag(e9), .x5_real(e10), .x5_imag(e11),  .x6_real(e12), .x6_imag(e13), .x7_real(e14), .x7_imag(e15),
    .X0_real(O0), .X0_imag(O1), .X1_real(O2), .X1_imag(O3), .X2_real(O4), .X2_imag(O5), .X3_real(O6), .X3_imag(O7), 
    .X4_real(O8), .X4_imag(O9), .X5_real(O10), .X5_imag(O11), .X6_real(O12), .X6_imag(O13), .X7_real(O14), .X7_imag(O15)
);

top_IFFT row_ins2(
    .x0_real(f0), .x0_imag(f1), .x1_real(f2), .x1_imag(f3) ,.x2_real(f4), .x2_imag(f5), .x3_real(f6), .x3_imag(f7), 
    .x4_real(f8), .x4_imag(f9), .x5_real(f10), .x5_imag(f11),  .x6_real(f12), .x6_imag(f13), .x7_real(f14), .x7_imag(f15),
    .X0_real(O16), .X0_imag(O17), .X1_real(O18), .X1_imag(O19), .X2_real(O20), .X2_imag(O21), .X3_real(O22), .X3_imag(O23), 
    .X4_real(O24), .X4_imag(O25), .X5_real(O26), .X5_imag(O27), .X6_real(O28), .X6_imag(O29), .X7_real(O30), .X7_imag(O31)
);

top_IFFT row_ins3(
    .x0_real(g0), .x0_imag(g1), .x1_real(g2), .x1_imag(g3) ,.x2_real(g4), .x2_imag(g5), .x3_real(g6), .x3_imag(g7), 
    .x4_real(g8), .x4_imag(g9), .x5_real(g10), .x5_imag(g11),  .x6_real(g12), .x6_imag(g13), .x7_real(g14), .x7_imag(g15),
    .X0_real(O32), .X0_imag(O33), .X1_real(O34), .X1_imag(O35), .X2_real(O36), .X2_imag(O37), .X3_real(O38), .X3_imag(O39), 
    .X4_real(O40), .X4_imag(O41), .X5_real(O42), .X5_imag(O43), .X6_real(O44), .X6_imag(O45), .X7_real(O46), .X7_imag(O47)
);

top_IFFT row_ins4(
    .x0_real(h0), .x0_imag(h1), .x1_real(h2), .x1_imag(h3) ,.x2_real(h4), .x2_imag(h5), .x3_real(h6), .x3_imag(h7), 
    .x4_real(h8), .x4_imag(h9), .x5_real(h10), .x5_imag(h11),  .x6_real(h12), .x6_imag(h13), .x7_real(h14), .x7_imag(h15),
    .X0_real(O48), .X0_imag(O49), .X1_real(O50), .X1_imag(O51), .X2_real(O52), .X2_imag(O53), .X3_real(O54), .X3_imag(O55), 
    .X4_real(O56), .X4_imag(O57), .X5_real(O58), .X5_imag(O59), .X6_real(O60), .X6_imag(O61), .X7_real(O62), .X7_imag(O63)
);

endmodule
