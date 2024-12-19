`timescale 1ns / 1ps

module tb_fp_add_3in;

    // Testbench signals
    reg [31:0] a, b, c;       // Inputs to the FP adder
    wire [31:0] result;       // Output from the FP adder
    
    // Instantiate the 3-input floating-point adder module
    fp_add_3in uut (
        .a(a),
        .b(b),
        .c(c),
        .result(result)
    );
    
    // Task to display results
    task display_result;
        input [31:0] input_a, input_b, input_c, output_res, expected_res;
        input real real_a, real_b, real_c, real_expected;
        begin
            $display("Input A = %h, Input B = %h, Input C = %h, Result = %h", input_a, input_b, input_c, output_res);
            $display("Expected = %f, Got = %f", real_expected, ieee_to_real(output_res));
            if (real_absolute(real_expected - ieee_to_real(output_res)) < 1e-6) 
                $display("Test Passed!\n");
            else 
                $display("Test Failed!\n");
        end
    endtask

    // Function to calculate absolute value of a real number
    function real real_absolute(input real value);
        begin
            real_absolute = (value < 0) ? -value : value;
        end
    endfunction

    // Function to convert IEEE 754 to real number
    function real ieee_to_real(input [31:0] ieee);
        integer exp;
        real mantissa;
        begin
            exp = ieee[30:23] - 127; // Exponent biasing
            mantissa = 1.0 + (ieee[22:0] / (2.0**23)); // Implicit 1 added
            ieee_to_real = (ieee[31] ? -1.0 : 1.0) * mantissa * (2.0**exp);
        end
    endfunction

    // Initial block to apply stimulus
    initial begin
        $display("3-Input Floating Point Adder Testbench");
        $display("--------------------------------------------");

        // Test case 1: Adding three positive numbers
        a = 32'h448da000;  // 1125.0
        b = 32'h440da000;  // 567.0
        c = 32'h42C80000;  // 100.0
        #10;
        display_result(a, b, c, result, a + b + c, ieee_to_real(a), ieee_to_real(b), ieee_to_real(c), ieee_to_real(a) + ieee_to_real(b) + ieee_to_real(c));

        // Test case 2: Adding three negative numbers
        a = 32'hC48DA000;  // -1125.0
        b = 32'hC40DA000;  // -567.0
        c = 32'hC2C80000;  // -100.0
        #10;
        display_result(a, b, c, result, a + b + c, ieee_to_real(a), ieee_to_real(b), ieee_to_real(c), ieee_to_real(a) + ieee_to_real(b) + ieee_to_real(c));

        // Test case 3: Adding positive and negative numbers
        a = 32'h448DA000;  // 1125.0
        b = 32'hC40DA000;  // -567.0
        c = 32'h42C80000;  // 100.0
        #10;
        display_result(a, b, c, result, a + b + c, ieee_to_real(a), ieee_to_real(b), ieee_to_real(c), ieee_to_real(a) + ieee_to_real(b) + ieee_to_real(c));

        // End simulation
        $display("--------------------------------------------");
        $display("Testbench completed.");
        $finish;
    end
endmodule
