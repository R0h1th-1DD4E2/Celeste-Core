`timescale 1ns / 1ps
module ker_mul_tb;
  // Declare testbench signals
  reg [31:0] x_real [0:63], x_imag [0:63];
  reg [31:0] y_real [0:63], y_imag [0:63];
  wire [31:0] X_real [0:63], X_imag [0:63];
  integer i;
  
  // Instantiate the DUT (Design Under Test)
  ker_mul DUT (
    .x0_real(x_real[0]), .x0_imag(x_imag[0]), 
    .x1_real(x_real[1]), .x1_imag(x_imag[1]),
    .x2_real(x_real[2]), .x2_imag(x_imag[2]),
    .x3_real(x_real[3]), .x3_imag(x_imag[3]),
    .x4_real(x_real[4]), .x4_imag(x_imag[4]),
    .x5_real(x_real[5]), .x5_imag(x_imag[5]),
    .x6_real(x_real[6]), .x6_imag(x_imag[6]),
    .x7_real(x_real[7]), .x7_imag(x_imag[7]),
    .x8_real(x_real[8]), .x8_imag(x_imag[8]),
    .x9_real(x_real[9]), .x9_imag(x_imag[9]),
    .x10_real(x_real[10]), .x10_imag(x_imag[10]),
    .x11_real(x_real[11]), .x11_imag(x_imag[11]),
    .x12_real(x_real[12]), .x12_imag(x_imag[12]),
    .x13_real(x_real[13]), .x13_imag(x_imag[13]),
    .x14_real(x_real[14]), .x14_imag(x_imag[14]),
    .x15_real(x_real[15]), .x15_imag(x_imag[15]),
    .x16_real(x_real[16]), .x16_imag(x_imag[16]),
    .x17_real(x_real[17]), .x17_imag(x_imag[17]),
    .x18_real(x_real[18]), .x18_imag(x_imag[18]),
    .x19_real(x_real[19]), .x19_imag(x_imag[19]),
    .x20_real(x_real[20]), .x20_imag(x_imag[20]),
    .x21_real(x_real[21]), .x21_imag(x_imag[21]),
    .x22_real(x_real[22]), .x22_imag(x_imag[22]),
    .x23_real(x_real[23]), .x23_imag(x_imag[23]),
    .x24_real(x_real[24]), .x24_imag(x_imag[24]),
    .x25_real(x_real[25]), .x25_imag(x_imag[25]),
    .x26_real(x_real[26]), .x26_imag(x_imag[26]),
    .x27_real(x_real[27]), .x27_imag(x_imag[27]),
    .x28_real(x_real[28]), .x28_imag(x_imag[28]),
    .x29_real(x_real[29]), .x29_imag(x_imag[29]),
    .x30_real(x_real[30]), .x30_imag(x_imag[30]),
    .x31_real(x_real[31]), .x31_imag(x_imag[31]),
    .x32_real(x_real[32]), .x32_imag(x_imag[32]),
    .x33_real(x_real[33]), .x33_imag(x_imag[33]),
    .x34_real(x_real[34]), .x34_imag(x_imag[34]),
    .x35_real(x_real[35]), .x35_imag(x_imag[35]),
    .x36_real(x_real[36]), .x36_imag(x_imag[36]),
    .x37_real(x_real[37]), .x37_imag(x_imag[37]),
    .x38_real(x_real[38]), .x38_imag(x_imag[38]),
    .x39_real(x_real[39]), .x39_imag(x_imag[39]),
    .x40_real(x_real[40]), .x40_imag(x_imag[40]),
    .x41_real(x_real[41]), .x41_imag(x_imag[41]),
    .x42_real(x_real[42]), .x42_imag(x_imag[42]),
    .x43_real(x_real[43]), .x43_imag(x_imag[43]),
    .x44_real(x_real[44]), .x44_imag(x_imag[44]),
    .x45_real(x_real[45]), .x45_imag(x_imag[45]),
    .x46_real(x_real[46]), .x46_imag(x_imag[46]),
    .x47_real(x_real[47]), .x47_imag(x_imag[47]),
    .x48_real(x_real[48]), .x48_imag(x_imag[48]),
    .x49_real(x_real[49]), .x49_imag(x_imag[49]),
    .x50_real(x_real[50]), .x50_imag(x_imag[50]),
    .x51_real(x_real[51]), .x51_imag(x_imag[51]),
    .x52_real(x_real[52]), .x52_imag(x_imag[52]),
    .x53_real(x_real[53]), .x53_imag(x_imag[53]),
    .x54_real(x_real[54]), .x54_imag(x_imag[54]),
    .x55_real(x_real[55]), .x55_imag(x_imag[55]),
    .x56_real(x_real[56]), .x56_imag(x_imag[56]),
    .x57_real(x_real[57]), .x57_imag(x_imag[57]),
    .x58_real(x_real[58]), .x58_imag(x_imag[58]),
    .x59_real(x_real[59]), .x59_imag(x_imag[59]),
    .x60_real(x_real[60]), .x60_imag(x_imag[60]),
    .x61_real(x_real[61]), .x61_imag(x_imag[61]),
    .x62_real(x_real[62]), .x62_imag(x_imag[62]),
    .x63_real(x_real[63]), .x63_imag(x_imag[63]),

    // kernal input
    .y0_real(y_real[0]), .y0_imag(y_imag[0]), 
    .y1_real(y_real[1]), .y1_imag(y_imag[1]),
    .y2_real(y_real[2]), .y2_imag(y_imag[2]),
    .y3_real(y_real[3]), .y3_imag(y_imag[3]),
    .y4_real(y_real[4]), .y4_imag(y_imag[4]),
    .y5_real(y_real[5]), .y5_imag(y_imag[5]),
    .y6_real(y_real[6]), .y6_imag(y_imag[6]),
    .y7_real(y_real[7]), .y7_imag(y_imag[7]),
    .y8_real(y_real[8]), .y8_imag(y_imag[8]),
    .y9_real(y_real[9]), .y9_imag(y_imag[9]),
    .y10_real(y_real[10]), .y10_imag(y_imag[10]),
    .y11_real(y_real[11]), .y11_imag(y_imag[11]),
    .y12_real(y_real[12]), .y12_imag(y_imag[12]),
    .y13_real(y_real[13]), .y13_imag(y_imag[13]),
    .y14_real(y_real[14]), .y14_imag(y_imag[14]),
    .y15_real(y_real[15]), .y15_imag(y_imag[15]),
    .y16_real(y_real[16]), .y16_imag(y_imag[16]),
    .y17_real(y_real[17]), .y17_imag(y_imag[17]),
    .y18_real(y_real[18]), .y18_imag(y_imag[18]),
    .y19_real(y_real[19]), .y19_imag(y_imag[19]),
    .y20_real(y_real[20]), .y20_imag(y_imag[20]),
    .y21_real(y_real[21]), .y21_imag(y_imag[21]),
    .y22_real(y_real[22]), .y22_imag(y_imag[22]),
    .y23_real(y_real[23]), .y23_imag(y_imag[23]),
    .y24_real(y_real[24]), .y24_imag(y_imag[24]),
    .y25_real(y_real[25]), .y25_imag(y_imag[25]),
    .y26_real(y_real[26]), .y26_imag(y_imag[26]),
    .y27_real(y_real[27]), .y27_imag(y_imag[27]),
    .y28_real(y_real[28]), .y28_imag(y_imag[28]),
    .y29_real(y_real[29]), .y29_imag(y_imag[29]),
    .y30_real(y_real[30]), .y30_imag(y_imag[30]),
    .y31_real(y_real[31]), .y31_imag(y_imag[31]),
    .y32_real(y_real[32]), .y32_imag(y_imag[32]),
    .y33_real(y_real[33]), .y33_imag(y_imag[33]),
    .y34_real(y_real[34]), .y34_imag(y_imag[34]),
    .y35_real(y_real[35]), .y35_imag(y_imag[35]),
    .y36_real(y_real[36]), .y36_imag(y_imag[36]),
    .y37_real(y_real[37]), .y37_imag(y_imag[37]),
    .y38_real(y_real[38]), .y38_imag(y_imag[38]),
    .y39_real(y_real[39]), .y39_imag(y_imag[39]),
    .y40_real(y_real[40]), .y40_imag(y_imag[40]),
    .y41_real(y_real[41]), .y41_imag(y_imag[41]),
    .y42_real(y_real[42]), .y42_imag(y_imag[42]),
    .y43_real(y_real[43]), .y43_imag(y_imag[43]),
    .y44_real(y_real[44]), .y44_imag(y_imag[44]),
    .y45_real(y_real[45]), .y45_imag(y_imag[45]),
    .y46_real(y_real[46]), .y46_imag(y_imag[46]),
    .y47_real(y_real[47]), .y47_imag(y_imag[47]),
    .y48_real(y_real[48]), .y48_imag(y_imag[48]),
    .y49_real(y_real[49]), .y49_imag(y_imag[49]),
    .y50_real(y_real[50]), .y50_imag(y_imag[50]),
    .y51_real(y_real[51]), .y51_imag(y_imag[51]),
    .y52_real(y_real[52]), .y52_imag(y_imag[52]),
    .y53_real(y_real[53]), .y53_imag(y_imag[53]),
    .y54_real(y_real[54]), .y54_imag(y_imag[54]),
    .y55_real(y_real[55]), .y55_imag(y_imag[55]),
    .y56_real(y_real[56]), .y56_imag(y_imag[56]),
    .y57_real(y_real[57]), .y57_imag(y_imag[57]),
    .y58_real(y_real[58]), .y58_imag(y_imag[58]),
    .y59_real(y_real[59]), .y59_imag(y_imag[59]),
    .y60_real(y_real[60]), .y60_imag(y_imag[60]),
    .y61_real(y_real[61]), .y61_imag(y_imag[61]),
    .y62_real(y_real[62]), .y62_imag(y_imag[62]),
    .y63_real(y_real[63]), .y63_imag(y_imag[63]),
    
    // Outputs
    .X0_real(X_real[0]), .X0_imag(X_imag[0]),
    .X1_real(X_real[1]), .X1_imag(X_imag[1]),
    .X2_real(X_real[2]), .X2_imag(X_imag[2]),
    .X3_real(X_real[3]), .X3_imag(X_imag[3]),
    .X4_real(X_real[4]), .X4_imag(X_imag[4]),
    .X5_real(X_real[5]), .X5_imag(X_imag[5]),
    .X6_real(X_real[6]), .X6_imag(X_imag[6]),
    .X7_real(X_real[7]), .X7_imag(X_imag[7]),
    .X8_real(X_real[8]), .X8_imag(X_imag[8]),
    .X9_real(X_real[9]), .X9_imag(X_imag[9]),
    .X10_real(X_real[10]), .X10_imag(X_imag[10]),
    .X11_real(X_real[11]), .X11_imag(X_imag[11]),
    .X12_real(X_real[12]), .X12_imag(X_imag[12]),
    .X13_real(X_real[13]), .X13_imag(X_imag[13]),
    .X14_real(X_real[14]), .X14_imag(X_imag[14]),
    .X15_real(X_real[15]), .X15_imag(X_imag[15]),
    .X16_real(X_real[16]), .X16_imag(X_imag[16]),
    .X17_real(X_real[17]), .X17_imag(X_imag[17]),
    .X18_real(X_real[18]), .X18_imag(X_imag[18]),
    .X19_real(X_real[19]), .X19_imag(X_imag[19]),
    .X20_real(X_real[20]), .X20_imag(X_imag[20]),
    .X21_real(X_real[21]), .X21_imag(X_imag[21]),
    .X22_real(X_real[22]), .X22_imag(X_imag[22]),
    .X23_real(X_real[23]), .X23_imag(X_imag[23]),
    .X24_real(X_real[24]), .X24_imag(X_imag[24]),
    .X25_real(X_real[25]), .X25_imag(X_imag[25]),
    .X26_real(X_real[26]), .X26_imag(X_imag[26]),
    .X27_real(X_real[27]), .X27_imag(X_imag[27]),
    .X28_real(X_real[28]), .X28_imag(X_imag[28]),
    .X29_real(X_real[29]), .X29_imag(X_imag[29]),
    .X30_real(X_real[30]), .X30_imag(X_imag[30]),
    .X31_real(X_real[31]), .X31_imag(X_imag[31]),
    .X32_real(X_real[32]), .X32_imag(X_imag[32]),
    .X33_real(X_real[33]), .X33_imag(X_imag[33]),
    .X34_real(X_real[34]), .X34_imag(X_imag[34]),
    .X35_real(X_real[35]), .X35_imag(X_imag[35]),
    .X36_real(X_real[36]), .X36_imag(X_imag[36]),
    .X37_real(X_real[37]), .X37_imag(X_imag[37]),
    .X38_real(X_real[38]), .X38_imag(X_imag[38]),
    .X39_real(X_real[39]), .X39_imag(X_imag[39]),
    .X40_real(X_real[40]), .X40_imag(X_imag[40]),
    .X41_real(X_real[41]), .X41_imag(X_imag[41]),
    .X42_real(X_real[42]), .X42_imag(X_imag[42]),
    .X43_real(X_real[43]), .X43_imag(X_imag[43]),
    .X44_real(X_real[44]), .X44_imag(X_imag[44]),
    .X45_real(X_real[45]), .X45_imag(X_imag[45]),
    .X46_real(X_real[46]), .X46_imag(X_imag[46]),
    .X47_real(X_real[47]), .X47_imag(X_imag[47]),
    .X48_real(X_real[48]), .X48_imag(X_imag[48]),
    .X49_real(X_real[49]), .X49_imag(X_imag[49]),
    .X50_real(X_real[50]), .X50_imag(X_imag[50]),
    .X51_real(X_real[51]), .X51_imag(X_imag[51]),
    .X52_real(X_real[52]), .X52_imag(X_imag[52]),
    .X53_real(X_real[53]), .X53_imag(X_imag[53]),
    .X54_real(X_real[54]), .X54_imag(X_imag[54]),
    .X55_real(X_real[55]), .X55_imag(X_imag[55]),
    .X56_real(X_real[56]), .X56_imag(X_imag[56]),
    .X57_real(X_real[57]), .X57_imag(X_imag[57]),
    .X58_real(X_real[58]), .X58_imag(X_imag[58]),
    .X59_real(X_real[59]), .X59_imag(X_imag[59]),
    .X60_real(X_real[60]), .X60_imag(X_imag[60]),
    .X61_real(X_real[61]), .X61_imag(X_imag[61]),
    .X62_real(X_real[62]), .X62_imag(X_imag[62]),
    .X63_real(X_real[63]), .X63_imag(X_imag[63])
  );

  // Test procedure
  initial begin
    // Initialize all inputs
    for (i = 0; i < 64; i = i + 1) begin
      x_real[i] = 0;
      x_imag[i] = 0;
      y_real[i] = 0;
      y_imag[i] = 0;
    end
    
    // Wait 100ns for global reset
    #100;
    
    // Test Case 1: Linear values for inputs
    for (i = 0; i < 64; i = i + 1) begin
      x_real[i] = 32'h3f800000;             // 1, 2, 3, ..., 64
      x_imag[i] = 32'h0;       // 2, 4, 6, ..., 128
//      y_real[i] = 32'h3f800000;            // 64, 63, 62, ..., 1
      y_imag[i] = 32'h0;      // 128, 126, 124, ..., 2
    end
    y_real[0]  = 32'h3951b717; y_real[1]  = 32'h399d4952; y_real[2]  = 32'h3a03126f; y_real[3]  = 32'h3b2a64c3; 
y_real[4]  = 32'hbc7765fe; y_real[5]  = 32'h3b2a64c3; y_real[6]  = 32'h3a03126f; y_real[7]  = 32'h399d4952; 

y_real[8]  = 32'h399d4952; y_real[9]  = 32'h399d4952; y_real[10] = 32'h3a1d4952; y_real[11] = 32'h3b4b295f; 
y_real[12] = 32'hbc91d14e; y_real[13] = 32'h3b4b295f; y_real[14] = 32'h3a1d4952; y_real[15] = 32'h399d4952; 

y_real[16] = 32'h3a03126f; y_real[17] = 32'h3a1d4952; y_real[18] = 32'h3a83126f; y_real[19] = 32'h3bb0f27c; 
y_real[20] = 32'hbcfec56d; y_real[21] = 32'h3bb0f27c; y_real[22] = 32'h3a83126f; y_real[23] = 32'h3a1d4952; 

y_real[24] = 32'h3b2a64c3; y_real[25] = 32'h3b4b295f; y_real[26] = 32'h3bb0f27c; y_real[27] = 32'h3cf9db23; 
y_real[28] = 32'hbe32e48f; y_real[29] = 32'h3cf9db23; y_real[30] = 32'h3bb0f27c; y_real[31] = 32'h3b4b295f; 

y_real[32] = 32'hbc7765fe; y_real[33] = 32'hbc91d14e; y_real[34] = 32'hbcfec56d; y_real[35] = 32'hbe32e48f; 
y_real[36] = 32'h3f800000; y_real[37] = 32'hbe32e48f; y_real[38] = 32'hbcfec56d; y_real[39] = 32'hbc91d14e; 

y_real[40] = 32'h3b2a64c3; y_real[41] = 32'h3b4b295f; y_real[42] = 32'h3bb0f27c; y_real[43] = 32'h3cf9db23; 
y_real[44] = 32'hbe32e48f; y_real[45] = 32'h3cf9db23; y_real[46] = 32'h3bb0f27c; y_real[47] = 32'h3b4b295f; 

y_real[48] = 32'h3a03126f; y_real[49] = 32'h3a1d4952; y_real[50] = 32'h3a83126f; y_real[51] = 32'h3bb0f27c; 
y_real[52] = 32'hbcfec56d; y_real[53] = 32'h3bb0f27c; y_real[54] = 32'h3a83126f; y_real[55] = 32'h3a1d4952; 

y_real[56] = 32'h399d4952; y_real[57] = 32'h399d4952; y_real[58] = 32'h3a1d4952; y_real[59] = 32'h3b4b295f; 
y_real[60] = 32'hbc91d14e; y_real[61] = 32'h3b4b295f; y_real[62] = 32'h3a1d4952; y_real[63] = 32'h399d4952;

    
    // Wait for processing
    // #100;
    
    // // Display outputs for Test Case 1
    // $display("Test Case 1 Results:");
    // for (i = 0; i < 64; i = i + 1) begin
    //   $display("X[%0d] = %0d + j%0d", i, X_real[i], X_imag[i]);
    // end
    
    // // Test Case 2: Periodic pattern inputs
     #100;
     for (i = 0; i < 64; i = i + 1) begin
       x_real[i] = i % 8;             // 0, 1, 2, ..., 7, 0, 1, ...
       x_imag[i] = (i % 8) * 10;      // 0, 10, 20, ..., 70, 0, 10, ...
//       y_real[i] = (i % 4) * 25;      // 0, 25, 50, 75, 0, 25, ...
//       y_imag[i] = i % 2 ? 50 : 100;  // 100, 50, 100, 50, ...
     end
    
    // // Wait for processing
    // #100;
    
    // // Display outputs for Test Case 2
    // $display("Test Case 2 Results:");
    // for (i = 0; i < 64; i = i + 1) begin
    //   $display("X[%0d] = %0d + j%0d", i, X_real[i], X_imag[i]);
    // end
    
    // // Test Case 3: All ones (unity test)
    // #100;
    // for (i = 0; i < 64; i = i + 1) begin
    //   x_real[i] = 1;
    //   x_imag[i] = 1;
    //   y_real[i] = 1;
    //   y_imag[i] = 1;
    // end
    
    // // Wait for processing
    // #100;
    
    // // Display outputs for Test Case 3
    // $display("Test Case 3 Results:");
    // for (i = 0; i < 64; i = i + 1) begin
    //   $display("X[%0d] = %0d + j%0d", i, X_real[i], X_imag[i]);
    // end
    
    // // Test Case 4: Random values (using deterministic patterns for reproducibility)
    // #100;
    // for (i = 0; i < 64; i = i + 1) begin
    //   x_real[i] = (i * 17) % 256;
    //   x_imag[i] = (i * 23) % 256;
    //   y_real[i] = (i * 29) % 256;
    //   y_imag[i] = (i * 31) % 256;
    // end
    
    // // Wait for processing
    // #100;
    
    // // Display outputs for Test Case 4
    // $display("Test Case 4 Results:");
    // for (i = 0; i < 64; i = i + 1) begin
    //   $display("X[%0d] = %0d + j%0d", i, X_real[i], X_imag[i]);
    // end
    
    // End simulation after another delay
    #100;
    $finish;
  end
endmodule