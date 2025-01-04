`timescale 1ns/1ps

// this module stores the output of the computed image, it is 32bit reg for single data and total of 8x8 32bit reg which is 64 in 2D array
module out_rom (
    input clk,
    input [7:0] addr,
    input [31:0] data_in,
    input write_en,
    output [31:0] data_out
);
    reg [31:0] mem [0:63];
    reg [31:0] data_out_reg;

    assign data_out = data_out_reg;
    always @(posedge clk) begin
        if (write_en) begin
            mem[addr] <= data_in;
        end
        else begin
            data_out_reg <= mem[addr];
        end
    end

    
endmodule