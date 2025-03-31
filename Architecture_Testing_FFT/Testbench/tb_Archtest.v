//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 03/23/2025 01:23:44 AM
//// Design Name: 
//// Module Name: tb_Archtest
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
///////////////////////////////////////////////////////// ///////////////////////////


//module tb_Archtest();
//    reg [31:0] x0,  x1,  x2,  x3,  x4,  x5,  x6,  x7,
//                  x8,  x9,  x10, x11, x12, x13, x14, x15,
//                  x16, x17, x18, x19, x20, x21, x22, x23,
//                  x24, x25, x26, x27, x28, x29, x30, x31,
//                  x32, x33, x34, x35, x36, x37, x38, x39,
//                  x40, x41, x42, x43, x44, x45, x46, x47,
//                  x48, x49, x50, x51, x52, x53, x54, x55,
//                  x56, x57, x58, x59, x60, x61, x62, x63;
//    wire [31:0] y0,  y1,  y2,  y3,  y4,  y5,  y6,  y7,
//                  y8,  y9,  y10, y11, y12, y13, y14, y15,
//                  y16, y17, y18, y19, y20, y21, y22, y23,
//                  y24, y25, y26, y27, y28, y29, y30, y31,
//                  y32, y33, y34, y35, y36, y37, y38, y39,
//                  y40, y41, y42, y43, y44, y45, y46, y47,
//                  y48, y49, y50, y51, y52, y53, y54, y55,
//                  y56, y57, y58, y59, y60, y61, y62, y63;
                  
//    // Wires for decimal converted values
//    wire [31:0] x0_dec, x1_dec, x2_dec, x3_dec, x4_dec, x5_dec, x6_dec, x7_dec,
//                x8_dec, x9_dec, x10_dec, x11_dec, x12_dec, x13_dec, x14_dec, x15_dec,
//                x16_dec, x17_dec, x18_dec, x19_dec, x20_dec, x21_dec, x22_dec, x23_dec,
//                x24_dec, x25_dec, x26_dec, x27_dec, x28_dec, x29_dec, x30_dec, x31_dec,
//                x32_dec, x33_dec, x34_dec, x35_dec, x36_dec, x37_dec, x38_dec, x39_dec,
//                x40_dec, x41_dec, x42_dec, x43_dec, x44_dec, x45_dec, x46_dec, x47_dec,
//                x48_dec, x49_dec, x50_dec, x51_dec, x52_dec, x53_dec, x54_dec, x55_dec,
//                x56_dec, x57_dec, x58_dec, x59_dec, x60_dec, x61_dec, x62_dec, x63_dec;
                
//    // Wires for decimal converted output values
//    wire [31:0] y0_dec, y1_dec, y2_dec, y3_dec, y4_dec, y5_dec, y6_dec, y7_dec,
//                y8_dec, y9_dec, y10_dec, y11_dec, y12_dec, y13_dec, y14_dec, y15_dec,
//                y16_dec, y17_dec, y18_dec, y19_dec, y20_dec, y21_dec, y22_dec, y23_dec,
//                y24_dec, y25_dec, y26_dec, y27_dec, y28_dec, y29_dec, y30_dec, y31_dec,
//                y32_dec, y33_dec, y34_dec, y35_dec, y36_dec, y37_dec, y38_dec, y39_dec,
//                y40_dec, y41_dec, y42_dec, y43_dec, y44_dec, y45_dec, y46_dec, y47_dec,
//                y48_dec, y49_dec, y50_dec, y51_dec, y52_dec, y53_dec, y54_dec, y55_dec,
//                y56_dec, y57_dec, y58_dec, y59_dec, y60_dec, y61_dec, y62_dec, y63_dec;
                
//    reg clk, rst;
    
//    // Instantiate the main module
//    Arch_test1 t1(
//        .clk(clk), .rst(rst),
//        .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7),
//        .x8(x8), .x9(x9), .x10(x10), .x11(x11), .x12(x12), .x13(x13), .x14(x14), .x15(x15),
//        .x16(x16), .x17(x17), .x18(x18), .x19(x19), .x20(x20), .x21(x21), .x22(x22), .x23(x23),
//        .x24(x24), .x25(x25), .x26(x26), .x27(x27), .x28(x28), .x29(x29), .x30(x30), .x31(x31),
//        .x32(x32), .x33(x33), .x34(x34), .x35(x35), .x36(x36), .x37(x37), .x38(x38), .x39(x39),
//        .x40(x40), .x41(x41), .x42(x42), .x43(x43), .x44(x44), .x45(x45), .x46(x46), .x47(x47),
//        .x48(x48), .x49(x49), .x50(x50), .x51(x51), .x52(x52), .x53(x53), .x54(x54), .x55(x55),
//        .x56(x56), .x57(x57), .x58(x58), .x59(x59), .x60(x60), .x61(x61), .x62(x62), .x63(x63),

//        .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7),
//        .y8(y8), .y9(y9), .y10(y10), .y11(y11), .y12(y12), .y13(y13), .y14(y14), .y15(y15),
//        .y16(y16), .y17(y17), .y18(y18), .y19(y19), .y20(y20), .y21(y21), .y22(y22), .y23(y23),
//        .y24(y24), .y25(y25), .y26(y26), .y27(y27), .y28(y28), .y29(y29), .y30(y30), .y31(y31),
//        .y32(y32), .y33(y33), .y34(y34), .y35(y35), .y36(y36), .y37(y37), .y38(y38), .y39(y39),
//        .y40(y40), .y41(y41), .y42(y42), .y43(y43), .y44(y44), .y45(y45), .y46(y46), .y47(y47),
//        .y48(y48), .y49(y49), .y50(y50), .y51(y51), .y52(y52), .y53(y53), .y54(y54), .y55(y55),
//        .y56(y56), .y57(y57), .y58(y58), .y59(y59), .y60(y60), .y61(y61), .y62(y62), .y63(y63)
//    );

//    // Instantiate the fp_2_dec modules for inputs
//    fp_2_dec fp2dec_x0(.in(x0), .out(x0_dec));
//    fp_2_dec fp2dec_x1(.in(x1), .out(x1_dec));
//    fp_2_dec fp2dec_x2(.in(x2), .out(x2_dec));
//    fp_2_dec fp2dec_x3(.in(x3), .out(x3_dec));
//    fp_2_dec fp2dec_x4(.in(x4), .out(x4_dec));
//    fp_2_dec fp2dec_x5(.in(x5), .out(x5_dec));
//    fp_2_dec fp2dec_x6(.in(x6), .out(x6_dec));
//    fp_2_dec fp2dec_x7(.in(x7), .out(x7_dec));
//    fp_2_dec fp2dec_x8(.in(x8), .out(x8_dec));
//    fp_2_dec fp2dec_x9(.in(x9), .out(x9_dec));
//    fp_2_dec fp2dec_x10(.in(x10), .out(x10_dec));
//    fp_2_dec fp2dec_x11(.in(x11), .out(x11_dec));
//    fp_2_dec fp2dec_x12(.in(x12), .out(x12_dec));
//    fp_2_dec fp2dec_x13(.in(x13), .out(x13_dec));
//    fp_2_dec fp2dec_x14(.in(x14), .out(x14_dec));
//    fp_2_dec fp2dec_x15(.in(x15), .out(x15_dec));
//    fp_2_dec fp2dec_x16(.in(x16), .out(x16_dec));
//    fp_2_dec fp2dec_x17(.in(x17), .out(x17_dec));
//    fp_2_dec fp2dec_x18(.in(x18), .out(x18_dec));
//    fp_2_dec fp2dec_x19(.in(x19), .out(x19_dec));
//    fp_2_dec fp2dec_x20(.in(x20), .out(x20_dec));
//    fp_2_dec fp2dec_x21(.in(x21), .out(x21_dec));
//    fp_2_dec fp2dec_x22(.in(x22), .out(x22_dec));
//    fp_2_dec fp2dec_x23(.in(x23), .out(x23_dec));
//    fp_2_dec fp2dec_x24(.in(x24), .out(x24_dec));
//    fp_2_dec fp2dec_x25(.in(x25), .out(x25_dec));
//    fp_2_dec fp2dec_x26(.in(x26), .out(x26_dec));
//    fp_2_dec fp2dec_x27(.in(x27), .out(x27_dec));
//    fp_2_dec fp2dec_x28(.in(x28), .out(x28_dec));
//    fp_2_dec fp2dec_x29(.in(x29), .out(x29_dec));
//    fp_2_dec fp2dec_x30(.in(x30), .out(x30_dec));
//    fp_2_dec fp2dec_x31(.in(x31), .out(x31_dec));
//    fp_2_dec fp2dec_x32(.in(x32), .out(x32_dec));
//    fp_2_dec fp2dec_x33(.in(x33), .out(x33_dec));
//    fp_2_dec fp2dec_x34(.in(x34), .out(x34_dec));
//    fp_2_dec fp2dec_x35(.in(x35), .out(x35_dec));
//    fp_2_dec fp2dec_x36(.in(x36), .out(x36_dec));
//    fp_2_dec fp2dec_x37(.in(x37), .out(x37_dec));
//    fp_2_dec fp2dec_x38(.in(x38), .out(x38_dec));
//    fp_2_dec fp2dec_x39(.in(x39), .out(x39_dec));
//    fp_2_dec fp2dec_x40(.in(x40), .out(x40_dec));
//    fp_2_dec fp2dec_x41(.in(x41), .out(x41_dec));
//    fp_2_dec fp2dec_x42(.in(x42), .out(x42_dec));
//    fp_2_dec fp2dec_x43(.in(x43), .out(x43_dec));
//    fp_2_dec fp2dec_x44(.in(x44), .out(x44_dec));
//    fp_2_dec fp2dec_x45(.in(x45), .out(x45_dec));
//    fp_2_dec fp2dec_x46(.in(x46), .out(x46_dec));
//    fp_2_dec fp2dec_x47(.in(x47), .out(x47_dec));
//    fp_2_dec fp2dec_x48(.in(x48), .out(x48_dec));
//    fp_2_dec fp2dec_x49(.in(x49), .out(x49_dec));
//    fp_2_dec fp2dec_x50(.in(x50), .out(x50_dec));
//    fp_2_dec fp2dec_x51(.in(x51), .out(x51_dec));
//    fp_2_dec fp2dec_x52(.in(x52), .out(x52_dec));
//    fp_2_dec fp2dec_x53(.in(x53), .out(x53_dec));
//    fp_2_dec fp2dec_x54(.in(x54), .out(x54_dec));
//    fp_2_dec fp2dec_x55(.in(x55), .out(x55_dec));
//    fp_2_dec fp2dec_x56(.in(x56), .out(x56_dec));
//    fp_2_dec fp2dec_x57(.in(x57), .out(x57_dec));
//    fp_2_dec fp2dec_x58(.in(x58), .out(x58_dec));
//    fp_2_dec fp2dec_x59(.in(x59), .out(x59_dec));
//    fp_2_dec fp2dec_x60(.in(x60), .out(x60_dec));
//    fp_2_dec fp2dec_x61(.in(x61), .out(x61_dec));
//    fp_2_dec fp2dec_x62(.in(x62), .out(x62_dec));
//    fp_2_dec fp2dec_x63(.in(x63), .out(x63_dec));
    
//    // Instantiate the fp_2_dec modules for outputs
//    fp_2_dec fp2dec_y0(.in(y0), .out(y0_dec));
//    fp_2_dec fp2dec_y1(.in(y1), .out(y1_dec));
//    fp_2_dec fp2dec_y2(.in(y2), .out(y2_dec));
//    fp_2_dec fp2dec_y3(.in(y3), .out(y3_dec));
//    fp_2_dec fp2dec_y4(.in(y4), .out(y4_dec));
//    fp_2_dec fp2dec_y5(.in(y5), .out(y5_dec));
//    fp_2_dec fp2dec_y6(.in(y6), .out(y6_dec));
//    fp_2_dec fp2dec_y7(.in(y7), .out(y7_dec));
//    fp_2_dec fp2dec_y8(.in(y8), .out(y8_dec));
//    fp_2_dec fp2dec_y9(.in(y9), .out(y9_dec));
//    fp_2_dec fp2dec_y10(.in(y10), .out(y10_dec));
//    fp_2_dec fp2dec_y11(.in(y11), .out(y11_dec));
//    fp_2_dec fp2dec_y12(.in(y12), .out(y12_dec));
//    fp_2_dec fp2dec_y13(.in(y13), .out(y13_dec));
//    fp_2_dec fp2dec_y14(.in(y14), .out(y14_dec));
//    fp_2_dec fp2dec_y15(.in(y15), .out(y15_dec));
//    fp_2_dec fp2dec_y16(.in(y16), .out(y16_dec));
//    fp_2_dec fp2dec_y17(.in(y17), .out(y17_dec));
//    fp_2_dec fp2dec_y18(.in(y18), .out(y18_dec));
//    fp_2_dec fp2dec_y19(.in(y19), .out(y19_dec));
//    fp_2_dec fp2dec_y20(.in(y20), .out(y20_dec));
//    fp_2_dec fp2dec_y21(.in(y21), .out(y21_dec));
//    fp_2_dec fp2dec_y22(.in(y22), .out(y22_dec));
//    fp_2_dec fp2dec_y23(.in(y23), .out(y23_dec));
//    fp_2_dec fp2dec_y24(.in(y24), .out(y24_dec));
//    fp_2_dec fp2dec_y25(.in(y25), .out(y25_dec));
//    fp_2_dec fp2dec_y26(.in(y26), .out(y26_dec));
//    fp_2_dec fp2dec_y27(.in(y27), .out(y27_dec));
//    fp_2_dec fp2dec_y28(.in(y28), .out(y28_dec));
//    fp_2_dec fp2dec_y29(.in(y29), .out(y29_dec));
//    fp_2_dec fp2dec_y30(.in(y30), .out(y30_dec));
//    fp_2_dec fp2dec_y31(.in(y31), .out(y31_dec));
//    fp_2_dec fp2dec_y32(.in(y32), .out(y32_dec));
//    fp_2_dec fp2dec_y33(.in(y33), .out(y33_dec));
//    fp_2_dec fp2dec_y34(.in(y34), .out(y34_dec));
//    fp_2_dec fp2dec_y35(.in(y35), .out(y35_dec));
//    fp_2_dec fp2dec_y36(.in(y36), .out(y36_dec));
//    fp_2_dec fp2dec_y37(.in(y37), .out(y37_dec));
//    fp_2_dec fp2dec_y38(.in(y38), .out(y38_dec));
//    fp_2_dec fp2dec_y39(.in(y39), .out(y39_dec));
//    fp_2_dec fp2dec_y40(.in(y40), .out(y40_dec));
//    fp_2_dec fp2dec_y41(.in(y41), .out(y41_dec));
//    fp_2_dec fp2dec_y42(.in(y42), .out(y42_dec));
//    fp_2_dec fp2dec_y43(.in(y43), .out(y43_dec));
//    fp_2_dec fp2dec_y44(.in(y44), .out(y44_dec));
//    fp_2_dec fp2dec_y45(.in(y45), .out(y45_dec));
//    fp_2_dec fp2dec_y46(.in(y46), .out(y46_dec));
//    fp_2_dec fp2dec_y47(.in(y47), .out(y47_dec));
//    fp_2_dec fp2dec_y48(.in(y48), .out(y48_dec));
//    fp_2_dec fp2dec_y49(.in(y49), .out(y49_dec));
//    fp_2_dec fp2dec_y50(.in(y50), .out(y50_dec));
//    fp_2_dec fp2dec_y51(.in(y51), .out(y51_dec));
//    fp_2_dec fp2dec_y52(.in(y52), .out(y52_dec));
//    fp_2_dec fp2dec_y53(.in(y53), .out(y53_dec));
//    fp_2_dec fp2dec_y54(.in(y54), .out(y54_dec));
//    fp_2_dec fp2dec_y55(.in(y55), .out(y55_dec));
//    fp_2_dec fp2dec_y56(.in(y56), .out(y56_dec));
//    fp_2_dec fp2dec_y57(.in(y57), .out(y57_dec));
//    fp_2_dec fp2dec_y58(.in(y58), .out(y58_dec));
//    fp_2_dec fp2dec_y59(.in(y59), .out(y59_dec));
//    fp_2_dec fp2dec_y60(.in(y60), .out(y60_dec));
//    fp_2_dec fp2dec_y61(.in(y61), .out(y61_dec));
//    fp_2_dec fp2dec_y62(.in(y62), .out(y62_dec));
//    fp_2_dec fp2dec_y63(.in(y63), .out(y63_dec));
    
//    integer i;
//    always #20 clk=~clk;
    
//    initial begin
//        rst=1;
//        clk=0;
//        #20 rst=0;
        
//        // FFT INP1
//        x0 = 32'h00000000;  x1 = 32'h00000000;  x2 = 32'h40000000;  x3 = 32'h00000000;  
//        x4 = 32'h40800000;  x5 = 32'h00000000;  x6 = 32'h40C00000;  x7 = 32'h00000000;
//        x8 = 32'h41000000;  x9 = 32'h00000000;  x10 = 32'h41200000; x11 = 32'h00000000; 
//        x12 = 32'h41400000; x13 = 32'h00000000; x14 = 32'h41600000; x15 = 32'h00000000;
        
//        // FFT INP2
//        x16 = 32'h3F800000; x17 = 32'h00000000; x18 = 32'h40400000; x19 = 32'h00000000; 
//        x20 = 32'h40A00000; x21 = 32'h00000000; x22 = 32'h40E00000; x23 = 32'h00000000;
//        x24 = 32'h41100000; x25 = 32'h00000000; x26 = 32'h41300000; x27 = 32'h00000000; 
//        x28 = 32'h41500000; x29 = 32'h00000000; x30 = 32'h41700000; x31 = 32'h00000000; 
        
        
//        // FFT INP3
//        x32 = 32'h00000000;  x33 = 32'h00000000; x34 = 32'h40400000; x35 = 32'h00000000; 
//        x36 = 32'h40C00000;  x37 = 32'h00000000; x38 = 32'h41200000; x39 = 32'h00000000; 
//        x40 = 32'h41600000;  x41 = 32'h00000000; x42 = 32'h41A00000; x43 = 32'h00000000;
//        x44 = 32'h41C00000;  x45 = 32'h00000000; x46 = 32'h41E00000; x47 = 32'h00000000;
       
         
//        // FFT INP4
//         x48 = 32'h00000000; x49 = 32'h00000000; x50 = 32'h40800000; x51 = 32'h00000000; 
//         x52 = 32'h41000000; x53 = 32'h00000000; x54 = 32'h41400000; x55 = 32'h00000000; 
//         x56 = 32'h41800000; x57 = 32'h00000000; x58 = 32'h41A00000; x59 = 32'h00000000;
//         x60 = 32'h41C00000; x61 = 32'h00000000; x62 = 32'h41E00000; x63 = 32'h00000000;
        
//        // Display input decimal values after a few clock cycles
//        #100;
//        $display("Input decimal values:");
//        $display("x0_dec = %d, x2_dec = %d, x4_dec = %d, x6_dec = %d", x0_dec, x2_dec, x4_dec, x6_dec);
//        $display("x8_dec = %d, x10_dec = %d, x12_dec = %d, x14_dec = %d", x8_dec, x10_dec, x12_dec, x14_dec);
//        $display("x16_dec = %d, x18_dec = %d, x20_dec = %d, x22_dec = %d", x16_dec, x18_dec, x20_dec, x22_dec);
//        $display("x24_dec = %d, x26_dec = %d, x28_dec = %d, x30_dec = %d", x24_dec, x26_dec, x28_dec, x30_dec);
//        $display("x33_dec = %d, x35_dec = %d, x37_dec = %d, x39_dec = %d", x33_dec, x35_dec, x37_dec, x39_dec);
//        $display("x41_dec = %d, x43_dec = %d, x45_dec = %d, x47_dec = %d", x41_dec, x43_dec, x45_dec, x47_dec);
//        $display("x49_dec = %d, x51_dec = %d, x53_dec = %d, x55_dec = %d", x49_dec, x51_dec, x53_dec, x55_dec);
//        $display("x57_dec = %d, x59_dec = %d, x61_dec = %d, x63_dec = %d", x57_dec, x59_dec, x61_dec, x63_dec);
        
//        // Display output decimal values at the end of simulation
//        #800;
//        $display("Output decimal values:");
//        $display("y0_dec = %d, y2_dec = %d, y4_dec = %d, y6_dec = %d", y0_dec, y2_dec, y4_dec, y6_dec);
//        $display("y8_dec = %d, y10_dec = %d, y12_dec = %d, y14_dec = %d", y8_dec, y10_dec, y12_dec, y14_dec);
//        $display("y16_dec = %d, y18_dec = %d, y20_dec = %d, y22_dec = %d", y16_dec, y18_dec, y20_dec, y22_dec);
//        $display("y24_dec = %d, y26_dec = %d, y28_dec = %d, y30_dec = %d", y24_dec, y26_dec, y28_dec, y30_dec);
//        $display("y33_dec = %d, y35_dec = %d, y37_dec = %d, y39_dec = %d", y33_dec, y35_dec, y37_dec, y39_dec);
//        $display("y41_dec = %d, y43_dec = %d, y45_dec = %d, y47_dec = %d", y41_dec, y43_dec, y45_dec, y47_dec);
//        $display("y49_dec = %d, y51_dec = %d, y53_dec = %d, y55_dec = %d", y49_dec, y51_dec, y53_dec, y55_dec);
//        $display("y57_dec = %d, y59_dec = %d, y61_dec = %d, y63_dec = %d", y57_dec, y59_dec, y61_dec, y63_dec);
        
//        $finish;
//    end

//endmodule
//module fp_2_dec(
//    input [31:0] in,      // IEEE 754 floating-point input
//    output reg [31:0] out  // Signed integer output
//);
//    reg sign;
//    reg [7:0] exponent;
//    reg [22:0] mantissa;
//    reg [31:0] abs_value;
//    reg [7:0] effective_exponent;
//    always @(*) begin
//        // Extract sign, exponent, and mantissa from ieee_in
//        sign = in[31];
//        exponent = in[30:23];
//        mantissa = in[22:0];
//        // Handle special cases: zero 
//        if (in == 32'd0) begin
//            out = 32'b0; // Zero (treated as zero)
//        end else begin
//            // Calculate the effective exponent
//            effective_exponent = exponent - 8'd127;
            
//            if (effective_exponent >= 23) begin
//                // Shift left if exponent is large 
//                abs_value = {1'b1,mantissa[22:1]} << (effective_exponent - 22);
//            end else if (effective_exponent < 23) begin
//                // Shift right if exponent is small
//                abs_value = {1'b1,mantissa[22:1]} >> (22 - effective_exponent);
//            end
            
//            // Apply the sign to get the final output
//            out = sign ? -abs_value : abs_value;
//        end
//    end
//endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 01:23:44 AM
// Design Name: 
// Module Name: tb_Archtest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for Arch_test1 that writes final floating-point outputs
//              directly to a file without converting them via fp_2_dec.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_Archtest(); 
    // Input declarations
    reg [31:0] x0,  x1,  x2,  x3,  x4,  x5,  x6,  x7,
                  x8,  x9,  x10, x11, x12, x13, x14, x15,
                  x16, x17, x18, x19, x20, x21, x22, x23,
                  x24, x25, x26, x27, x28, x29, x30, x31,
                  x32, x33, x34, x35, x36, x37, x38, x39,
                  x40, x41, x42, x43, x44, x45, x46, x47,
                  x48, x49, x50, x51, x52, x53, x54, x55,
                  x56, x57, x58, x59, x60, x61, x62, x63;
    
    // Final floating-point outputs from the main module
    wire [31:0] y0,  y1,  y2,  y3,  y4,  y5,  y6,  y7,
                  y8,  y9,  y10, y11, y12, y13, y14, y15,
                  y16, y17, y18, y19, y20, y21, y22, y23,
                  y24, y25, y26, y27, y28, y29, y30, y31,
                  y32, y33, y34, y35, y36, y37, y38, y39,
                  y40, y41, y42, y43, y44, y45, y46, y47,
                  y48, y49, y50, y51, y52, y53, y54, y55,
                  y56, y57, y58, y59, y60, y61, y62, y63;

    wire [31:0] j0,  j1,  j2,  j3,  j4,  j5,  j6,  j7,
                  j8,  j9,  j10, j11, j12, j13, j14, j15,
                  j16, j17, j18, j19, j20, j21, j22, j23,
                  j24, j25, j26, j27, j28, j29, j30, j31,
                  j32, j33, j34, j35, j36, j37, j38, j39,
                  j40, j41, j42, j43, j44, j45, j46, j47,
                  j48, j49, j50, j51, j52, j53, j54, j55,
                  j56, j57, j58, j59, j60, j61, j62, j63;
    wire [31:0] k0,  k1,  k2,  k3,  k4,  k5,  k6,  k7,
                  k8,  k9,  k10, k11, k12, k13, k14, k15,
                  k16, k17, k18, k19, k20, k21, k22, k23,
                  k24, k25, k26, k27, k28, k29, k30, k31,
                  k32, k33, k34, k35, k36, k37, k38, k39,
                  k40, k41, k42, k43, k44, k45, k46, k47,
                  k48, k49, k50, k51, k52, k53, k54, k55,
                  k56, k57, k58, k59, k60, k61, k62, k63;
    wire [31:0]   m0,  m1,  m2,  m3,  m4,  m5,  m6,  m7,
                  m8,  m9,  m10, m11, m12, m13, m14, m15,
                  m16, m17, m18, m19, m20, m21, m22, m23,
                  m24, m25, m26, m27, m28, m29, m30, m31,
                  m32, m33, m34, m35, m36, m37, m38, m39,
                  m40, m41, m42, m43, m44, m45, m46, m47,
                  m48, m49, m50, m51, m52, m53, m54, m55,
                  m56, m57, m58, m59, m60, m61, m62, m63;
                  
    reg clk, rst;
    
    // File descriptor for output file
    integer file;
    
    // Instantiate the main module (Arch_test1)
    Arch_test1 t1(
        .clk(clk), .rst(rst),
        .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7),
        .x8(x8), .x9(x9), .x10(x10), .x11(x11), .x12(x12), .x13(x13), .x14(x14), .x15(x15),
        .x16(x16), .x17(x17), .x18(x18), .x19(x19), .x20(x20), .x21(x21), .x22(x22), .x23(x23),
        .x24(x24), .x25(x25), .x26(x26), .x27(x27), .x28(x28), .x29(x29), .x30(x30), .x31(x31),
        .x32(x32), .x33(x33), .x34(x34), .x35(x35), .x36(x36), .x37(x37), .x38(x38), .x39(x39),
        .x40(x40), .x41(x41), .x42(x42), .x43(x43), .x44(x44), .x45(x45), .x46(x46), .x47(x47),
        .x48(x48), .x49(x49), .x50(x50), .x51(x51), .x52(x52), .x53(x53), .x54(x54), .x55(x55),
        .x56(x56), .x57(x57), .x58(x58), .x59(x59), .x60(x60), .x61(x61), .x62(x62), .x63(x63),

        .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7),
        .y8(y8), .y9(y9), .y10(y10), .y11(y11), .y12(y12), .y13(y13), .y14(y14), .y15(y15),
        .y16(y16), .y17(y17), .y18(y18), .y19(y19), .y20(y20), .y21(y21), .y22(y22), .y23(y23),
        .y24(y24), .y25(y25), .y26(y26), .y27(y27), .y28(y28), .y29(y29), .y30(y30), .y31(y31),
        .y32(y32), .y33(y33), .y34(y34), .y35(y35), .y36(y36), .y37(y37), .y38(y38), .y39(y39),
        .y40(y40), .y41(y41), .y42(y42), .y43(y43), .y44(y44), .y45(y45), .y46(y46), .y47(y47),
        .y48(y48), .y49(y49), .y50(y50), .y51(y51), .y52(y52), .y53(y53), .y54(y54), .y55(y55),
        .y56(y56), .y57(y57), .y58(y58), .y59(y59), .y60(y60), .y61(y61), .y62(y62), .y63(y63),
        
        .j0(j0), .j1(j1), .j2(j2), .j3(j3), .j4(j4), .j5(j5), .j6(j6), .j7(j7),
        .j8(j8), .j9(j9), .j10(j10), .j11(j11), .j12(j12), .j13(j13), .j14(j14), .j15(j15),
        .j16(j16), .j17(j17), .j18(j18), .j19(j19), .j20(j20), .j21(j21), .j22(j22), .j23(j23),
        .j24(j24), .j25(j25), .j26(j26), .j27(j27), .j28(j28), .j29(j29), .j30(j30), .j31(j31),
        .j32(j32), .j33(j33), .j34(j34), .j35(j35), .j36(j36), .j37(j37), .j38(j38), .j39(j39),
        .j40(j40), .j41(j41), .j42(j42), .j43(j43), .j44(j44), .j45(j45), .j46(j46), .j47(j47),
        .j48(j48), .j49(j49), .j50(j50), .j51(j51), .j52(j52), .j53(j53), .j54(j54), .j55(j55),
        .j56(j56), .j57(j57), .j58(j58), .j59(j59), .j60(j60), .j61(j61), .j62(j62), .j63(j63),
        
        .k0(k0), .k1(k1), .k2(k2), .k3(k3), .k4(k4), .k5(k5), .k6(k6), .k7(k7),
        .k8(k8), .k9(k9), .k10(k10), .k11(k11), .k12(k12), .k13(k13), .k14(k14), .k15(k15),
        .k16(k16), .k17(k17), .k18(k18), .k19(k19), .k20(k20), .k21(k21), .k22(k22), .k23(k23),
        .k24(k24), .k25(k25), .k26(k26), .k27(k27), .k28(k28), .k29(k29), .k30(k30), .k31(k31),
        .k32(k32), .k33(k33), .k34(k34), .k35(k35), .k36(k36), .k37(k37), .k38(k38), .k39(k39),
        .k40(k40), .k41(k41), .k42(k42), .k43(k43), .k44(k44), .k45(k45), .k46(k46), .k47(k47),
        .k48(k48), .k49(k49), .k50(k50), .k51(k51), .k52(k52), .k53(k53), .k54(k54), .k55(k55),
        .k56(k56), .k57(k57), .k58(k58), .k59(k59), .k60(k60), .k61(k61), .k62(k62), .k63(k63),
        
        .m0(m0), .m1(m1), .m2(m2), .m3(m3), .m4(m4), .m5(m5), .m6(m6), .m7(m7),
        .m8(m8), .m9(m9), .m10(m10), .m11(m11), .m12(m12), .m13(m13), .m14(m14), .m15(m15),
        .m16(m16), .m17(m17), .m18(m18), .m19(m19), .m20(m20), .m21(m21), .m22(m22), .m23(m23),
        .m24(m24), .m25(m25), .m26(m26), .m27(m27), .m28(m28), .m29(m29), .m30(m30), .m31(m31),
        .m32(m32), .m33(m33), .m34(m34), .m35(m35), .m36(m36), .m37(m37), .m38(m38), .m39(m39),
        .m40(m40), .m41(m41), .m42(m42), .m43(m43), .m44(m44), .m45(m45), .m46(m46), .m47(m47),
        .m48(m48), .m49(m49), .m50(m50), .m51(m51), .m52(m52), .m53(m53), .m54(m54), .m55(m55),
        .m56(m56), .m57(m57), .m58(m58), .m59(m59), .m60(m60), .m61(m61), .m62(m62), .m63(m63)
    );
    // Clock generation
    always #20 clk = ~clk;
    
    initial begin
        // Open the file for writing
        file = $fopen("final_outputs.txt", "w");  // Change to "final_outputs.csv" if desired.
        
        rst = 1;
        clk = 0;
        #20 rst = 0;
        
        // Set input values for your FFT inputs
        // FFT INP1
        x0 = 32'h00000000;  x1 = 32'h00000000;  x2 = 32'h40000000;  x3 = 32'h00000000;  
        x4 = 32'h40800000;  x5 = 32'h00000000;  x6 = 32'h40C00000;  x7 = 32'h00000000;
        x8 = 32'h41000000;  x9 = 32'h00000000;  x10 = 32'h41200000; x11 = 32'h00000000; 
        x12 = 32'h41400000; x13 = 32'h00000000; x14 = 32'h41600000; x15 = 32'h00000000;
        
        // FFT INP2
        x16 = 32'h3F800000; x17 = 32'h00000000; x18 = 32'h40400000; x19 = 32'h00000000; 
        x20 = 32'h40A00000; x21 = 32'h00000000; x22 = 32'h40E00000; x23 = 32'h00000000;
        x24 = 32'h41100000; x25 = 32'h00000000; x26 = 32'h41300000; x27 = 32'h00000000; 
        x28 = 32'h41500000; x29 = 32'h00000000; x30 = 32'h41700000; x31 = 32'h00000000; 
        
        // FFT INP3
        x32 = 32'h00000000;  x33 = 32'h00000000; x34 = 32'h40400000; x35 = 32'h00000000; 
        x36 = 32'h40C00000;  x37 = 32'h00000000; x38 = 32'h41200000; x39 = 32'h00000000; 
        x40 = 32'h41600000;  x41 = 32'h00000000; x42 = 32'h41A00000; x43 = 32'h00000000;
        x44 = 32'h41C00000;  x45 = 32'h00000000; x46 = 32'h41d80000; x47 = 32'h00000000;
       
        // FFT INP4
        x48 = 32'h00000000; x49 = 32'h00000000; x50 = 32'h40800000; x51 = 32'h00000000; 
        x52 = 32'h41000000; x53 = 32'h00000000; x54 = 32'h41400000; x55 = 32'h00000000; 
        x56 = 32'h41800000; x57 = 32'h00000000; x58 = 32'h41A00000; x59 = 32'h00000000;
        x60 = 32'h41C00000; x61 = 32'h00000000; x62 = 32'h41E00000; x63 = 32'h00000000;
        
        // Wait for processing
        #800;
        
        // Display and write the final floating-point outputs directly
        $display("Final floating-point outputs:");
        $fdisplay(file, "Final floating-point outputs:\n");
        $display("y0 = %h", y0);
        $fdisplay(file, "y0 = %h\n", y0);
        $display("y1 = %h", y1);
        $fdisplay(file, "y1 = %h\n", y1);
        $display("y2 = %h", y2);
        $fdisplay(file, "y2 = %h\n", y2);
        $display("y3 = %h", y3);
        $fdisplay(file, "y3 = %h\n", y3);
        $display("y4 = %h", y4);
        $fdisplay(file, "y4 = %h\n", y4);
        $display("y5 = %h", y5);
        $fdisplay(file, "y5 = %h\n", y5);
        $display("y6 = %h", y6);
        $fdisplay(file, "y6 = %h\n", y6);
        $display("y7 = %h", y7);
        $fdisplay(file, "y7 = %h\n", y7);
        $display("y8 = %h", y8);
        $fdisplay(file, "y8 = %h\n", y8);
        $display("y9 = %h", y9);
        $fdisplay(file, "y9 = %h\n", y9);
        $display("y10 = %h", y10);
        $fdisplay(file, "y10 = %h\n", y10);
        $display("y11 = %h", y11);
        $fdisplay(file, "y11 = %h\n", y11);
        $display("y12 = %h", y12);
        $fdisplay(file, "y12 = %h\n", y12);
        $display("y13 = %h", y13);
        $fdisplay(file, "y13 = %h\n", y13);
        $display("y14 = %h", y14);
        $fdisplay(file, "y14 = %h\n", y14);
        $display("y15 = %h", y15);
        $fdisplay(file, "y15 = %h\n", y15);
        $display("y16 = %h", y16);
        $fdisplay(file, "y16 = %h\n", y16);
        $display("y17 = %h", y17);
        $fdisplay(file, "y17 = %h\n", y17);
        $display("y18 = %h", y18);
        $fdisplay(file, "y18 = %h\n", y18);
        $display("y19 = %h", y19);
        $fdisplay(file, "y19 = %h\n", y19);
        $display("y20 = %h", y20);
        $fdisplay(file, "y20 = %h\n", y20);
        $display("y21 = %h", y21);
        $fdisplay(file, "y21 = %h\n", y21);
        $display("y22 = %h", y22);
        $fdisplay(file, "y22 = %h\n", y22);
        $display("y23 = %h", y23);
        $fdisplay(file, "y23 = %h\n", y23);
        $display("y24 = %h", y24);
        $fdisplay(file, "y24 = %h\n", y24);
        $display("y25 = %h", y25);
        $fdisplay(file, "y25 = %h\n", y25);
        $display("y26 = %h", y26);
        $fdisplay(file, "y26 = %h\n", y26);
        $display("y27 = %h", y27);
        $fdisplay(file, "y27 = %h\n", y27);
        $display("y28 = %h", y28);
        $fdisplay(file, "y28 = %h\n", y28);
        $display("y29 = %h", y29);
        $fdisplay(file, "y29 = %h\n", y29);
        $display("y30 = %h", y30);
        $fdisplay(file, "y30 = %h\n", y30);
        $display("y31 = %h", y31);
        $fdisplay(file, "y31 = %h\n", y31);
        $display("y32 = %h", y32);
        $fdisplay(file, "y32 = %h\n", y32);
        $display("y33 = %h", y33);
        $fdisplay(file, "y33 = %h\n", y33);
        $display("y34 = %h", y34);
        $fdisplay(file, "y34 = %h\n", y34);
        $display("y35 = %h", y35);
        $fdisplay(file, "y35 = %h\n", y35);
        $display("y36 = %h", y36);
        $fdisplay(file, "y36 = %h\n", y36);
        $display("y37 = %h", y37);
        $fdisplay(file, "y37 = %h\n", y37);
        $display("y38 = %h", y38);
        $fdisplay(file, "y38 = %h\n", y38);
        $display("y39 = %h", y39);
        $fdisplay(file, "y39 = %h\n", y39);
        $display("y40 = %h", y40);
        $fdisplay(file, "y40 = %h\n", y40);
        $display("y41 = %h", y41);
        $fdisplay(file, "y41 = %h\n", y41);
        $display("y42 = %h", y42);
        $fdisplay(file, "y42 = %h\n", y42);
        $display("y43 = %h", y43);
        $fdisplay(file, "y43 = %h\n", y43);
        $display("y44 = %h", y44);
        $fdisplay(file, "y44 = %h\n", y44);
        $display("y45 = %h", y45);
        $fdisplay(file, "y45 = %h\n", y45);
        $display("y46 = %h", y46);
        $fdisplay(file, "y46 = %h\n", y46);
        $display("y47 = %h", y47);
        $fdisplay(file, "y47 = %h\n", y47);
        $display("y48 = %h", y48);
        $fdisplay(file, "y48 = %h\n", y48);
        $display("y49 = %h", y49);
        $fdisplay(file, "y49 = %h\n", y49);
        $display("y50 = %h", y50);
        $fdisplay(file, "y50 = %h\n", y50);
        $display("y51 = %h", y51);
        $fdisplay(file, "y51 = %h\n", y51);
        $display("y52 = %h", y52);
        $fdisplay(file, "y52 = %h\n", y52);
        $display("y53 = %h", y53);
        $fdisplay(file, "y53 = %h\n", y53);
        $display("y54 = %h", y54);
        $fdisplay(file, "y54 = %h\n", y54);
        $display("y55 = %h", y55);
        $fdisplay(file, "y55 = %h\n", y55);
        $display("y56 = %h", y56);
        $fdisplay(file, "y56 = %h\n", y56);
        $display("y57 = %h", y57);
        $fdisplay(file, "y57 = %h\n", y57);
        $display("y58 = %h", y58);
        $fdisplay(file, "y58 = %h\n", y58);
        $display("y59 = %h", y59);
        $fdisplay(file, "y59 = %h\n", y59);
        $display("y60 = %h", y60);
        $fdisplay(file, "y60 = %h\n", y60);
        $display("y61 = %h", y61);
        $fdisplay(file, "y61 = %h\n", y61);
        $display("y62 = %h", y62);
        $fdisplay(file, "y62 = %h\n", y62);
        $display("y63 = %h", y63);
        $fdisplay(file, "y63 = %h\n", y63);
        
        $display("j0 = %h", j0);
        $fdisplay(file, "j0 = %h\n", j0);
        $display("j1 = %h", j1);
        $fdisplay(file, "j1 = %h\n", j1);
        $display("j2 = %h", j2);
        $fdisplay(file, "j2 = %h\n", j2);
        $display("j3 = %h", j3);
        $fdisplay(file, "j3 = %h\n", j3);
        $display("j4 = %h", j4);
        $fdisplay(file, "j4 = %h\n", j4);
        $display("j5 = %h", j5);
        $fdisplay(file, "j5 = %h\n", j5);
        $display("j6 = %h", j6);
        $fdisplay(file, "j6 = %h\n", j6);
        $display("j7 = %h", j7);
        $fdisplay(file, "j7 = %h\n", j7);
        $display("j8 = %h", j8);
        $fdisplay(file, "j8 = %h\n", j8);
        $display("j9 = %h", j9);
        $fdisplay(file, "j9 = %h\n", j9);
        $display("j10 = %h", j10);
        $fdisplay(file, "j10 = %h\n", j10);
        $display("j11 = %h", j11);
        $fdisplay(file, "j11 = %h\n", j11);
        $display("j12 = %h", j12);
        $fdisplay(file, "j12 = %h\n", j12);
        $display("j13 = %h", j13);
        $fdisplay(file, "j13 = %h\n", j13);
        $display("j14 = %h", j14);
        $fdisplay(file, "j14 = %h\n", j14);
        $display("j15 = %h", j15);
        $fdisplay(file, "j15 = %h\n", j15);
        $display("j16 = %h", j16);
        $fdisplay(file, "j16 = %h\n", j16);
        $display("j17 = %h", j17);
        $fdisplay(file, "j17 = %h\n", j17);
        $display("j18 = %h", j18);      
        $fdisplay(file, "j18 = %h\n", j18);
        $display("j19 = %h", j19);
        $fdisplay(file, "j19 = %h\n", j19);
        $display("j20 = %h", j20);
        $fdisplay(file, "j20 = %h\n", j20);
        $display("j21 = %h", j21);
        $fdisplay(file, "j21 = %h\n", j21);
        $display("j22 = %h", j22);
        $fdisplay(file, "j22 = %h\n", j22);
        $display("j23 = %h", j23);
        $fdisplay(file, "j23 = %h\n", j23);
        $display("j24 = %h", j24);
        $fdisplay(file, "j24 = %h\n", j24);
        $display("j25 = %h", j25);
        $fdisplay(file, "j25 = %h\n", j25);
        $display("j26 = %h", j26);
        $fdisplay(file, "j26 = %h\n", j26);
        $display("j27 = %h", j27);
        $fdisplay(file, "j27 = %h\n", j27);
        $display("j28 = %h", j28);
        $fdisplay(file, "j28 = %h\n", j28);
        $display("j29 = %h", j29);
        $fdisplay(file, "j29 = %h\n", j29);
        $display("j30 = %h", j30);
        $fdisplay(file, "j30 = %h\n", j30);
        $display("j31 = %h", j31);
        $fdisplay(file, "j31 = %h\n", j31);
        $display("j32 = %h", j32);
        $fdisplay(file, "j32 = %h\n", j32);
        $display("j33 = %h", j33);
        $fdisplay(file, "j33 = %h\n", j33);
        $display("j34 = %h", j34);
        $fdisplay(file, "j34 = %h\n", j34);
        $display("j35 = %h", j35);
        $fdisplay(file, "j35 = %h\n", j35);
        $display("j36 = %h", j36);
        $fdisplay(file, "j36 = %h\n", j36);
        $display("j37 = %h", j37);
        $fdisplay(file, "j37 = %h\n", j37);
        $display("j38 = %h", j38);
        $fdisplay(file, "j38 = %h\n", j38);
        $display("j39 = %h", j39);
        $fdisplay(file, "j39 = %h\n", j39);
        $display("j40 = %h", j40);
        $fdisplay(file, "j40 = %h\n", j40);
        $display("j41 = %h", j41);
        $fdisplay(file, "j41 = %h\n", j41);
        $display("j42 = %h", j42);
        $fdisplay(file, "j42 = %h\n", j42);
        $display("j43 = %h", j43);
        $fdisplay(file, "j43 = %h\n", j43);
        $display("j44 = %h", j44);
        $fdisplay(file, "j44 = %h\n", j44);
        $display("j45 = %h", j45);
        $fdisplay(file, "j45 = %h\n", j45);
        $display("j46 = %h", j46);
        $fdisplay(file, "j46 = %h\n", j46);
        $display("j47 = %h", j47);
        $fdisplay(file, "j47 = %h\n", j47);
        $display("j48 = %h", j48);
        $fdisplay(file, "j48 = %h\n", j48);
        $display("j49 = %h", j49);
        $fdisplay(file, "j49 = %h\n", j49);
        $display("j50 = %h", j50);
        $fdisplay(file, "j50 = %h\n", j50);
        $display("j51 = %h", j51);
        $fdisplay(file, "j51 = %h\n", j51);
        $display("j52 = %h", j52);
        $fdisplay(file, "j52 = %h\n", j52);
        $display("j53 = %h", j53);
        $fdisplay(file, "j53 = %h\n", j53);
        $display("j54 = %h", j54);
        $fdisplay(file, "j54 = %h\n", j54);
        $display("j55 = %h", j55);
        $fdisplay(file, "j55 = %h\n", j55);
        $display("j56 = %h", j56);
        $fdisplay(file, "j56 = %h\n", j56);
        $display("j57 = %h", j57);
        $fdisplay(file, "j57 = %h\n", j57);
        $display("j58 = %h", j58);
        $fdisplay(file, "j58 = %h\n", j58);
        $display("j59 = %h", j59);
        $fdisplay(file, "j59 = %h\n", j59);
        $display("j60 = %h", j60);
        $fdisplay(file, "j60 = %h\n", j60);
        $display("j61 = %h", j61);
        $fdisplay(file, "j61 = %h\n", j61);
        $display("j62 = %h", j62);
        $fdisplay(file, "j62 = %h\n", j62);
        $display("j63 = %h", j63);
        $fdisplay(file, "j63 = %h\n", j63);
        
        $display("k0 = %h", k0);
        $fdisplay(file, "k0 = %h\n", k0);
        $display("k1 = %h", k1);
        $fdisplay(file, "k1 = %h\n", k1);
        $display("k2 = %h", k2);
        $fdisplay(file, "k2 = %h\n", k2);
        $display("k3 = %h", k3);
        $fdisplay(file, "k3 = %h\n", k3);
        $display("k4 = %h", k4);
        $fdisplay(file, "k4 = %h\n", k4);
        $display("k5 = %h", k5);
        $fdisplay(file, "k5 = %h\n", k5);
        $display("k6 = %h", k6);
        $fdisplay(file, "k6 = %h\n", k6);
        $display("k7 = %h", k7);
        $fdisplay(file, "k7 = %h\n", k7);
        $display("k8 = %h", k8);
        $fdisplay(file, "k8 = %h\n", k8);
        $display("k9 = %h", k9);
        $fdisplay(file, "k9 = %h\n", k9);
        $display("k10 = %h", k10);
        $fdisplay(file, "k10 = %h\n", k10);
        $display("k11 = %h", k11);
        $fdisplay(file, "k11 = %h\n", k11);
        $display("k12 = %h", k12);
        $fdisplay(file, "k12 = %h\n", k12);
        $display("k13 = %h", k13);
        $fdisplay(file, "k13 = %h\n", k13);
        $display("k14 = %h", k14);
        $fdisplay(file, "k14 = %h\n", k14);
        $display("k15 = %h", k15);
        $fdisplay(file, "k15 = %h\n", k15);
        $display("k16 = %h", k16);
        $fdisplay(file, "k16 = %h\n", k16);
        $display("k17 = %h", k17);
        $fdisplay(file, "k17 = %h\n", k17);
        $display("k18 = %h", k18);
        $fdisplay(file, "k18 = %h\n", k18);
        $display("k19 = %h", k19);
        $fdisplay(file, "k19 = %h\n", k19);
        $display("k20 = %h", k20);
        $fdisplay(file, "k20 = %h\n", k20);
        $display("k21 = %h", k21);
        $fdisplay(file, "k21 = %h\n", k21);
        $display("k22 = %h", k22);
        $fdisplay(file, "k22 = %h\n", k22);
        $display("k23 = %h", k23);
        $fdisplay(file, "k23 = %h\n", k23);
        $display("k24 = %h", k24);
        $fdisplay(file, "k24 = %h\n", k24);
        $display("k25 = %h", k25);
        $fdisplay(file, "k25 = %h\n", k25);
        $display("k26 = %h", k26);
        $fdisplay(file, "k26 = %h\n", k26);
        $display("k27 = %h", k27);
        $fdisplay(file, "k27 = %h\n", k27);
        $display("k28 = %h", k28);
        $fdisplay(file, "k28 = %h\n", k28);
        $display("k29 = %h", k29);
        $fdisplay(file, "k29 = %h\n", k29);
        $display("k30 = %h", k30);
        $fdisplay(file, "k30 = %h\n", k30);
        $display("k31 = %h", k31);
        $fdisplay(file, "k31 = %h\n", k31);
        $display("k32 = %h", k32);
        $fdisplay(file, "k32 = %h\n", k32);
        $display("k33 = %h", k33);
        $fdisplay(file, "k33 = %h\n", k33);
        $display("k34 = %h", k34);
        $fdisplay(file, "k34 = %h\n", k34);
        $display("k35 = %h", k35);
        $fdisplay(file, "k35 = %h\n", k35);
        $display("k36 = %h", k36);
        $fdisplay(file, "k36 = %h\n", k36);
        $display("k37 = %h", k37);
        $fdisplay(file, "k37 = %h\n", k37);
        $display("k38 = %h", k38);
        $fdisplay(file, "k38 = %h\n", k38);
        $display("k39 = %h", k39);
        $fdisplay(file, "k39 = %h\n", k39);
        $display("k40 = %h", k40);
        $fdisplay(file, "k40 = %h\n", k40);
        $display("k41 = %h", k41);
        $fdisplay(file, "k41 = %h\n", k41);      
        $display("k42 = %h", k42);
        $fdisplay(file, "k42 = %h\n", k42);
        $display("k43 = %h", k43);              
        $fdisplay(file, "k43 = %h\n", k43);
        $display("k44 = %h", k44);
        $fdisplay(file, "k44 = %h\n", k44);
        $display("k45 = %h", k45);
        $fdisplay(file, "k45 = %h\n", k45);
        $display("k46 = %h", k46);
        $fdisplay(file, "k46 = %h\n", k46);
        $display("k47 = %h", k47);
        $fdisplay(file, "k47 = %h\n", k47);
        $display("k48 = %h", k48);
        $fdisplay(file, "k48 = %h\n", k48);
        $display("k49 = %h", k49);
        $fdisplay(file, "k49 = %h\n", k49);
        $display("k50 = %h", k50);
        $fdisplay(file, "k50 = %h\n", k50);
        $display("k51 = %h", k51);
        $fdisplay(file, "k51 = %h\n", k51);
        $display("k52 = %h", k52);
        $fdisplay(file, "k52 = %h\n", k52);
        $display("k53 = %h", k53);
        $fdisplay(file, "k53 = %h\n", k53);
        $display("k54 = %h", k54);
        $fdisplay(file, "k54 = %h\n", k54);
        $display("k55 = %h", k55);
        $fdisplay(file, "k55 = %h\n", k55);
        $display("k56 = %h", k56);
        $fdisplay(file, "k56 = %h\n", k56);
        $display("k57 = %h", k57);
        $fdisplay(file, "k57 = %h\n", k57);
        $display("k58 = %h", k58);
        $fdisplay(file, "k58 = %h\n", k58);
        $display("k59 = %h", k59);
        $fdisplay(file, "k59 = %h\n", k59);
        $display("k60 = %h", k60);
        $fdisplay(file, "k60 = %h\n", k60);
        $display("k61 = %h", k61);
        $fdisplay(file, "k61 = %h\n", k61);
        $display("k62 = %h", k62);
        $fdisplay(file, "k62 = %h\n", k62);
        $display("k63 = %h", k63);         
        $fdisplay(file, "k63 = %h\n", k63);
        
        $display("m0 = %h", m0);
        $fdisplay(file, "m0 = %h\n", m0);
        $display("m1 = %h", m1);
        $fdisplay(file, "m1 = %h\n", m1);
        $display("m2 = %h", m2);
        $fdisplay(file, "m2 = %h\n", m2);
        $display("m3 = %h", m3);
        $fdisplay(file, "m3 = %h\n", m3);
        $display("m4 = %h", m4);
        $fdisplay(file, "m4 = %h\n", m4);
        $display("m5 = %h", m5);
        $fdisplay(file, "m5 = %h\n", m5);
        $display("m6 = %h", m6);
        $fdisplay(file, "m6 = %h\n", m6);
        $display("m7 = %h", m7);
        $fdisplay(file, "m7 = %h\n", m7);
        $display("m8 = %h", m8);
        $fdisplay(file, "m8 = %h\n", m8);
        $display("m9 = %h", m9);
        $fdisplay(file, "m9 = %h\n", m9);
        $display("m10 = %h", m10);
        $fdisplay(file, "m10 = %h\n", m10);
        $display("m11 = %h", m11);
        $fdisplay(file, "m11 = %h\n", m11);
        $display("m12 = %h", m12);
        $fdisplay(file, "m12 = %h\n", m12);
        $display("m13 = %h", m13);
        $fdisplay(file, "m13 = %h\n", m13);
        $display("m14 = %h", m14);
        $fdisplay(file, "m14 = %h\n", m14);
        $display("m15 = %h", m15);
        $fdisplay(file, "m15 = %h\n", m15);
        $display("m16 = %h", m16);
        $fdisplay(file, "m16 = %h\n", m16);
        $display("m17 = %h", m17);
        $fdisplay(file, "m17 = %h\n", m17);
        $display("m18 = %h", m18);
        $fdisplay(file, "m18 = %h\n", m18);
        $display("m19 = %h", m19);
        $fdisplay(file, "m19 = %h\n", m19);
        $display("m20 = %h", m20);
        $fdisplay(file, "m20 = %h\n", m20);
        $display("m21 = %h", m21);
        $fdisplay(file, "m21 = %h\n", m21);
        $display("m22 = %h", m22);
        $fdisplay(file, "m22 = %h\n", m22);
        $display("m23 = %h", m23);
        $fdisplay(file, "m23 = %h\n", m23);
        $display("m24 = %h", m24);
        $fdisplay(file, "m24 = %h\n", m24);
        $display("m25 = %h", m25);
        $fdisplay(file, "m25 = %h\n", m25);
        $display("m26 = %h", m26);
        $fdisplay(file, "m26 = %h\n", m26);
        $display("m27 = %h", m27);
        $fdisplay(file, "m27 = %h\n", m27);
        $display("m28 = %h", m28);
        $fdisplay(file, "m28 = %h\n", m28);
        $display("m29 = %h", m29);
        $fdisplay(file, "m29 = %h\n", m29);
        $display("m30 = %h", m30);
        $fdisplay(file, "m30 = %h\n", m30);
        $display("m31 = %h", m31);
        $fdisplay(file, "m31 = %h\n", m31);
        $display("m32 = %h", m32);
        $fdisplay(file, "m32 = %h\n", m32);
        $display("m33 = %h", m33);
        $fdisplay(file, "m33 = %h\n", m33);
        $display("m34 = %h", m34);
        $fdisplay(file, "m34 = %h\n", m34);
        $display("m35 = %h", m35);
        $fdisplay(file, "m35 = %h\n", m35);
        $display("m36 = %h", m36);
        $fdisplay(file, "m36 = %h\n", m36);
        $display("m37 = %h", m37);
        $fdisplay(file, "m37 = %h\n", m37);
        $display("m38 = %h", m38);
        $fdisplay(file, "m38 = %h\n", m38);
        $display("m39 = %h", m39);
        $fdisplay(file, "m39 = %h\n", m39);
        $display("m40 = %h", m40);
        $fdisplay(file, "m40 = %h\n", m40);  
        $display("m41 = %h", m41);
        $fdisplay(file, "m41 = %h\n", m41);      
        $display("m42 = %h", m42);
        $fdisplay(file, "m42 = %h\n", m42);
        $display("m43 = %h", m43);              
        $fdisplay(file, "m43 = %h\n", m43);
        $display("m44 = %h", m44);
        $fdisplay(file, "m44 = %h\n", m44);
        $display("m45 = %h", m45);
        $fdisplay(file, "m45 = %h\n", m45);
        $display("m46 = %h", m46);
        $fdisplay(file, "m46 = %h\n", m46);
        $display("m47 = %h", m47);
        $fdisplay(file, "m47 = %h\n", m47);
        $display("m48 = %h", m48);
        $fdisplay(file, "m48 = %h\n", m48);
        $display("m49 = %h", m49);
        $fdisplay(file, "m49 = %h\n", m49);
        $display("m50 = %h", m50);
        $fdisplay(file, "m50 = %h\n", m50);
        $display("m51 = %h", m51);
        $fdisplay(file, "m51 = %h\n", m51);
        $display("m52 = %h", m52);
        $fdisplay(file, "m52 = %h\n", m52);
        $display("m53 = %h", m53);
        $fdisplay(file, "m53 = %h\n", m53);
        $display("m54 = %h", m54);
        $fdisplay(file, "m54 = %h\n", m54);
        $display("m55 = %h", m55);
        $fdisplay(file, "m55 = %h\n", m55);
        $display("m56 = %h", m56);
        $fdisplay(file, "m56 = %h\n", m56);
        $display("m57 = %h", m57);
        $fdisplay(file, "m57 = %h\n", m57);
        $display("m58 = %h", m58);
        $fdisplay(file, "m58 = %h\n", m58);
        $display("m59 = %h", m59);
        $fdisplay(file, "m59 = %h\n", m59);
        $display("m60 = %h", m60);
        $fdisplay(file, "m60 = %h\n", m60); 
        $display("m61 = %h", m61);
        $fdisplay(file, "m61 = %h\n", m61);
        $display("m62 = %h", m62);
        $fdisplay(file, "m62 = %h\n", m62);
        $display("m63 = %h", m63);         
        $fdisplay(file, "m63 = %h\n", m63);
        // Continue similarly for remaining outputs as needed
        $fclose(file);
        $finish;  
    end
endmodule
 