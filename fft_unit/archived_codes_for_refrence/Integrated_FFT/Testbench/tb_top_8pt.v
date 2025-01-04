`timescale 1ns / 1ps

module tb_top_8pt;

    // Parameters
    parameter N = 32; // Example: 16-bit width for fixed-point representation
    parameter CLK_PERIOD = 10;

    // Inputs
    reg clk;
    reg signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag;
    reg signed [N-1:0] x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag;


    // Outputs
    wire signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag;
    wire signed [N-1:0] X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag;
    wire signed [N-1:0] fp_X0_real, fp_X0_imag, fp_X1_real, fp_X1_imag, fp_X2_real, fp_X2_imag, fp_X3_real, fp_X3_imag;
    wire signed [N-1:0] fp_X4_real, fp_X4_imag, fp_X5_real, fp_X5_imag, fp_X6_real, fp_X6_imag, fp_X7_real, fp_X7_imag;

    // Instantiate the DUT (Device Under Test)
    clked_8pt #(.N(N)) DUT (
        .clk(clk),
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
        .X7_real(X7_real), .X7_imag(X7_imag),
        .fp_X0_real(fp_X0_real), .fp_X0_imag(fp_X0_imag),
        .fp_X1_real(fp_X1_real), .fp_X1_imag(fp_X1_imag),
        .fp_X2_real(fp_X2_real), .fp_X2_imag(fp_X2_imag),
        .fp_X3_real(fp_X3_real), .fp_X3_imag(fp_X3_imag),
        .fp_X4_real(fp_X4_real), .fp_X4_imag(fp_X4_imag),
        .fp_X5_real(fp_X5_real), .fp_X5_imag(fp_X5_imag),
        .fp_X6_real(fp_X6_real), .fp_X6_imag(fp_X6_imag),
        .fp_X7_real(fp_X7_real), .fp_X7_imag(fp_X7_imag)

    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
   

    // Stimulus generation
    initial begin
        // Initialize inputs
        // x0_real = 32'h00000000;  x0_imag = 32'h00000000; // 0.0 in IEEE 754
        // x1_real = 32'h3f800000;  x1_imag = 32'h00000000; // 1.0 in IEEE 754
        // x2_real = 32'h40000000;  x2_imag = 32'h00000000; // 2.0 in IEEE 754
        // x3_real = 32'h40400000;  x3_imag = 32'h00000000; // 3.0 in IEEE 754
        // x4_real = 32'h40800000;  x4_imag = 32'h00000000; // 4.0 in IEEE 754
        // x5_real = 32'h40a00000;  x5_imag = 32'h00000000; // 5.0 in IEEE 754
        // x6_real = 32'h40c00000;  x6_imag = 32'h00000000; // 6.0 in IEEE 754
        // x7_real = 32'h40e00000;  x7_imag = 32'h00000000; // 7.0 in IEEE 754
//test case 1
 x0_real=0;x0_imag=0;
 x1_real=1;x1_imag=0;
 x2_real=2;x2_imag=0;
 x3_real=3;x3_imag=0;
 x4_real=4;x4_imag=0;
 x5_real=5;x5_imag=0;
 x6_real=6;x6_imag=0;
 x7_real=7;x7_imag=0;
#10;

        // Wait for a few clock cycles to observe output
x0_real=1;x0_imag=0;
x1_real=1;x1_imag=0;
x2_real=1;x2_imag=0;
x3_real=1;x3_imag=0;
x4_real=-1;x4_imag=0;
x5_real=-1;x5_imag=0;
x6_real=-1;x6_imag=0;
x7_real=-1;x7_imag=0;   
#10;

 x0_real=1;x0_imag=0;
 x1_real=1;x1_imag=0;
 x2_real=1;x2_imag=0;
 x3_real=1;x3_imag=0;
 x4_real=2;x4_imag=0;
 x5_real=2;x5_imag=0;
 x6_real=2;x6_imag=0;
 x7_real=2;x7_imag=0;
#10; 


      

        // Finish simulation
          #10;
    $display("fp_X0_real  = %h", fp_X0_real);
    $display("fp_X0_imag  = %h", fp_X0_imag);
    $display("fp_X1_real  = %h", fp_X1_real);
    $display("fp_X1_imag  = %h", fp_X1_imag);
    $display("fp_X2_real  = %h", fp_X2_real);
    $display("fp_X2_imag  = %h", fp_X2_imag);
    $display("fp_X3_real  = %h", fp_X3_real);
    $display("fp_X3_imag  = %h", fp_X3_imag);
    $display("fp_X4_real  = %h", fp_X4_real);
    $display("fp_X4_imag  = %h", fp_X4_imag);
    $display("fp_X5_real  = %h", fp_X5_real);
    $display("fp_X5_imag  = %h", fp_X5_imag);
    $display("fp_X6_real  = %h", fp_X6_real);
    $display("fp_X6_imag  = %h", fp_X6_imag);
    $display("fp_X7_real  = %h", fp_X7_real);
    $display("fp_X7_imag  = %h", fp_X7_imag);


    $display("  ");
    $display("  ");
    $display("  ");

    $display("X0_real  = %d", X0_real);
    $display("X0_imag  = %d", X0_imag);

    $display("X1_real  = %d", X1_real);
    $display("X1_imag  = %d", X1_imag);

    $display("X2_real  = %d", X2_real);
    $display("X2_imag  = %d", X2_imag);

    $display("X3_real  = %d", X3_real);
    $display("X3_imag  = %d", X3_imag);

    $display("X4_real  = %d", X4_real);
    $display("X4_imag  = %d", X4_imag);

    $display("X5_real  = %d", X5_real);
    $display("X5_imag  = %d", X5_imag);

    $display("X6_real  = %d", X6_real);
    $display("X6_imag  = %d", X6_imag);

    $display("X7_real  = %d", X7_real);
    $display("X7_imag  = %d", X7_imag);




    end

    // Monitor output

    

endmodule
