module top_module_8pt #(parameter N = 32) (
    input clk,
    input signed  [31:0] x0_real, x0_imag, x1_real, x1_imag ,x2_real, x2_imag, x3_real, x3_imag, x4_real, x4_imag, x5_real, x5_imag,  x6_real, x6_imag, x7_real, x7_imag,
    output signed [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag, X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag,
    output signed [31:0] fp_X0_real, fp_X0_imag, fp_X1_real, fp_X1_imag, fp_X2_real, fp_X2_imag, fp_X3_real, fp_X3_imag, fp_X4_real, fp_X4_imag,
    output signed [31:0] fp_X5_real, fp_X5_imag, fp_X6_real, fp_X6_imag, fp_X7_real, fp_X7_imag

);

wire signed  [31:0]  fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_x2_real, fp_x2_imag, fp_x3_real, fp_x3_imag;
wire signed  [31:0]   fp_x4_real, fp_x4_imag, fp_x5_real, fp_x5_imag, fp_x6_real, fp_x6_imag, fp_x7_real, fp_x7_imag;


    dec_2_fp op1(x0_real, fp_x0_real);
    dec_2_fp op2(x0_imag, fp_x0_imag);

    dec_2_fp op3(x1_real, fp_x1_real);
    dec_2_fp op4(x1_imag, fp_x1_imag);

    dec_2_fp op5(x2_real, fp_x2_real);
    dec_2_fp op6(x2_imag, fp_x2_imag);

    dec_2_fp op7(x3_real, fp_x3_real);
    dec_2_fp op8(x3_imag, fp_x3_imag);

    dec_2_fp op9(x4_real, fp_x4_real);
    dec_2_fp op10(x4_imag, fp_x4_imag);

    dec_2_fp op11(x5_real, fp_x5_real);
    dec_2_fp op12(x5_imag, fp_x5_imag);

    dec_2_fp op13(x6_real, fp_x6_real);
    dec_2_fp op14(x6_imag, fp_x6_imag);

    dec_2_fp op15(x7_real, fp_x7_real);
    dec_2_fp op16(x7_imag, fp_x7_imag);

    fft8pt ins2(
        .clk(clk), 
        .xr0(fp_x0_real), .xi0(fp_x0_imag), 
        .xr1(fp_x1_real), .xi1(fp_x1_imag), 
        .xr2(fp_x2_real), .xi2(fp_x2_imag), 
        .xr3(fp_x3_real), .xi3(fp_x3_imag), 
        .xr4(fp_x4_real), .xi4(fp_x4_imag), 
        .xr5(fp_x5_real), .xi5(fp_x5_imag), 
        .xr6(fp_x6_real), .xi6(fp_x6_imag), 
        .xr7(fp_x7_real), .xi7(fp_x7_imag), 
        .Xr0(fp_X0_real), .Xi0(fp_X0_imag), 
        .Xr1(fp_X1_real), .Xi1(fp_X1_imag), 
        .Xr2(fp_X2_real), .Xi2(fp_X2_imag), 
        .Xr3(fp_X3_real), .Xi3(fp_X3_imag), 
        .Xr4(fp_X4_real), .Xi4(fp_X4_imag), 
        .Xr5(fp_X5_real), .Xi5(fp_X5_imag), 
        .Xr6(fp_X6_real), .Xi6(fp_X6_imag), 
        .Xr7(fp_X7_real), .Xi7(fp_X7_imag)
    );

    fp_2_dec op17(fp_X0_real, X0_real);
    fp_2_dec op18(fp_X0_imag, X0_imag);

    fp_2_dec op19(fp_X1_real, X1_real);
    fp_2_dec op20(fp_X1_imag, X1_imag);

    fp_2_dec op21(fp_X2_real, X2_real);
    fp_2_dec op22(fp_X2_imag, X2_imag);

    fp_2_dec op23(fp_X3_real, X3_real);
    fp_2_dec op24(fp_X3_imag, X3_imag);

    fp_2_dec op25(fp_X4_real, X4_real);
    fp_2_dec op26(fp_X4_imag, X4_imag);

    fp_2_dec op27(fp_X5_real, X5_real);
    fp_2_dec op28(fp_X5_imag, X5_imag);

    fp_2_dec op29(fp_X6_real, X6_real);
    fp_2_dec op30(fp_X6_imag, X6_imag);

    fp_2_dec op31(fp_X7_real, X7_real);
    fp_2_dec op32(fp_X7_imag, X7_imag);

    






endmodule

    