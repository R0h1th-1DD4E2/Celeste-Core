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
    wire signed [N-1:0] rr1, ii1, ri1, ir1;
    
    // Intermediate wires for addition steps
    wire signed [N-1:0] t1, t2, t3, t4;
    wire signed [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;

    reg signed [N-1:0] FP_X0_REAL, FP_X0_IMAG, FP_X1_REAL, FP_X1_IMAG;
    reg signed [N-1:0] FP_TWIDDLE_REAL, FP_TWIDDLE_IMAG;
    
    // Intermediate registers for complex multiplication results
    reg signed [N-1:0] RR1, II1, RI1, IR1;
    
    // Intermediate registers for addition steps
    reg signed [N-1:0] T1, T2, T3, T4;
    reg signed [N-1:0] TEMP_X0_REAL, TEMP_X0_IMAG, TEMP_X1_REAL, TEMP_X1_IMAG;

    
    // Convert inputs to floating-point representation
    dec_2_fp dec2fp_x0_real ((x0_real), (fp_x0_real));
    dec_2_fp dec2fp_x0_imag ((x0_imag), (fp_x0_imag));
    dec_2_fp dec2fp_x1_real ((x1_real), (fp_x1_real));
    dec_2_fp dec2fp_x1_imag ((x1_imag), (fp_x1_imag));
    dec_2_fp dec2fp_twiddle_real ((twiddle_real), (fp_twiddle_real));
    dec_2_fp dec2fp_twiddle_imag ((twiddle_imag), (fp_twiddle_imag));
    
    // Complex multiplication
    fp_mul first  (.a(FP_X0_REAL), .b(FP_TWIDDLE_REAL), .result(rr1));
    fp_mul second (.a(FP_X0_IMAG), .b(FP_TWIDDLE_IMAG), .result(ii1));
    fp_mul third  (.a(FP_X1_REAL), .b(FP_TWIDDLE_IMAG), .result(ri1));
    fp_mul fourth (.a(FP_X1_IMAG), .b(FP_TWIDDLE_REAL), .result(ir1));
    
    // Butterfly computation using intermediate wires
    fp_add add1  (.a(FP_X0_REAL), .b(RR1), .result(t1));
    fp_add add2  (.a(T1), .b(-II1), .result(temp_X0_real));
    fp_add add3  (.a(FP_X0_IMAG), .b(RI1), .result(t2));
    fp_add add4  (.a(T2), .b(IR1), .result(temp_X0_imag));
    fp_add add5  (.a(FP_X0_REAL), .b(-RR1), .result(t3));
    fp_add add6  (.a(T3), .b(II1), .result(temp_X1_real));
    fp_add add7  (.a(FP_X0_IMAG), .b(-RI1), .result(t4));
    fp_add add8  (.a(T4), .b(-IR1), .result(temp_X1_imag));
    
    // Convert results back to decimal representation
    fp_2_dec fp2dec_X0_real ((TEMP_X0_REAL), (X0_real));
    fp_2_dec fp2dec_X0_imag ((TEMP_X0_IMAG), (X0_imag));
    fp_2_dec fp2dec_X1_real ((TEMP_X1_REAL), (X1_real));
    fp_2_dec fp2dec_X1_imag ((TEMP_X1_IMAG), (X1_imag));


    always @(posedge clk ) begin
        FP_X0_REAL <= fp_x0_real;
        FP_X0_IMAG <= fp_x0_imag;
        FP_X1_REAL <= fp_x1_real;
        FP_X1_IMAG <= fp_x1_imag;

        FP_TWIDDLE_REAL <= fp_twiddle_real;
        FP_TWIDDLE_IMAG <= fp_twiddle_imag;

        RR1 <= rr1;
        II1 <= ii1;
        RI1 <= ri1;
        IR1 <= ir1;

        T1 <= t1;
        T2 <= t2;
        T3 <= t3;
        T4 <= t4;

        TEMP_X0_REAL <= temp_X0_real;
        TEMP_X0_IMAG <= temp_X0_imag;
        TEMP_X1_REAL <= temp_X1_real;
        TEMP_X1_IMAG <= temp_X1_imag;

    end

endmodule