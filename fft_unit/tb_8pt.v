`timescale 1ns / 1ps

module tb_8pt;
    parameter N = 16;  // Bit-width for inputs and outputs

    // Inputs
    reg clk;
    reg signed [N-1:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, xr4, xi4, xr5, xi5, xr6, xi6, xr7, xi7; // Inputs
    reg signed [N-1:0] w2r0, w2i0;               // For 2-point FFTs
    reg signed [N-1:0] w4r0, w4i0, w4r1, w4i1;       // For 4-point FFTs
    reg signed [N-1:0] w8r0, w8i0, w8r1, w8i1, w8r2, w8i2, w8r3, w8i3; // For 8-point combination

    // Outputs
    wire signed [N-1:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3,Xr4, Xi4, Xr5, Xi5, Xr6, Xi6, Xr7, Xi7; // FFT outputs

    // Instantiate the fft4pt module
    fft8pt #(N) uut (
        .clk(clk),
        .xr0(xr0), .xi0(xi0),
        .xr1(xr1), .xi1(xi1),
        .xr2(xr2), .xi2(xi2),
        .xr3(xr3), .xi3(xi3),
        .xr4(xr4), .xi4(xi4),
        .xr5(xr5), .xi5(xi5),
        .xr6(xr6), .xi6(xi6),
        .xr7(xr7), .xi7(xi7),
        .w2r0(w2r0), .w2i0(w2i0),
        .w4r0(w4r0), .w4i0(w4i0), .w4r1(w4r1), .w4i1(w4i1),
        .w8r0(w8r0), .w8i0(w8i0), .w8r1(w8r1), .w8i1(w8i1), .w8r2(w8r2), .w8i2(w8i2), .w8r3(w8r3), .w8i3(w8i3),
        .Xr0(Xr0), .Xi0(Xi0),
        .Xr1(Xr1), .Xi1(Xi1),
        .Xr2(Xr2), .Xi2(Xi2),
        .Xr3(Xr3), .Xi3(Xi3),
        .Xr4(Xr4), .Xi4(Xi4),
        .Xr5(Xr5), .Xi5(Xi5),
        .Xr6(Xr6), .Xi6(Xi6),
        .Xr7(Xr7), .Xi7(Xi7)
    );
   

    // Clock generation
    initial begin
        clk = 0;  // Initialize clock
    end
    always #10 clk = ~clk;  // Clock toggles every 5ns

    // Apply stimuli
    initial begin


        w2r0=1;w2i0=0;

        w4r0=1;w4i0=0;
        w4r1=0;w4i1=-1;

        w8r0=1;w8i0=0;
        w8r1=0;w8i1=-1;


        w8r2=0.7071067812;                                       
        w8i2=-0.7071067812;  

        w8r3=-0.7071067812;
        w8i3=-0.7071067812;



xr0=0;xi0=0;
xr1=1;xi1=0;
xr2=2;xi2=0;
xr3=3;xi3=0;
xr4=4;xi4=0;
xr5=5;xi5=0;
xr6=6;xi6=0;
xr7=7;xi7=0;

        #100;  // Wait for results

    $display("Xr0",Xr0);
    $display("Xi0",Xi0);
        $display("  ");
    $display("Xr1",Xr1);
    $display("Xi1",Xi1);
        $display("  ");
    $display("Xr2",Xr2);
    $display("Xi2",Xi2);
        $display("  ");
    $display("Xr3",Xr3);
    $display("Xi3",Xi3);
        $display("  ");
    $display("Xr4",Xr4);
    $display("Xi4",Xi4);
        $display("  ");
    $display("Xr5",Xr5);
    $display("Xi5",Xi5);
        $display("  ");
    $display("Xr6",Xr6);
    $display("Xi6",Xi6);
        $display("  ");
    $display("Xr7",Xr7);
    $display("Xi7",Xi7);






        $finish;
    end
endmodule
