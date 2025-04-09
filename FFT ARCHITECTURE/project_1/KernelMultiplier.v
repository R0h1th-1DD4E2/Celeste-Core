module KernelMultiplier(

  //Module Description:
/*
This module implements a complex multiplication operation between FFT inputs and kernel inputs
for a 64-point (8x8) 2D operation. The module:

- Takes 64 complex inputs (x0-x63) where each input has:
  * 32-bit real component 
  * 32-bit imaginary component
  * Total input width of 64 x 64 = 4096 bits

- Takes 64 complex kernel inputs (y0-y63) where each input has:
  * 32-bit real component
  * 32-bit imaginary component 
  * Total kernel input width of 64 x 64 = 4096 bits

- Produces 64 complex outputs (X0-X63) where each output has:
  * 32-bit real component
  * 32-bit imaginary component
  * Total output width of 64 x 64 = 4096 bits

- Architecture:
  * Divides the 64-point operation into 4 separate 16-point complex multiply blocks
  * Uses 4 instances of cmpx_mul submodule, each handling 16 points
  * First block: Points 0-15
  * Second block: Points 16-31  
  * Third block: Points 32-47
  * Fourth block: Points 48-63

The module is designed for performing element-wise complex multiplication between 
FFT data and a kernel function, typically used in frequency domain filtering or 
convolution operations.
*/

  // fft input
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
  input [31:0] x16_real, x16_imag,
  input [31:0] x17_real, x17_imag,
  input [31:0] x18_real, x18_imag,
  input [31:0] x19_real, x19_imag,
  input [31:0] x20_real, x20_imag,
  input [31:0] x21_real, x21_imag,
  input [31:0] x22_real, x22_imag,
  input [31:0] x23_real, x23_imag,
  input [31:0] x24_real, x24_imag,
  input [31:0] x25_real, x25_imag,
  input [31:0] x26_real, x26_imag,
  input [31:0] x27_real, x27_imag,
  input [31:0] x28_real, x28_imag,
  input [31:0] x29_real, x29_imag,
  input [31:0] x30_real, x30_imag,
  input [31:0] x31_real, x31_imag,
  input [31:0] x32_real, x32_imag,
  input [31:0] x33_real, x33_imag,
  input [31:0] x34_real, x34_imag,
  input [31:0] x35_real, x35_imag,
  input [31:0] x36_real, x36_imag,
  input [31:0] x37_real, x37_imag,
  input [31:0] x38_real, x38_imag,
  input [31:0] x39_real, x39_imag,
  input [31:0] x40_real, x40_imag,
  input [31:0] x41_real, x41_imag,
  input [31:0] x42_real, x42_imag,
  input [31:0] x43_real, x43_imag,
  input [31:0] x44_real, x44_imag,
  input [31:0] x45_real, x45_imag,
  input [31:0] x46_real, x46_imag,
  input [31:0] x47_real, x47_imag,
  input [31:0] x48_real, x48_imag,
  input [31:0] x49_real, x49_imag,
  input [31:0] x50_real, x50_imag,
  input [31:0] x51_real, x51_imag,
  input [31:0] x52_real, x52_imag,
  input [31:0] x53_real, x53_imag,
  input [31:0] x54_real, x54_imag,
  input [31:0] x55_real, x55_imag,
  input [31:0] x56_real, x56_imag,
  input [31:0] x57_real, x57_imag,
  input [31:0] x58_real, x58_imag,
  input [31:0] x59_real, x59_imag,
  input [31:0] x60_real, x60_imag,
  input [31:0] x61_real, x61_imag,
  input [31:0] x62_real, x62_imag,
  input [31:0] x63_real, x63_imag,

    // kernal input
  input [31:0] y0_real, y0_imag,
  input [31:0] y1_real, y1_imag,
  input [31:0] y2_real, y2_imag,
  input [31:0] y3_real, y3_imag,
  input [31:0] y4_real, y4_imag,
  input [31:0] y5_real, y5_imag,
  input [31:0] y6_real, y6_imag,
  input [31:0] y7_real, y7_imag,
  input [31:0] y8_real, y8_imag,
  input [31:0] y9_real, y9_imag,
  input [31:0] y10_real, y10_imag,
  input [31:0] y11_real, y11_imag,
  input [31:0] y12_real, y12_imag,
  input [31:0] y13_real, y13_imag,
  input [31:0] y14_real, y14_imag,
  input [31:0] y15_real, y15_imag,
  input [31:0] y16_real, y16_imag,
  input [31:0] y17_real, y17_imag,
  input [31:0] y18_real, y18_imag,
  input [31:0] y19_real, y19_imag,
  input [31:0] y20_real, y20_imag,
  input [31:0] y21_real, y21_imag,
  input [31:0] y22_real, y22_imag,
  input [31:0] y23_real, y23_imag,
  input [31:0] y24_real, y24_imag,
  input [31:0] y25_real, y25_imag,
  input [31:0] y26_real, y26_imag,
  input [31:0] y27_real, y27_imag,
  input [31:0] y28_real, y28_imag,
  input [31:0] y29_real, y29_imag,
  input [31:0] y30_real, y30_imag,
  input [31:0] y31_real, y31_imag,
  input [31:0] y32_real, y32_imag,
  input [31:0] y33_real, y33_imag,
  input [31:0] y34_real, y34_imag,
  input [31:0] y35_real, y35_imag,
  input [31:0] y36_real, y36_imag,
  input [31:0] y37_real, y37_imag,
  input [31:0] y38_real, y38_imag,
  input [31:0] y39_real, y39_imag,
  input [31:0] y40_real, y40_imag,
  input [31:0] y41_real, y41_imag,
  input [31:0] y42_real, y42_imag,
  input [31:0] y43_real, y43_imag,
  input [31:0] y44_real, y44_imag,
  input [31:0] y45_real, y45_imag,
  input [31:0] y46_real, y46_imag,
  input [31:0] y47_real, y47_imag,
  input [31:0] y48_real, y48_imag,
  input [31:0] y49_real, y49_imag,
  input [31:0] y50_real, y50_imag,
  input [31:0] y51_real, y51_imag,
  input [31:0] y52_real, y52_imag,
  input [31:0] y53_real, y53_imag,
  input [31:0] y54_real, y54_imag,
  input [31:0] y55_real, y55_imag,
  input [31:0] y56_real, y56_imag,
  input [31:0] y57_real, y57_imag,
  input [31:0] y58_real, y58_imag,
  input [31:0] y59_real, y59_imag,
  input [31:0] y60_real, y60_imag,
  input [31:0] y61_real, y61_imag,
  input [31:0] y62_real, y62_imag,
  input [31:0] y63_real, y63_imag,


    //output
  output [31:0] X0_real, X0_imag,
  output [31:0] X1_real, X1_imag,
  output [31:0] X2_real, X2_imag,
  output [31:0] X3_real, X3_imag,
  output [31:0] X4_real, X4_imag,
  output [31:0] X5_real, X5_imag,
  output [31:0] X6_real, X6_imag,
  output [31:0] X7_real, X7_imag,
  output [31:0] X8_real, X8_imag,
  output [31:0] X9_real, X9_imag,
  output [31:0] X10_real, X10_imag,
  output [31:0] X11_real, X11_imag,
  output [31:0] X12_real, X12_imag,
  output [31:0] X13_real, X13_imag,
  output [31:0] X14_real, X14_imag,
  output [31:0] X15_real, X15_imag,
  output [31:0] X16_real, X16_imag,
  output [31:0] X17_real, X17_imag,
  output [31:0] X18_real, X18_imag,
  output [31:0] X19_real, X19_imag,
  output [31:0] X20_real, X20_imag,
  output [31:0] X21_real, X21_imag,
  output [31:0] X22_real, X22_imag,
  output [31:0] X23_real, X23_imag,
  output [31:0] X24_real, X24_imag,
  output [31:0] X25_real, X25_imag,
  output [31:0] X26_real, X26_imag,
  output [31:0] X27_real, X27_imag,
  output [31:0] X28_real, X28_imag,
  output [31:0] X29_real, X29_imag,
  output [31:0] X30_real, X30_imag,
  output [31:0] X31_real, X31_imag,
  output [31:0] X32_real, X32_imag,
  output [31:0] X33_real, X33_imag,
  output [31:0] X34_real, X34_imag,
  output [31:0] X35_real, X35_imag,
  output [31:0] X36_real, X36_imag,
  output [31:0] X37_real, X37_imag,
  output [31:0] X38_real, X38_imag,
  output [31:0] X39_real, X39_imag,
  output [31:0] X40_real, X40_imag,
  output [31:0] X41_real, X41_imag,
  output [31:0] X42_real, X42_imag,
  output [31:0] X43_real, X43_imag,
  output [31:0] X44_real, X44_imag,
  output [31:0] X45_real, X45_imag,
  output [31:0] X46_real, X46_imag,
  output [31:0] X47_real, X47_imag,
  output [31:0] X48_real, X48_imag,
  output [31:0] X49_real, X49_imag,
  output [31:0] X50_real, X50_imag,
  output [31:0] X51_real, X51_imag,
  output [31:0] X52_real, X52_imag,
  output [31:0] X53_real, X53_imag,
  output [31:0] X54_real, X54_imag,
  output [31:0] X55_real, X55_imag,
  output [31:0] X56_real, X56_imag,
  output [31:0] X57_real, X57_imag,
  output [31:0] X58_real, X58_imag,
  output [31:0] X59_real, X59_imag,
  output [31:0] X60_real, X60_imag,
  output [31:0] X61_real, X61_imag,
  output [31:0] X62_real, X62_imag,
  output [31:0] X63_real, X63_imag);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUASSIAN KERNAL IEEE 754
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// localparam signed [31:0] 
//     ker_r0  = 32'h3951b717, ker_r1  = 32'h399d4952, ker_r2  = 32'h3a03126f, ker_r3  = 32'h3b2a64c3, ker_r4  = 32'hbc7765fe, ker_r5  = 32'h3b2a64c3, ker_r6  = 32'h3a03126f, ker_r7  = 32'h399d4952,
//     ker_r8  = 32'h399d4952, ker_r9  = 32'h399d4952, ker_r10 = 32'h3a1d4952, ker_r11 = 32'h3b4b295f, ker_r12 = 32'hbc91d14e, ker_r13 = 32'h3b4b295f, ker_r14 = 32'h3a1d4952, ker_r15 = 32'h399d4952,
//     ker_r16 = 32'h3a03126f, ker_r17 = 32'h3a1d4952, ker_r18 = 32'h3a83126f, ker_r19 = 32'h3bb0f27c, ker_r20 = 32'hbcfec56d, ker_r21 = 32'h3bb0f27c, ker_r22 = 32'h3a83126f, ker_r23 = 32'h3a1d4952,
//     ker_r24 = 32'h3b2a64c3, ker_r25 = 32'h3b4b295f, ker_r26 = 32'h3bb0f27c, ker_r27 = 32'h3cf9db23, ker_r28 = 32'hbe32e48f, ker_r29 = 32'h3cf9db23, ker_r30 = 32'h3bb0f27c, ker_r31 = 32'h3b4b295f,
//     ker_r32 = 32'hbc7765fe, ker_r33 = 32'hbc91d14e, ker_r34 = 32'hbcfec56d, ker_r35 = 32'hbe32e48f, ker_r36 = 32'h3f800000, ker_r37 = 32'hbe32e48f, ker_r38 = 32'hbcfec56d, ker_r39 = 32'hbc91d14e,
//     ker_r40 = 32'h3b2a64c3, ker_r41 = 32'h3b4b295f, ker_r42 = 32'h3bb0f27c, ker_r43 = 32'h3cf9db23, ker_r44 = 32'hbe32e48f, ker_r45 = 32'h3cf9db23, ker_r46 = 32'h3bb0f27c, ker_r47 = 32'h3b4b295f,
//     ker_r48 = 32'h3a03126f, ker_r49 = 32'h3a1d4952, ker_r50 = 32'h3a83126f, ker_r51 = 32'h3bb0f27c, ker_r52 = 32'hbcfec56d, ker_r53 = 32'h3bb0f27c, ker_r54 = 32'h3a83126f, ker_r55 = 32'h3a1d4952,
//     ker_r56 = 32'h399d4952, ker_r57 = 32'h399d4952, ker_r58 = 32'h3a1d4952, ker_r59 = 32'h3b4b295f, ker_r60 = 32'hbc91d14e, ker_r61 = 32'h3b4b295f, ker_r62 = 32'h3a1d4952, ker_r63 = 32'h399d4952;

//     localparam signed [31:0] ker_i0 = 32'h0, ker_i1 = 32'h0, ker_i2 = 32'h0, ker_i3 = 32'h0, ker_i4 = 32'h0, ker_i5 = 32'h0, ker_i6 = 32'h0, ker_i7 = 32'h0,
//                         ker_i8 = 32'h0, ker_i9 = 32'h0, ker_i10 = 32'h0, ker_i11 = 32'h0, ker_i12 = 32'h0, ker_i13 = 32'h0, ker_i14 = 32'h0, ker_i15 = 32'h0,
//                         ker_i16 = 32'h0, ker_i17 = 32'h0, ker_i18 = 32'h0, ker_i19 = 32'h0, ker_i20 = 32'h0, ker_i21 = 32'h0, ker_i22 = 32'h0, ker_i23 = 32'h0,
//                         ker_i24 = 32'h0, ker_i25 = 32'h0, ker_i26 = 32'h0, ker_i27 = 32'h0, ker_i28 = 32'h0, ker_i29 = 32'h0, ker_i30 = 32'h0, ker_i31 = 32'h0,
//                         ker_i32 = 32'h0, ker_i33 = 32'h0, ker_i34 = 32'h0, ker_i35 = 32'h0, ker_i36 = 32'h0, ker_i37 = 32'h0, ker_i38 = 32'h0, ker_i39 = 32'h0,
//                         ker_i40 = 32'h0, ker_i41 = 32'h0, ker_i42 = 32'h0, ker_i43 = 32'h0, ker_i44 = 32'h0, ker_i45 = 32'h0, ker_i46 = 32'h0, ker_i47 = 32'h0,
//                         ker_i48 = 32'h0, ker_i49 = 32'h0, ker_i50 = 32'h0, ker_i51 = 32'h0, ker_i52 = 32'h0, ker_i53 = 32'h0, ker_i54 = 32'h0, ker_i55 = 32'h0,
//                         ker_i56 = 32'h0, ker_i57 = 32'h0, ker_i58 = 32'h0, ker_i59 = 32'h0, ker_i60 = 32'h0, ker_i61 = 32'h0, ker_i62 = 32'h0, ker_i63 = 32'h0;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//for 1st and 2nd row
cmpx_mul u_cmpx_mul1 (
    // Inputs for x0 to x15
    .x0_real(x0_real),  .x0_imag(x0_imag),
    .x1_real(x1_real),  .x1_imag(x1_imag),
    .x2_real(x2_real),  .x2_imag(x2_imag),
    .x3_real(x3_real),  .x3_imag(x3_imag),
    .x4_real(x4_real),  .x4_imag(x4_imag),
    .x5_real(x5_real),  .x5_imag(x5_imag),
    .x6_real(x6_real),  .x6_imag(x6_imag),
    .x7_real(x7_real),  .x7_imag(x7_imag),
    .x8_real(x8_real),  .x8_imag(x8_imag),
    .x9_real(x9_real),  .x9_imag(x9_imag),
    .x10_real(x10_real), .x10_imag(x10_imag),
    .x11_real(x11_real), .x11_imag(x11_imag),
    .x12_real(x12_real), .x12_imag(x12_imag),
    .x13_real(x13_real), .x13_imag(x13_imag),
    .x14_real(x14_real), .x14_imag(x14_imag),
    .x15_real(x15_real), .x15_imag(x15_imag),

    // Inputs for y0 to y15
    .y0_real(y0_real),  .y0_imag(y0_imag),
    .y1_real(y1_real),  .y1_imag(y1_imag),
    .y2_real(y2_real),  .y2_imag(y2_imag),
    .y3_real(y3_real),  .y3_imag(y3_imag),
    .y4_real(y4_real),  .y4_imag(y4_imag),
    .y5_real(y5_real),  .y5_imag(y5_imag),
    .y6_real(y6_real),  .y6_imag(y6_imag),
    .y7_real(y7_real),  .y7_imag(y7_imag),
    .y8_real(y8_real),  .y8_imag(y8_imag),
    .y9_real(y9_real),  .y9_imag(y9_imag),
    .y10_real(y10_real), .y10_imag(y10_imag),
    .y11_real(y11_real), .y11_imag(y11_imag),
    .y12_real(y12_real), .y12_imag(y12_imag),
    .y13_real(y13_real), .y13_imag(y13_imag),
    .y14_real(y14_real), .y14_imag(y14_imag),
    .y15_real(y15_real), .y15_imag(y15_imag),

    // Outputs for X0 to X15
    .X0_real(X0_real), .X0_imag(X0_imag),
    .X1_real(X1_real), .X1_imag(X1_imag),
    .X2_real(X2_real), .X2_imag(X2_imag),
    .X3_real(X3_real), .X3_imag(X3_imag),
    .X4_real(X4_real), .X4_imag(X4_imag),
    .X5_real(X5_real), .X5_imag(X5_imag),
    .X6_real(X6_real), .X6_imag(X6_imag),
    .X7_real(X7_real), .X7_imag(X7_imag),
    .X8_real(X8_real), .X8_imag(X8_imag),
    .X9_real(X9_real), .X9_imag(X9_imag),
    .X10_real(X10_real), .X10_imag(X10_imag),
    .X11_real(X11_real), .X11_imag(X11_imag),
    .X12_real(X12_real), .X12_imag(X12_imag),
    .X13_real(X13_real), .X13_imag(X13_imag),
    .X14_real(X14_real), .X14_imag(X14_imag),
    .X15_real(X15_real), .X15_imag(X15_imag)
);

// for 3 and 4th row

cmpx_mul u_cmpx_mul2 (
    // Inputs for x0 to x15
    .x0_real(x16_real),  .x0_imag(x16_imag),
    .x1_real(x17_real),  .x1_imag(x17_imag),
    .x2_real(x18_real),  .x2_imag(x18_imag),
    .x3_real(x19_real),  .x3_imag(x19_imag),
    .x4_real(x20_real),  .x4_imag(x20_imag),
    .x5_real(x21_real),  .x5_imag(x21_imag),
    .x6_real(x22_real),  .x6_imag(x22_imag),
    .x7_real(x23_real),  .x7_imag(x23_imag),
    .x8_real(x24_real),  .x8_imag(x24_imag),
    .x9_real(x25_real),  .x9_imag(x25_imag),
    .x10_real(x26_real), .x10_imag(x26_imag),
    .x11_real(x27_real), .x11_imag(x27_imag),
    .x12_real(x28_real), .x12_imag(x28_imag),
    .x13_real(x29_real), .x13_imag(x29_imag),
    .x14_real(x30_real), .x14_imag(x30_imag),
    .x15_real(x31_real), .x15_imag(x31_imag),

    // Inputs for y0 to y15
    .y0_real(y16_real),  .y0_imag(y16_imag),
    .y1_real(y17_real),  .y1_imag(y17_imag),
    .y2_real(y18_real),  .y2_imag(y18_imag),
    .y3_real(y19_real),  .y3_imag(y19_imag),
    .y4_real(y20_real),  .y4_imag(y20_imag),
    .y5_real(y21_real),  .y5_imag(y21_imag),
    .y6_real(y22_real),  .y6_imag(y22_imag),
    .y7_real(y23_real),  .y7_imag(y23_imag),
    .y8_real(y24_real),  .y8_imag(y24_imag),
    .y9_real(y25_real),  .y9_imag(y25_imag),
    .y10_real(y26_real), .y10_imag(y26_imag),
    .y11_real(y27_real), .y11_imag(y27_imag),
    .y12_real(y28_real), .y12_imag(y28_imag),
    .y13_real(y29_real), .y13_imag(y29_imag),
    .y14_real(y30_real), .y14_imag(y30_imag),
    .y15_real(y31_real), .y15_imag(y31_imag),

    // Outputs for X0 to X15
    .X0_real(X16_real), .X0_imag(X16_imag),
    .X1_real(X17_real), .X1_imag(X17_imag),
    .X2_real(X18_real), .X2_imag(X18_imag),
    .X3_real(X19_real), .X3_imag(X19_imag),
    .X4_real(X20_real), .X4_imag(X20_imag),
    .X5_real(X21_real), .X5_imag(X21_imag),
    .X6_real(X22_real), .X6_imag(X22_imag),
    .X7_real(X23_real), .X7_imag(X23_imag),
    .X8_real(X24_real), .X8_imag(X24_imag),
    .X9_real(X25_real), .X9_imag(X25_imag),
    .X10_real(X26_real), .X10_imag(X26_imag),
    .X11_real(X27_real), .X11_imag(X27_imag),
    .X12_real(X28_real), .X12_imag(X28_imag),
    .X13_real(X29_real), .X13_imag(X29_imag),
    .X14_real(X30_real), .X14_imag(X30_imag),
    .X15_real(X31_real), .X15_imag(X31_imag)
);

// for 5 and 6th row

cmpx_mul u_cmpx_mul3 (
    // Inputs for x32 to x47
    .x0_real(x32_real),  .x0_imag(x32_imag),
    .x1_real(x33_real),  .x1_imag(x33_imag),
    .x2_real(x34_real),  .x2_imag(x34_imag),
    .x3_real(x35_real),  .x3_imag(x35_imag),
    .x4_real(x36_real),  .x4_imag(x36_imag),
    .x5_real(x37_real),  .x5_imag(x37_imag),
    .x6_real(x38_real),  .x6_imag(x38_imag),
    .x7_real(x39_real),  .x7_imag(x39_imag),
    .x8_real(x40_real),  .x8_imag(x40_imag),
    .x9_real(x41_real),  .x9_imag(x41_imag),
    .x10_real(x42_real), .x10_imag(x42_imag),
    .x11_real(x43_real), .x11_imag(x43_imag),
    .x12_real(x44_real), .x12_imag(x44_imag),
    .x13_real(x45_real), .x13_imag(x45_imag),
    .x14_real(x46_real), .x14_imag(x46_imag),
    .x15_real(x47_real), .x15_imag(x47_imag),

    // Inputs for y32_real to y47_real
    .y0_real(y32_real),  .y0_imag(y32_imag),
    .y1_real(y33_real),  .y1_imag(y33_imag),
    .y2_real(y34_real),  .y2_imag(y34_imag),
    .y3_real(y35_real),  .y3_imag(y35_imag),
    .y4_real(y36_real),  .y4_imag(y36_imag),
    .y5_real(y37_real),  .y5_imag(y37_imag),
    .y6_real(y38_real),  .y6_imag(y38_imag),
    .y7_real(y39_real),  .y7_imag(y39_imag),
    .y8_real(y40_real),  .y8_imag(y40_imag),
    .y9_real(y41_real),  .y9_imag(y41_imag),
    .y10_real(y42_real), .y10_imag(y42_imag),
    .y11_real(y43_real), .y11_imag(y43_imag),
    .y12_real(y44_real), .y12_imag(y44_imag),
    .y13_real(y45_real), .y13_imag(y45_imag),
    .y14_real(y46_real), .y14_imag(y46_imag),
    .y15_real(y47_real), .y15_imag(y47_imag),


    // Outputs for X32 to X47
    .X0_real(X32_real), .X0_imag(X32_imag),
    .X1_real(X33_real), .X1_imag(X33_imag),
    .X2_real(X34_real), .X2_imag(X34_imag),
    .X3_real(X35_real), .X3_imag(X35_imag),
    .X4_real(X36_real), .X4_imag(X36_imag),
    .X5_real(X37_real), .X5_imag(X37_imag),
    .X6_real(X38_real), .X6_imag(X38_imag),
    .X7_real(X39_real), .X7_imag(X39_imag),
    .X8_real(X40_real), .X8_imag(X40_imag),
    .X9_real(X41_real), .X9_imag(X41_imag),
    .X10_real(X42_real), .X10_imag(X42_imag),
    .X11_real(X43_real), .X11_imag(X43_imag),
    .X12_real(X44_real), .X12_imag(X44_imag),
    .X13_real(X45_real), .X13_imag(X45_imag),
    .X14_real(X46_real), .X14_imag(X46_imag),
    .X15_real(X47_real), .X15_imag(X47_imag)
);

// for 7 and 8th row

cmpx_mul u_cmpx_mul4 (
    // Inputs for x48 to x63
    .x0_real(x48_real),  .x0_imag(x48_imag),
    .x1_real(x49_real),  .x1_imag(x49_imag),
    .x2_real(x50_real),  .x2_imag(x50_imag),
    .x3_real(x51_real),  .x3_imag(x51_imag),
    .x4_real(x52_real),  .x4_imag(x52_imag),
    .x5_real(x53_real),  .x5_imag(x53_imag),
    .x6_real(x54_real),  .x6_imag(x54_imag),
    .x7_real(x55_real),  .x7_imag(x55_imag),
    .x8_real(x56_real),  .x8_imag(x56_imag),
    .x9_real(x57_real),  .x9_imag(x57_imag),
    .x10_real(x58_real), .x10_imag(x58_imag),
    .x11_real(x59_real), .x11_imag(x59_imag),
    .x12_real(x60_real), .x12_imag(x60_imag),
    .x13_real(x61_real), .x13_imag(x61_imag),
    .x14_real(x62_real), .x14_imag(x62_imag),
    .x15_real(x63_real), .x15_imag(x63_imag),

    // Inputs for y48_real to y63_real
    .y0_real(y48_real),  .y0_imag(y48_imag),
    .y1_real(y49_real),  .y1_imag(y49_imag),
    .y2_real(y50_real),  .y2_imag(y50_imag),
    .y3_real(y51_real),  .y3_imag(y51_imag),
    .y4_real(y52_real),  .y4_imag(y52_imag),
    .y5_real(y53_real),  .y5_imag(y53_imag),
    .y6_real(y54_real),  .y6_imag(y54_imag),
    .y7_real(y55_real),  .y7_imag(y55_imag),
    .y8_real(y56_real),  .y8_imag(y56_imag),
    .y9_real(y57_real),  .y9_imag(y57_imag),
    .y10_real(y58_real), .y10_imag(y58_imag),
    .y11_real(y59_real), .y11_imag(y59_imag),
    .y12_real(y60_real), .y12_imag(y60_imag),
    .y13_real(y61_real), .y13_imag(y61_imag),
    .y14_real(y62_real), .y14_imag(y62_imag),
    .y15_real(y63_real), .y15_imag(y63_imag),

    // Outputs for X48 to X63
    .X0_real(X48_real), .X0_imag(X48_imag),
    .X1_real(X49_real), .X1_imag(X49_imag),
    .X2_real(X50_real), .X2_imag(X50_imag),
    .X3_real(X51_real), .X3_imag(X51_imag),
    .X4_real(X52_real), .X4_imag(X52_imag),
    .X5_real(X53_real), .X5_imag(X53_imag),
    .X6_real(X54_real), .X6_imag(X54_imag),
    .X7_real(X55_real), .X7_imag(X55_imag),
    .X8_real(X56_real), .X8_imag(X56_imag),
    .X9_real(X57_real), .X9_imag(X57_imag),
    .X10_real(X58_real), .X10_imag(X58_imag),
    .X11_real(X59_real), .X11_imag(X59_imag),
    .X12_real(X60_real), .X12_imag(X60_imag),
    .X13_real(X61_real), .X13_imag(X61_imag),
    .X14_real(X62_real), .X14_imag(X62_imag),
    .X15_real(X63_real), .X15_imag(X63_imag)
);

endmodule
