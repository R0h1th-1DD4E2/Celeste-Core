module ifft4pt (
=
    input signed [31:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, // Real & Imag parts of inputs
    input signed [31:0] w2r0, w2i0, w4r0, w4i0, w4r1, w4i1 ,                   // Twiddle factors
    output  signed [31:0]  Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3 // Real & Imag outputs
);


   // Internal variables for intermediate FFT stages
   wire signed [31:0] tr0, ti0, tr1, ti1, tr2, ti2, tr3, ti3;

    // First stage: Two 2-point FFTs
    ifft_2pt ins1 (xr0, xi0,xr2, xi2, w2r0, w2i0, tr0, ti0, tr1, ti1);
    ifft_2pt ins2 (xr1, xi1, xr3, xi3, w2r0, w2i0, tr2, ti2, tr3, ti3);

    // Second stage: Combine 2-point FFTs into a 4-point FFT
    ifft_2pt ins3 (tr0, ti0, tr2, ti2, w4r0, w4i0, Xr0, Xi0, Xr2, Xi2);
    ifft_2pt ins4 (tr1, ti1, tr3, ti3, w4r1, w4i1, Xr1, Xi1, Xr3, Xi3);

	 

endmodule