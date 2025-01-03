module integrated_2pt #(parameter N = 32) (
    input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag
);
    // Internal signals for floating-point representations
    wire signed [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag;
    wire signed [N-1:0] fp_twiddle_real, fp_twiddle_imag;
    
    // Intermediate wires for complex multiplication results
    wire signed [N-1:0] rr1, ii1, ri1, ir1, II1;
    
    // Intermediate wires for addition steps
    wire signed [N-1:0] t1, t2, T1, T2;
    wire signed [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;

    // Convert inputs to floating-point representation
    dec_2_fp dec2fp_x0_real (x0_real, fp_x0_real);
    dec_2_fp dec2fp_x0_imag (x0_imag, fp_x0_imag);
    dec_2_fp dec2fp_x1_real (x1_real, fp_x1_real);
    dec_2_fp dec2fp_x1_imag (x1_imag, fp_x1_imag);
    dec_2_fp dec2fp_twiddle_real (twiddle_real, fp_twiddle_real);
    dec_2_fp dec2fp_twiddle_imag (twiddle_imag, fp_twiddle_imag);
    
    // Complex multiplication
    fp_mul first  (fp_x1_real, fp_twiddle_real, rr1); // cx
    fp_mul second (fp_x1_imag, fp_twiddle_imag, ii1); // dy
    fp_mul third  (fp_x1_real, fp_twiddle_imag, ri1); // cy
    fp_mul fourth (fp_x1_imag, fp_twiddle_real, ir1); // dx
    
    fp_mul mul01 (ii1, -1, II1);
    fp_mul mul04 (t1, -1, T1);
    fp_mul mul05 (t2, -1, T2);

    // Butterfly computation using intermediate wires
    fp_add add1  (rr1, II1, t1);    // l = cx - dy
    fp_add add2  (t1, fp_x0_real, temp_X0_real);   // A + l
    fp_add add3  (T1, fp_x0_real, temp_X1_real);  // A - l

    fp_add add4  (ri1, ir1, t2);    // m = cy + dx
    fp_add add5  (t2, fp_x0_imag, temp_X0_imag);   // B + m
    fp_add add6  (T2, fp_x0_imag, temp_X1_imag);  // B - m
    
    // Convert results back to decimal representation
    fp_2_dec fp2dec_X0_real (temp_X0_real, X0_real);
    fp_2_dec fp2dec_X0_imag (temp_X0_imag, X0_imag);
    fp_2_dec fp2dec_X1_real (temp_X1_real, X1_real);
    fp_2_dec fp2dec_X1_imag (temp_X1_imag, X1_imag);

endmodule
