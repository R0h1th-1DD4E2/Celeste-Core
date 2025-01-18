`timescale 1ns / 1ps

module tb_cmpx_mul;

    // Parameters
    //parameter N = 32;
  reg clk;
  reg [31:0] x0_real,  x0_imag;
  reg [31:0] x1_real,  x1_imag;
  reg [31:0] x2_real,  x2_imag;
  reg [31:0] x3_real,  x3_imag;
  reg [31:0] x4_real,  x4_imag;
  reg [31:0] x5_real,  x5_imag;
  reg [31:0] x6_real,  x6_imag;
  reg [31:0] x7_real,  x7_imag;
  reg [31:0] x8_real,  x8_imag;
  reg [31:0] x9_real,  x9_imag;
  reg [31:0] x10_real, x10_imag;
  reg [31:0] x11_real, x11_imag;
  reg [31:0] x12_real, x12_imag;
  reg [31:0] x13_real, x13_imag;
  reg [31:0] x14_real, x14_imag;
  reg [31:0] x15_real, x15_imag;

  reg [31:0] y0_real,  y0_imag;
  reg [31:0] y1_real,  y1_imag;
  reg [31:0] y2_real,  y2_imag;
  reg [31:0] y3_real,  y3_imag;
  reg [31:0] y4_real,  y4_imag;
  reg [31:0] y5_real,  y5_imag;
  reg [31:0] y6_real,  y6_imag;
  reg [31:0] y7_real,  y7_imag;
  reg [31:0] y8_real,  y8_imag;
  reg [31:0] y9_real,  y9_imag;
  reg [31:0] y10_real, y10_imag;
  reg [31:0] y11_real, y11_imag;
  reg [31:0] y12_real, y12_imag;
  reg [31:0] y13_real, y13_imag;
  reg [31:0] y14_real, y14_imag;
  reg [31:0] y15_real, y15_imag;

  wire [31:0] X0_real, X0_imag;
  wire [31:0] X1_real, X1_imag;
  wire [31:0] X2_real, X2_imag;
  wire [31:0] X3_real, X3_imag;
  wire [31:0] X4_real, X4_imag;
  wire [31:0] X5_real, X5_imag;
  wire [31:0] X6_real, X6_imag;
  wire [31:0] X7_real, X7_imag;
  wire [31:0] X8_real,  X8_imag;
  wire [31:0] X9_real,  X9_imag;
  wire [31:0] X10_real, X10_imag;
  wire [31:0] X11_real, X11_imag;
  wire [31:0] X12_real, X12_imag;
  wire [31:0] X13_real, X13_imag;
  wire [31:0] X14_real, X14_imag;
  wire [31:0] X15_real, X15_imag;

    // Testbench variables
    integer i;  // Declare the integer outside the `initial` block.

    // Instantiate the Unit Under Test (UUT)
    cmpx_mul uut (
                .clk(clk),
              .x0_real(x0_real),  .x0_imag(x0_imag),
              .x1_real(x1_real),  .x1_imag(x1_imag),
              .x2_real(x2_real),  .x2_imag(x2_imag),
              .x3_real(x3_real),  .x3_imag(x3_imag),
              .x4_real(x4_real),  .x4_imag(x4_imag),
              .x5_real(x5_real),  .x5_imag(x5_imag),
              .x6_real(x6_real),  .x6_imag(x6_imag),
              .x7_real(x7_real),  .x7_imag(x7_imag),
              .x8_real(x8_real),  .x8_imag(x8_imag),
              .x9_real(x9_real),  .x9_imag(x9_imag),
              .x10_real(x10_real), .x10_imag(x10_imag),
              .x11_real(x11_real), .x11_imag(x11_imag),
              .x12_real(x12_real), .x12_imag(x12_imag),
              .x13_real(x13_real), .x13_imag(x13_imag),
              .x14_real(x14_real), .x14_imag(x14_imag),
              .x15_real(x15_real), .x15_imag(x15_imag),

              .y0_real(y0_real),  .y0_imag(y0_imag),
              .y1_real(y1_real),  .y1_imag(y1_imag),
              .y2_real(y2_real),  .y2_imag(y2_imag),
              .y3_real(y3_real),  .y3_imag(y3_imag),
              .y4_real(y4_real),  .y4_imag(y4_imag),
              .y5_real(y5_real),  .y5_imag(y5_imag),
              .y6_real(y6_real),  .y6_imag(y6_imag),
              .y7_real(y7_real),  .y7_imag(y7_imag),
              .y8_real(y8_real),  .y8_imag(y8_imag),
              .y9_real(y9_real),  .y9_imag(y9_imag),
              .y10_real(y10_real), .y10_imag(y10_imag),
              .y11_real(y11_real), .y11_imag(y11_imag),
              .y12_real(y12_real), .y12_imag(y12_imag),
              .y13_real(y13_real), .y13_imag(y13_imag),
              .y14_real(y14_real), .y14_imag(y14_imag),
              .y15_real(y15_real), .y15_imag(y15_imag),

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
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 50MHz clock
  end
    // Testbench logic
    initial begin
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

        y0_real = 0; y0_imag = 0;
        y1_real = 0; y1_imag = 0;
        y2_real = 0; y2_imag = 0;
        y3_real = 0; y3_imag = 0;
        y4_real = 0; y4_imag = 0;
        y5_real = 0; y5_imag = 0;
        y6_real = 0; y6_imag = 0;
        y7_real = 0; y7_imag = 0;
        y8_real = 0; y8_imag = 0;
        y9_real = 0; y9_imag = 0;
        y10_real = 0; y10_imag = 0;
        y11_real = 0; y11_imag = 0;
        y12_real = 0; y12_imag = 0;
        y13_real = 0; y13_imag = 0;
        y14_real = 0; y14_imag = 0;
        y15_real = 0; y15_imag = 0;
        #10;

       x0_real = 32'h3f800000; x0_imag = 32'h3f800000; //real = 1 imag = 1
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

       y0_real = 32'h3f800000; y0_imag = 32'hbf800000; //real = 1 imag =-1
       y1_real = 32'h3f800000; y1_imag = 32'hbf800000;
       y2_real = 32'h3f800000; y2_imag = 32'hbf800000;
       y3_real = 32'h3f800000; y3_imag = 32'hbf800000;
       y4_real = 32'h3f800000; y4_imag = 32'hbf800000;
       y5_real = 32'h3f800000; y5_imag = 32'hbf800000;
       y6_real = 32'h3f800000; y6_imag = 32'hbf800000;
       y7_real = 32'h3f800000; y7_imag = 32'hbf800000;
       y8_real = 32'h3f800000; y8_imag = 32'hbf800000;
       y9_real = 32'h3f800000; y9_imag = 32'hbf800000;
       y10_real = 32'h3f800000; y10_imag = 32'hbf800000;
       y11_real = 32'h3f800000; y11_imag = 32'hbf800000;
       y12_real = 32'h3f800000; y12_imag = 32'hbf800000;
       y13_real = 32'h3f800000; y13_imag = 32'hbf800000;
       y14_real = 32'h3f800000; y14_imag = 32'hbf800000;
       y15_real = 32'h3f800000; y15_imag = 32'hbf800000;

        // Display results

        #100;
        $finish;
    end

endmodule
