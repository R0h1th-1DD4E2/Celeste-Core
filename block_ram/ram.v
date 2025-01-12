`timescale 1ns / 1ps

module ram #(parameter ROW = 8, COLUMN = 8)(
    input wire clk,
    input wire [$clog2(ROW)-1:0] wr_row_addr,
    input wire [$clog2(COLUMN)-1:0] wr_col_addr,
    input wire [$clog2(ROW)-1:0] rd_row_addr,
    input wire [$clog2(COLUMN)-1:0] rd_col_addr,
    input wire [511:0] data_in,  // 16 x 32-bit wire
    input wire we,
    input wire rd,
    output reg [511:0] data_out  // 16 x 32-bit wire
);
    reg [31:0] ram [ROW-1:0][COLUMN-1:0];
    reg [3:0] i, j;
    
    always @(posedge clk) begin
        // Handle Write Operations
        if (we) begin
            for (i = 0; i < 8; i = i + 1) begin
                for (j = 0; j < 2; j = j + 1) begin
                    if ((wr_row_addr + i) < ROW && (wr_col_addr + j) < COLUMN) begin
                        ram[wr_row_addr + i][wr_col_addr + j] <= data_in[((i * 2 + j) * 32) +: 32];
                    end
                end
            end
        end
        
        // Handle Read Operations
        if (rd) begin
            for (i = 0; i < 8; i = i + 1) begin
                for (j = 0; j < 2; j = j + 1) begin
                    if ((rd_row_addr + i) < ROW && (rd_col_addr + j) < COLUMN) begin
                        data_out[((i * 2 + j) * 32) +: 32] <= ram[rd_row_addr + i][rd_col_addr + j];
                    end else begin
                        data_out[((i * 2 + j) * 32) +: 32] <= 32'h0;
                    end
                end
            end
        end
    end
endmodule

