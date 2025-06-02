`timescale 1ns/1ps

module top_IFFT (
    input signed  [31:0] x0_real, x0_imag, x1_real, x1_imag ,x2_real, x2_imag, x3_real, x3_imag, x4_real, x4_imag, x5_real, x5_imag,  x6_real, x6_imag, x7_real, x7_imag,
    output signed [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag, X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag
);
wire signed [31:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag, temp_X2_real, temp_X2_imag, temp_X3_real, temp_X3_imag, 
                    temp_X4_real, temp_X4_imag, temp_X5_real, temp_X5_imag, temp_X6_real, temp_X6_imag, temp_X7_real, temp_X7_imag;

ifft8pt ins2(
    .xr0(x0_real), .xi0(x0_imag), 
    .xr1(x1_real), .xi1(x1_imag),   
    .xr2(x2_real), .xi2(x2_imag), 
    .xr3(x3_real), .xi3(x3_imag), 
    .xr4(x4_real), .xi4(x4_imag), 
    .xr5(x5_real), .xi5(x5_imag),  
    .xr6(x6_real), .xi6(x6_imag),  
    .xr7(x7_real), .xi7(x7_imag), 
    .Xr0(temp_X0_real), .Xi0(temp_X0_imag), 
    .Xr1(temp_X1_real), .Xi1(temp_X1_imag), 
    .Xr2(temp_X2_real), .Xi2(temp_X2_imag), 
    .Xr3(temp_X3_real), .Xi3(temp_X3_imag), 
    .Xr4(temp_X4_real), .Xi4(temp_X4_imag), 
    .Xr5(temp_X5_real), .Xi5(temp_X5_imag), 
    .Xr6(temp_X6_real), .Xi6(temp_X6_imag), 
    .Xr7(temp_X7_real), .Xi7(temp_X7_imag)
);

fp_mul mul0_real(temp_X0_real, 32'h3e000000, X0_real);
fp_mul mul0_imag(temp_X0_imag, 32'h3e000000, X0_imag);

fp_mul mul1_real(temp_X1_real, 32'h3e000000, X1_real);
fp_mul mul1_imag(temp_X1_imag, 32'h3e000000, X1_imag);

fp_mul mul2_real(temp_X2_real, 32'h3e000000, X2_real);
fp_mul mul2_imag(temp_X2_imag, 32'h3e000000, X2_imag);

fp_mul mul3_real(temp_X3_real, 32'h3e000000, X3_real);
fp_mul mul3_imag(temp_X3_imag, 32'h3e000000, X3_imag);

fp_mul mul4_real(temp_X4_real, 32'h3e000000, X4_real);
fp_mul mul4_imag(temp_X4_imag, 32'h3e000000, X4_imag);

fp_mul mul5_real(temp_X5_real, 32'h3e000000, X5_real);
fp_mul mul5_imag(temp_X5_imag, 32'h3e000000, X5_imag);

fp_mul mul6_real(temp_X6_real, 32'h3e000000, X6_real);
fp_mul mul6_imag(temp_X6_imag, 32'h3e000000, X6_imag);

fp_mul mul7_real(temp_X7_real, 32'h3e000000, X7_real);
fp_mul mul7_imag(temp_X7_imag, 32'h3e000000, X7_imag);

endmodule
