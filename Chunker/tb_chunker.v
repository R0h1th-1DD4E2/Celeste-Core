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
    wire [255:0] mem_data_in1;
    wire [255:0] mem_data_in2;
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
        // Instantiate the 4-port RAM
    ram_4port ram (
        .reset(rst),
        // Port A
        .clkA(clk),
        .write_enA(1'b0),  // We are not writing to Port A, only reading
        .read_enA(1'b1),
        .data_inA(256'h0),
        .data_outA(mem_data_in1),
        .read_addrA(mem_addr_out1),
        .write_addrA(32'b0),
        
        // Port B
        .clkB(clk),
        .write_enB(1'b0),
        .read_enB(1'b1),
        .data_inB(256'h0),
        .data_outB(mem_data_in2),
        .read_addrB(mem_addr_out2),
        .write_addrB(32'b0),

        // Port C
        .clkC(clk),
        .write_enC(1'b0),
        .read_enC(1'b0),
        .data_inC(256'h0),
        .data_outC(data_outC),
        .read_addrC(32'b0),
        .write_addrC(32'b0),
        
        // Port D
        .clkD(clk),
        .write_enD(1'b0),
        .read_enD(1'b0),
        .data_inD(256'h0),
        .data_outD(data_outD),
        .read_addrD(32'b0),
        .write_addrD(32'b0)
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

        
        #10 start = 1;rst = 0;
        

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

always@(*)begin
        if(done)begin
        start =0;
        end
        end


endmodule
