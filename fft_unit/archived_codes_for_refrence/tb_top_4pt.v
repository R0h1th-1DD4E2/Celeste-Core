`timescale 1ns / 1ps

module tb_top_4pt;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag;

    // Outputs
    wire [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag;
    wire [31:0] fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_x2_real, fp_x2_imag, fp_x3_real, fp_x3_imag;

    // Instantiate the Unit Under Test (UUT)
    top_module_4pt uut (
        .clk(clk),
        .reset(reset),
        .x0_real(x0_real),
        .x0_imag(x0_imag),
        .x1_real(x1_real),
        .x1_imag(x1_imag),
        .x2_real(x2_real),
        .x2_imag(x2_imag),
        .x3_real(x3_real),
        .x3_imag(x3_imag),
        .X0_real(X0_real),
        .X0_imag(X0_imag),
        .X1_real(X1_real),
        .X1_imag(X1_imag),
        .X2_real(X2_real),
        .X2_imag(X2_imag),
        .X3_real(X3_real),
        .X3_imag(X3_imag),
        .fp_x0_real(fp_x0_real),
        .fp_x0_imag(fp_x0_imag),
        .fp_x1_real(fp_x1_real),
        .fp_x1_imag(fp_x1_imag),
        .fp_x2_real(fp_x2_real),
        .fp_x2_imag(fp_x2_imag),
        .fp_x3_real(fp_x3_real),
        .fp_x3_imag(fp_x3_imag)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    // Testbench
    initial begin
        // Initialize inputs
        reset = 1;
      
        // Apply test vectors
   
        // Apply another set of test vectors
        x0_real = 32'd0; x0_imag = 32'd0;
        x1_real = 32'd2; x1_imag = 32'd0;
        x2_real = 32'd4; x2_imag = 32'd0;
        x3_real = 32'd6; x3_imag = 32'd0;

        // Wait for the outputs to settle
        #100;

        // End simulation
        $display("X0_real = %h", X0_real);
        $display("X0_imag = %h", X0_imag);
        $display("X1_real = %h", X1_real);
        $display("X1_imag = %h", X1_imag);
        $display("X2_real = %h", X2_real);
        $display("X2_imag = %h", X2_imag);
        $display("X3_real = %h", X3_real);
        $display("X3_imag = %h", X3_imag);

        $display("fp_x0_real = %h", fp_x0_real);
        $display("fp_x0_imag = %h", fp_x0_imag);
        $display("fp_x1_real = %h", fp_x1_real);
        $display("fp_x1_imag = %h", fp_x1_imag);
        $display("fp_x2_real = %h", fp_x2_real);
        $display("fp_x2_imag = %h", fp_x2_imag);
        $display("fp_x3_real = %h", fp_x3_real);
        $display("fp_x3_imag = %h", fp_x3_imag);
        

    end

    // Monitor the outputs
   

endmodule
