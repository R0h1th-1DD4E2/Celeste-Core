`timescale 1ns / 1ps

module ram_tb();
    // Parameters
    parameter ROW = 8;
    parameter COLUMN = 8;
    parameter CLK_PERIOD = 10;

    // Signals
    reg clk;
    reg [$clog2(ROW)-1:0] wr_row_addr;
    reg [$clog2(COLUMN)-1:0] wr_col_addr;
    reg [$clog2(ROW)-1:0] rd_row_addr;
    reg [$clog2(COLUMN)-1:0] rd_col_addr;
    reg [511:0] data_in;
    reg we;
    reg rd;
    wire [511:0] data_out;

    // Test variables
    integer i;
    
    // Instantiate RAM
    ram #(
        .ROW(ROW),
        .COLUMN(COLUMN)
    ) ram_inst (
        .clk(clk),
        .wr_row_addr(wr_row_addr),
        .wr_col_addr(wr_col_addr),
        .rd_row_addr(rd_row_addr),
        .rd_col_addr(rd_col_addr),
        .data_in(data_in),
        .we(we),
        .rd(rd),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Monitor block to track control signals
    initial begin
        $monitor("Time=%0t rd=%b we=%b data_out=%h", $time, rd, we, data_out);
    end

    // Main test sequence
    initial begin
        // Initialize
        we = 0;
        rd = 0;
        wr_row_addr = 0;
        wr_col_addr = 0;
        rd_row_addr = 0;
        rd_col_addr = 0;
        data_in = 0;

        // Wait for 100ns
        #100;
        $display("Starting test at time %0t", $time);

        // Test 1: Write operation
        $display("\nWriting data at time %0t", $time);
        for (i = 0; i < 16; i = i + 1) begin
            data_in[i*32 +: 32] = i + 1;
        end
        
        @(posedge clk);
        we = 1;
        $display("Write enabled at time %0t", $time);
        @(posedge clk);
        we = 0;
        
        // Wait a few cycles
        repeat(3) @(posedge clk);
        
        // Test 2: Read operation
        $display("\nReading data at time %0t", $time);
        rd = 1;
        $display("Read enabled at time %0t", $time);
        @(posedge clk);
        $display("After clock edge at time %0t, data_out = %h", $time, data_out);
        @(posedge clk);
        rd = 0;
        
        // Wait a few cycles
        repeat(3) @(posedge clk);
        
        // Display final data
        $display("\nFinal data_out at time %0t: %h", $time, data_out);
        
        #100;
        $finish;
    end

endmodule