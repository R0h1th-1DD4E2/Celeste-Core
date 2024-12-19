`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 06:50:24 PM
// Design Name: 
// Module Name: tb_fp_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module tb_adder;

    // Testbench signals
    reg [31:0] a, b;       // Inputs to the FP adder
    wire [31:0] result;    // Output from the FP adder
    
    // Instantiate the floating-point adder module
    fp_add uut (
        .a(a),
        .b(b),
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

        // Test case 1: Adding two positive numbers
        a = 32'h40400000;  // 3.0 in IEEE 754
        b = 32'h40800000;  // 4.0 in IEEE 754
        #10;
        display_result(a, b, result);
        
        // Test case 2: Adding positive and negative numbers
        a = 32'h40400000;  // 3.0
        b = 32'hC0800000;  // -4.0
        #10;
        display_result(a, b, result);
        
        // Test case 3: Adding zero
        a = 32'h00000000;  // 0.0
        b = 32'h40800000;  // 4.0
        #10;
        display_result(a, b, result);
        
        // Test case 4: Adding two negative numbers
        a = 32'hC0400000;  // -3.0
        b = 32'hC0800000;  // -4.0
        #10;
        display_result(a, b, result);
        
        // Test case 5: Large numbers
        a = 32'h7F7FFFFF;  // Largest normalized number
        b = 32'h3F800000;  // 1.0
        #10;
        display_result(a, b, result);

        // Test case 6: Small numbers
        a = 32'h00000001;  // Smallest denormalized number
        b = 32'h3F800000;  // 1.0
        #10;
        display_result(a, b, result);

        // Test case 7: Zero + Zero
        a = 32'h00000000;  // 0.0
        b = 32'h00000000;  // 0.0
        #10;
        display_result(a, b, result);

        // End simulation
        $display("--------------------------------------------");
        $display("Testbench completed.");
        $finish;
    end
endmodule

