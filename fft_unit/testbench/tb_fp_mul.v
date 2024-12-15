`timescale 1ns / 1ps

module tb_fp_mul;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Output
    wire [31:0] result;
    
    // Instantiate the Unit Under Test (UUT)
    fp_mul uut (
        .a(a),
        .b(b),
        .result(result)
    );
    
    // Task to convert IEEE 754 floating-point value to real value
    task ieee_to_real;
        input [31:0] fp;  // IEEE 754 floating-point value (32-bit)
        output real value;  // Converted real value
    
        reg sign;
        reg [7:0] exponent;
        reg [22:0] mantissa_bits;
        real mantissa;
        integer i;
    
        begin
            // Extract the sign, exponent, and mantissa from the IEEE 754 format
            sign = fp[31];               // Sign bit
            exponent = fp[30:23];        // Exponent (8 bits)
            mantissa_bits = fp[22:0];    // Mantissa (23 bits)
    
            // Calculate the real value of the mantissa (1 + fractional part)
            mantissa = 1.0;  // The implicit leading 1 for normalized numbers
            for (i = 0; i < 23; i = i + 1) begin
                if (mantissa_bits[i] == 1) begin
                    mantissa = mantissa + (2.0 ** -(23 - i));  // Add fractional part
                end
            end
    
            // Calculate the exponent (subtract bias of 127)
            value = (sign ? -1 : 1) * mantissa * (2.0 ** (exponent - 127));  // Apply the formula
    
        end
    endtask

    // Task to display IEEE 754 floating-point value in human-readable form
    task display_fp(input [31:0] fp);
        reg [7:0] exponent;
        reg [22:0] mantissa_bits;
        reg sign;
        real value;

        begin
            sign = fp[31];
            exponent = fp[30:23] - 127;  // Decode exponent (subtract bias)
            mantissa_bits = fp[22:0];  // Decode mantissa (without the implicit 1)
            
            // Convert IEEE 754 floating-point value to real
            ieee_to_real(fp, value);
            
            $display("Sign: %b, Exponent: %d, Mantissa: %h => Value: %f", sign, exponent, mantissa_bits, value);
        end
    endtask

    initial begin
        // Initialize Inputs
        $display("Testing Floating-Point Multiplication");

        // Test Case 1: Multiply 2.5 * 4.0
        a = 32'b01000000001000000000000000000000;  // 2.5 in IEEE 754
        b = 32'b01000000100000000000000000000000;  // 4.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        // Test Case 2: Multiply -1.5 * 3.0
        a = 32'b10111111110000000000000000000000;  // -1.5 in IEEE 754
        b = 32'b01000000010000000000000000000000;  // 3.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        // Test Case 3: Multiply 0.5 * -2.0
        a = 32'b00111111000000000000000000000000;  // 0.5 in IEEE 754
        b = 32'b11000000000000000000000000000000;  // -2.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        // Test Case 4: Multiply 0.0 * 5.0
        a = 32'b00000000000000000000000000000000;  // 0.0 in IEEE 754
        b = 32'b01000000101000000000000000000000;  // 5.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        // Test Case 5: Multiply Infinity * 1.0
        a = 32'b01111111100000000000000000000000;  // Infinity in IEEE 754
        b = 32'b00111111100000000000000000000000;  // 1.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        // Test Case 6: Multiply NaN * 1.0
        a = 32'b01111111110000000000000000000000;  // NaN in IEEE 754
        b = 32'b00111111100000000000000000000000;  // 1.0 in IEEE 754
        #10;
        $display("Input A:");
        display_fp(a);
        $display("Input B:");
        display_fp(b);
        $display("Result:");
        display_fp(result);
        $display("");

        $stop;  // End simulation
    end
endmodule
