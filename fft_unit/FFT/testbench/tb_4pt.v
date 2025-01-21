`timescale 1ns / 1ps

module tb_4pt;

    // Inputs (32-bit IEEE 754 floating point)
    reg [31:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3;
    reg [31:0] w2r0, w2i0, w4r0, w4i0, w4r1, w4i1;

    // Outputs (32-bit IEEE 754 floating point)
    wire [31:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3;

    // Instantiate the fft4pt module
    fft4pt uut (
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

    // Test inputs using IEEE 754 encoding (32-bit floating-point values)
    initial begin
        // Initialize inputs (example values in IEEE 754 format)
        w2r0 = 32'h3F800000;  // 1.0 in IEEE 754
        w2i0 = 32'h00000000;  // 0.0 in IEEE 754
        w4r0 = 32'h3F800000;  // 1.0 in IEEE 754
        w4i0 = 32'h00000000;  // 0.0 in IEEE 754
        w4r1 = 32'h00000000;  // 1.0 in IEEE 754
        w4i1 = 32'hBF800000;  // -1.0 in IEEE 754

        // Apply test vectors (example values in IEEE 754 format)
        xr0 = 32'h00000000;  // 0.0 in IEEE 754
        xi0 = 32'h00000000;  // 0.0 in IEEE 754
        xr1 = 32'h40000000;  // 2.0 in IEEE 754
        xi1 = 32'h00000000;  // 0.0 in IEEE 754
        xr2 = 32'h40800000;  // 4.0 in IEEE 754
        xi2 = 32'h00000000;  // 0.0 in IEEE 754
        xr3 = 32'h40C00000;  // 6.0 in IEEE 754
        xi3 = 32'h00000000;  // 0.0 in IEEE 754

        // Wait for FFT computation
        #50;

        // Additional test case with new IEEE 754 values
        xr0 = 32'h40400000;  // 3.0 in IEEE 754
        xi0 = 32'h40400000;  // 3.0 in IEEE 754
        xr1 = 32'h40000000;  // 2.0 in IEEE 754
        xi1 = 32'h3F800000;  // 1.0 in IEEE 754
        xr2 = 32'hBF800000;  // -1.0 in IEEE 754
        xi2 = 32'hC0000000;  // -2.0 in IEEE 754
        xr3 = 32'hBF800000;  // -1.0 in IEEE 754
        xi3 = 32'hBF800000;  // -1.0 in IEEE 754

        // Wait for FFT computation
        #50;

        // End simulation
        $finish;
    end

    // Monitor outputs (IEEE 754 format interpretation)
    initial begin
        $monitor($time, " Xr0=%h, Xi0=%h, Xr1=%h, Xi1=%h, Xr2=%h, Xi2=%h, Xr3=%h, Xi3=%h",
                 Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3);
    end

endmodule
