module top_module_2pt (
    input clk, reset,
    input [31:0] x0_real, x0_imag, x1_real, x1_imag,
    output [31:0] X0_real, X0_imag, X1_real, X1_imag
);

    // Internal wires for floating-point values
    wire [31:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag;

    // Convert Decimal to Floating Point
    localparam [31:0] w2r0 = 32'h3f800000, w2i0 = 32'b0;

    // Instantiate decimal to floating-point converters
    dec_2_fp op1(x0_real, fp_x0_real);
    dec_2_fp op2(x0_imag, fp_x0_imag);
    dec_2_fp op3(x1_real, fp_x1_real);
    dec_2_fp op4(x1_imag, fp_x1_imag);

    // Instantiate FFT module
    fft_2pt ins1 (
        .x0_real(fp_x0_real),
        .x0_imag(fp_x0_imag),
        .x1_real(fp_x1_real),
        .x1_imag(fp_x1_imag),
        .twiddle_real(w2r0),
        .twiddle_imag(w2i0),
        .X0_real(X0_real),
        .X0_imag(X0_imag),
        .X1_real(X1_real),
        .X1_imag(X1_imag)
    );

    

endmodule
