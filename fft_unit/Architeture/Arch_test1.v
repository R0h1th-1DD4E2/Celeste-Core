module Arch_test1(
    input clk,rst,
    input  [31:0] x0,  x1,  x2,  x3,  x4,  x5,  x6,  x7,
                  x8,  x9,  x10, x11, x12, x13, x14, x15,
                  x16, x17, x18, x19, x20, x21, x22, x23,
                  x24, x25, x26, x27, x28, x29, x30, x31,
                  x32, x33, x34, x35, x36, x37, x38, x39,
                  x40, x41, x42, x43, x44, x45, x46, x47,
                  x48, x49, x50, x51, x52, x53, x54, x55,
                  x56, x57, x58, x59, x60, x61, x62, x63,
    output [31:0] y0,  y1,  y2,  y3,  y4,  y5,  y6,  y7,
                  y8,  y9,  y10, y11, y12, y13, y14, y15,
                  y16, y17, y18, y19, y20, y21, y22, y23,
                  y24, y25, y26, y27, y28, y29, y30, y31,
                  y32, y33, y34, y35, y36, y37, y38, y39,
                  y40, y41, y42, y43, y44, y45, y46, y47,
                  y48, y49, y50, y51, y52, y53, y54, y55,
                  y56, y57, y58, y59, y60, y61, y62, y63
);

//---------------------------------------------------------------------
// Row FFT Stage: Four instantiations of 8-point FFT modules
//---------------------------------------------------------------------

// First row FFT: process x0..x15 (8 complex numbers)
wire [31:0] j0,  j1,  j2,  j3,  j4,  j5,  j6,  j7,
            j8,  j9,  j10, j11, j12, j13, j14, j15;
top_module_8pt row_fft0 (
    .x0_real(x0),   .x0_imag(x1),
    .x1_real(x2),   .x1_imag(x3),
    .x2_real(x4),   .x2_imag(x5),
    .x3_real(x6),   .x3_imag(x7),
    .x4_real(x8),   .x4_imag(x9),
    .x5_real(x10),  .x5_imag(x11),
    .x6_real(x12),  .x6_imag(x13),
    .x7_real(x14),  .x7_imag(x15),
    .X0_real(j0),   .X0_imag(j1),
    .X1_real(j2),   .X1_imag(j3),
    .X2_real(j4),   .X2_imag(j5),
    .X3_real(j6),   .X3_imag(j7),
    .X4_real(j8),   .X4_imag(j9),
    .X5_real(j10),  .X5_imag(j11),
    .X6_real(j12),  .X6_imag(j13),
    .X7_real(j14),  .X7_imag(j15)
);

// Second row FFT: process x16..x31
wire [31:0] j16, j17, j18, j19, j20, j21, j22, j23,
            j24, j25, j26, j27, j28, j29, j30, j31;
top_module_8pt row_fft1 (
    .x0_real(x16),  .x0_imag(x17),
    .x1_real(x18),  .x1_imag(x19),
    .x2_real(x20),  .x2_imag(x21),
    .x3_real(x22),  .x3_imag(x23),
    .x4_real(x24),  .x4_imag(x25),
    .x5_real(x26),  .x5_imag(x27),
    .x6_real(x28),  .x6_imag(x29),
    .x7_real(x30),  .x7_imag(x31),
    .X0_real(j16),  .X0_imag(j17),
    .X1_real(j18),  .X1_imag(j19),
    .X2_real(j20),  .X2_imag(j21),
    .X3_real(j22),  .X3_imag(j23),
    .X4_real(j24),  .X4_imag(j25),
    .X5_real(j26),  .X5_imag(j27),
    .X6_real(j28),  .X6_imag(j29),
    .X7_real(j30),  .X7_imag(j31)
);

// Third row FFT: process x32..x47
wire [31:0] j32, j33, j34, j35, j36, j37, j38, j39,
            j40, j41, j42, j43, j44, j45, j46, j47;
top_module_8pt row_fft2 (
    .x0_real(x32),  .x0_imag(x33),
    .x1_real(x34),  .x1_imag(x35),
    .x2_real(x36),  .x2_imag(x37),
    .x3_real(x38),  .x3_imag(x39),
    .x4_real(x40),  .x4_imag(x41),
    .x5_real(x42),  .x5_imag(x43),
    .x6_real(x44),  .x6_imag(x45),
    .x7_real(x46),  .x7_imag(x47),
    .X0_real(j32),  .X0_imag(j33),
    .X1_real(j34),  .X1_imag(j35),
    .X2_real(j36),  .X2_imag(j37),
    .X3_real(j38),  .X3_imag(j39),
    .X4_real(j40),  .X4_imag(j41),
    .X5_real(j42),  .X5_imag(j43),
    .X6_real(j44),  .X6_imag(j45),
    .X7_real(j46),  .X7_imag(j47)
);

// Fourth row FFT: process x48..x63
wire [31:0] j48, j49, j50, j51, j52, j53, j54, j55,
            j56, j57, j58, j59, j60, j61, j62, j63;
top_module_8pt row_fft3 (
    .x0_real(x48),  .x0_imag(x49),
    .x1_real(x50),  .x1_imag(x51),
    .x2_real(x52),  .x2_imag(x53),
    .x3_real(x54),  .x3_imag(x55),
    .x4_real(x56),  .x4_imag(x57),
    .x5_real(x58),  .x5_imag(x59),
    .x6_real(x60),  .x6_imag(x61),
    .x7_real(x62),  .x7_imag(x63),
    .X0_real(j48),  .X0_imag(j49),
    .X1_real(j50),  .X1_imag(j51),
    .X2_real(j52),  .X2_imag(j53),
    .X3_real(j54),  .X3_imag(j55),
    .X4_real(j56),  .X4_imag(j57),
    .X5_real(j58),  .X5_imag(j59),
    .X6_real(j60),  .X6_imag(j61),
    .X7_real(j62),  .X7_imag(j63)
);

//---------------------------------------------------------------------
// Register Stage: Latch the row FFT outputs into k0..k63
//---------------------------------------------------------------------
wire [31:0] k0,  k1,  k2,  k3,  k4,  k5,  k6,  k7,
            k8,  k9,  k10, k11, k12, k13, k14, k15,
            k16, k17, k18, k19, k20, k21, k22, k23,
            k24, k25, k26, k27, k28, k29, k30, k31,
            k32, k33, k34, k35, k36, k37, k38, k39,
            k40, k41, k42, k43, k44, k45, k46, k47,
            k48, k49, k50, k51, k52, k53, k54, k55,
            k56, k57, k58, k59, k60, k61, k62, k63;
            
Register reg_inst (
    .a0(j0),  .a1(j1),   .a2(j2),   .a3(j3),
    .a4(j4),  .a5(j5),   .a6(j6),   .a7(j7),
    .a8(j8),  .a9(j9),   .a10(j10), .a11(j11),
    .a12(j12), .a13(j13), .a14(j14), .a15(j15),
    .a16(j16), .a17(j17), .a18(j18), .a19(j19),
    .a20(j20), .a21(j21), .a22(j22), .a23(j23),
    .a24(j24), .a25(j25), .a26(j26), .a27(j27),
    .a28(j28), .a29(j29), .a30(j30), .a31(j31),
    .a32(j32), .a33(j33), .a34(j34), .a35(j35),
    .a36(j36), .a37(j37), .a38(j38), .a39(j39),
    .a40(j40), .a41(j41), .a42(j42), .a43(j43),
    .a44(j44), .a45(j45), .a46(j46), .a47(j47),
    .a48(j48), .a49(j49), .a50(j50), .a51(j51),
    .a52(j52), .a53(j53), .a54(j54), .a55(j55),
    .a56(j56), .a57(j57), .a58(j58), .a59(j59),
    .a60(j60), .a61(j61), .a62(j62), .a63(j63),

    .b0(k0),  .b1(k1),   .b2(k2),   .b3(k3),
    .b4(k4),  .b5(k5),   .b6(k6),   .b7(k7),
    .b8(k8),  .b9(k9),   .b10(k10), .b11(k11),
    .b12(k12), .b13(k13), .b14(k14), .b15(k15),
    .b16(k16), .b17(k17), .b18(k18), .b19(k19),
    .b20(k20), .b21(k21), .b22(k22), .b23(k23),
    .b24(k24), .b25(k25), .b26(k26), .b27(k27),
    .b28(k28), .b29(k29), .b30(k30), .b31(k31),
    .b32(k32), .b33(k33), .b34(k34), .b35(k35),
    .b36(k36), .b37(k37), .b38(k38), .b39(k39),
    .b40(k40), .b41(k41), .b42(k42), .b43(k43),
    .b44(k44), .b45(k45), .b46(k46), .b47(k47),
    .b48(k48), .b49(k49), .b50(k50), .b51(k51),
    .b52(k52), .b53(k53), .b54(k54), .b55(k55),
    .b56(k56), .b57(k57), .b58(k58), .b59(k59),
    .b60(k60), .b61(k61), .b62(k62), .b63(k63),
    .clk(clk),.rst(rst)
);

//---------------------------------------------------------------------
// Column FFT Stage: Four instantiations of 8-point FFT modules
//---------------------------------------------------------------------
wire [31:0] m0,  m1,  m2,  m3,  m4,  m5,  m6,  m7,
            m8,  m9,  m10, m11, m12, m13, m14, m15;
top_module_8pt col_fft0 (
    .x0_real(k0),   .x0_imag(k1),
    .x1_real(k2),   .x1_imag(k3),
    .x2_real(k4),   .x2_imag(k5),
    .x3_real(k6),   .x3_imag(k7),
    .x4_real(k8),   .x4_imag(k9),
    .x5_real(k10),  .x5_imag(k11),
    .x6_real(k12),  .x6_imag(k13),
    .x7_real(k14),  .x7_imag(k15),
    .X0_real(m0),   .X0_imag(m1),
    .X1_real(m2),   .X1_imag(m3),
    .X2_real(m4),   .X2_imag(m5),
    .X3_real(m6),   .X3_imag(m7),
    .X4_real(m8),   .X4_imag(m9),
    .X5_real(m10),  .X5_imag(m11),
    .X6_real(m12),  .X6_imag(m13),
    .X7_real(m14),  .X7_imag(m15)
);

wire [31:0] m16, m17, m18, m19, m20, m21, m22, m23,
            m24, m25, m26, m27, m28, m29, m30, m31;
top_module_8pt col_fft1 (
    .x0_real(k16),   .x0_imag(k17),
    .x1_real(k18),   .x1_imag(k19),
    .x2_real(k20),   .x2_imag(k21),
    .x3_real(k22),   .x3_imag(k23),
    .x4_real(k24),   .x4_imag(k25),
    .x5_real(k26),   .x5_imag(k27),
    .x6_real(k28),   .x6_imag(k29),
    .x7_real(k30),   .x7_imag(k31),
    .X0_real(m16),   .X0_imag(m17),
    .X1_real(m18),   .X1_imag(m19),
    .X2_real(m20),   .X2_imag(m21),
    .X3_real(m22),   .X3_imag(m23),
    .X4_real(m24),   .X4_imag(m25),
    .X5_real(m26),   .X5_imag(m27),
    .X6_real(m28),   .X6_imag(m29),
    .X7_real(m30),   .X7_imag(m31)
);

wire [31:0] m32, m33, m34, m35, m36, m37, m38, m39,
            m40, m41, m42, m43, m44, m45, m46, m47;
top_module_8pt col_fft2 (
    .x0_real(k32),   .x0_imag(k33),
    .x1_real(k34),   .x1_imag(k35),
    .x2_real(k36),   .x2_imag(k37),
    .x3_real(k38),   .x3_imag(k39),
    .x4_real(k40),   .x4_imag(k41),
    .x5_real(k42),   .x5_imag(k43),
    .x6_real(k44),   .x6_imag(k45),
    .x7_real(k46),   .x7_imag(k47),
    .X0_real(m32),   .X0_imag(m33),
    .X1_real(m34),   .X1_imag(m35),
    .X2_real(m36),   .X2_imag(m37),
    .X3_real(m38),   .X3_imag(m39),
    .X4_real(m40),   .X4_imag(m41),
    .X5_real(m42),   .X5_imag(m43),
    .X6_real(m44),   .X6_imag(m45),
    .X7_real(m46),   .X7_imag(m47)
    
);

wire [31:0] m48, m49, m50, m51, m52, m53, m54, m55,
            m56, m57, m58, m59, m60, m61, m62, m63;
top_module_8pt col_fft3 (
    .x0_real(k48),   .x0_imag(k49),
    .x1_real(k50),   .x1_imag(k51),
    .x2_real(k52),   .x2_imag(k53),
    .x3_real(k54),   .x3_imag(k55),
    .x4_real(k56),   .x4_imag(k57),
    .x5_real(k58),   .x5_imag(k59),
    .x6_real(k60),   .x6_imag(k61),
    .x7_real(k62),   .x7_imag(k63),
    .X0_real(m48),   .X0_imag(m49),
    .X1_real(m50),   .X1_imag(m51),
    .X2_real(m52),   .X2_imag(m53),
    .X3_real(m54),   .X3_imag(m55),
    .X4_real(m56),   .X4_imag(m57),
    .X5_real(m58),   .X5_imag(m59),
    .X6_real(m60),   .X6_imag(m61),
    .X7_real(m62),   .X7_imag(m63)
);

//---------------------------------------------------------------------
// Spectral Register Stage: Latch the column FFT outputs
//---------------------------------------------------------------------

            
SpectralRegister spec_reg (
    // Inputs to the spectral register
    .c0(m0),  .c1(m1),   .c2(m2),   .c3(m3),
    .c4(m4),  .c5(m5),   .c6(m6),   .c7(m7),
    .c8(m8),  .c9(m9),   .c10(m10), .c11(m11),
    .c12(m12),.c13(m13), .c14(m14), .c15(m15),
    .c16(m16),.c17(m17), .c18(m18), .c19(m19),
    .c20(m20),.c21(m21), .c22(m22), .c23(m23),
    .c24(m24),.c25(m25), .c26(m26), .c27(m27),
    .c28(m28),.c29(m29), .c30(m30), .c31(m31),
    .c32(m32),.c33(m33), .c34(m34), .c35(m35),
    .c36(m36),.c37(m37), .c38(m38), .c39(m39),
    .c40(m40),.c41(m41), .c42(m42), .c43(m43),
    .c44(m44),.c45(m45), .c46(m46), .c47(m47),
    .c48(m48),.c49(m49), .c50(m50), .c51(m51),
    .c52(m52),.c53(m53), .c54(m54), .c55(m55),
    .c56(m56),.c57(m57), .c58(m58), .c59(m59),
    .c60(m60),.c61(m61), .c62(m62), .c63(m63),
    
    // Directly connect spectral register outputs to module outputs
    .d0(y0),  .d1(y1),   .d2(y2),   .d3(y3),
    .d4(y4),  .d5(y5),   .d6(y6),   .d7(y7),
    .d8(y8),  .d9(y9),   .d10(y10), .d11(y11),
    .d12(y12),.d13(y13), .d14(y14), .d15(y15),
    .d16(y16),.d17(y17), .d18(y18), .d19(y19),
    .d20(y20),.d21(y21), .d22(y22), .d23(y23),
    .d24(y24),.d25(y25), .d26(y26), .d27(y27),
    .d28(y28),.d29(y29), .d30(y30), .d31(y31),
    .d32(y32),.d33(y33), .d34(y34), .d35(y35),
    .d36(y36),.d37(y37), .d38(y38), .d39(y39),
    .d40(y40),.d41(y41), .d42(y42), .d43(y43),
    .d44(y44),.d45(y45), .d46(y46), .d47(y47),
    .d48(y48),.d49(y49), .d50(y50), .d51(y51),
    .d52(y52),.d53(y53), .d54(y54), .d55(y55),
    .d56(y56),.d57(y57), .d58(y58), .d59(y59),
    .d60(y60),.d61(y61), .d62(y62), .d63(y63),
    .clk(clk),.rst(rst)
);


endmodule 
