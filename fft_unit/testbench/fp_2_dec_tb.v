`timescale 1ns / 1ps

module fp_2_dec_tb;

    // Testbench signals
    reg [31:0] fp;          // IEEE 754 floating-point input
    wire [31:0] dec;        // Converted decimal output

    // Instantiate the module under test
    fp_2_dec uut(
       fp,dec
    );

    // Task to verify test cases
    task verify(
        input [31:0] ieee754_input,  // Input in IEEE 754 format
        input [31:0] expected_dec    // Expected decimal output
    );
        begin
            fp = ieee754_input; // Apply input
            #10; // Wait for 10 ns to stabilize output
            if (dec === expected_dec) begin
                $display("PASS: Input = %h | Expected = %d | Output = %d", ieee754_input, expected_dec, dec);
            end else begin
                $display("FAIL: Input = %h | Expected = %d | Output = %d", ieee754_input, expected_dec, dec);
            end
        end
    endtask

    // Test procedure
    initial begin
        $display("Starting Testbench...");

        // Test Cases
        verify(32'h41200000, 10);       // IEEE 754 for 10.0
        verify(32'hC1A00000, -20);      // IEEE 754 for -20.0
        verify(32'h00000000, 0);        // IEEE 754 for 0.0
        verify(32'h41C80000, 25);       // IEEE 754 for 25.0
        verify(32'hC2480000, -50);      // IEEE 754 for -50.0
        verify(32'h47C35000, 100000);   // IEEE 754 for 100000.0
        verify(32'hC7C35000, -100000);  // IEEE 754 for -100000.0

        // Test edge cases
        verify(32'h7F800000, 32'h7FFFFFFF); // IEEE 754 for positive infinity
        verify(32'hFF800000, 32'h80000000); // IEEE 754 for negative infinity
        verify(32'h7FC00000, 0);            // IEEE 754 for NaN (expect 0 or default handling)

        $display("Testbench Completed.");
        $stop;
    end
endmodule
