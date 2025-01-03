module top_module_4pt
 (
    input clk, reset,
    input [31:0] x0_real, x0_imag, x1_real, x1_imag ,x2_real, x2_imag,  x3_real, x3_imag,
    output [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag,  X3_real, X3_imag,
    output [31:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_x2_real, fp_x2_imag, fp_x3_real, fp_x3_imag
);

    // Internal wires for floating-point values
   // wire [31:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_x2_real, fp_x2_imag, fp_x3_real, fp_x3_imag;

    // Convert Decimal to Floating Point
    localparam [31:0] w2r0 = 32'h3f800000, w2i0 = 32'b0;
    localparam [31:0] w4r0 = 32'h3f800000, w4i0 = 32'b0;
    localparam [31:0] w4r1 = 32'h0, w4i1 = 32'hbf800000;

    // Instantiate decimal to floating-point converters
    dec_2_fp op1(x0_real, fp_x0_real);
    dec_2_fp op2(x0_imag, fp_x0_imag);

    dec_2_fp op3(x1_real, fp_x1_real);
    dec_2_fp op4(x1_imag, fp_x1_imag);

    dec_2_fp op5(x2_real, fp_x2_real);
    dec_2_fp op6(x2_imag, fp_x2_imag);

    dec_2_fp op7(x3_real, fp_x3_real);
    dec_2_fp op8(x3_imag, fp_x3_imag);

    // Instantiate FFT module
fft4pt ins1 (
    fp_x0_real,
    fp_x0_imag,

    fp_x1_real,
    fp_x1_imag,

    fp_x2_real,
    fp_x2_imag,

    fp_x3_real,
    fp_x3_imag,

    w2r0,
    w2i0,

    w4r0,
    w4i0,

    w4r1,
    w4i1,

    X0_real,
    X0_imag,

    X1_real,
    X1_imag,

    X2_real,
    X2_imag,
    
    X3_real,
    X3_imag
);


    

endmodule