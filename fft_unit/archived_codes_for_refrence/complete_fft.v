module fft_2pt #(parameter N = 32) (
    input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output  signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag,
    output signed  [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_twiddle_real, fp_twiddle_imag,
    output signed  [N-1:0] rr1, ii1, ri1, ir1,
    output signed  [N-1:0] t1, t2,t3,t4,
   // output signed  [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag
);
    // always @(posedge clk) begin
        // // Perform the 2-point DFT

        // X0_real=(x0_real+(x1_real*twiddle_real)-(x1_imag*twiddle_imag));  rr1 -ii1
        // X0_imag=(x0_imag+(x1_real*twiddle_imag)+(x1_imag*twiddle_real));  ri1 +ir1
        
        // X1_real=(x0_real-(x1_real*twiddle_real)+(x1_imag*twiddle_imag));
        // X1_imag=(x0_imag-(x1_real*twiddle_imag)-(x1_imag*twiddle_real));
        
       
   // end
    // output signed  [N-1:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_twiddle_real, fp_twiddle_imag;
    // output signed  [N-1:0] rr1, ii1, ri1, ir1;
    // output signed  [N-1:0] t1, t2,t3,t4;
    // output signed  [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;
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


dec_2_fp abc(x0_real,fp_x0_real);
dec_2_fp c(x0_imag,fp_x0_imag);
dec_2_fp sabc(x1_real,fp_x1_real);
dec_2_fp aabc(x1_imag,fp_x1_imag);
dec_2_fp ghabc(twiddle_real,fp_twiddle_real);
dec_2_fp aggrg(twiddle_imag,fp_twiddle_imag);


//  fp_add add1(fp_x0_real,rr1,t1);
//  fp_add add2(t1,-ii1,temp_X0_real);

//  fp_add add3(fp_x0_imag,ri1,t2);
//  fp_add add4(t2,ir1,temp_X0_imag);

//  fp_add add5(fp_x0_real,-rr1,t3);
//  fp_add add6(t3,ii1,temp_X1_real);

//  fp_add add7(fp_x0_imag,-ri1,t4);
//  fp_add add8(t4,-ir1,temp_X1_imag);

 fp_add add1(fp_x0_real,rr1,t1);
 fp_add add2(t1,II1,X0_real);

 fp_add add3(fp_x0_imag,ri1,t2);
 fp_add add4(t2,ir1,X0_imag);

 fp_add add5(fp_x0_real,RR1,t3);
 fp_add add6(t3,ii1,X1_real);

 fp_add add7(fp_x0_imag,RI1,t4);
 fp_add add8(t4,IR1,X1_imag);










// always@(*) begin
// $display("fp_x0_real= %h",fp_x0_real);

// $display("rr1= %h",rr1);
// $display("t1= %h",t1);
//$display("temp_X0_real=%h",temp_X0_real);
// $display("t2=%h",t2);
// $display("temp_X0_imag=%h",temp_X0_imag);
// $display("t3=%h",t3);
// $display("temp_X1_real=%h",temp_X1_real);
// $display("t4=%h",t4);
// $display("temp_X1_imag=%h",temp_X1_imag);
//  end


endmodule
