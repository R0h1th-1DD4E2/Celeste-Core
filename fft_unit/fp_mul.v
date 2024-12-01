module fp_mul (
     // Floating-point (IEEE 754 format)
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);
    wire sign_a, sign_b, sign_result;
    wire [7:0] exponent_a, exponent_b, exponent_result;
    wire [23:0] mantissa_a, mantissa_b, mantissa_result;
    wire [47:0] mantissa_mult;

    assign sign_a = a[31];
    assign sign_b = b[31];
    assign sign_result = sign_a ^ sign_b;  // XOR to find the sign

    assign exponent_a = a[30:23];
    assign exponent_b = b[30:23];
    assign exponent_result = exponent_a + exponent_b - 8'd127;  // 2^a * 2^b = 2^(a+b)

    assign mantissa_a = {1'b1, a[22:0]};  // Implicit representation 
    assign mantissa_b = {1'b1, b[22:0]};

    assign mantissa_mult = mantissa_a * mantissa_b; // Multiply mantissas

    wire [22:0] normalized_mantissa;
    wire [7:0] normalized_exponent;
    assign normalized_mantissa = (mantissa_mult[47]) ? mantissa_mult[46:24] : mantissa_mult[45:23]; // If MSB is 1 then normalize 
    assign normalized_exponent = (mantissa_mult[47]) ? exponent_result + 1 : exponent_result;
    
    assign result = {sign_result, normalized_exponent, normalized_mantissa}; // result => [31](sign) + [30 : 23](exponent) + [22 : 0](Mantissa)
endmodule
