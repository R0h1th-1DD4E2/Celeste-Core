module tb_2pt;

    // Parameters
    parameter N = 32;

    // Testbench signals
    reg clk;
    reg signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag;
    reg signed [N-1:0] twiddle_real, twiddle_imag;
    wire signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag;
    wire signed [N-1:0]  fp_x0_real, fp_x0_imag, fp_x1_real, fp_x1_imag, fp_twiddle_real, fp_twiddle_imag;
    wire signed [N-1:0] rr1, ii1, ri1, ir1;
    wire signed [N-1:0] t1, t2,t3,t4;
 //   wire signed [N-1:0] temp_X0_real, temp_X0_imag, temp_X1_real, temp_X1_imag;

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
        .X1_imag(X1_imag),
        .fp_x0_real(fp_x0_real),
        .fp_x0_imag(fp_x0_imag),
        .fp_x1_real(fp_x1_real),
        .fp_x1_imag(fp_x1_imag),
        .fp_twiddle_real(fp_twiddle_real),
        .fp_twiddle_imag(fp_twiddle_imag),
        .rr1(rr1),
        .ii1(ii1),
        .ri1(ri1),
        .ir1(ir1),
        .t1(t1),
        .t2(t2),
        .t3(t3),
        .t4(t4)
        // .temp_X0_real(temp_X0_real),
        // .temp_X0_imag(temp_X0_imag),
        // .temp_X1_real(temp_X1_real),
        // .temp_X1_imag(temp_X1_imag)
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

        // Wait for some time for simulation to settle
        #20;

        // Display results
        // $display("Inputs:");
        // $display("x0_real = %h, x0_imag = %h", x0_real, x0_imag);
        // $display("x1_real = %h, x1_imag = %h", x1_real, x1_imag);
        // $display("twiddle_real = %h, twiddle_imag = %h", twiddle_real, twiddle_imag);

        // $display("Outputs:");
        // $display("X0_real = %h, X0_imag = %h", X0_real, X0_imag);
        // $display("X1_real = %h, X1_imag = %h", X1_real, X1_imag);

        // End simulation
        $stop;
    end

endmodule
