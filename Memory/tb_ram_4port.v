`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2025 10:58:15 PM
// Design Name: 
// Module Name: tb_ram_4port
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_ram_4port_mul_push;
    // Testbench Signals
    reg clkA, clkB, clkC, clkD;
    reg reset;
    
    // Port A signals
    reg write_enA;
    reg read_enA;
    reg [255:0] data_inA;
    wire [255:0] data_outA;
    reg [31:0] write_addrA;
    reg [31:0] read_addrA;
    
    // Port B signals
    reg write_enB;
    reg read_enB;
    reg [255:0] data_inB;
    wire [255:0] data_outB;
    reg [31:0] write_addrB;
    reg [31:0] read_addrB;
    
    // Port C signals
    reg write_enC;
    reg read_enC;
    reg [255:0] data_inC;
    wire [255:0] data_outC;
    reg [31:0] write_addrC;
    reg [31:0] read_addrC;
    
    // Port D signals
    reg write_enD;
    reg read_enD;
    reg [255:0] data_inD;
    wire [255:0] data_outD;
    reg [31:0] write_addrD;
    reg [31:0] read_addrD;


    // Instantiate the DUT
    ram_4port_mul_push uutu (
        .reset(reset),
        // Port A
        .clkA(clkA), .write_enA(write_enA), .read_enA(read_enA),
        .data_inA(data_inA), .data_outA(data_outA),
        .write_addrA(write_addrA), .read_addrA(read_addrA),
        // Port B
        .clkB(clkB), .write_enB(write_enB), .read_enB(read_enB),
        .data_inB(data_inB), .data_outB(data_outB),
        .write_addrB(write_addrB), .read_addrB(read_addrB),
        // Port C
        .clkC(clkC), .write_enC(write_enC), .read_enC(read_enC),
        .data_inC(data_inC), .data_outC(data_outC),
        .write_addrC(write_addrC), .read_addrC(read_addrC),
        // Port D
        .clkD(clkD), .write_enD(write_enD), .read_enD(read_enD),
        .data_inD(data_inD), .data_outD(data_outD),
        .write_addrD(write_addrD), .read_addrD(read_addrD)
    );

    // Clock Generation
    always #5 clkA = ~clkA;  // 100 MHz clock
    always #5 clkB = ~clkB;  // 100 MHz clock
    always #5 clkC = ~clkC;  // 100 MHz clock
    always #5 clkD = ~clkD;  // 100 MHz clock

    // Test Sequence
    initial begin
        // Initialize signals
        clkA = 0; clkB = 0; clkC = 0; clkD = 0;
        reset = 1;
        reset=0;
        // Initialize Port A
        write_enA = 0;
        read_enA = 0;
        data_inA = 0;
        write_addrA = 0;
        read_addrA = 0;
        
        // Initialize Port B
        write_enB = 0;
        read_enB = 0;
        data_inB = 0;
        write_addrB = 0;
        read_addrB = 0;
        
        // Initialize Port C
        write_enC = 0;
        read_enC = 0;
        data_inC = 0;
        write_addrC = 0;
        read_addrC = 0;
        
        // Initialize Port D
        write_enD = 0;
        read_enD = 0;
        data_inD = 0;
        write_addrD = 0;
        read_addrD = 0;

        // Initialize memory from hex file
        $readmemh("S://Mini_project_workspace//Four_port VIVADO//memory_ini2.hex", uutu.mem);
       // fd = $fopen("results.hex", "w");

        // Reset sequence
        #10;
        reset = 0;

        // Read operations for Port A
//        read_enA = 1;
//        #10;
//        read_addrA = 0;
//        #20;
//        read_addrA = 8;
//        #20;
//        read_addrA = 16;
       
//        // Read operations for Port B
      
//        #10;
//        read_addrB = 24;
//        #20;
//        read_addrB = 32;
//        #20;
//        read_addrB = 40;
  

//        // Read operations for Port C
//        read_enC = 1;
//        #10;
//        read_addrC = 48;
//        #20;
//        read_addrC = 56;
//        #20;
//        read_addrC = 64;


//        // Read operations for Port D
//        read_enD = 1;
//        #10;
//        read_addrD = 72;
//        #20;
//        read_addrD = 80;
//        #20;
//        read_addrD = 88;
         read_enA = 1;
         read_enB=1;
         read_enC=1;
         read_enD=1;
         read_addrA=0;
         read_addrB=8;
         read_addrC=16;
         read_addrD=32;
        
        // End simulation
        #600 $finish;
    end
endmodule