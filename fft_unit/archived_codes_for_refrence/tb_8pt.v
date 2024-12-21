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
               // Test Case 1: Simple real inputs
        x0_real = 32'd4; x0_imag = 32'd0;
        x1_real = 32'd2; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0; // Twiddle factor for 2-point FFT
        #120;
        $display("Test Case 1:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 2: Real inputs with larger values
        x0_real = 32'd20; x0_imag = 32'd0;
        x1_real = 32'd15; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 2:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 3: One input is zero
        x0_real = 32'd0; x0_imag = 32'd0;
        x1_real = 32'd12; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 3:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 4: Equal real inputs
        x0_real = 32'd5; x0_imag = 32'd0;
        x1_real = 32'd5; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 4:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 5: Negative real inputs
        x0_real = -32'd8; x0_imag = 32'd0;
        x1_real = -32'd4; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 5:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 6: Mixed positive and negative real inputs
        x0_real = 32'd6; x0_imag = 32'd0;
        x1_real = -32'd3; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 6:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 7: Large magnitude real inputs
        x0_real = 32'd100; x0_imag = 32'd0;
        x1_real = 32'd50; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 7:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 8: Small magnitude real inputs
        x0_real = 32'd1; x0_imag = 32'd0;
        x1_real = 32'd2; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 8:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 9: High contrast inputs
        x0_real = 32'd1000; x0_imag = 32'd0;
        x1_real = 32'd1; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 9:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        // Test Case 10: Zero for all inputs
        x0_real = 32'd0; x0_imag = 32'd0;
        x1_real = 32'd0; x1_imag = 32'd0;
        twiddle_real = 32'd1; twiddle_imag = 32'd0;
        #120;
        $display("Test Case 10:\n X0_real = %d, X0_imag = %d, X1_real = %d, X1_imag = %d\n",
                 X0_real, X0_imag, X1_real, X1_imag);

        $stop;
    end
endmodule
