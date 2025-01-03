`timescale 1ns / 1ps

module fp_div(
    // Floating-point (IEEE 754 format)
    // result = a / b
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

    wire sign_a, sign_b, sign_result;
    wire [7:0] exponent_a, exponent_b, exponent_result;
    wire [23:0] mantissa_a, mantissa_b;
    wire [47:0] mantissa_div;
    wire [22:0] normalized_mantissa;
    wire [7:0] normalized_exponent;

    // Extracting the sign, exponent, and mantissa
    assign sign_a = a[31];
    assign sign_b = b[31];
    assign sign_result = sign_a ^ sign_b;

    assign exponent_a = a[30:23];
    assign exponent_b = b[30:23];

    // Adding implicit 1 to form IEEE 754 format
    assign mantissa_a = {1'b1, a[22:0]}; 
    assign mantissa_b = {1'b1, b[22:0]};

    // exponent = exponent_a - exponent_b + bias (127)
    assign exponent_result = exponent_a - exponent_b + 8'd127;

    // Perform division on the mantissas
    assign mantissa_div = (mantissa_a << 23) / mantissa_b; // Shifting left for precision before dividing

    // Normalizing the result
    assign normalized_mantissa = mantissa_div[23] ? mantissa_div[22:0] : (mantissa_div[22:0] << 1);
    assign normalized_exponent = mantissa_div[23] ? exponent_result : exponent_result - 1;
    
    

    wire Zero=(a==0)||(b==0);
    assign result =Zero?0:( {sign_result, normalized_exponent, normalized_mantissa});

endmodule

