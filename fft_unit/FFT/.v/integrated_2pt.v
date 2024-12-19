// Code your design here
module integrated_2pt #(parameter N = 16) (
    input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output reg signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag
);
    // Internal signals for floating-point representations
    wire signed [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag;
    wire signed [N-1:0] fp_twiddle_real, fp_twiddle_imag;
    wire signed [N-1:0] fp_X0_real, fp_X0_imag, fp_X1_real, fp_X1_imag;

    // Convert inputs to floating-point representation
    dec_2_fp dec2fp_x0_real (.in(x0_real), .out(fp_x0_real));
    dec_2_fp dec2fp_x0_imag (.in(x0_imag), .out(fp_x0_imag));
    dec_2_fp dec2fp_x1_real (.in(x1_real), .out(fp_x1_real));
    dec_2_fp dec2fp_x1_imag (.in(x1_imag), .out(fp_x1_imag));
    dec_2_fp dec2fp_twiddle_real (.in(twiddle_real), .out(fp_twiddle_real));
    dec_2_fp dec2fp_twiddle_imag (.in(twiddle_imag), .out(fp_twiddle_imag));
  
      reg signed [N-1:0] RR1,II1,RI1,IR1;
  
      fp_mult first  (fp_x1_real , fp_twiddle_real, RR1);
      fp_mult second (fp_x1_imag , fp_twiddle_imag, II1);
      fp_mult third  (fp_x1_real , fp_twiddle_imag, RI1);
      fp_mult fourth (fp_x1_imag , fp_twiddle_real, IR1);

//     
//         // Perform the 2-point DFT in floating-point
//       fp_X0_real = fp_x0_real + ( RR1) - (II1);
//       fp_X0_imag = fp_x0_imag +(RI1) + (IR1);

//       fp_X1_real = fp_x0_real - (RR1) + (II1);
//       fp_X1_imag = fp_x0_imag - (RI1) - (IR1);
  
  always @(posedge clk) begin   
  fp_add one  (fp_x0_real,   RR1,  II1, fp_X0_real);
  fp_add two  (fp_x0_imag ,  RI1,  IR1, fp_X0_imag);
  fp_add three(fp_x0_real,  -RR1,  II1, fp_X1_real);
  fp_add four (fp_x0_imag,  RI1,   IR1, fp_X1_imag);
                    

        // Convert results back to decimal representation
        fp_2_dec fp2dec_X0_real (.in(fp_X0_real), .out(X0_real));
        fp_2_dec fp2dec_X0_imag (.in(fp_X0_imag), .out(X0_imag));
        fp_2_dec fp2dec_X1_real (.in(fp_X1_real), .out(X1_real));
        fp_2_dec fp2dec_X1_imag (.in(fp_X1_imag), .out(X1_imag));
    end
endmodule
