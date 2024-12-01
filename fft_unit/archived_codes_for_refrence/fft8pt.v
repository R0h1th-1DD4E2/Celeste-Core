module fft8pt #(parameter N = 16) (
    input clk,
    // Input signals - real and imaginary parts
    input signed [N-1:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, xr4, xi4, xr5, xi5, xr6, xi6, xr7, xi7,
    // Twiddle factors
    input signed [N-1:0] w2r0, w2i0,                    // For 2-point FFTs
    input signed [N-1:0] w4r0, w4i0, w4r1, w4i1,       // For 4-point FFTs
    input signed [N-1:0] w8r0, w8i0, w8r1, w8i1, w8r2, w8i2, w8r3, w8i3, // For 8-point combination
    // Output signals - real and imaginary parts
    output signed [N-1:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3,
    output signed [N-1:0] Xr4, Xi4, Xr5, Xi5, Xr6, Xi6, Xr7, Xi7
);

    // Internal wires for intermediate stages
    wire signed [N-1:0] tr0, ti0, tr1, ti1, tr2, ti2, tr3, ti3;
    wire signed [N-1:0] tr4, ti4, tr5, ti5, tr6, ti6, tr7, ti7;
    wire signed [N-1:0] mr0, mi0, mr1, mi1, mr2, mi2, mr3, mi3;
    wire signed [N-1:0] mr4, mi4, mr5, mi5, mr6, mi6, mr7, mi7;

    // First stage: Two 4-point FFTs
    fft4pt #(N) fft4_1 (  
        .clk(clk),
        .xr0(xr0), .xi0(xi0), .xr1(xr1), .xi1(xi1),
        .xr2(xr2), .xi2(xi2), .xr3(xr3), .xi3(xi3),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0),
        .w4r1(w4r1), .w4i1(w4i1),
        .tr0(tr0), .ti0(ti0), .tr1(tr1), .ti1(ti1),
        .tr2(tr2), .ti2(ti2), .tr3(tr3), .ti3(ti3),
        .Xr0(mr0), .Xi0(mi0), .Xr1(mr1), .Xi1(mi1),
        .Xr2(mr2), .Xi2(mi2), .Xr3(mr3), .Xi3(mi3)
    );

    fft4pt #(N) fft4_2 (
        .clk(clk),
        .xr0(xr4), .xi0(xi4), .xr1(xr5), .xi1(xi5),
        .xr2(xr6), .xi2(xi6), .xr3(xr7), .xi3(xi7),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0),
        .w4r1(w4r1), .w4i1(w4i1),
        .tr0(tr4), .ti0(ti4), .tr1(tr5), .ti1(ti5),
        .tr2(tr6), .ti2(ti6), .tr3(tr7), .ti3(ti7),
        .Xr0(mr4), .Xi0(mi4), .Xr1(mr5), .Xi1(mi5),
        .Xr2(mr6), .Xi2(mi6), .Xr3(mr7), .Xi3(mi7)
    );

    // Final stage: Combine results with twiddle factors
    fft2pt #(N) fft2_1 (.clk(clk), .x0_real(mr0), .x0_imag(mi0), .x1_real(mr4), .x1_imag(mi4),
                        .twiddle_real(w8r0), .twiddle_imag(w8i0),
                        .X0_real(Xr0), .X0_imag(Xi0), .X1_real(Xr4), .X1_imag(Xi4));

    fft2pt #(N) fft2_2 (.clk(clk), .x0_real(mr1), .x0_imag(mi1), .x1_real(mr5), .x1_imag(mi5),
                        .twiddle_real(w8r1), .twiddle_imag(w8i1),
                        .X0_real(Xr1), .X0_imag(Xi1), .X1_real(Xr5), .X1_imag(Xi5));

    fft2pt #(N) fft2_3 (.clk(clk), .x0_real(mr2), .x0_imag(mi2), .x1_real(mr6), .x1_imag(mi6),
                        .twiddle_real(w8r2), .twiddle_imag(w8i2),
                        .X0_real(Xr2), .X0_imag(Xi2), .X1_real(Xr6), .X1_imag(Xi6));

    fft2pt #(N) fft2_4 (.clk(clk), .x0_real(mr3), .x0_imag(mi3), .x1_real(mr7), .x1_imag(mi7),
                        .twiddle_real(w8r3), .twiddle_imag(w8i3),
                        .X0_real(Xr3), .X0_imag(Xi3), .X1_real(Xr7), .X1_imag(Xi7));

endmodule