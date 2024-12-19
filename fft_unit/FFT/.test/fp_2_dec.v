`timescale 1ns / 1ps

module fp_2_dec(
    input [31:0] ieee_in,      // IEEE 754 floating-point input
    output reg [31:0] dec_out  // Signed integer output
);

    reg sign;
    reg [7:0] exponent;
    reg [22:0] mantissa;
    reg [31:0] abs_value;
    reg [7:0] effective_exponent;

    always @(*) begin
        // Extract sign, exponent, and mantissa from ieee_in
        sign = ieee_in[31];
        exponent = ieee_in[30:23];
        mantissa = ieee_in[22:0];

        // Handle special cases: zero 
        if (ieee_in == 8'd0) begin
            dec_out = 32'b0; // Zero (treated as zero)
        end else begin
            // Calculate the effective exponent
            effective_exponent = exponent - 8'd127;
            
            if (effective_exponent >= 23) begin
                // Shift left if exponent is large 
                abs_value = {1'b1,mantissa[22:1]} << (effective_exponent - 22);
            end else if (effective_exponent < 23) begin
                // Shift right if exponent is small
                abs_value = {1'b1,mantissa[22:1]} >> (22 - effective_exponent);
            end
            
            // Apply the sign to get the final output
            dec_out = sign ? -abs_value : abs_value;
        end
    end
endmodule
