`timescale 1ns / 1ps

module tb_ifft();

    // Parameters
    parameter CLK_PERIOD = 5;

    // Inputs
    reg clk;
    reg signed [31:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag;
    reg signed [31:0] x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag;

    // Outputs
    wire signed [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag;
    wire signed [31:0] X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag;

    // Instantiate the DUT (Device Under Test)
    clocked_i8pt DUT ( 
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
    initial begin
        clk = 0; 
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
   
    // Stimulus generation
    initial begin
// Initialize inputs (IEEE 754 Single Precision)
x0_real = 32'h00000000;  x0_imag = 32'h00000000;  // 0.0
x1_real = 32'h3F800000;  x1_imag = 32'h00000000;  // 1.0
x2_real = 32'h40000000;  x2_imag = 32'h00000000;  // 2.0
x3_real = 32'h40400000;  x3_imag = 32'h00000000;  // 3.0
x4_real = 32'h40800000;  x4_imag = 32'h00000000;  // 4.0
x5_real = 32'h40A00000;  x5_imag = 32'h00000000;  // 5.0
x6_real = 32'h40C00000;  x6_imag = 32'h00000000;  // 6.0
x7_real = 32'h40E00000;  x7_imag = 32'h00000000;  // 7.0
#10;

// Updated values - Even numbers (0, 2, 4, 6...)
x0_real = 32'h00000000;  x0_imag = 32'h00000000;  // 0.0
x1_real = 32'h40000000;  x1_imag = 32'h00000000;  // 2.0
x2_real = 32'h40800000;  x2_imag = 32'h00000000;  // 4.0
x3_real = 32'h40C00000;  x3_imag = 32'h00000000;  // 6.0
x4_real = 32'h00000000;  x4_imag = 32'h00000000;  // 0.0
x5_real = 32'h40000000;  x5_imag = 32'h00000000;  // 2.0
x6_real = 32'h40800000;  x6_imag = 32'h00000000;  // 4.0
x7_real = 32'h40C00000;  x7_imag = 32'h00000000;  // 6.0


#10;
// Updated values
 x0_real = 32'h3F800000;  x0_imag = 32'h00000000;  // 1.0
 x1_real = 32'h3F800000;  x1_imag = 32'h00000000;  // 1.0
 x2_real = 32'h3F800000;  x2_imag = 32'h00000000;  // 1.0
 x3_real = 32'h3F800000;  x3_imag = 32'h00000000;  // 1.0
 x4_real = 32'hBF800000;  x4_imag = 32'h00000000;  // -1.0
 x5_real = 32'hBF800000;  x5_imag = 32'h00000000;  // -1.0
 x6_real = 32'hBF800000;  x6_imag = 32'h00000000;  // -1.0
 x7_real = 32'hBF800000;  x7_imag = 32'h00000000;  // -1.0
// #5;



        // Finish simulation
        #5;
        $display("X0_real  = %h", X0_real);
        $display("X0_imag  = %h", X0_imag);
        $display("X1_real  = %h", X1_real); 
        $display("X1_imag  = %h", X1_imag);
        $display("X2_real  = %h", X2_real);
        $display("X2_imag  = %h", X2_imag);
        $display("X3_real  = %h", X3_real);
        $display("X3_imag  = %h", X3_imag);
        $display("X4_real  = %h", X4_real);
        $display("X4_imag  = %h", X4_imag);
        $display("X5_real  = %h", X5_real);
        $display("X5_imag  = %h", X5_imag);
        $display("X6_real  = %h", X6_real);
        $display("X6_imag  = %h", X6_imag);
        $display("X7_real  = %h", X7_real);
        $display("X7_imag  = %h", X7_imag);
        $finish;
    end
endmodule
