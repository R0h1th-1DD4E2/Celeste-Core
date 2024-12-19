`timescale 1ns / 1ps

module fp_add (
    // Floating-point (IEEE 754 format)
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
);

    // Extract
    wire sign_a, sign_b;
    wire [7:0] exp_a, exp_b;
    wire [23:0] mant_a, mant_b;

    assign sign_a = a[31];
    assign sign_b = b[31];
    assign exp_a  = a[30:23];
    assign exp_b  = b[30:23];
    assign mant_a = {1'b1, a[22:0]};
    assign mant_b = {1'b1, b[22:0]};

    // Aligning exponents
    wire [7:0] exp_diff;
    wire [23:0] aligned_mant_a, aligned_mant_b;

    assign exp_diff = (exp_a > exp_b) ? (exp_a - exp_b) : (exp_b - exp_a);
    assign aligned_mant_a = (exp_a > exp_b) ? mant_a : (mant_a >> exp_diff);
    assign aligned_mant_b = (exp_b > exp_a) ? mant_b : (mant_b >> exp_diff);

    // addition/subtraction of mantissas
    wire [24:0] mant_sum;
    wire sign_result;

    assign mant_sum = (sign_a == sign_b) ? (aligned_mant_a + aligned_mant_b) : (aligned_mant_a > aligned_mant_b) ? (aligned_mant_a - aligned_mant_b) : (aligned_mant_b - aligned_mant_a);

    assign sign_result = (sign_a == sign_b) ? sign_a : (aligned_mant_a > aligned_mant_b ? sign_a : sign_b);

    reg [7:0] normalized_exponent;
    reg [22:0] normalized_mantissa;
    reg [24:0] temp_mant;

    always @(*) begin
        temp_mant = mant_sum;

        // Normalize mantissa and adjust exponent
        normalized_exponent = (sign_a == sign_b) ? ((exp_a > exp_b) ? exp_a : exp_b) : ((exp_a > exp_b) ? exp_a + 1 : exp_b + 1);
        while (temp_mant[24] == 1'b0 && normalized_exponent > 0) begin
            temp_mant = temp_mant << 1;
            if (sign_a != sign_b)
                normalized_exponent = normalized_exponent - 1;
        end
        normalized_mantissa = temp_mant[23:1]; // Remove leading 1 bit
        // $display("aligned A = %b, aligned B = %b, mant_sum = %b", aligned_mant_a, aligned_mant_b, mant_sum);

    end
    
    assign result = {sign_result, normalized_exponent, normalized_mantissa};

endmodule
