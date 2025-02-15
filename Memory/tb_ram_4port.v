`timescale 1ns / 1ps

module ram_4port_tb;
    reg reset;
    reg clkA, clkB, clkC, clkD;
    reg write_enA, read_enA, write_enB, read_enB;
    reg write_enC, read_enC, write_enD, read_enD;
    reg [255:0] data_inA, data_inB, data_inC, data_inD;
    wire [255:0] data_outA, data_outB, data_outC, data_outD;
    reg [31:0] read_addrA, write_addrA;
    reg [31:0] read_addrB, write_addrB;
    reg [31:0] read_addrC, write_addrC;
    reg [31:0] read_addrD, write_addrD;
    
    // Instantiate the RAM module
    ram_4port uut (
        .reset(reset),
        .clkA(clkA), .write_enA(write_enA), .read_enA(read_enA), .data_inA(data_inA), .data_outA(data_outA), .read_addrA(read_addrA), .write_addrA(write_addrA),
        .clkB(clkB), .write_enB(write_enB), .read_enB(read_enB), .data_inB(data_inB), .data_outB(data_outB), .read_addrB(read_addrB), .write_addrB(write_addrB),
        .clkC(clkC), .write_enC(write_enC), .read_enC(read_enC), .data_inC(data_inC), .data_outC(data_outC), .read_addrC(read_addrC), .write_addrC(write_addrC),
        .clkD(clkD), .write_enD(write_enD), .read_enD(read_enD), .data_inD(data_inD), .data_outD(data_outD), .read_addrD(read_addrD), .write_addrD(write_addrD)
    );

    // Clock generation
    always #5 clkA = ~clkA;
    always #5 clkB = ~clkB;
    always #5 clkC = ~clkC;
    always #5 clkD = ~clkD;
    

    
    // Testbench
    initial begin
        // Initialize signals
        clkA = 0; clkB = 0; clkC = 0; clkD = 0;
        reset = 1;
        write_enA = 0; read_enA = 0; write_enB = 0; read_enB = 0;
        write_enC = 0; read_enC = 0; write_enD = 0; read_enD = 0;
        data_inA = 256'b0; data_inB = 256'b0; data_inC = 256'b0; data_inD = 256'b0;
        read_addrA = 0; write_addrA = 0;
        read_addrB = 0; write_addrB = 0;
        read_addrC = 0; write_addrC = 0;
        read_addrD = 0; write_addrD = 0;
        
        // Reset memory
        #10 reset = 0;
        
        // Write operation on Port A
//        #10 write_enA = 1;
//        write_addrA = 4;
//        data_inA = 256'hAABBCCDDEEFF00112233445566778899AABBCCDDEEFF00112233445566778899;
//        #10 write_enA = 0;
        
        // Read operation on Port A
        #10 read_enA = 1;
        read_addrA = 2226;
        #10 $display("Data Out A: %h", data_outA);
        #10 read_enA = 0;
        
        // Check results
        #20 $display("Data Out A: %h", data_outA);
        
        // End simulation
        #100 $finish;
    end
    
endmodule
