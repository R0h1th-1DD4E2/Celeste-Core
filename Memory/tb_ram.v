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
// Description: Testbench for the dual-port RAM module checking only read operations.
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
    reg read_enA, read_enB;
    wire [31:0] data_outA, data_outB;
    reg [10:0] read_addrA, read_addrB;
    reg [31:0] mem [0:1023]; // Declare memory array with 32-bit word size and 1024 depth

    // Instantiate the RAM module
    ram xyz(
        .clkA(clkA),
        .read_enA(read_enA),
        .data_outA(data_outA),
        .read_addrA(read_addrA),
        .clkB(clkB),
        .read_enB(read_enB),
        .data_outB(data_outB),
        .read_addrB(read_addrB)
    );

    // Clock generation for clkA and clkB
    always begin
        #5 clkA = ~clkA;  // Generate clock for port A (period of 10ns)
    end

    always begin
        #5 clkB = ~clkB;  // Generate clock for port B (period of 10ns)
    end
 // Optional initialization of memory
    
    // Initial block to apply test vectors
    initial begin
        // Initialize clocks
        clkA = 0;
        clkB = 0;
        
        // Initialize control signals
        read_enA = 0;
        read_enB = 0;
        read_addrA = 0;
        read_addrB = 0;
        
        // Load memory from hex file (you can replace the file path with your own file)
        $readmemh("ram_init.hex", xyz.mem);  // Load data into RAM from the hex file
        
        // Apply read test cases
        #10;  // Wait for a few cycles

        // Test 1: Read from address 0 on port A
        read_enA = 1;  // Enable read from port A
        read_addrA = 0;
        
        #10;
        $display("Read Data from Port A (address 0): %h", data_outA); // Check output at address 0
        
        // Test 2: Read from address 100 on port B
        read_enB = 1;  // Enable read from port B
        read_addrB = 100;
        
        #10;
        $display("Read Data from Port B (address 100): %h", data_outB); // Check output at address 100

        // Test 3: Read from address 10 on port A
        read_enA = 1;  // Enable read from port A
        read_addrA = 10;
        
        #10;
        $display("Read Data from Port A (address 10): %h", data_outA); // Check output at address 10

        // Test 4: Read from address 200 on port B
        read_enB = 1;  // Enable read from port B
        read_addrB = 200;
        
        #10;
        $display("Read Data from Port B (address 200): %h", data_outB); // Check output at address 200

        // Finish simulation
        #10;
        $finish;
    end

endmodule
