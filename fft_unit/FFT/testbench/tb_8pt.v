`timescale 1ns / 1ps

module tb_8pt;

    // Inputs
    reg clk;
    reg [31:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, xr4, xi4, xr5, xi5, xr6, xi6, xr7, xi7;

    // Outputs
    wire [31:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3, Xr4, Xi4, Xr5, Xi5, Xr6, Xi6, Xr7, Xi7;

    // Instantiate the fft8pt module
    fft8pt uut (
        .xr0(xr0), .xi0(xi0),
        .xr1(xr1), .xi1(xi1),
        .xr2(xr2), .xi2(xi2),
        .xr3(xr3), .xi3(xi3),
        .xr4(xr4), .xi4(xi4),
        .xr5(xr5), .xi5(xi5),
        .xr6(xr6), .xi6(xi6),
        .xr7(xr7), .xi7(xi7),
        .Xr0(Xr0), .Xi0(Xi0),
        .Xr1(Xr1), .Xi1(Xi1),
        .Xr2(Xr2), .Xi2(Xi2),
        .Xr3(Xr3), .Xi3(Xi3),
        .Xr4(Xr4), .Xi4(Xi4),
        .Xr5(Xr5), .Xi5(Xi5),
        .Xr6(Xr6), .Xi6(Xi6),
        .Xr7(Xr7), .Xi7(Xi7)
    );

    // Apply stimuli
    initial begin
        // Testcase 1: Input values in IEEE 754 single-precision format
        xr0 = 32'h00000000; xi0 = 32'h00000000; // 0.0 + j0.0
        xr1 = 32'h3f800000; xi1 = 32'h00000000; // 1.0 + j0.0
        xr2 = 32'h40000000; xi2 = 32'h00000000; // 2.0 + j0.0
        xr3 = 32'h40400000; xi3 = 32'h00000000; // 3.0 + j0.0
        xr4 = 32'h40800000; xi4 = 32'h00000000; // 4.0 + j0.0
        xr5 = 32'h40a00000; xi5 = 32'h00000000; // 5.0 + j0.0
        xr6 = 32'h40c00000; xi6 = 32'h00000000; // 6.0 + j0.0
        xr7 = 32'h40e00000; xi7 = 32'h00000000; // 7.0 + j0.0

        #100;  // Wait for results

        // Testcase 2: Randomized inputs
        xr0 = 32'h3f000000; xi0 = 32'hbf800000; // 0.5 + j-1.0
        xr1 = 32'hbf800000; xi1 = 32'h3f000000; // -1.0 + j0.5
        xr2 = 32'h40000000; xi2 = 32'hc0000000; // 2.0 + j-2.0
        xr3 = 32'h40400000; xi3 = 32'h40400000; // 3.0 + j3.0
        xr4 = 32'hbf800000; xi4 = 32'h40800000; // -1.0 + j4.0
        xr5 = 32'hc0400000; xi5 = 32'h00000000; // -3.0 + j0.0
        xr6 = 32'h3f800000; xi6 = 32'hc0400000; // 1.0 + j-3.0
        xr7 = 32'hc0000000; xi7 = 32'h40000000; // -2.0 + j2.0

        #100;  // Wait for results

        $finish;
    end

endmodule
