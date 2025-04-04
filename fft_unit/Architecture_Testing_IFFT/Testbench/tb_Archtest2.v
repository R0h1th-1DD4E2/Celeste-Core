`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 07:34:16 PM
// Design Name: 
// Module Name: tb_Archtest2
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




module tb_Archtest2;

  // Clock and reset
  reg clk;
  reg rst;

  // Declare inputs: 64 32-bit registers
  reg [31:0] I0,  I1,  I2,  I3,  I4,  I5,  I6,  I7,
             I8,  I9,  I10, I11, I12, I13, I14, I15,
             I16, I17, I18, I19, I20, I21, I22, I23,
             I24, I25, I26, I27, I28, I29, I30, I31,
             I32, I33, I34, I35, I36, I37, I38, I39,
             I40, I41, I42, I43, I44, I45, I46, I47,
             I48, I49, I50, I51, I52, I53, I54, I55,
             I56, I57, I58, I59, I60, I61, I62, I63;
             
  // Declare outputs: 64 32-bit wires
  wire [31:0] O0,  O1,  O2,  O3,  O4,  O5,  O6,  O7,
              O8,  O9,  O10, O11, O12, O13, O14, O15,
              O16, O17, O18, O19, O20, O21, O22, O23,
              O24, O25, O26, O27, O28, O29, O30, O31,
              O32, O33, O34, O35, O36, O37, O38, O39,
              O40, O41, O42, O43, O44, O45, O46, O47,
              O48, O49, O50, O51, O52, O53, O54, O55,
              O56, O57, O58, O59, O60, O61, O62, O63;
                  
wire [31:0] z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15;
wire [31:0] z16,z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31;
wire [31:0] z32,z33,z34,z35,z36,z37,z38,z39,z40,z41,z42,z43,z44,z45,z46,z47;
wire [31:0] z48,z49,z50,z51,z52,z53,z54,z55,z56,z57,z58,z59,z60,z61,z62,z63;
wire [31:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
wire [31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15;
wire [31:0] u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15;
wire [31:0] v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15;

wire [31:0] e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15;
wire [31:0] f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15;
wire [31:0] g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15;
wire [31:0] h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15;

  // Instantiate the DUT (Device Under Test)
  Archtest2 dut (
    .clk(clk), .rst(rst),
    .I0(I0),   .I1(I1),   .I2(I2),   .I3(I3),   .I4(I4),   .I5(I5),   .I6(I6),   .I7(I7),
    .I8(I8),   .I9(I9),   .I10(I10), .I11(I11), .I12(I12), .I13(I13), .I14(I14), .I15(I15),
    .I16(I16), .I17(I17), .I18(I18), .I19(I19), .I20(I20), .I21(I21), .I22(I22), .I23(I23),
    .I24(I24), .I25(I25), .I26(I26), .I27(I27), .I28(I28), .I29(I29), .I30(I30), .I31(I31),
    .I32(I32), .I33(I33), .I34(I34), .I35(I35), .I36(I36), .I37(I37), .I38(I38), .I39(I39),
    .I40(I40), .I41(I41), .I42(I42), .I43(I43), .I44(I44), .I45(I45), .I46(I46), .I47(I47),
    .I48(I48), .I49(I49), .I50(I50), .I51(I51), .I52(I52), .I53(I53), .I54(I54), .I55(I55),
    .I56(I56), .I57(I57), .I58(I58), .I59(I59), .I60(I60), .I61(I61), .I62(I62), .I63(I63),
    .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s4(s4), .s5(s5), .s6(s6), .s7(s7),
    .s8(s8), .s9(s9), .s10(s10), .s11(s11), .s12(s12), .s13(s13), .s14(s14), .s15(s15),
    .t0(t0), .t1(t1), .t2(t2), .t3(t3), .t4(t4), .t5(t5), .t6(t6), .t7(t7),
    .t8(t8), .t9(t9), .t10(t10), .t11(t11), .t12(t12), .t13(t13), .t14(t14), .t15(t15),
    .u0(u0), .u1(u1), .u2(u2), .u3(u3), .u4(u4), .u5(u5), .u6(u6), .u7(u7),
    .u8(u8), .u9(u9), .u10(u10), .u11(u11), .u12(u12), .u13(u13), .u14(u14), .u15(u15),
    .v0(v0), .v1(v1), .v2(v2), .v3(v3), .v4(v4), .v5(v5), .v6(v6), .v7(v7),
    .v8(v8), .v9(v9), .v10(v10), .v11(v11), .v12(v12), .v13(v13), .v14(v14), .v15(v15),
    .e0(e0), .e1(e1), .e2(e2), .e3(e3), .e4(e4), .e5(e5), .e6(e6), .e7(e7),
    .e8(e8), .e9(e9), .e10(e10), .e11(e11), .e12(e12), .e13(e13), .e14(e14), .e15(e15),
    .f0(f0), .f1(f1), .f2(f2), .f3(f3), .f4(f4), .f5(f5), .f6(f6), .f7(f7),
    .f8(f8), .f9(f9), .f10(f10), .f11(f11), .f12(f12), .f13(f13), .f14(f14), .f15(f15),
    .g0(g0), .g1(g1), .g2(g2), .g3(g3), .g4(g4), .g5(g5), .g6(g6), .g7(g7),
    .g8(g8), .g9(g9), .g10(g10), .g11(g11), .g12(g12), .g13(g13), .g14(g14), .g15(g15),
    .h0(h0), .h1(h1), .h2(h2), .h3(h3), .h4(h4), .h5(h5), .h6(h6), .h7(h7),
    .h8(h8), .h9(h9), .h10(h10), .h11(h11), .h12(h12), .h13(h13), .h14(h14), .h15(h15),
    .z0(z0), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7),
    .z8(z8), .z9(z9), .z10(z10), .z11(z11), .z12(z12), .z13(z13), .z14(z14), .z15(z15),
    .z16(z16), .z17(z17), .z18(z18), .z19(z19), .z20(z20), .z21(z21), .z22(z22), .z23(z23),
    .z24(z24), .z25(z25), .z26(z26), .z27(z27), .z28(z28), .z29(z29), .z30(z30), .z31(z31),
    .z32(z32), .z33(z33), .z34(z34), .z35(z35), .z36(z36), .z37(z37), .z38(z38), .z39(z39),
    .z40(z40), .z41(z41), .z42(z42), .z43(z43), .z44(z44), .z45(z45), .z46(z46), .z47(z47),
    .z48(z48), .z49(z49), .z50(z50), .z51(z51), .z52(z52), .z53(z53), .z54(z54), .z55(z55),
    .z56(z56), .z57(z57), .z58(z58), .z59(z59), .z60(z60), .z61(z61), .z62(z62), .z63(z63),
    .O0(O0),   .O1(O1),   .O2(O2),   .O3(O3),   .O4(O4),   .O5(O5),   .O6(O6),   .O7(O7),
    .O8(O8),   .O9(O9),   .O10(O10), .O11(O11), .O12(O12), .O13(O13), .O14(O14), .O15(O15),
    .O16(O16), .O17(O17), .O18(O18), .O19(O19), .O20(O20), .O21(O21), .O22(O22), .O23(O23),
    .O24(O24), .O25(O25), .O26(O26), .O27(O27), .O28(O28), .O29(O29), .O30(O30), .O31(O31),
    .O32(O32), .O33(O33), .O34(O34), .O35(O35), .O36(O36), .O37(O37), .O38(O38), .O39(O39),
    .O40(O40), .O41(O41), .O42(O42), .O43(O43), .O44(O44), .O45(O45), .O46(O46), .O47(O47),
    .O48(O48), .O49(O49), .O50(O50), .O51(O51), .O52(O52), .O53(O53), .O54(O54), .O55(O55),
    .O56(O56), .O57(O57), .O58(O58), .O59(O59), .O60(O60), .O61(O61), .O62(O62), .O63(O63)
  );
    integer file;
  // Clock generation: toggle every 5 time units.
  always #20 clk = ~clk;
  
  // Test stimulus
  initial begin
     file = $fopen("outputs.txt", "w");
    // Initialize clock and reset.
    clk = 0;
    rst = 1;
    #10;
    rst = 0;

    // ------------------------------------------------------
    // Group 1: I0 to I15 (8 complex numbers)
    // Real parts: 0, 1, 2, 3, 4, 5, 6, 7 
    // Imag parts: all 0
    // IEEE 754 hex: 0 = 32'h00000000, 1 = 32'h3F800000, 2 = 32'h40000000, 3 = 32'h40400000,
    //              4 = 32'h40800000, 5 = 32'h40A00000, 6 = 32'h40C00000, 7 = 32'h40E00000
    I0  = 32'h00000000; I1  = 32'h00000000;  // 0 + 0i
    I2  = 32'h3F800000; I3  = 32'h00000000;  // 1 + 0i
    I4  = 32'h40000000; I5  = 32'h00000000;  // 2 + 0i
    I6  = 32'h40400000; I7  = 32'h00000000;  // 3 + 0i
    I8  = 32'h40800000; I9  = 32'h00000000;  // 4 + 0i
    I10 = 32'h40A00000; I11 = 32'h00000000;  // 5 + 0i
    I12 = 32'h40C00000; I13 = 32'h00000000;  // 6 + 0i
    I14 = 32'h40E00000; I15 = 32'h00000000;  // 7 + 0i

    // ------------------------------------------------------
    // Group 2: I16 to I31 (8 complex numbers)
    // Real parts: 0, 2, 4, 6, 8, 10, 12, 14 (multiples of 2)
    // IEEE 754 hex: 2 = 32'h40000000, 4 = 32'h40800000, 6 = 32'h40C00000,
    //              8 = 32'h41000000, 10 = 32'h41200000, 12 = 32'h41400000, 14 = 32'h41600000
    I16 = 32'h00000000; I17 = 32'h00000000;  // 0 + 0i
    I18 = 32'h40000000; I19 = 32'h00000000;  // 2 + 0i
    I20 = 32'h40800000; I21 = 32'h00000000;  // 4 + 0i
    I22 = 32'h40C00000; I23 = 32'h00000000;  // 6 + 0i
    I24 = 32'h41000000; I25 = 32'h00000000;  // 8 + 0i
    I26 = 32'h41200000; I27 = 32'h00000000;  // 10 + 0i
    I28 = 32'h41400000; I29 = 32'h00000000;  // 12 + 0i
    I30 = 32'h41600000; I31 = 32'h00000000;  // 14 + 0i

    // ------------------------------------------------------
    // Group 3: I32 to I47 (8 complex numbers)
    // Real parts: 0, 3, 6, 9, 12, 15, 18, 21 (multiples of 3)
    // IEEE 754 hex: 3 = 32'h40400000, 6 = 32'h40C00000, 9 = 32'h41100000,
    //              12 = 32'h41400000, 15 = 32'h41700000, 18 = 32'h41900000, 21 = 32'h41A80000
    I32 = 32'h00000000; I33 = 32'h00000000;  // 0 + 0i
    I34 = 32'h40400000; I35 = 32'h00000000;  // 3 + 0i
    I36 = 32'h40C00000; I37 = 32'h00000000;  // 6 + 0i
    I38 = 32'h41100000; I39 = 32'h00000000;  // 9 + 0i
    I40 = 32'h41400000; I41 = 32'h00000000;  // 12 + 0i
    I42 = 32'h41700000; I43 = 32'h00000000;  // 15 + 0i
    I44 = 32'h41900000; I45 = 32'h00000000;  // 18 + 0i
    I46 = 32'h41A80000; I47 = 32'h00000000;  // 21 + 0i

    // ------------------------------------------------------
    // Group 4: I48 to I63 (8 complex numbers)
    // Real parts: 0, 4, 8, 12, 16, 20, 24, 28 (multiples of 4)
    // IEEE 754 hex: 4 = 32'h40800000, 8 = 32'h41000000, 12 = 32'h41400000,
    //              16 = 32'h41800000, 20 = 32'h41A00000, 24 = 32'h41C00000, 28 = 32'h41E00000
    I48 = 32'h00000000; I49 = 32'h00000000;  // 0 + 0i
    I50 = 32'h40800000; I51 = 32'h00000000;  // 4 + 0i
    I52 = 32'h41000000; I53 = 32'h00000000;  // 8 + 0i
    I54 = 32'h41400000; I55 = 32'h00000000;  // 12 + 0i
    I56 = 32'h41800000; I57 = 32'h00000000;  // 16 + 0i
    I58 = 32'h41A00000; I59 = 32'h00000000;  // 20 + 0i
    I60 = 32'h41C00000; I61 = 32'h00000000;  // 24 + 0i
    I62 = 32'h41E00000; I63 = 32'h00000000;  // 28 + 0i

    // Wait for some time to let the DUT process the input
    #600;
    $display("Final floating-point outputs:");
    $fdisplay(file, "Final floating-point outputs:\n");

    $display("O0 = %h", O0);   $fdisplay(file, "O0 = %h\n", O0);
    $display("O1 = %h", O1);   $fdisplay(file, "O1 = %h\n", O1);
    $display("O2 = %h", O2);   $fdisplay(file, "O2 = %h\n", O2);
    $display("O3 = %h", O3);   $fdisplay(file, "O3 = %h\n", O3);
    $display("O4 = %h", O4);   $fdisplay(file, "O4 = %h\n", O4);
    $display("O5 = %h", O5);   $fdisplay(file, "O5 = %h\n", O5);
    $display("O6 = %h", O6);   $fdisplay(file, "O6 = %h\n", O6);
    $display("O7 = %h", O7);   $fdisplay(file, "O7 = %h\n", O7);
    $display("O8 = %h", O8);   $fdisplay(file, "O8 = %h\n", O8);
    $display("O9 = %h", O9);   $fdisplay(file, "O9 = %h\n", O9);
    $display("O10 = %h", O10); $fdisplay(file, "O10 = %h\n", O10);
    $display("O11 = %h", O11); $fdisplay(file, "O11 = %h\n", O11);
    $display("O12 = %h", O12); $fdisplay(file, "O12 = %h\n", O12);
    $display("O13 = %h", O13); $fdisplay(file, "O13 = %h\n", O13);
    $display("O14 = %h", O14); $fdisplay(file, "O14 = %h\n", O14);
    $display("O15 = %h", O15); $fdisplay(file, "O15 = %h\n", O15);
    $display("O16 = %h", O16); $fdisplay(file, "O16 = %h\n", O16);
    $display("O17 = %h", O17); $fdisplay(file, "O17 = %h\n", O17);
    $display("O18 = %h", O18); $fdisplay(file, "O18 = %h\n", O18);
    $display("O19 = %h", O19); $fdisplay(file, "O19 = %h\n", O19);
    $display("O20 = %h", O20); $fdisplay(file, "O20 = %h\n", O20);
    $display("O21 = %h", O21); $fdisplay(file, "O21 = %h\n", O21);
    $display("O22 = %h", O22); $fdisplay(file, "O22 = %h\n", O22);
    $display("O23 = %h", O23); $fdisplay(file, "O23 = %h\n", O23);
    $display("O24 = %h", O24); $fdisplay(file, "O24 = %h\n", O24);
    $display("O25 = %h", O25); $fdisplay(file, "O25 = %h\n", O25);
    $display("O26 = %h", O26); $fdisplay(file, "O26 = %h\n", O26);
    $display("O27 = %h", O27); $fdisplay(file, "O27 = %h\n", O27);
    $display("O28 = %h", O28); $fdisplay(file, "O28 = %h\n", O28);
    $display("O29 = %h", O29); $fdisplay(file, "O29 = %h\n", O29);
    $display("O30 = %h", O30); $fdisplay(file, "O30 = %h\n", O30);
    $display("O31 = %h", O31); $fdisplay(file, "O31 = %h\n", O31);
    $display("O32 = %h", O32); $fdisplay(file, "O32 = %h\n", O32);
    $display("O33 = %h", O33); $fdisplay(file, "O33 = %h\n", O33);
    $display("O34 = %h", O34); $fdisplay(file, "O34 = %h\n", O34);
    $display("O35 = %h", O35); $fdisplay(file, "O35 = %h\n", O35);
    $display("O36 = %h", O36); $fdisplay(file, "O36 = %h\n", O36);
    $display("O37 = %h", O37); $fdisplay(file, "O37 = %h\n", O37);
    $display("O38 = %h", O38); $fdisplay(file, "O38 = %h\n", O38);
    $display("O39 = %h", O39); $fdisplay(file, "O39 = %h\n", O39);
    $display("O40 = %h", O40); $fdisplay(file, "O40 = %h\n", O40);
    $display("O41 = %h", O41); $fdisplay(file, "O41 = %h\n", O41);
    $display("O42 = %h", O42); $fdisplay(file, "O42 = %h\n", O42);
    $display("O43 = %h", O43); $fdisplay(file, "O43 = %h\n", O43);
    $display("O44 = %h", O44); $fdisplay(file, "O44 = %h\n", O44);
    $display("O45 = %h", O45); $fdisplay(file, "O45 = %h\n", O45);
    $display("O46 = %h", O46); $fdisplay(file, "O46 = %h\n", O46);
    $display("O47 = %h", O47); $fdisplay(file, "O47 = %h\n", O47);
    $display("O48 = %h", O48); $fdisplay(file, "O48 = %h\n", O48);
    $display("O49 = %h", O49); $fdisplay(file, "O49 = %h\n", O49);
    $display("O50 = %h", O50); $fdisplay(file, "O50 = %h\n", O50);
    $display("O51 = %h", O51); $fdisplay(file, "O51 = %h\n", O51);
    $display("O52 = %h", O52); $fdisplay(file, "O52 = %h\n", O52);
    $display("O53 = %h", O53); $fdisplay(file, "O53 = %h\n", O53);
    $display("O54 = %h", O54); $fdisplay(file, "O54 = %h\n", O54);
    $display("O55 = %h", O55); $fdisplay(file, "O55 = %h\n", O55);
    $display("O56 = %h", O56); $fdisplay(file, "O56 = %h\n", O56);
    $display("O57 = %h", O57); $fdisplay(file, "O57 = %h\n", O57);
    $display("O58 = %h", O58); $fdisplay(file, "O58 = %h\n", O58);
    $display("O59 = %h", O59); $fdisplay(file, "O59 = %h\n", O59);
    $display("O60 = %h", O60); $fdisplay(file, "O60 = %h\n", O60);
    $display("O61 = %h", O61); $fdisplay(file, "O61 = %h\n", O61);
    $display("O62 = %h", O62); $fdisplay(file, "O62 = %h\n", O62);
    $display("O63 = %h", O63); $fdisplay(file, "O63 = %h\n", O63);

    $display("z0 = %h", z0); $fdisplay(file, "z0 = %h\n", z0);
    $display("z1 = %h", z1); $fdisplay(file, "z1 = %h\n", z1);
    $display("z2 = %h", z2); $fdisplay(file, "z2 = %h\n", z2);
    $display("z3 = %h", z3); $fdisplay(file, "z3 = %h\n", z3);
    $display("z4 = %h", z4); $fdisplay(file, "z4 = %h\n", z4);
    $display("z5 = %h", z5); $fdisplay(file, "z5 = %h\n", z5);
    $display("z6 = %h", z6); $fdisplay(file, "z6 = %h\n", z6);
    $display("z7 = %h", z7); $fdisplay(file, "z7 = %h\n", z7);
    $display("z8 = %h", z8); $fdisplay(file, "z8 = %h\n", z8);
    $display("z9 = %h", z9); $fdisplay(file, "z9 = %h\n", z9);
    $display("z10 = %h", z10); $fdisplay(file, "z10 = %h\n", z10);
    $display("z11 = %h", z11); $fdisplay(file, "z11 = %h\n", z11);
    $display("z12 = %h", z12); $fdisplay(file, "z12 = %h\n", z12);
    $display("z13 = %h", z13); $fdisplay(file, "z13 = %h\n", z13);
    $display("z14 = %h", z14); $fdisplay(file, "z14 = %h\n", z14);
    $display("z15 = %h", z15); $fdisplay(file, "z15 = %h\n", z15);
    $display("z16 = %h", z16); $fdisplay(file, "z16 = %h\n", z16);
    $display("z17 = %h", z17); $fdisplay(file, "z17 = %h\n", z17);
    $display("z18 = %h", z18); $fdisplay(file, "z18 = %h\n", z18);
    $display("z19 = %h", z19); $fdisplay(file, "z19 = %h\n", z19);
    $display("z20 = %h", z20); $fdisplay(file, "z20 = %h\n", z20);
    $display("z21 = %h", z21); $fdisplay(file, "z21 = %h\n", z21);
    $display("z22 = %h", z22); $fdisplay(file, "z22 = %h\n", z22);
    $display("z23 = %h", z23); $fdisplay(file, "z23 = %h\n", z23);
    $display("z24 = %h", z24); $fdisplay(file, "z24 = %h\n", z24);
    $display("z25 = %h", z25); $fdisplay(file, "z25 = %h\n", z25);
    $display("z26 = %h", z26); $fdisplay(file, "z26 = %h\n", z26);
    $display("z27 = %h", z27); $fdisplay(file, "z27 = %h\n", z27);
    $display("z28 = %h", z28); $fdisplay(file, "z28 = %h\n", z28);
    $display("z29 = %h", z29); $fdisplay(file, "z29 = %h\n", z29);
    $display("z30 = %h", z30); $fdisplay(file, "z30 = %h\n", z30);
    $display("z31 = %h", z31); $fdisplay(file, "z31 = %h\n", z31);
    $display("z32 = %h", z32); $fdisplay(file, "z32 = %h\n", z32);
    $display("z33 = %h", z33); $fdisplay(file, "z33 = %h\n", z33);
    $display("z34 = %h", z34); $fdisplay(file, "z34 = %h\n", z34);
    $display("z35 = %h", z35); $fdisplay(file, "z35 = %h\n", z35);
    $display("z36 = %h", z36); $fdisplay(file, "z36 = %h\n", z36);
    $display("z37 = %h", z37); $fdisplay(file, "z37 = %h\n", z37);
    $display("z38 = %h", z38); $fdisplay(file, "z38 = %h\n", z38);
    $display("z39 = %h", z39); $fdisplay(file, "z39 = %h\n", z39);
    $display("z40 = %h", z40); $fdisplay(file, "z40 = %h\n", z40);
    $display("z41 = %h", z41); $fdisplay(file, "z41 = %h\n", z41);
    $display("z42 = %h", z42); $fdisplay(file, "z42 = %h\n", z42);
    $display("z43 = %h", z43); $fdisplay(file, "z43 = %h\n", z43);
    $display("z44 = %h", z44); $fdisplay(file, "z44 = %h\n", z44);
    $display("z45 = %h", z45); $fdisplay(file, "z45 = %h\n", z45);
    $display("z46 = %h", z46); $fdisplay(file, "z46 = %h\n", z46);
    $display("z47 = %h", z47); $fdisplay(file, "z47 = %h\n", z47);
    $display("z48 = %h", z48); $fdisplay(file, "z48 = %h\n", z48);
    $display("z49 = %h", z49); $fdisplay(file, "z49 = %h\n", z49);
    $display("z50 = %h", z50); $fdisplay(file, "z50 = %h\n", z50);
    $display("z51 = %h", z51); $fdisplay(file, "z51 = %h\n", z51);
    $display("z52 = %h", z52); $fdisplay(file, "z52 = %h\n", z52);
    $display("z53 = %h", z53); $fdisplay(file, "z53 = %h\n", z53);
    $display("z54 = %h", z54); $fdisplay(file, "z54 = %h\n", z54);
    $display("z55 = %h", z55); $fdisplay(file, "z55 = %h\n", z55);
    $display("z56 = %h", z56); $fdisplay(file, "z56 = %h\n", z56);
    $display("z57 = %h", z57); $fdisplay(file, "z57 = %h\n", z57);
    $display("z58 = %h", z58); $fdisplay(file, "z58 = %h\n", z58);
    $display("z59 = %h", z59); $fdisplay(file, "z59 = %h\n", z59);
    $display("z60 = %h", z60); $fdisplay(file, "z60 = %h\n", z60);
    $display("z61 = %h", z61); $fdisplay(file, "z61 = %h\n", z61);
    $display("z62 = %h", z62); $fdisplay(file, "z62 = %h\n", z62);
    $display("z63 = %h", z63); $fdisplay(file, "z63 = %h\n", z63);

    $display("s0 = %h", s0); $fdisplay(file, "s0 = %h\n", s0);
    $display("s1 = %h", s1); $fdisplay(file, "s1 = %h\n", s1);
    $display("s2 = %h", s2); $fdisplay(file, "s2 = %h\n", s2);
    $display("s3 = %h", s3); $fdisplay(file, "s3 = %h\n", s3);
    $display("s4 = %h", s4); $fdisplay(file, "s4 = %h\n", s4);
    $display("s5 = %h", s5); $fdisplay(file, "s5 = %h\n", s5);
    $display("s6 = %h", s6); $fdisplay(file, "s6 = %h\n", s6);
    $display("s7 = %h", s7); $fdisplay(file, "s7 = %h\n", s7);
    $display("s8 = %h", s8); $fdisplay(file, "s8 = %h\n", s8);
    $display("s9 = %h", s9); $fdisplay(file, "s9 = %h\n", s9); 
    $display("s10 = %h", s10); $fdisplay(file, "s10 = %h\n", s10);
    $display("s11 = %h", s11); $fdisplay(file, "s11 = %h\n", s11);
    $display("s12 = %h", s12); $fdisplay(file, "s12 = %h\n", s12);
    $display("s13 = %h", s13); $fdisplay(file, "s13 = %h\n", s13);
    $display("s14 = %h", s14); $fdisplay(file, "s14 = %h\n", s14);
    $display("s15 = %h", s15); $fdisplay(file, "s15 = %h\n", s15);

    $display("t0 = %h", t0); $fdisplay(file, "t0 = %h\n", t0);
    $display("t1 = %h", t1); $fdisplay(file, "t1 = %h\n", t1);
    $display("t2 = %h", t2); $fdisplay(file, "t2 = %h\n", t2);
    $display("t3 = %h", t3); $fdisplay(file, "t3 = %h\n", t3);
    $display("t4 = %h", t4); $fdisplay(file, "t4 = %h\n", t4);
    $display("t5 = %h", t5); $fdisplay(file, "t5 = %h\n", t5);
    $display("t6 = %h", t6); $fdisplay(file, "t6 = %h\n", t6);
    $display("t7 = %h", t7); $fdisplay(file, "t7 = %h\n", t7);
    $display("t8 = %h", t8); $fdisplay(file, "t8 = %h\n", t8);
    $display("t9 = %h", t9); $fdisplay(file, "t9 = %h\n", t9);
    $display("t10 = %h", t10); $fdisplay(file, "t10 = %h\n", t10);
    $display("t11 = %h", t11); $fdisplay(file, "t11 = %h\n", t11);
    $display("t12 = %h", t12); $fdisplay(file, "t12 = %h\n", t12);
    $display("t13 = %h", t13); $fdisplay(file, "t13 = %h\n", t13);
    $display("t14 = %h", t14); $fdisplay(file, "t14 = %h\n", t14);
    $display("t15 = %h", t15); $fdisplay(file, "t15 = %h\n", t15);

    $display("u0 = %h", u0); $fdisplay(file, "u0 = %h\n", u0);
    $display("u1 = %h", u1); $fdisplay(file, "u1 = %h\n", u1);
    $display("u2 = %h", u2); $fdisplay(file, "u2 = %h\n", u2);
    $display("u3 = %h", u3); $fdisplay(file, "u3 = %h\n", u3);
    $display("u4 = %h", u4); $fdisplay(file, "u4 = %h\n", u4);
    $display("u5 = %h", u5); $fdisplay(file, "u5 = %h\n", u5);
    $display("u6 = %h", u6); $fdisplay(file, "u6 = %h\n", u6);
    $display("u7 = %h", u7); $fdisplay(file, "u7 = %h\n", u7);
    $display("u8 = %h", u8); $fdisplay(file, "u8 = %h\n", u8);
    $display("u9 = %h", u9); $fdisplay(file, "u9 = %h\n", u9);
    $display("u10 = %h", u10); $fdisplay(file, "u10 = %h\n", u10);
    $display("u11 = %h", u11); $fdisplay(file, "u11 = %h\n", u11);
    $display("u12 = %h", u12); $fdisplay(file, "u12 = %h\n", u12);
    $display("u13 = %h", u13); $fdisplay(file, "u13 = %h\n", u13);
    $display("u14 = %h", u14); $fdisplay(file, "u14 = %h\n", u14);
    $display("u15 = %h", u15); $fdisplay(file, "u15 = %h\n", u15);

    $display("v0 = %h", v0); $fdisplay(file, "v0 = %h\n", v0);
    $display("v1 = %h", v1); $fdisplay(file, "v1 = %h\n", v1);
    $display("v2 = %h", v2); $fdisplay(file, "v2 = %h\n", v2);
    $display("v3 = %h", v3); $fdisplay(file, "v3 = %h\n", v3);
    $display("v4 = %h", v4); $fdisplay(file, "v4 = %h\n", v4);
    $display("v5 = %h", v5); $fdisplay(file, "v5 = %h\n", v5);
    $display("v6 = %h", v6); $fdisplay(file, "v6 = %h\n", v6);
    $display("v7 = %h", v7); $fdisplay(file, "v7 = %h\n", v7);
    $display("v8 = %h", v8); $fdisplay(file, "v8 = %h\n", v8);
    $display("v9 = %h", v9); $fdisplay(file, "v9 = %h\n", v9);
    $display("v10 = %h", v10); $fdisplay(file, "v10 = %h\n", v10);
    $display("v11 = %h", v11); $fdisplay(file, "v11 = %h\n", v11);
    $display("v12 = %h", v12); $fdisplay(file, "v12 = %h\n", v12);
    $display("v13 = %h", v13); $fdisplay(file, "v13 = %h\n", v13);
    $display("v14 = %h", v14); $fdisplay(file, "v14 = %h\n", v14);
    $display("v15 = %h", v15); $fdisplay(file, "v15 = %h\n", v15);


    $display("e0 = %h", e0); $fdisplay(file, "e0 = %h\n", e0);
    $display("e1 = %h", e1); $fdisplay(file, "e1 = %h\n", e1);
    $display("e2 = %h", e2); $fdisplay(file, "e2 = %h\n", e2);
    $display("e3 = %h", e3); $fdisplay(file, "e3 = %h\n", e3);
    $display("e4 = %h", e4); $fdisplay(file, "e4 = %h\n", e4);
    $display("e5 = %h", e5); $fdisplay(file, "e5 = %h\n", e5);
    $display("e6 = %h", e6); $fdisplay(file, "e6 = %h\n", e6);
    $display("e7 = %h", e7); $fdisplay(file, "e7 = %h\n", e7);
    $display("e8 = %h", e8); $fdisplay(file, "e8 = %h\n", e8);
    $display("e9 = %h", e9); $fdisplay(file, "e9 = %h\n", e9);
    $display("e10 = %h", e10); $fdisplay(file, "e10 = %h\n", e10);
    $display("e11 = %h", e11); $fdisplay(file, "e11 = %h\n", e11);
    $display("e12 = %h", e12); $fdisplay(file, "e12 = %h\n", e12);
    $display("e13 = %h", e13); $fdisplay(file, "e13 = %h\n", e13);
    $display("e14 = %h", e14); $fdisplay(file, "e14 = %h\n", e14);
    $display("e15 = %h", e15); $fdisplay(file, "e15 = %h\n", e15);

    $display("f0 = %h", f0); $fdisplay(file, "f0 = %h\n", f0);
    $display("f1 = %h", f1); $fdisplay(file, "f1 = %h\n", f1);
    $display("f2 = %h", f2); $fdisplay(file, "f2 = %h\n", f2);
    $display("f3 = %h", f3); $fdisplay(file, "f3 = %h\n", f3);
    $display("f4 = %h", f4); $fdisplay(file, "f4 = %h\n", f4);
    $display("f5 = %h", f5); $fdisplay(file, "f5 = %h\n", f5);
    $display("f6 = %h", f6); $fdisplay(file, "f6 = %h\n", f6);
    $display("f7 = %h", f7); $fdisplay(file, "f7 = %h\n", f7);
    $display("f8 = %h", f8); $fdisplay(file, "f8 = %h\n", f8);
    $display("f9 = %h", f9); $fdisplay(file, "f9 = %h\n", f9);
    $display("f10 = %h", f10); $fdisplay(file, "f10 = %h\n", f10);
    $display("f11 = %h", f11); $fdisplay(file, "f11 = %h\n", f11);
    $display("f12 = %h", f12); $fdisplay(file, "f12 = %h\n", f12);
    $display("f13 = %h", f13); $fdisplay(file, "f13 = %h\n", f13);
    $display("f14 = %h", f14); $fdisplay(file, "f14 = %h\n", f14);
    $display("f15 = %h", f15); $fdisplay(file, "f15 = %h\n", f15);

    $display("g0 = %h", g0); $fdisplay(file, "g0 = %h\n", g0);
    $display("g1 = %h", g1); $fdisplay(file, "g1 = %h\n", g1);
    $display("g2 = %h", g2); $fdisplay(file, "g2 = %h\n", g2);
    $display("g3 = %h", g3); $fdisplay(file, "g3 = %h\n", g3);
    $display("g4 = %h", g4); $fdisplay(file, "g4 = %h\n", g4);
    $display("g5 = %h", g5); $fdisplay(file, "g5 = %h\n", g5);
    $display("g6 = %h", g6); $fdisplay(file, "g6 = %h\n", g6);
    $display("g7 = %h", g7); $fdisplay(file, "g7 = %h\n", g7);
    $display("g8 = %h", g8); $fdisplay(file, "g8 = %h\n", g8);
    $display("g9 = %h", g9); $fdisplay(file, "g9 = %h\n", g9);
    $display("g10 = %h", g10); $fdisplay(file, "g10 = %h\n", g10);
    $display("g11 = %h", g11); $fdisplay(file, "g11 = %h\n", g11);
    $display("g12 = %h", g12); $fdisplay(file, "g12 = %h\n", g12);
    $display("g13 = %h", g13); $fdisplay(file, "g13 = %h\n", g13);
    $display("g14 = %h", g14); $fdisplay(file, "g14 = %h\n", g14);
    $display("g15 = %h", g15); $fdisplay(file, "g15 = %h\n", g15);

    $display("h0 = %h", h0); $fdisplay(file, "h0 = %h\n", h0);
    $display("h1 = %h", h1); $fdisplay(file, "h1 = %h\n", h1);
    $display("h2 = %h", h2); $fdisplay(file, "h2 = %h\n", h2);
    $display("h3 = %h", h3); $fdisplay(file, "h3 = %h\n", h3);
    $display("h4 = %h", h4); $fdisplay(file, "h4 = %h\n", h4);
    $display("h5 = %h", h5); $fdisplay(file, "h5 = %h\n", h5);
    $display("h6 = %h", h6); $fdisplay(file, "h6 = %h\n", h6);
    $display("h7 = %h", h7); $fdisplay(file, "h7 = %h\n", h7);
    $display("h8 = %h", h8); $fdisplay(file, "h8 = %h\n", h8);
    $display("h9 = %h", h9); $fdisplay(file, "h9 = %h\n", h9);
    $display("h10 = %h", h10); $fdisplay(file, "h10 = %h\n", h10);
    $display("h11 = %h", h11); $fdisplay(file, "h11 = %h\n", h11);
    $display("h12 = %h", h12); $fdisplay(file, "h12 = %h\n", h12);
    $display("h13 = %h", h13); $fdisplay(file, "h13 = %h\n", h13);
    $display("h14 = %h", h14); $fdisplay(file, "h14 = %h\n", h14);
    $display("h15 = %h", h15); $fdisplay(file, "h15 = %h\n", h15);
    // End simulation
    $fclose(file);
    $finish;
  end

endmodule
