`timescale 1ns / 1ps

module tb_chunker;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Testbench signals
    reg clk;
    reg rst;
    reg start;
    reg [31:0] image_base_addr;
    reg [31:0] image_width;
    reg [31:0] image_height;
    reg [255:0] mem_data_in1;
    reg [255:0] mem_data_in2;
    wire [511:0] chunk_data_out;
    wire chunk_valid;
    wire [31:0] mem_addr_out1;
    wire [31:0] mem_addr_out2;
    wire done;

    // Instantiate the DUT (Device Under Test)
    chunker_1 dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .image_base_addr(image_base_addr),
        .image_width(image_width),
        .image_height(image_height),
        .mem_data_in1(mem_data_in1),
        .mem_data_in2(mem_data_in2),
        .chunk_data_out(chunk_data_out),
        .chunk_valid(chunk_valid),
        .mem_addr_out1(mem_addr_out1),
        .mem_addr_out2(mem_addr_out2),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        start = 0;
        image_base_addr = 32'h0000_0000;
        image_width = 32'd32;  // Example width (2 chunks per row)
        image_height = 32'd32; // Example height (2 chunks per column)
        mem_data_in1 = 256'h0;
        mem_data_in2 = 256'h0;

        // Apply reset
        #(2 * CLK_PERIOD);
        rst = 0;

        // Start the chunker
        #(CLK_PERIOD);
        start = 1;

        // Simulate memory data inputs and processing
        #(CLK_PERIOD);
        start = 0;

        // Feed in memory data
        mem_data_in1 = 256'h00000001_00000002_00000003_00000004_00000005_00000006_00000007_00000008;
        mem_data_in2 = 256'h00000009_0000000A_0000000B_0000000C_0000000D_0000000E_0000000F_00000010;

        // Wait for the chunker to process
        

        // Observe outputs
        $display("Chunk Data Out: %h", chunk_data_out);
        $display("Memory Address Out1: %h", mem_addr_out1);
        $display("Memory Address Out2: %h", mem_addr_out2);

        // Wait for completion
       
        $display("Processing done.");

        // Finish simulation
        #9000;
       $finish;
    end

endmodule
