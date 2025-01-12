`timescale 1ns / 1ps

module tb_AXI;

// Parameters
parameter ADDRESS = 32;
parameter DATA_WIDTH = 32;

// Inputs
reg ACLK;
reg ARESETN;
reg read_s;
reg write_s;
reg [ADDRESS-1:0] address;
reg [DATA_WIDTH-1:0] W_data;

// Outputs (from axi_Controller)
wire [ADDRESS-1:0] M_ARADDR;
wire M_ARVALID;
wire M_RREADY;
wire [ADDRESS-1:0] M_AWADDR;
wire M_AWVALID;
wire [DATA_WIDTH-1:0] M_WDATA;
wire [3:0] M_WSTRB;
wire M_WVALID;
wire M_BREADY;

// Instantiate the axi_Controller module
axi_Controller #(
    .ADDRESS(ADDRESS),
    .DATA_WIDTH(DATA_WIDTH)
) u_axi_Controller (
    .ACLK(ACLK),
    .ARESETN(ARESETN),
    .read_s(read_s),
    .write_s(write_s),
    .address(address),
    .W_data(W_data)
);

// Clock Generation
initial begin
    ACLK = 0;
    forever #5 ACLK = ~ACLK; // 100MHz clock
end

// Reset Generation
initial begin
    ARESETN = 0;
    #15 ARESETN = 1; // Release reset after 15ns
end

// Testbench logic
initial begin
    // Initialize signals
    read_s = 0;
    write_s = 0;
    address = 32'h0000_0000;
    W_data = 32'h0000_0000;

    // Apply stimulus
    #20;

    // Test Write Operation
    // Load data from the hex file into the write data
    $readmemh("ram_test.hex", u_axi_Controller.mem_data); // Load hex file into memory

    // Test writing data to the RAM
    write_s = 1;
    address = 32'h0000_0000; // Address to write to
    W_data = u_axi_Controller.mem_data[0];    // First value to write from the hex file
    #10;

    // Wait for write response
    write_s = 0;
    #20;

    // Test Read Operation
    read_s = 1;
    address = 32'h0000_0000; // Address to read from
    #10;

    // Wait for read response
    read_s = 0;
    #20;

    // Add more read/write tests here if necessary

    // End simulation
    $finish;
end

endmodule
