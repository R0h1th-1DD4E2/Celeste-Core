`timescale 1ns / 1ps

module tb_top;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] x0_real, x1_real; 
    reg [31:0] x0_imag, x1_imag;
    wire [31:0] X0_real,X0_imag, X1_imag, X1_real;
    // Instantiate the DUT (Device Under Test)
    top_module dut (
        .clk(clk),
        .reset(reset),
        .x0_real(x0_real), .x1_real(x1_real), 
        .x0_imag(x0_imag), .x1_imag(x1_imag),
        .X0_real(X0_real), .X1_real(X1_real),
        .X0_imag(X0_imag), .X1_imag(X1_imag)
       
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        x0_real = 32'h00000001; x0_imag = 32'h00000002; x1_real = 32'h00000003; x1_imag = 32'h00000004;
        // x4_real = 32'h00000005; x5_real = 32'h00000006; x6_real = 32'h00000007; x7_real = 32'h00000008;
        // x0_imag = 32'h00000001; x1_imag = 32'h00000002; x2_imag = 32'h00000003; x3_imag = 32'h00000004;
        // x4_imag = 32'h00000005; x5_imag = 32'h00000006; x6_imag = 32'h00000007; x7_imag = 32'h00000008;

        // Apply reset
      //  #10 reset = 0;

        // Wait for some time to observe outputs
        #100;
$display( "X0_real = %h", X0_real);
$display( "X0_imag = %h", X0_imag);
$display( "X1_real = %h", X1_real);
$display( "X1_imag = %h", X1_imag);

        // End simulation
        //$finish;
    end

    // Monitor outputs (Optional: Based on what outputs are available)
    // Uncomment or modify this block if your `top_module` produces observable outputs.
    //initial begin
    //    $monitor("Time = %0t | Output_X0_real = %h | Output_X0_imag = %h",
    //             $time, dut.fp_X0_real, dut.fp_X0_imag);
    //end

endmodule
