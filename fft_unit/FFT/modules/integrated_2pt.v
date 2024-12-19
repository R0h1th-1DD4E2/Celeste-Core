module integrated_2pt #(parameter N = 16) (
    //input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag
);
    // Internal signals for floating-point representations
    wire signed [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag;
    wire signed [N-1:0] fp_twiddle_real, fp_twiddle_imag;
    wire signed [N-1:0] fp_X0_real, fp_X0_imag, fp_X1_real, fp_X1_imag;
    
    // Intermediate wires for complex multiplication results
    wire signed [N-1:0] RR1, II1, RI1, IR1;
    
    // Intermediate wires for addition steps
    wire signed [N-1:0] t1, t2, t3, t4;
    wire signed [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;
    
    // Convert inputs to floating-point representation
    dec_2_fp dec2fp_x0_real ((x0_real), (fp_x0_real));
    dec_2_fp dec2fp_x0_imag ((x0_imag), (fp_x0_imag));
    dec_2_fp dec2fp_x1_real ((x1_real), (fp_x1_real));
    dec_2_fp dec2fp_x1_imag ((x1_imag), (fp_x1_imag));
    dec_2_fp dec2fp_twiddle_real ((twiddle_real), (fp_twiddle_real));
    dec_2_fp dec2fp_twiddle_imag ((twiddle_imag), (fp_twiddle_imag));
    
    // Complex multiplication
    fp_mul first  (.a(fp_x1_real), .b(fp_twiddle_real), .result(RR1));
    fp_mul second (.a(fp_x1_imag), .b(fp_twiddle_imag), .result(II1));
    fp_mul third  (.a(fp_x1_real), .b(fp_twiddle_imag), .result(RI1));
    fp_mul fourth (.a(fp_x1_imag), .b(fp_twiddle_real), .result(IR1));
    
    // Butterfly computation using intermediate wires
    fp_add add1  (.a(fp_x0_real), .b(RR1), .result(t1));
    fp_add add2  (.a(t1), .b(-II1), .result(temp_X0_real));
    fp_add add3  (.a(fp_x0_imag), .b(RI1), .result(t2));
    fp_add add4  (.a(t2), .b(IR1), .result(temp_X0_imag));
    fp_add add5  (.a(fp_x0_real), .b(-RR1), .result(t3));
    fp_add add6  (.a(t3), .b(II1), .result(temp_X1_real));
    fp_add add7  (.a(fp_x0_imag), .b(-RI1), .result(t4));
    fp_add add8  (.a(t4), .b(-IR1), .result(temp_X1_imag));
    
    // Convert results back to decimal representation
    fp_2_dec fp2dec_X0_real ((temp_X0_real), (X0_real));
    fp_2_dec fp2dec_X0_imag ((temp_X0_imag), (X0_imag));
    fp_2_dec fp2dec_X1_real ((temp_X1_real), (X1_real));
    fp_2_dec fp2dec_X1_imag ((temp_X1_imag), (X1_imag));

endmodule