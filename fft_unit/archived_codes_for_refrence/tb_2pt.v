`timescale 1ns / 1ps  // Time unit and precision

module tb_2pt;
    parameter N = 32;  // Parameter for bit width

    // Declare input and output signals
//    reg clk;  // Clock signal
    reg  [N-1:0] x0_real, x0_imag, x1_real, x1_imag;
    reg  [N-1:0] twiddle_real, twiddle_imag;
    wire [N-1:0] X0_real, X0_imag, X1_real, X1_imag;

    // Instantiate the 2-point FFT module
    fft_2pt #(N) modins (
        .x0_real(x0_real),
        .x0_imag(x0_imag),
        .x1_real(x1_real),
        .x1_imag(x1_imag),
        .twiddle_real(twiddle_real),
        .twiddle_imag(twiddle_imag),
        .X0_real(X0_real),
        .X0_imag(X0_imag),
        .X1_real(X1_real),
        .X1_imag(X1_imag)
    );

    // Initialize clock signal
//    initial begin
//        clk = 0;  // Start clock at 0
//    end

    // Generate clock signal with a 10ns period (5ns high, 5ns low)
//    always #5 clk = ~clk;

    // Test stimuli
    initial begin
        // Apply test case 1: x = {0 + j0, 1 + j0}
        // x0_real = 2; x0_imag = 0;  // Input x0 = 0 + j0
        // x1_real = 3; x1_imag = 0;  // Input x1 = 1 + j0
        // twiddle_real = 0;          // Twiddle factor = 1 (cos(0))
        // twiddle_imag = -1;          // Twiddle factor = 0 (sin(0))
        // #10;  // Wait 10 time units
        // $display("Test case 1: x(n) = {0+j0, 1+j0}");
        // $display("Output: X0 = %d + j%d, X1 = %d + j%d\n", X0_real, X0_imag, X1_real, X1_imag);

        // Apply test case 2: x = {2 + j0, 3 + j0}
//        x0_real = 16'd2; x0_imag = 16'd0;  // Input x0 = 2 + j0
//        x1_real = 16'd3; x1_imag = 16'd0;  // Input x1 = 3 + j0
//        twiddle_real = 16'd1;              // Twiddle factor = 1 (cos(0))
//        twiddle_imag = 16'd0;              // Twiddle factor = 0 (sin(0))
        x0_real = 32'h40000000; x0_imag = 32'h0;  // Input x0 = 2 + j0
        x1_real = 32'h40400000; x1_imag = 32'h0;  // Input x1 = 3 + j0
        twiddle_real = 32'h3f800000;              // Twiddle factor = 1 (cos(0))
        twiddle_imag = 32'd0;              // Twiddle factor = 0 (sin(0))
        #10;  // Wait 10 time units
         x0_real = 32'h40000000; x0_imag = 32'h40000000;  // Input x0 = 2 + j2
        x1_real = 32'h40400000; x1_imag = 32'h40000000;  // Input x1 = 3 + j2
        twiddle_real = 32'h3f800000;              // Twiddle factor = 1 (cos(0))
        twiddle_imag = 32'd0;              // Twiddle factor = 0 (sin(0))
        #10;
        x0_real = 32'h40000000; x0_imag = 32'h40400000;  // Input x0 = 2 + j3
        x1_real = 32'h40400000; x1_imag = 32'h40400000;  // Input x1 = 3 + j3
        twiddle_real = 32'h3f800000;              // Twiddle factor = 1 (cos(0))
        twiddle_imag = 32'd0;              // Twiddle factor = 0 (sin(0))
        #10;
        // $display("Test case 2: x(n) = {2+oj, 3+j0}");
        // $display("Output: X0 = %d + j%d, X1 = %d + j%d\n", X0_real, X0_imag, X1_real, X1_imag);

        // // Apply test case 3: x = {4 + j0, 0 - j1}
        // x0_real = 16'd4; x0_imag = 16'd0;  // Input x0 = 4 + j0
        // x1_real = 16'd0; x1_imag = -16'd1; // Input x1 = 0 - j1
        // twiddle_real = 16'd1;              // Twiddle factor = 1 (cos(0))
        // twiddle_imag = 16'd0;              // Twiddle factor = 0 (sin(0))
        // #10;  // Wait 10 time units
        // $display("Test case 3: x(n) = {4+j0, 0-j1}");
        // $display("Output: X0 = %d + j%d, X1 = %d + j%d\n", X0_real, X0_imag, X1_real, X1_imag);

        // End simulation
        $finish;
    end

    // Monitor signals for debugging
    initial begin
        $monitor("At time %t: Inputs: x0 = %d + j%d, x1 = %d + j%d | Outputs: X0 = %d + j%d, X1 = %d + j%d",
                 $time, x0_real, x0_imag, x1_real, x1_imag, X0_real, X0_imag, X1_real, X1_imag);
    end
endmodule
