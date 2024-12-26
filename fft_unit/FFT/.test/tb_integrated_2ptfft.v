module tb_2pt;

    // Parameters
    parameter N = 32;

    // Testbench signals
    reg clk;
    reg signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag;
    reg signed [N-1:0] twiddle_real, twiddle_imag;
    wire signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag;

    // Instantiate the FFT module
    fft_2pt #(N) uutddfd (
        .clk(clk),
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

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10-time unit clock period

    // Test inputs and verification
    initial begin
        // Initialize inputs
        x0_real = 16'd1;  // 4 in Q15 format
        x0_imag = 16'd2;  // 0 in Q15 format
        x1_real = 16'd3;  // 3 in Q15 format
        x1_imag = 16'd4;  // 0 in Q15 format
        twiddle_real = 16'd1; // 1 in Q15 format (cos(0))
        twiddle_imag = 16'd0; // 0 in Q15 format (sin(0))


        #20;

    end

endmodule
