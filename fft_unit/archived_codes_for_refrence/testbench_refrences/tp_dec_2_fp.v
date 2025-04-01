`timescale 1ns / 1ps


module tp_dec_2_fp;

    // Testbench signals
    reg clk, reset;
    reg [31:0] dec;
    wire [31:0] fp;

    // Instantiate the module under test
    dec_2_fp uut (
        .dec(dec),
        .ieee_out(fp)
    );

    // Clock generation
    always #10 clk = ~clk; // 10 ns clock period

    // Expected IEEE 754 values for verification
    reg [31:0] expected_fp;

    // Task to verify each test case
    task verify(
        input [31:0] input_dec,
        input [31:0] expected_fp_value
    );
        begin
            dec = input_dec; // Apply input
            expected_fp = expected_fp_value; // Set expected value
            #20; // Wait for two clock cycles to stabilize
            if (fp === expected_fp) begin
                $display("PASS: Input = %d | Expected = %h | Output = %h", input_dec, expected_fp_value, fp);
            end else begin
                $display("FAIL: Input = %d | Expected = %h | Output = %h", input_dec, expected_fp_value, fp);
            end
        end
    endtask

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        dec = 0;

        // Apply reset
        #10 reset = 0;

        // Test Cases
        verify(32'd10, 32'h41200000);      // Decimal 10 -> IEEE 754
        verify(-32'd20, 32'hC1A00000);     // Decimal -20 -> IEEE 754
        verify(32'd0, 32'h00000000);       // Decimal 0 -> IEEE 754
        verify(32'd12345, 32'h4640E400);   // Decimal 12345 -> IEEE 754
        verify(-32'd54321, 32'hc7543100);  // Decimal -54321 -> IEEE 754
        verify(32'd214748366, 32'h4d4ccccd); // Max positive 32-bit -> IEEE 754
        verify(32'h80000000, 32'hCF000000); // Min negative 32-bit -> IEEE 754

        // Finish simulation
        $stop;
    end
endmodule

