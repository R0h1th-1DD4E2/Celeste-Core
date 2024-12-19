module tb_integrated_2pt_fft;
    parameter N = 32; // Parameter for data width

    // Inputs
    reg clk;
    reg signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag;
    reg signed [N-1:0] twiddle_real, twiddle_imag;

    // Outputs
    wire signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag;


    // Instantiate the module under test
    integrated_2pt #(.N(N)) uut ( .clk(clk),
        .x0_real(x0_real), .x0_imag(x0_imag),
        .x1_real(x1_real), .x1_imag(x1_imag),
        .twiddle_real(twiddle_real), .twiddle_imag(twiddle_imag),
        .X0_real(X0_real), .X0_imag(X0_imag),
        .X1_real(X1_real), .X1_imag(X1_imag)
    );
    
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        // Test Case 1: Real FFT inputs (imaginary parts are zero)
        x0_real = 16'd1; x0_imag = 16'd0;
        x1_real = 16'd2; x1_imag = 16'd0;
        twiddle_real = 16'd1; twiddle_imag = 16'd0; // Twiddle factor for 2-point FFT
        #100;
        $display("Test Case 1:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 2: Real FFT with negative values
        x0_real = 16'd3; x0_imag = 16'd0;
        x1_real = -16'd1; x1_imag = 16'd0;
        twiddle_real = 16'd1; twiddle_imag = 16'd0; // Twiddle factor for 2-point FFT
        #100;
        $display("Test Case 2:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 3: Real FFT with larger inputs
        x0_real = 16'd100; x0_imag = 16'd0;
        x1_real = 16'd50; x1_imag = 16'd0;
        twiddle_real = 16'd1; twiddle_imag = 16'd0; // Twiddle factor for 2-point FFT
        #100;
        $display("Test Case 3:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 4: Real FFT edge case
        x0_real = 16'd32767; x0_imag = 16'd0;
        x1_real = -16'd32768; x1_imag = 16'd0;
        twiddle_real = 16'd1; twiddle_imag = 16'd0; // Twiddle factor for 2-point FFT
        #100;
        $display("Test Case 4:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        $stop;
    end
endmodule
