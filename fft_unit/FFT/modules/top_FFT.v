module top_FFT (
    input signed  [31:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag, 
                         x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag,
    output signed [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag, 
                         X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag
);

    fft8pt ins2 (
        .xr0(x0_real), .xi0(x0_imag),
        .xr1(x1_real), .xi1(x1_imag),
        .xr2(x2_real), .xi2(x2_imag),
        .xr3(x3_real), .xi3(x3_imag),
        .xr4(x4_real), .xi4(x4_imag),
        .xr5(x5_real), .xi5(x5_imag),
        .xr6(x6_real), .xi6(x6_imag),
        .xr7(x7_real), .xi7(x7_imag),

        .Xr0(X0_real), .Xi0(X0_imag),
        .Xr1(X1_real), .Xi1(X1_imag),
        .Xr2(X2_real), .Xi2(X2_imag),
        .Xr3(X3_real), .Xi3(X3_imag),
        .Xr4(X4_real), .Xi4(X4_imag),
        .Xr5(X5_real), .Xi5(X5_imag),
        .Xr6(X6_real), .Xi6(X6_imag),
        .Xr7(X7_real), .Xi7(X7_imag)
    );

endmodule
