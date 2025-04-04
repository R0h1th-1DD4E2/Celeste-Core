`timescale 1ns / 1ps

module fft_tb;
   
    // Parameters
    parameter N = 32; // 32-bit fixed-point representation
    parameter CLK_PERIOD = 10;

    // Inputs
    reg clk, rst;
    reg signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag;
    reg signed [N-1:0] x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag;

    // Outputs
    wire signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag;
    wire signed [N-1:0] X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag;

    // Instantiate the DUT (Device Under Test)
    top_module_8pt DUT (
        .x0_real(x0_real), .x0_imag(x0_imag),
        .x1_real(x1_real), .x1_imag(x1_imag),
        .x2_real(x2_real), .x2_imag(x2_imag),
        .x3_real(x3_real), .x3_imag(x3_imag),
        .x4_real(x4_real), .x4_imag(x4_imag),
        .x5_real(x5_real), .x5_imag(x5_imag),
        .x6_real(x6_real), .x6_imag(x6_imag),
        .x7_real(x7_real), .x7_imag(x7_imag),
        .X0_real(X0_real), .X0_imag(X0_imag),
        .X1_real(X1_real), .X1_imag(X1_imag),
        .X2_real(X2_real), .X2_imag(X2_imag),
        .X3_real(X3_real), .X3_imag(X3_imag),
        .X4_real(X4_real), .X4_imag(X4_imag),
        .X5_real(X5_real), .X5_imag(X5_imag),
        .X6_real(X6_real), .X6_imag(X6_imag),
        .X7_real(X7_real), .X7_imag(X7_imag)
    );

    // Clock generation
    always #(CLK_PERIOD / 2) clk = ~clk;

    // Stimulus generation
    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0;

        // Test Case 1: Increasing Real Values, Imaginary Zero
        x0_real = 32'h00000000; x0_imag = 32'h00000000;
        x1_real = 32'h40400000; x1_imag = 32'h00000000;
        x2_real = 32'h40C00000; x2_imag = 32'h00000000;
        x3_real = 32'h41100000; x3_imag = 32'h00000000;
        x4_real = 32'h41400000; x4_imag = 32'h00000000;
        x5_real = 32'h41700000; x5_imag = 32'h00000000;
        x6_real = 32'h41900000; x6_imag = 32'h00000000;
        x7_real = 32'h41A80000; x7_imag = 32'h00000000;

        #100; // Wait for processing
        
        // Print Output
        $display("FFT Output Results:");
        $display("X0 = %h + j%h", X0_real, X0_imag);
        $display("X1 = %h + j%h", X1_real, X1_imag);
        $display("X2 = %h + j%h", X2_real, X2_imag);
        $display("X3 = %h + j%h", X3_real, X3_imag);
        $display("X4 = %h + j%h", X4_real, X4_imag);
        $display("X5 = %h + j%h", X5_real, X5_imag);
        $display("X6 = %h + j%h", X6_real, X6_imag);
        $display("X7 = %h + j%h", X7_real, X7_imag);
        
        #50;
        $stop;
    end

endmodule
