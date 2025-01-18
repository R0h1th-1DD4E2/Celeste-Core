`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 06:52:19 PM
// Design Name: 
// Module Name: tb_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for writing and reading data from the dual-port RAM module.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_ram;

    // Testbench signals
    reg clkA, clkB;
    reg write_enA, write_enB;
    reg read_enA, read_enB;
    reg [31:0] data_inA, data_inB;
    wire [31:0] data_outA, data_outB;
    reg [10:0] write_addrA, write_addrB;
    reg [10:0] read_addrA, read_addrB;

    // Instantiate the RAM module
    ram uut (
        .clkA(clkA),
        .write_enA(write_enA),
        .read_enA(read_enA),
        .data_inA(data_inA),
        .data_outA(data_outA),
        .write_addrA(write_addrA),
        .read_addrA(read_addrA),
        .clkB(clkB),
        .write_enB(write_enB),
        .read_enB(read_enB),
        .data_inB(data_inB),
        .data_outB(data_outB),
        .write_addrB(write_addrB),
        .read_addrB(read_addrB)
    );

    // Clock generation for clkA and clkB
    always begin
        #5 clkA = ~clkA;  // 10ns clock period
    end

    always begin
        #5 clkB = ~clkB;  // 10ns clock period
    end

    // Testbench logic
    initial begin
        // Initialize clocks
        clkA = 0;
        clkB = 0;

        // Initialize control signals
        write_enA = 0;
        write_enB = 0;
        read_enA = 0;
        read_enB = 0;
        data_inA = 0;
        data_inB = 0;
        write_addrA = 0;
        write_addrB = 0;
        read_addrA = 0;
        read_addrB = 0;

        // Write test cases
        #10;

        // Test 1: Write to address 0 using port A
        write_enA = 1;
        data_inA = 32'hAABBCCDD;
        write_addrA = 11'd0;
        #10;  // Wait for one clock cycle
        write_enA = 0; // Disable write

        // Test 2: Write to address 10 using port B
        write_enB = 1;
        data_inB = 32'h11223344;
        write_addrB = 11'd10;
        #10;  // Wait for one clock cycle
        write_enB = 0; // Disable write

        // Read test cases
        #10;

        // Test 3: Read from address 0 using port A
        read_enA = 1;
        read_addrA = 11'd0;
        #10;  // Wait for one clock cycle
        $display("Read Data from Port A (address 0): %h", data_outA);
        read_enA = 0;

        // Test 4: Read from address 10 using port B
        read_enB = 1;
        read_addrB = 11'd10;
        #10;  // Wait for one clock cycle
        $display("Read Data from Port B (address 10): %h", data_outB);
        read_enB = 0;

        // Test 5: Read from address 1 (empty) using port A
        read_enA = 1;
        read_addrA = 11'd1;
        #10;  // Wait for one clock cycle
        $display("Read Data from Port A (address 1): %h", data_outA);
        read_enA = 0;

        // Finish simulation
        #10;
        $writememh("/home/sateesh/pico_ws/RAM/output.hex", uut.mem);


        $finish;
    end

endmodule
