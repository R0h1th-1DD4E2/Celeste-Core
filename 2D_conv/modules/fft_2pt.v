module fft_2pt (
    input [31:0] x0_real, x0_imag, x1_real, x1_imag,
    input [31:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output [31:0] X0_real, X0_imag, X1_real, X1_imag 
);
    localparam minus_one = 32'hbf800000;
    
    wire   [31:0] rr1, ii1, ri1, ir1;
    wire   [31:0] t1, t2,t3,t4;
    wire [31:0] RR1,RI1,IR1,II1;
    
    fp_mul mul1(x1_real,twiddle_real,rr1);
    fp_mul mul2(x1_imag,twiddle_imag,ii1);
    fp_mul mul3(x1_real,twiddle_imag,ri1);
    fp_mul mul4(x1_imag,twiddle_real,ir1);

    assign RR1 = rr1 ^ (1 << 31);
    assign II1 = ii1 ^ (1 << 31);
    assign RI1 = ri1 ^ (1 << 31);
    assign IR1 = ir1 ^ (1 << 31);
    
    fp_add add1(x0_real,rr1,t1);
    fp_add add2(t1,II1,X0_real);
        
    fp_add add3(x0_imag,ri1,t2);
    fp_add add4(t2,ir1,X0_imag);
        
    fp_add add5(x0_real,RR1,t3);
    fp_add add6(t3,ii1,X1_real);
        
    fp_add add7(x0_imag,RI1,t4);
    fp_add add8(t4,IR1,X1_imag);
     
endmodule