module fft_2pt #(parameter N = 32) (
    input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output  signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag
    
);

    // output signed  [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;

    wire  [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_twiddle_real, fp_twiddle_imag;
    wire   [N-1:0] rr1, ii1, ri1, ir1;
    wire  [N-1:0] t1, t2,t3,t4;
    localparam minus_one = 32'hbf800000;

wire [N-1:0] RR1,RI1,IR1,II1;


fp_mul mul1(fp_x1_real,fp_twiddle_real,rr1);
fp_mul mul2(fp_x1_imag,fp_twiddle_imag,ii1);
fp_mul mul3(fp_x1_real,fp_twiddle_imag,ri1);
fp_mul mul4(fp_x1_imag,fp_twiddle_real,ir1);


fp_mul mul00(rr1,minus_one,RR1);
fp_mul mul01(ii1,minus_one,II1);
fp_mul mul02(ri1,minus_one,RI1);
fp_mul mul03(ir1,minus_one,IR1);


dec_2_fp conv1(x0_real,fp_x0_real);
dec_2_fp conv2(x0_imag,fp_x0_imag);
dec_2_fp conv3(x1_real,fp_x1_real);
dec_2_fp conv4(x1_imag,fp_x1_imag);
dec_2_fp conv5(twiddle_real,fp_twiddle_real);
dec_2_fp conv6(twiddle_imag,fp_twiddle_imag);


 fp_add add1(fp_x0_real,rr1,t1);
 fp_add add2(t1,II1,X0_real);

 fp_add add3(fp_x0_imag,ri1,t2);
 fp_add add4(t2,ir1,X0_imag);

 fp_add add5(fp_x0_real,RR1,t3);
 fp_add add6(t3,ii1,X1_real);

 fp_add add7(fp_x0_imag,RI1,t4);
 fp_add add8(t4,IR1,X1_imag);




endmodule
