`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2025 09:38:26 AM
// Design Name: 
// Module Name: clked_8pt
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


module clked_8pt(
    input clk,
    input signed  [31:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag,
                        x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag,
    output reg signed [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag,
                            X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag,
    output reg signed [31:0] fp_X0_real, fp_X0_imag, fp_X1_real, fp_X1_imag, fp_X2_real, fp_X2_imag, 
                            fp_X3_real, fp_X3_imag, fp_X4_real, fp_X4_imag, fp_X5_real, fp_X5_imag,
                            fp_X6_real, fp_X6_imag, fp_X7_real, fp_X7_imag
);

// Input registers for decimal values
reg signed [31:0] x0_real_reg, x0_imag_reg, x1_real_reg, x1_imag_reg;
reg signed [31:0] x2_real_reg, x2_imag_reg, x3_real_reg, x3_imag_reg;
reg signed [31:0] x4_real_reg, x4_imag_reg, x5_real_reg, x5_imag_reg;
reg signed [31:0] x6_real_reg, x6_imag_reg, x7_real_reg, x7_imag_reg;

// Wires for floating point conversion outputs
wire signed [31:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag;
wire signed [31:0] fp_x2_real, fp_x2_imag, fp_x3_real, fp_x3_imag;
wire signed [31:0] fp_x4_real, fp_x4_imag, fp_x5_real, fp_x5_imag;
wire signed [31:0] fp_x6_real, fp_x6_imag, fp_x7_real, fp_x7_imag;

// Registers for floating point values
reg signed [31:0] fp_x0_real_reg, fp_x0_imag_reg, fp_x1_real_reg, fp_x1_imag_reg;
reg signed [31:0] fp_x2_real_reg, fp_x2_imag_reg, fp_x3_real_reg, fp_x3_imag_reg;
reg signed [31:0] fp_x4_real_reg, fp_x4_imag_reg, fp_x5_real_reg, fp_x5_imag_reg;
reg signed [31:0] fp_x6_real_reg, fp_x6_imag_reg, fp_x7_real_reg, fp_x7_imag_reg;

// Wires for FFT outputs
wire signed [31:0] fft_X0_real, fft_X0_imag, fft_X1_real, fft_X1_imag;
wire signed [31:0] fft_X2_real, fft_X2_imag, fft_X3_real, fft_X3_imag;
wire signed [31:0] fft_X4_real, fft_X4_imag, fft_X5_real, fft_X5_imag;
wire signed [31:0] fft_X6_real, fft_X6_imag, fft_X7_real, fft_X7_imag;

// Register input values
always @(posedge clk) begin
    x0_real_reg <= x0_real; x0_imag_reg <= x0_imag;
    x1_real_reg <= x1_real; x1_imag_reg <= x1_imag;
    x2_real_reg <= x2_real; x2_imag_reg <= x2_imag;
    x3_real_reg <= x3_real; x3_imag_reg <= x3_imag;
    x4_real_reg <= x4_real; x4_imag_reg <= x4_imag;
    x5_real_reg <= x5_real; x5_imag_reg <= x5_imag;
    x6_real_reg <= x6_real; x6_imag_reg <= x6_imag;
    x7_real_reg <= x7_real; x7_imag_reg <= x7_imag;
end

// Decimal to floating point conversion
dec_2_fp op1(x0_real_reg, fp_x0_real);
dec_2_fp op2(x0_imag_reg, fp_x0_imag);
dec_2_fp op3(x1_real_reg, fp_x1_real);
dec_2_fp op4(x1_imag_reg, fp_x1_imag);
dec_2_fp op5(x2_real_reg, fp_x2_real);
dec_2_fp op6(x2_imag_reg, fp_x2_imag);
dec_2_fp op7(x3_real_reg, fp_x3_real);
dec_2_fp op8(x3_imag_reg, fp_x3_imag);
dec_2_fp op9(x4_real_reg, fp_x4_real);
dec_2_fp op10(x4_imag_reg, fp_x4_imag);
dec_2_fp op11(x5_real_reg, fp_x5_real);
dec_2_fp op12(x5_imag_reg, fp_x5_imag);
dec_2_fp op13(x6_real_reg, fp_x6_real);
dec_2_fp op14(x6_imag_reg, fp_x6_imag);
dec_2_fp op15(x7_real_reg, fp_x7_real);
dec_2_fp op16(x7_imag_reg, fp_x7_imag);

// Register floating point values
always @(posedge clk) begin
    fp_x0_real_reg <= fp_x0_real; fp_x0_imag_reg <= fp_x0_imag;
    fp_x1_real_reg <= fp_x1_real; fp_x1_imag_reg <= fp_x1_imag;
    fp_x2_real_reg <= fp_x2_real; fp_x2_imag_reg <= fp_x2_imag;
    fp_x3_real_reg <= fp_x3_real; fp_x3_imag_reg <= fp_x3_imag;
    fp_x4_real_reg <= fp_x4_real; fp_x4_imag_reg <= fp_x4_imag;
    fp_x5_real_reg <= fp_x5_real; fp_x5_imag_reg <= fp_x5_imag;
    fp_x6_real_reg <= fp_x6_real; fp_x6_imag_reg <= fp_x6_imag;
    fp_x7_real_reg <= fp_x7_real; fp_x7_imag_reg <= fp_x7_imag;
end

// FFT computation
fft8pt ins2(
    .clk(clk),
    .xr0(fp_x0_real_reg), .xi0(fp_x0_imag_reg),
    .xr1(fp_x1_real_reg), .xi1(fp_x1_imag_reg),
    .xr2(fp_x2_real_reg), .xi2(fp_x2_imag_reg),
    .xr3(fp_x3_real_reg), .xi3(fp_x3_imag_reg),
    .xr4(fp_x4_real_reg), .xi4(fp_x4_imag_reg),
    .xr5(fp_x5_real_reg), .xi5(fp_x5_imag_reg),
    .xr6(fp_x6_real_reg), .xi6(fp_x6_imag_reg),
    .xr7(fp_x7_real_reg), .xi7(fp_x7_imag_reg),
    .Xr0(fft_X0_real), .Xi0(fft_X0_imag),
    .Xr1(fft_X1_real), .Xi1(fft_X1_imag),
    .Xr2(fft_X2_real), .Xi2(fft_X2_imag),
    .Xr3(fft_X3_real), .Xi3(fft_X3_imag),
    .Xr4(fft_X4_real), .Xi4(fft_X4_imag),
    .Xr5(fft_X5_real), .Xi5(fft_X5_imag),
    .Xr6(fft_X6_real), .Xi6(fft_X6_imag),
    .Xr7(fft_X7_real), .Xi7(fft_X7_imag)
);

// Register FFT outputs and convert back to decimal
always @(posedge clk) begin
    // Register floating point outputs
    fp_X0_real <= fft_X0_real; fp_X0_imag <= fft_X0_imag;
    fp_X1_real <= fft_X1_real; fp_X1_imag <= fft_X1_imag;
    fp_X2_real <= fft_X2_real; fp_X2_imag <= fft_X2_imag;
    fp_X3_real <= fft_X3_real; fp_X3_imag <= fft_X3_imag;
    fp_X4_real <= fft_X4_real; fp_X4_imag <= fft_X4_imag;
    fp_X5_real <= fft_X5_real; fp_X5_imag <= fft_X5_imag;
    fp_X6_real <= fft_X6_real; fp_X6_imag <= fft_X6_imag;
    fp_X7_real <= fft_X7_real; fp_X7_imag <= fft_X7_imag;
end

// Floating point to decimal conversion
wire signed [31:0] dec_X0_real, dec_X0_imag, dec_X1_real, dec_X1_imag;
wire signed [31:0] dec_X2_real, dec_X2_imag, dec_X3_real, dec_X3_imag;
wire signed [31:0] dec_X4_real, dec_X4_imag, dec_X5_real, dec_X5_imag;
wire signed [31:0] dec_X6_real, dec_X6_imag, dec_X7_real, dec_X7_imag;

fp_2_dec op17(fp_X0_real, dec_X0_real);
fp_2_dec op18(fp_X0_imag, dec_X0_imag);
fp_2_dec op19(fp_X1_real, dec_X1_real);
fp_2_dec op20(fp_X1_imag, dec_X1_imag);
fp_2_dec op21(fp_X2_real, dec_X2_real);
fp_2_dec op22(fp_X2_imag, dec_X2_imag);
fp_2_dec op23(fp_X3_real, dec_X3_real);
fp_2_dec op24(fp_X3_imag, dec_X3_imag);
fp_2_dec op25(fp_X4_real, dec_X4_real);
fp_2_dec op26(fp_X4_imag, dec_X4_imag);
fp_2_dec op27(fp_X5_real, dec_X5_real);
fp_2_dec op28(fp_X5_imag, dec_X5_imag);
fp_2_dec op29(fp_X6_real, dec_X6_real);
fp_2_dec op30(fp_X6_imag, dec_X6_imag);
fp_2_dec op31(fp_X7_real, dec_X7_real);
fp_2_dec op32(fp_X7_imag, dec_X7_imag);

// Register final decimal outputs
always @(posedge clk) begin
    X0_real <= dec_X0_real; X0_imag <= dec_X0_imag;
    X1_real <= dec_X1_real; X1_imag <= dec_X1_imag;
    X2_real <= dec_X2_real; X2_imag <= dec_X2_imag;
    X3_real <= dec_X3_real; X3_imag <= dec_X3_imag;
    X4_real <= dec_X4_real; X4_imag <= dec_X4_imag;
    X5_real <= dec_X5_real; X5_imag <= dec_X5_imag;
    X6_real <= dec_X6_real; X6_imag <= dec_X6_imag;
    X7_real <= dec_X7_real; X7_imag <= dec_X7_imag;
end

endmodule