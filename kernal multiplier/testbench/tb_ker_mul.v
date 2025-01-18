`timescale 1ns / 1ps
module tb_ker_mul;

    // Testbench parameters
    //parameter N = 32;

    // Declare the signals to be used
    reg clk;
    reg rst;
    reg in_valid;
    wire in_ready;
    wire out_valid;
    reg out_ready;
    
    reg [31:0] x0_real, x0_imag;
    reg [31:0] x1_real, x1_imag;
    reg [31:0] x2_real, x2_imag;
    reg [31:0] x3_real, x3_imag;
    reg [31:0] x4_real, x4_imag;
    reg [31:0] x5_real, x5_imag;
    reg [31:0] x6_real, x6_imag;
    reg [31:0] x7_real, x7_imag;
    reg [31:0] x8_real, x8_imag;
    reg [31:0] x9_real, x9_imag;
    reg [31:0] x10_real, x10_imag;
    reg [31:0] x11_real, x11_imag;
    reg [31:0] x12_real, x12_imag;
    reg [31:0] x13_real, x13_imag;
    reg [31:0] x14_real, x14_imag;
    reg [31:0] x15_real, x15_imag;

    wire [31:0] X0_real, X0_imag;
    wire [31:0] X1_real, X1_imag;
    wire [31:0] X2_real, X2_imag;
    wire [31:0] X3_real, X3_imag;
    wire [31:0] X4_real, X4_imag;
    wire [31:0] X5_real, X5_imag;
    wire [31:0] X6_real, X6_imag;
    wire [31:0] X7_real, X7_imag;
    wire [31:0] X8_real, X8_imag;
    wire [31:0] X9_real, X9_imag;
    wire [31:0] X10_real, X10_imag;
    wire [31:0] X11_real, X11_imag;
    wire [31:0] X12_real, X12_imag;
    wire [31:0] X13_real, X13_imag;
    wire [31:0] X14_real, X14_imag;
    wire [31:0] X15_real, X15_imag;

    // Instantiate the cmpx_mul module
    ker_mul uut (
        .clk(clk),
        .rst(rst),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .out_valid(out_valid),
        .out_ready(out_ready),
        .x0_real(x0_real), .x0_imag(x0_imag),
        .x1_real(x1_real), .x1_imag(x1_imag),
        .x2_real(x2_real), .x2_imag(x2_imag),
        .x3_real(x3_real), .x3_imag(x3_imag),
        .x4_real(x4_real), .x4_imag(x4_imag),
        .x5_real(x5_real), .x5_imag(x5_imag),
        .x6_real(x6_real), .x6_imag(x6_imag),
        .x7_real(x7_real), .x7_imag(x7_imag),
        .x8_real(x8_real), .x8_imag(x8_imag),
        .x9_real(x9_real), .x9_imag(x9_imag),
        .x10_real(x10_real), .x10_imag(x10_imag),
        .x11_real(x11_real), .x11_imag(x11_imag),
        .x12_real(x12_real), .x12_imag(x12_imag),
        .x13_real(x13_real), .x13_imag(x13_imag),
        .x14_real(x14_real), .x14_imag(x14_imag),
        .x15_real(x15_real), .x15_imag(x15_imag),
        .X0_real(X0_real), .X0_imag(X0_imag),
        .X1_real(X1_real), .X1_imag(X1_imag),
        .X2_real(X2_real), .X2_imag(X2_imag),
        .X3_real(X3_real), .X3_imag(X3_imag),
        .X4_real(X4_real), .X4_imag(X4_imag),
        .X5_real(X5_real), .X5_imag(X5_imag),
        .X6_real(X6_real), .X6_imag(X6_imag),
        .X7_real(X7_real), .X7_imag(X7_imag),
        .X8_real(X8_real), .X8_imag(X8_imag),
        .X9_real(X9_real), .X9_imag(X9_imag),
        .X10_real(X10_real), .X10_imag(X10_imag),
        .X11_real(X11_real), .X11_imag(X11_imag),
        .X12_real(X12_real), .X12_imag(X12_imag),
        .X13_real(X13_real), .X13_imag(X13_imag),
        .X14_real(X14_real), .X14_imag(X14_imag),
        .X15_real(X15_real), .X15_imag(X15_imag)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100MHz clock
    end

    // Initial block to apply test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        in_valid = 0;
        out_ready = 0;
        x0_real = 0; x0_imag = 0;
        x1_real = 0; x1_imag = 0;
        x2_real = 0; x2_imag = 0;
        x3_real = 0; x3_imag = 0;
        x4_real = 0; x4_imag = 0;
        x5_real = 0; x5_imag = 0;
        x6_real = 0; x6_imag = 0;
        x7_real = 0; x7_imag = 0;
        x8_real = 0; x8_imag = 0;
        x9_real = 0; x9_imag = 0;
        x10_real = 0; x10_imag = 0;
        x11_real = 0; x11_imag = 0;
        x12_real = 0; x12_imag = 0;
        x13_real = 0; x13_imag = 0;
        x14_real = 0; x14_imag = 0;
        x15_real = 0; x15_imag = 0;

        // Apply reset
        rst = 1;
        #10 rst = 0;
        
        // Start test
        in_valid = 1;
        out_ready = 1;
        #10;
        
       x0_real = 32'h3f800000; x0_imag = 32'h3f800000;
       x1_real = 32'h3f800000; x1_imag = 32'h3f800000;
       x2_real = 32'h3f800000; x2_imag = 32'h3f800000;
       x3_real = 32'h3f800000; x3_imag = 32'h3f800000;
       x4_real = 32'h3f800000; x4_imag = 32'h3f800000;
       x5_real = 32'h3f800000; x5_imag = 32'h3f800000;
       x6_real = 32'h3f800000; x6_imag = 32'h3f800000;
       x7_real = 32'h3f800000; x7_imag = 32'h3f800000;
       x8_real = 32'h3f800000; x8_imag = 32'h3f800000;
       x9_real = 32'h3f800000; x9_imag = 32'h3f800000;
       x10_real = 32'h3f800000; x10_imag = 32'h3f800000;
       x11_real = 32'h3f800000; x11_imag = 32'h3f800000;
       x12_real = 32'h3f800000; x12_imag = 32'h3f800000;
       x13_real = 32'h3f800000; x13_imag = 32'h3f800000;
       x14_real = 32'h3f800000; x14_imag = 32'h3f800000;
       x15_real = 32'h3f800000; x15_imag = 32'h3f800000;
        #100;
        
                
       x0_real = 32'h3f800000; x0_imag = 32'h3f800000;
       x1_real = 32'h3f800000; x1_imag = 32'h3f800000;
       x2_real = 32'h3f800000; x2_imag = 32'h3f800000;
       x3_real = 32'h3f800000; x3_imag = 32'h3f800000;
       x4_real = 32'h3f800000; x4_imag = 32'h3f800000;
       x5_real = 32'h3f800000; x5_imag = 32'h3f800000;
       x6_real = 32'h3f800000; x6_imag = 32'h3f800000;
       x7_real = 32'h3f800000; x7_imag = 32'h3f800000;
       x8_real = 32'h3f800000; x8_imag = 32'h3f800000;
       x9_real = 32'h3f800000; x9_imag = 32'h3f800000;
       x10_real = 32'h3f800000; x10_imag = 32'h3f800000;
       x11_real = 32'h3f800000; x11_imag = 32'h3f800000;
       x12_real = 32'h3f800000; x12_imag = 32'h3f800000;
       x13_real = 32'h3f800000; x13_imag = 32'h3f800000;
       x14_real = 32'h3f800000; x14_imag = 32'h3f800000;
       x15_real = 32'h3f800000; x15_imag = 32'h3f800000;
        #100;
        
       x0_real = 32'h3f800000; x0_imag = 32'h3f800000;
       x1_real = 32'h3f800000; x1_imag = 32'h3f800000;
       x2_real = 32'h3f800000; x2_imag = 32'h3f800000;
       x3_real = 32'h3f800000; x3_imag = 32'h3f800000;
       x4_real = 32'h3f800000; x4_imag = 32'h3f800000;
       x5_real = 32'h3f800000; x5_imag = 32'h3f800000;
       x6_real = 32'h3f800000; x6_imag = 32'h3f800000;
       x7_real = 32'h3f800000; x7_imag = 32'h3f800000;
       x8_real = 32'h3f800000; x8_imag = 32'h3f800000;
       x9_real = 32'h3f800000; x9_imag = 32'h3f800000;
       x10_real = 32'h3f800000; x10_imag = 32'h3f800000;
       x11_real = 32'h3f800000; x11_imag = 32'h3f800000;
       x12_real = 32'h3f800000; x12_imag = 32'h3f800000;
       x13_real = 32'h3f800000; x13_imag = 32'h3f800000;
       x14_real = 32'h3f800000; x14_imag = 32'h3f800000;
       x15_real = 32'h3f800000; x15_imag = 32'h3f800000;
        
//        x3_real = 32'h00000007;
//        x3_imag = 32'h00000008;
//        #10;
        
        // Check if the output is valid
        if (in_ready) begin

            // Capture and print results (e.g., use $display)
            $display("X0: %h, X0_imag: %h", X0_real, X0_imag);
            // Add additional output checks here for X1, X2, ..., X15
        end
        
        // End of simulation
        #300;
        $finish;
    end
endmodule
