module ifft8pt (
    
    input [31:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, xr4, xi4, xr5, xi5, xr6, xi6, xr7, xi7,
    output [31:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3,
    output [31:0] Xr4, Xi4, Xr5, Xi5, Xr6, Xi6, Xr7, Xi7
    
);
// w4i1 should be 32'h3f800000
// w8i2 should be 32'h3f800000
// w8i1 should be 32'h3f350481
// w8i3 should be 32'h3f350481
    parameter [31:0] w2r0 = 32'h3f800000, w2i0 = 32'h0;
    parameter [31:0] w4r0 = 32'h3f800000, w4i0 = 32'h0, w4r1 = 32'h0, w4i1 = 32'h3f800000;
    parameter [31:0] w8r0 = 32'h3f800000, w8i0 = 32'h0, w8r2 = 32'h0, w8i2 = 32'h3f800000;
    parameter [31:0] w8r1 = 32'h3f350481, w8i1 = 32'h3f350481;
    parameter [31:0] w8r3 = 32'hbf350481, w8i3 = 32'h3f350481;


    wire [31:0] mr0, mi0, mr1, mi1, mr2, mi2, mr3, mi3;
    wire [31:0] mr4, mi4, mr5, mi5, mr6, mi6, mr7, mi7;

    // First stage: Two 4-point FFTs
    ifft4pt ifft4_1 (  
         
        .xr0(xr0), .xi0(xi0), .xr1(xr2), .xi1(xi2),
        .xr2(xr4), .xi2(xi4), .xr3(xr6), .xi3(xi6),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0),
        .w4r1(w4r1), .w4i1(w4i1),
        .Xr0(mr0), .Xi0(mi0), .Xr1(mr1), .Xi1(mi1),
        .Xr2(mr2), .Xi2(mi2), .Xr3(mr3), .Xi3(mi3)
    );


    ifft4pt ifft4_2 (  
        
        .xr0(xr1), .xi0(xi1), .xr1(xr3), .xi1(xi3),
        .xr2(xr5), .xi2(xi5), .xr3(xr7), .xi3(xi7),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0),
        .w4r1(w4r1), .w4i1(w4i1),
        .Xr0(mr4), .Xi0(mi4), .Xr1(mr5), .Xi1(mi5),
        .Xr2(mr6), .Xi2(mi6), .Xr3(mr7), .Xi3(mi7)
    );

    // Final stage: Combine results with twiddle factors
    ifft_2pt ifft2_1 (.x0_real(mr0), .x0_imag(mi0), .x1_real(mr4), .x1_imag(mi4),
                        .twiddle_real(w8r0), .twiddle_imag(w8i0),
                        .X0_real(Xr0), .X0_imag(Xi0), .X1_real(Xr4), .X1_imag(Xi4));

    ifft_2pt ifft2_2 ( .x0_real(mr1), .x0_imag(mi1), .x1_real(mr5), .x1_imag(mi5),
                        .twiddle_real(w8r1), .twiddle_imag(w8i1),
                        .X0_real(Xr1), .X0_imag(Xi1), .X1_real(Xr5), .X1_imag(Xi5));

    ifft_2pt ifft2_3 ( .x0_real(mr2), .x0_imag(mi2), .x1_real(mr6), .x1_imag(mi6),
                        .twiddle_real(w8r2), .twiddle_imag(w8i2),
                        .X0_real(Xr2), .X0_imag(Xi2), .X1_real(Xr6), .X1_imag(Xi6));

    ifft_2pt ifft2_4 ( .x0_real(mr3), .x0_imag(mi3), .x1_real(mr7), .x1_imag(mi7),
                        .twiddle_real(w8r3), .twiddle_imag(w8i3),
                        .X0_real(Xr3), .X0_imag(Xi3), .X1_real(Xr7), .X1_imag(Xi7));

endmodule

 
