`timescale 1ns / 1ps

module tb_8pt;

    // Inputs
    reg clk;
    reg [31:0] xr0, xi0, xr1, xi1, xr2, xi2, xr3, xi3, xr4, xi4, xr5, xi5, xr6, xi6, xr7, xi7; // Inputs


    // Outputs
    wire [31:0] Xr0, Xi0, Xr1, Xi1, Xr2, Xi2, Xr3, Xi3,Xr4, Xi4, Xr5, Xi5, Xr6, Xi6, Xr7, Xi7;// FFT outputs                             // FFT outputs0
    // Instantiate the fft4pt module
    fft8pt uut (
        .clk(clk),
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
   

    // Clock generation
    initial begin
        clk = 0;  // Initialize clock
    end
    always #10 clk = ~clk;  // Clock toggles every 5ns

    // Apply stimuli
    initial begin





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

if(Xr0 !== 28)
  $display("WRONG Xr0, expected 28; obtained %0.4f", Xr0);
if(Xi0 !== 0)
  $display("WRONG Xi0, expected 0; obtained %0.4f", Xi0);
if(Xr1 !== -4)
  $display("WRONG Xr1, expected -4; obtained %0.4f", Xr1);
if(Xi1 !== 9.6569)
  $display("WRONG Xi1, expected 9.6569; obtained %0.4f", Xi1);
if(Xr2 !== -4)
  $display("WRONG Xr2, expected -4; obtained %0.4f", Xr2);
if(Xi2 !== 4.0000)
  $display("WRONG Xi2, expected 4.0000; obtained %0.4f", Xi2);
if(Xr3 !== -4)
  $display("WRONG Xr3, expected -4; obtained %0.4f", Xr3);
if(Xi3 !== 1.6569)
  $display("WRONG Xi3, expected 1.6569; obtained %0.4f", Xi3);
if(Xr4 !== -4)
  $display("WRONG Xr4, expected -4; obtained %0.4f", Xr4);
if(Xi4 !== 0.0000)
  $display("WRONG Xi4, expected 0.0000; obtained %0.4f", Xi4);
if(Xr5 !== -4)
  $display("WRONG Xr5, expected -4; obtained %0.4f", Xr5);
if(Xi5 !== -1.6569)
  $display("WRONG Xi5, expected -1.6569; obtained %0.4f", Xi5);
if(Xr6 !== -4)
  $display("WRONG Xr6, expected -4; obtained %0.4f", Xr6);
if(Xi6 !== -4.0000)
  $display("WRONG Xi6, expected -4.0000; obtained %0.4f", Xi6);
if(Xr7 !== -4)
  $display("WRONG Xr7, expected -4; obtained %0.4f", Xr7);
if(Xi7 !== -9.6569)
  $display("WRONG Xi7, expected -9.6569; obtained %0.4f", Xi7);

$display(" ");
$display(" ");
$display(" ");
// Display correct values with expected and obtained values
if (Xr0 === 28)
  $display("CORRECT Xr0, expected 28; obtained %0.4f", Xr0);
if (Xi0 === 0)
  $display("CORRECT Xi0, expected 0; obtained %0.4f", Xi0);
if (Xr1 === -4)
  $display("CORRECT Xr1, expected -4; obtained %0.4f", Xr1);
if (Xi1 === 9.6569)
  $display("CORRECT Xi1, expected 9.6569; obtained %0.4f", Xi1);
if (Xr2 === -4)
  $display("CORRECT Xr2, expected -4; obtained %0.4f", Xr2);
if (Xi2 === 4.0000)
  $display("CORRECT Xi2, expected 4.0000; obtained %0.4f", Xi2);
if (Xr3 === -4)
  $display("CORRECT Xr3, expected -4; obtained %0.4f", Xr3);
if (Xi3 === 1.6569)
  $display("CORRECT Xi3, expected 1.6569; obtained %0.4f", Xi3);
if (Xr4 === -4)
  $display("CORRECT Xr4, expected -4; obtained %0.4f", Xr4);
if (Xi4 === 0.0000)
  $display("CORRECT Xi4, expected 0.0000; obtained %0.4f", Xi4);
if (Xr5 === -4)
  $display("CORRECT Xr5, expected -4; obtained %0.4f", Xr5);
if (Xi5 === -1.6569)
  $display("CORRECT Xi5, expected -1.6569; obtained %0.4f", Xi5);
if (Xr6 === -4)
  $display("CORRECT Xr6, expected -4; obtained %0.4f", Xr6);
if (Xi6 === -4.0000)
  $display("CORRECT Xi6, expected -4.0000; obtained %0.4f", Xi6);
if (Xr7 === -4)
  $display("CORRECT Xr7, expected -4; obtained %0.4f", Xr7);
if (Xi7 === -9.6569)
  $display("CORRECT Xi7, expected -9.6569; obtained %0.4f", Xi7);


    $finish;
  end

endmodule