`timescale 1ns/1ps

module tb_i2pt;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] x0_real, x0_imag, x1_real, x1_imag;

    // Outputs
    wire [31:0] X0_real, X0_imag, X1_real, X1_imag;

    // Instantiate the Unit Under Test (UUT)
    top_module_2pt uut (
        .clk(clk),
        .reset(reset),
        .x0_real(x0_real),
        .x0_imag(x0_imag),
        .x1_real(x1_real),
        .x1_imag(x1_imag),
        .X0_real(X0_real),
        .X0_imag(X0_imag),
        .X1_real(X1_real),
        .X1_imag(X1_imag)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        x0_real = 32'h00000000; x0_imag = 32'h00000000;
        x1_real = 32'h00000000; x1_imag = 32'h00000000;

        // Apply reset
        #20;
        reset = 0;

        // Test case 1: DC signal (x0 = 1, x1 = 1)
        x0_real = 32'd2; // 1.0 in IEEE-754 floating-point
        x0_imag = 32'h00000000; // 0.0 in IEEE-754 floating-point
        x1_real = 32'd2; // 1.0 in IEEE-754 floating-point
        x1_imag = 32'h00000000; // 0.0 in IEEE-754 floating-point
        #20;

        $display("XO R %h",X0_real);
        $display("Xo i %h",X0_imag);
        $display("X1 R %h",X1_real);
        $display("X1 i %h",X1_imag);

        // // Test case 2: Alternating signal (x0 = 1, x1 = -1)
        // x0_real = 32'h3f800000; // 1.0
        // x0_imag = 32'h00000000; // 0.0
        // x1_real = 32'hbf800000; // -1.0
        // x1_imag = 32'h00000000; // 0.0
        // #20;

        // // Test case 3: Complex signal (x0 = 1+j, x1 = -1-j)
        // x0_real = 32'h3f800000; // 1.0
        // x0_imag = 32'h3f800000; // 1.0
        // x1_real = 32'hbf800000; // -1.0
        // x1_imag = 32'hbf800000; // -1.0
        // #20;

        // End simulation
        $stop;
    end

endmodule
