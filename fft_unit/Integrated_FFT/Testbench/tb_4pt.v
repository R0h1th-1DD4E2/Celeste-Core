`timescale 1ns / 1ps

module tb_4pt;

    // Parameters
    parameter N = 16;

    // Inputs
  
    reg signed [N-1:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3;
    reg signed [N-1:0] w2r0, w2i0, w4r0, w4i0, w4r1, w4i1;

    // Outputs
    wire signed [N-1:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3;

    // Instantiate the fft4pt module
    fft4pt #(N) uut (
       
        .xr0(xr0), .xi0(xi0),
        .xr1(xr1), .xi1(xi1),
        .xr2(xr2), .xi2(xi2),
        .xr3(xr3), .xi3(xi3),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0),
        .w4r1(w4r1), .w4i1(w4i1),
        .Xr0(Xr0), .Xi0(Xi0),
        .Xr1(Xr1), .Xi1(Xi1),
        .Xr2(Xr2), .Xi2(Xi2),
        .Xr3(Xr3), .Xi3(Xi3)
    );

    // Clock generation
  
    // Test inputs
    initial begin
        // Initialize inputs
       w2r0 = 16'h0001; w2i0 = 16'h0000;
       w4r0 = 16'h0001; w4i0 = 16'h0000;
         w4r1 = 16'h0000; w4i1 = -16'h0001;
        // Apply test vectors
       
        xr0 = 16'h0000; xi0 = 16'h0000;
        xr1 = 16'h0002; xi1 = 16'h0000;
        xr2 = 16'h0004; xi2 = 16'h0000;
        xr3 = 16'h0006; xi3 = 16'h0000;

        // Wait for FFT computation
        #50;

        // Additional test case
        xr0 = 16'h0004; xi0 = 16'h0003;
        xr1 = 16'h0002; xi1 = 16'h0001;
        xr2 = -16'h0001; xi2 = -16'h0002;
        xr3 = -16'h0003; xi3 = -16'h0004;

        // Wait for FFT computation
        #50;

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor($time, " Xr0=%d, Xi0=%d, Xr1=%d, Xi1=%d, Xr2=%d, Xi2=%d, Xr3=%d, Xi3=%d",
                 Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3);
    end

endmodule
