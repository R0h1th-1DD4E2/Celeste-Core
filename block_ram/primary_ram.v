`timescale 1ns / 1ps

module primary_ram #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 3  // For 8x8 blocks
)(
    input wire clk,
    
    // Input data interface
    input wire [511:0] input_data_real_in,
    input wire [511:0] input_data_imag_in,
    input wire input_we,
    input wire input_rd,
    input wire [ADDR_WIDTH-1:0] input_wr_row_addr,
    input wire [ADDR_WIDTH-1:0] input_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] input_rd_row_addr,
    input wire [ADDR_WIDTH-1:0] input_rd_col_addr,
    output wire [511:0] input_data_real_out,
    output wire [511:0] input_data_imag_out,
    
    // Row FFT interface
    input wire row_fft_we,
    input wire row_fft_rd,
    input wire [ADDR_WIDTH-1:0] row_wr_addr,
    input wire [ADDR_WIDTH:0] row_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] row_rd_addr,
    input wire [ADDR_WIDTH:0] row_rd_col_addr,
    input wire [511:0] row_data_real_in,
    input wire [511:0] row_data_imag_in,
    output wire [511:0] row_data_real_out,
    output wire [511:0] row_data_imag_out,
    
    // Column FFT interface
    input wire col_fft_we,
    input wire col_fft_rd,
    input wire [ADDR_WIDTH-1:0] col_wr_addr,
    input wire [ADDR_WIDTH-1:0] col_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] col_rd_addr,
    input wire [ADDR_WIDTH-1:0] col_rd_col_addr,
    input wire [511:0] col_data_real_in,
    input wire [511:0] col_data_imag_in,
    output wire [511:0] col_data_real_out,
    output wire [511:0] col_data_imag_out,
    
    // Kernel multiplier interface
    input wire kernel_we,
    input wire kernel_rd,
    input wire [ADDR_WIDTH-1:0] kernel_wr_addr,
    input wire [ADDR_WIDTH-1:0] kernel_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] kernel_rd_addr,
    input wire [ADDR_WIDTH-1:0] kernel_rd_col_addr,
    input wire [511:0] kernel_data_real_in,
    input wire [511:0] kernel_data_imag_in,
    output wire [511:0] kernel_data_real_out,
    output wire [511:0] kernel_data_imag_out,
    
    // IFFT column interface
    input wire ifft_we,
    input wire ifft_rd,
    input wire [ADDR_WIDTH-1:0] ifft_wr_addr,
    input wire [ADDR_WIDTH:0] ifft_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] ifft_rd_addr,
    input wire [ADDR_WIDTH:0] ifft_rd_col_addr,
    input wire [511:0] ifft_data_real_in,
    input wire [511:0] ifft_data_imag_in,
    output wire [511:0] ifft_data_real_out,
    output wire [511:0] ifft_data_imag_out,
    
    // Output data interface
    input wire output_we,
    input wire output_rd,
    input wire [ADDR_WIDTH-1:0] output_wr_row_addr,
    input wire [ADDR_WIDTH-1:0] output_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] output_rd_row_addr,
    input wire [ADDR_WIDTH-1:0] output_rd_col_addr,
    input wire [511:0] output_data_real_in,
    input wire [511:0] output_data_imag_in,
    output wire [511:0] output_data_real_out,
    output wire [511:0] output_data_imag_out,
    
    // Kernel Storage
    input wire ker_we,
    input wire ker_rd,
    input wire [ADDR_WIDTH-1:0] ker_wr_row_addr,
    input wire [ADDR_WIDTH-1:0] ker_wr_col_addr,
    input wire [ADDR_WIDTH-1:0] ker_rd_row_addr,
    input wire [ADDR_WIDTH-1:0] ker_rd_col_addr,
    input wire [511:0] ker_data_real_in,
    input wire [511:0] ker_data_imag_in,
    output wire [511:0] ker_data_real_out,
    output wire [511:0] ker_data_imag_out
);

    // Input data RAM (8x8) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(8)
    ) input_data_real (
        .clk(clk),
        .wr_row_addr(input_wr_row_addr),
        .wr_col_addr(input_wr_col_addr),
        .rd_row_addr(input_rd_row_addr),
        .rd_col_addr(input_rd_col_addr),
        .data_in(input_data_real_in),
        .we(input_we),
        .rd(input_rd),
        .data_out(input_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(8)
    ) input_data_imag (
        .clk(clk),
        .wr_row_addr(input_wr_row_addr),
        .wr_col_addr(input_wr_col_addr),
        .rd_row_addr(input_rd_row_addr),
        .rd_col_addr(input_rd_col_addr),
        .data_in(input_data_imag_in),
        .we(input_we),
        .rd(input_rd),
        .data_out(input_data_imag_out)
    );

    // Row intermediate RAM (8x16) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(16)
    ) pipe_row_intermediate_real (
        .clk(clk),
        .wr_row_addr(row_wr_addr),
        .wr_col_addr(row_wr_col_addr),
        .rd_row_addr(row_rd_addr),
        .rd_col_addr(row_rd_col_addr),
        .data_in(row_data_real_in),
        .we(row_fft_we),
        .rd(row_fft_rd),
        .data_out(row_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(16)
    ) pipe_row_intermediate_imag (
        .clk(clk),
        .wr_row_addr(row_wr_addr),
        .wr_col_addr(row_wr_col_addr),
        .rd_row_addr(row_rd_addr),
        .rd_col_addr(row_rd_col_addr),
        .data_in(row_data_imag_in),
        .we(row_fft_we),
        .rd(row_fft_rd),
        .data_out(row_data_imag_out)
    );

    // Column intermediate RAM (8x8) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(8)
    ) column_intermediate_real (
        .clk(clk),
        .wr_row_addr(col_wr_addr),
        .wr_col_addr(col_wr_col_addr),
        .rd_row_addr(col_rd_addr),
        .rd_col_addr(col_rd_col_addr),
        .data_in(col_data_real_in),
        .we(col_fft_we),
        .rd(col_fft_rd),
        .data_out(col_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(8)
    ) column_intermediate_imag (
        .clk(clk),
        .wr_row_addr(col_wr_addr),
        .wr_col_addr(col_wr_col_addr),
        .rd_row_addr(col_rd_addr),
        .rd_col_addr(col_rd_col_addr),
        .data_in(col_data_imag_in),
        .we(col_fft_we),
        .rd(col_fft_rd),
        .data_out(col_data_imag_out)
    );

    // Kernel multiplied RAM (8x8) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(8)
    ) kernel_multiplied_real (
        .clk(clk),
        .wr_row_addr(kernel_wr_addr),
        .wr_col_addr(kernel_wr_col_addr),
        .rd_row_addr(kernel_rd_addr),
        .rd_col_addr(kernel_rd_col_addr),
        .data_in(kernel_data_real_in),
        .we(kernel_we),
        .rd(kernel_rd),
        .data_out(kernel_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(8)
    ) kernel_multiplied_imag (
        .clk(clk),
        .wr_row_addr(kernel_wr_addr),
        .wr_col_addr(kernel_wr_col_addr),
        .rd_row_addr(kernel_rd_addr),
        .rd_col_addr(kernel_rd_col_addr),
        .data_in(kernel_data_imag_in),
        .we(kernel_we),
        .rd(kernel_rd),
        .data_out(kernel_data_imag_out)
    );

    // IFFT row intermediate RAM (8x16) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(16)
    ) pipe_inv_column_intermediate_real (
        .clk(clk),
        .wr_row_addr(ifft_wr_addr),
        .wr_col_addr(ifft_wr_col_addr),
        .rd_row_addr(ifft_rd_addr),
        .rd_col_addr(ifft_rd_col_addr),
        .data_in(ifft_data_real_in),
        .we(ifft_we),
        .rd(ifft_rd),
        .data_out(ifft_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(16)
    ) pipe_inv_colunm_intermediate_imag (
        .clk(clk),
        .wr_row_addr(ifft_wr_addr),
        .wr_col_addr(ifft_wr_col_addr),
        .rd_row_addr(ifft_rd_addr),
        .rd_col_addr(ifft_rd_col_addr),
        .data_in(ifft_data_imag_in),
        .we(ifft_we),
        .rd(ifft_rd),
        .data_out(ifft_data_imag_out)
    );

    // Output data RAM (8x8) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(8)
    ) output_data_real (
        .clk(clk),
        .wr_row_addr(output_wr_row_addr),
        .wr_col_addr(output_wr_col_addr),
        .rd_row_addr(output_rd_row_addr),
        .rd_col_addr(output_rd_col_addr),
        .data_in(output_data_real_in),
        .we(output_we),
        .rd(output_rd),
        .data_out(output_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(8)
    ) output_data_imag (
        .clk(clk),
        .wr_row_addr(output_wr_row_addr),
        .wr_col_addr(output_wr_col_addr),
        .rd_row_addr(output_rd_row_addr),
        .rd_col_addr(output_rd_col_addr),
        .data_in(output_data_imag_in),
        .we(output_we),
        .rd(output_rd),
        .data_out(output_data_imag_out)
    );
    
    // Kernel RAM (8x8) - Real and Imaginary
    ram #(
        .ROW(8),
        .COLUMN(8)
    ) kernel_real (
        .clk(clk),
        .wr_row_addr(ker_wr_row_addr),
        .wr_col_addr(ker_wr_col_addr),
        .rd_row_addr(ker_rd_row_addr),
        .rd_col_addr(ker_rd_col_addr),
        .data_in(ker_data_real_in),
        .we(ker_we),
        .rd(ker_rd),
        .data_out(ker_data_real_out)
    );

    ram #(
        .ROW(8),
        .COLUMN(8)
    ) kernel_imag (
        .clk(clk),
        .wr_row_addr(ker_wr_row_addr),
        .wr_col_addr(ker_wr_col_addr),
        .rd_row_addr(ker_rd_row_addr),
        .rd_col_addr(ker_rd_col_addr),
        .data_in(ker_data_imag_in),
        .we(ker_we),
        .rd(ker_rd),
        .data_out(ker_data_imag_out)
    );

endmodule