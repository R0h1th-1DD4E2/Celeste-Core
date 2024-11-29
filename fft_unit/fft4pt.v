module fft4pt #(parameter N = 5) (
	 input clk,
    input signed [N-1:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, // Real & Imag parts of inputs
    input signed [N-1:0] w2r0, w2i0, w4r0, w4i0, w4r1, w4i1 ,                   // Twiddle factors
    output  signed [N-1:0]  tr0, ti0, tr1, ti1, tr2, ti2, tr3, ti3,Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3 // Real & Imag outputs
);


   // Internal variables for intermediate FFT stages
  //  wire signed [N-1:0] tr0, ti0, tr1, ti1, tr2, ti2, tr3, ti3;

    // First stage: Two 2-point FFTs
    fft2pt #(N) ins1 (clk,xr0, xi0,xr2, xi2, w2r0, w2i0, tr0, ti0, tr1, ti1);
    fft2pt #(N) ins2 (clk,xr1, xi1, xr3, xi3, w2r0, w2i0, tr2, ti2, tr3, ti3);

    // Second stage: Combine 2-point FFTs into a 4-point FFT
    fft2pt #(N) ins3 (clk,tr0, ti0, tr2, ti2, w4r0, w4i0, Xr0, Xi0, Xr2, Xi2);
    fft2pt #(N) ins4 (clk,tr1, ti1, tr3, ti3, w4r1, w4i1, Xr1, Xi1, Xr3, Xi3);

	 

endmodule
