`timescale 1ns / 1ps

module tb_add;

    // Testbench signals
    reg [31:0] a, b;       // Inputs to the FP adder
    wire [31:0] result;    // Output from the FP adder
    
    // Instantiate the floating-point adder module
    fp_add uut (
        .A(a),
        .B(b),
        .result(result)
    );
    
    // Task to display results
    task display_result;
        input [31:0] input_a, input_b, output_res;
        begin
            $display("Input A = %h, Input B = %h, Result = %h", input_a, input_b, output_res);
        end
    endtask
    
    // Initial block to apply stimulus
    initial begin
        $display("Floating Point Adder Testbench");
        $display("--------------------------------------------");
        $monitor("Time = %0dns, A = %h, B = %h, Result = %h", 
                 $time, a, b, result);

        // Test case 1: 2.0 + 3.0 (both positive)
        a = 32'h40000000;  // 2.0 in IEEE 754
        b = 32'h40400000;  // 3.0 in IEEE 754
        #10;
        display_result(a, b, result);

        // Test case 2: -2.0 + 3.0
        a = 32'hC0000000;  // -2.0
        b = 32'h40400000;  // 3.0
        #10;
        display_result(a, b, result);

        // Test case 3: 2.0 + -3.0
        a = 32'h40000000;  // 2.0
        b = 32'hC0400000;  // -3.0
        #10;
        display_result(a, b, result);

        // Test case 4: -2.0 + -3.0
        a = 32'hC0000000;  // -2.0
        b = 32'hC0400000;  // -3.0
        #10;
        display_result(a, b, result);

        // Test case 5: 3.0 + 4.0 (both positive)
        a = 32'h40400000;  // 3.0
        b = 32'h40800000;  // 4.0
        #10;
        display_result(a, b, result);

        // Test case 6: -3.0 + 4.0
        a = 32'hC0400000;  // -3.0
        b = 32'h40800000;  // 4.0
        #10;
        display_result(a, b, result);

        // Test case 7: 3.0 + -4.0
        a = 32'h40400000;  // 3.0
        b = 32'hC0800000;  // -4.0
        #10;
        display_result(a, b, result);

        // Test case 8: -3.0 + -4.0
        a = 32'hC0400000;  // -3.0
        b = 32'hC0800000;  // -4.0
        #10;
        display_result(a, b, result);

        // Test case 9: 0.7 + 0.9 (both positive)
        a = 32'h3F333333;  // 0.7
        b = 32'h3F666666;  // 0.9
        #10;
        display_result(a, b, result);

        // Test case 10: -0.7 + 0.9
        a = 32'hBF333333;  // -0.7
        b = 32'h3F666666;  // 0.9
        #10;
        display_result(a, b, result);

        // Test case 11: 0.7 + -0.9
        a = 32'h3F333333;  // 0.7
        b = 32'hBF666666;  // -0.9
        #10;
        display_result(a, b, result);

        // Test case 12: -0.7 + -0.9
        a = 32'hBF333333;  // -0.7
        b = 32'hBF666666;  // -0.9
        #10;
        display_result(a, b, result);

        // Test case 13: 2.3 + 4.5 (both positive)
        a = 32'h40126666;  // 2.3
        b = 32'h40900000;  // 4.5
        #10;
        display_result(a, b, result);

        // Test case 14: -2.3 + 4.5
        a = 32'hC0126666;  // -2.3
        b = 32'h40900000;  // 4.5
        #10;
        display_result(a, b, result);

        // Test case 15: 2.3 + -4.5
        a = 32'h40126666;  // 2.3
        b = 32'hC0900000;  // -4.5
        #10;
        display_result(a, b, result);

        // Test case 16: -2.3 + -4.5
        a = 32'hC0126666;  // -2.3
        b = 32'hC0900000;  // -4.5
        #10;
        display_result(a, b, result);

        // Test case 17: 7.8 + 0.5 (both positive)
        a = 32'h40F99999;  // 7.8
        b = 32'h3F000000;  // 0.5
        #10;
        display_result(a, b, result);

        // Test case 18: -7.8 + 0.5
        a = 32'hC0F99999;  // -7.8
        b = 32'h3F000000;  // 0.5
        #10;
        display_result(a, b, result);

        // Test case 19: 7.8 + -0.5
        a = 32'h40F99999;  // 7.8
        b = 32'hBF000000;  // -0.5
        #10;
        display_result(a, b, result);

        // Test case 20: -7.8 + -0.5
        a = 32'hC0F99999;  // -7.8
        b = 32'hBF000000;  // -0.5
        #10;
        display_result(a, b, result);

        // Test case 21: 3.0 - 3.0 (same numbers, positive)
        a = 32'h40400000;  // 3.0
        b = 32'h40400000;  // 3.0
        #10;
        display_result(a, b, result);

        // Test case 22: -3.0 + -3.0 (same numbers, negative)
        a = 32'hC0400000;  // -3.0
        b = 32'hC0400000;  // -3.0
        #10;
        display_result(a, b, result);
        
        // Test case 22: -3.0 + -3.0 (same numbers, negative)
        a = 32'h3f800000;  // -1.0
        b = 32'hbf800000;  // 1.0
        #10;
        display_result(a, b, result);

        // Test case 23: Large numbers in the 100's range
        a = 32'h42C80000;  // 100.0
        b = 32'h430E0000;  // 200.0
        #10;
        display_result(a, b, result);

        // Test case 24: Large numbers in the 1000's range
        a = 32'h447A0000;  // 1000.0
        b = 32'h44FA0000;  // 2000.0
        #10;
        display_result(a, b, result);

        // End simulation
        $display("--------------------------------------------");
        $display("Testbench completed.");
        $finish;
    end
endmodule
