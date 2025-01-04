`timescale 1ns / 1ps

module tb_i4pt;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] x0_real, x0_imag;
    reg [31:0] x1_real, x1_imag;
    reg [31:0] x2_real, x2_imag;
    reg [31:0] x3_real, x3_imag;

    // Outputs
    wire [31:0] X0_real, X0_imag;
    wire [31:0] X1_real, X1_imag;
    wire [31:0] X2_real, X2_imag;
    wire [31:0] X3_real, X3_imag;
    wire [31:0] fp_x0_real, fp_x0_imag;
    wire [31:0] fp_x1_real, fp_x1_imag;
    wire [31:0] fp_x2_real, fp_x2_imag;
    wire [31:0] fp_x3_real, fp_x3_imag;

    // Instantiate the Unit Under Test (UUT)
    top_module_4pt uut (
        .clk(clk),
        .reset(reset),
        .x0_real(x0_real), .x0_imag(x0_imag),
        .x1_real(x1_real), .x1_imag(x1_imag),
        .x2_real(x2_real), .x2_imag(x2_imag),
        .x3_real(x3_real), .x3_imag(x3_imag),
        .X0_real(X0_real), .X0_imag(X0_imag),
        .X1_real(X1_real), .X1_imag(X1_imag),
        .X2_real(X2_real), .X2_imag(X2_imag),
        .X3_real(X3_real), .X3_imag(X3_imag),
        .fp_x0_real(fp_x0_real), .fp_x0_imag(fp_x0_imag),
        .fp_x1_real(fp_x1_real), .fp_x1_imag(fp_x1_imag),
        .fp_x2_real(fp_x2_real), .fp_x2_imag(fp_x2_imag),
        .fp_x3_real(fp_x3_real), .fp_x3_imag(fp_x3_imag)
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
        x0_real = 32'd0; x0_imag = 32'd0;
        x1_real = 32'd0; x1_imag = 32'd0;
        x2_real = 32'd0; x2_imag = 32'd0;
        x3_real = 32'd0; x3_imag = 32'd0;

        #10 reset = 0; // Deassert reset

        // Test Case 1: Zero inputs
        #10;
        $display("TC1: X0_real=%h, X0_imag=%h, X1_real=%h, X1_imag=%h, X2_real=%h, X2_imag=%h, X3_real=%h, X3_imag=%h", X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag);

        // Test Case 2: Simple inputs (1, 2, 3, 4)
        x0_real = 32'd32; x0_imag = 32'd0;
        x1_real = 32'd0; x1_imag = 32'd0;
        x2_real = 32'd4; x2_imag = 32'd0;
        x3_real = 32'd4; x3_imag = 32'd0;

        #10;
        $display("TC2: X0_real=%h, X0_imag=%h, X1_real=%h, X1_imag=%h, X2_real=%h, X2_imag=%h, X3_real=%h, X3_imag=%h", X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag);

        // Test Case 3: Mixed real and imaginary inputs
        x0_real = 32'd1; x0_imag = 32'd1;
        x1_real = 32'd2; x1_imag = 32'd1;
        x2_real = 32'd3; x2_imag = 32'd2;
        x3_real = 32'd4; x3_imag = 32'd2;

        #10;
        $display("TC3: X0_real=%h, X0_imag=%h, X1_real=%h, X1_imag=%h, X2_real=%h, X2_imag=%h, X3_real=%h, X3_imag=%h", X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag);

        $stop;
    end

endmodule
