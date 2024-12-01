`timescale 1ns / 1ps

module tb_4pt;
    parameter N = 5;  // Bit-width for inputs and outputs

    // Inputs
    reg clk;
    reg signed [N-1:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3; // Inputs
    reg signed [N-1:0] w2r0, w2i0, w4r0, w4i0,w4r1,w4i1; // Twiddle factors

    // Outputs
    wire signed [N-1:0] tr0, ti0, tr1, ti1,tr2, ti2, tr3, ti3,Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3; // FFT outputs

    // Instantiate the fft4pt module
    fft4pt #(N) uut (
        .clk(clk),
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
    initial begin
        clk = 0;  // Initialize clock
    end
    always #5 clk = ~clk;  // Clock toggles every 5ns

    // Apply stimuli
    initial begin


        w2r0=1;w2i0=0;
        w4r0=1;w4i0=0;
        w4r1=0;w4i1=-1;
        // Test case 1: Simple inputs
    //     xr0 = 5'd0; xi0 = 5'd0;  // x(0) = 0 + j0
    //     xr1 = 5'd1; xi1 = 5'd0;  // x(1) = 1 + j0
    //     xr2 = 5'd2; xi2 = 5'd0;  // x(2) = 2 + j0
    //     xr3 = 5'd3; xi3 = 5'd0;  // x(3) = 3 + j0
    //    // wr0 = 5'd1; wi0 = 5'd0;  // Twiddle factor W0 = 1 + j0
    //    // wr1 = 5'd1; wi1 = 5'd0; // Twiddle factor W1 = 0 - j1
    //     #20;  // Wait for results



// $display("expected output is for testcase 1   x = [0,1,2,3]");
// $display("6.0000 + 0.0000i , -2.0000 + 2.0000i , -2.0000 + 0.0000i  ,-2.0000 - 2.0000i");
//         // Test case 2: Inputs with imaginary components
//         xr0 = 5'd1; xi0 = 5'd1;  // x(0) = 1 + j1
//         xr1 = 5'd2; xi1 = -5'd1; // x(1) = 2 - j1
//         xr2 = 5'd0; xi2 = 5'd0;  // x(2) = 0 + j0
//         xr3 = -5'd1; xi3 = 5'd1; // x(3) = -1 + j1
//       //  wr0 = 5'd1; wi0 = 5'd0;  // Twiddle factor W0 = 1 + j0
//       //  wr1 = 5'd1; wi1 = 0; // Twiddle factor W1 = 0 - j1
//         #20;  // Wait for results

//        $display("expected output is for testcase 2 is x=[1+i,2-i,0,-1+i]  ");
// $display("2.0000 + 1.0000i  ,-1.0000 - 2.0000i ,  0.0000 + 1.0000i  , 3.0000 + 4.0000i");

        // Test case 3: Complex inputs
        xr0 = 5'd0; xi0 = 5'd0;  // x(0) =12
        xr1 = 5'd2; xi1 = 5'd0; // x(1) = -4+4j
        xr2 = 5'd4; xi2 = 5'd0;  // x(2) = 16
        xr3 = 5'd6; xi3 = 5'd0;  // x(3) = 4+4j
     //   wr0 = 5'd1; wi0 = 5'd0;  // Twiddle factor W0 = 1 
     //   wr1 = 5'd0; wi1 = -5'd1; // Twiddle factor W1 = -j
        #20;  // Wait for results

        // $display("Test case 3: x = [4+j3, -2-j1, 1+j, 0]");
        // $display("3.0000 + 3.0000i ,  2.0000 + 4.0000i ,  7.0000 + 5.0000i  , 4.0000 + 0.0000i");
                 
//         // End simulation
        $finish;
    end
endmodule
