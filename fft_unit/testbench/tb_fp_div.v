`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 10:17:03 PM
// Design Name: 
// Module Name: tb_fp_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fp_div;

  // Parameters
  parameter TEST_COUNT = 100;

  // Input/output for DUT
  reg [31:0] a, b;
  wire [31:0] result;

  // Internal signals
  real real_a, real_b, real_result, real_expected;
  integer i, errors;

  // Instantiate the DUT (replace "fp_div" with your module name)
  fp_div uut (
    .a(a),
    .b(b),
    .result(result)
  );

  // Task to convert IEEE 754 to real
  function real ieee_to_real(input [31:0] ieee);
    integer exp;
    real mantissa;
    begin
      exp = ieee[30:23] - 127; // Exponent biasing
      mantissa = 1.0 + (ieee[22:0] / (2.0**23)); // Implicit 1 added
      ieee_to_real = (ieee[31] ? -1.0 : 1.0) * mantissa * (2.0**exp);
    end
  endfunction

  // Task to convert real to IEEE 754
  function [31:0] real_to_ieee(input real value);
    integer s, e;
    real m;
    reg [22:0] mantissa;
    begin
      s = (value < 0) ? 1 : 0;
      m = (value < 0) ? -value : value;

      e = 0;
      while (m >= 2.0) begin
        m = m / 2.0;
        e = e + 1;
      end

      while (m < 1.0 && m != 0.0) begin
        m = m * 2.0;
        e = e - 1;
      end

      e = e + 127; // Bias exponent
      mantissa = (m - 1.0) * (2**23); // Remove implicit 1 and scale
      real_to_ieee = {s, e[7:0], mantissa};
    end
  endfunction

  // Stimulus generation
  initial begin
    errors = 0;
    $display("Starting floating-point division testbench...");
    $display("Test Count: %0d", TEST_COUNT);

    for (i = 0; i < TEST_COUNT; i = i + 1) begin
      // Generate random floating-point numbers
      real_a = $urandom_range(1, 100) + ($urandom % 1000) / 1000.0; // Random real between 1 and 100
      real_b = $urandom_range(1, 100) + ($urandom % 1000) / 1000.0; // Random real between 1 and 100
      
      a = real_to_ieee(real_a);
      b = real_to_ieee(real_b);

      // Wait for division to complete
      #10;

      // Convert result to real for validation
      real_result = ieee_to_real(result);
      real_expected = real_a / real_b;

      // Compare results with a tolerance
      if (real_result < real_expected * 1.001 && real_result > real_expected * 0.999) begin
        $display("Test %0d: PASS | A = %f, B = %f, Expected = %f, Result = %f", i, real_a, real_b, real_expected, real_result);
      end else begin
        $display("Test %0d: FAIL | A = %f, B = %f, Expected = %f, Result = %f", i, real_a, real_b, real_expected, real_result);
        errors = errors + 1;
      end
    end

    // Test completion
    $display("Testbench completed with %0d errors out of %0d tests.", errors, TEST_COUNT);
    $finish;
  end

endmodule
