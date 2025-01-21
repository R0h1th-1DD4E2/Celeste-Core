`timescale 1ns / 1ps

module clked_8pt(
    input clk,
    input rst,
    input valid_in,
    output reg ready_in,
    input  [31:0] x0_real, x0_imag, x1_real, x1_imag, x2_real, x2_imag, x3_real, x3_imag,
                  x4_real, x4_imag, x5_real, x5_imag, x6_real, x6_imag, x7_real, x7_imag,
    output reg valid_out,
    input ready_out,
    output reg [31:0] X0_real, X0_imag, X1_real, X1_imag, X2_real, X2_imag, X3_real, X3_imag,
                      X4_real, X4_imag, X5_real, X5_imag, X6_real, X6_imag, X7_real, X7_imag
);

// Two sets of input registers for ping-pong buffering
reg [31:0] x0_real_reg [1:0], x0_imag_reg [1:0], x1_real_reg [1:0], x1_imag_reg [1:0];
reg [31:0] x2_real_reg [1:0], x2_imag_reg [1:0], x3_real_reg [1:0], x3_imag_reg [1:0];
reg [31:0] x4_real_reg [1:0], x4_imag_reg [1:0], x5_real_reg [1:0], x5_imag_reg [1:0];
reg [31:0] x6_real_reg [1:0], x6_imag_reg [1:0], x7_real_reg [1:0], x7_imag_reg [1:0];

// Buffer selection registers
reg current_buffer;
reg processing_buffer;

// Wires for FFT outputs
wire [31:0] fft_X0_real, fft_X0_imag, fft_X1_real, fft_X1_imag;
wire [31:0] fft_X2_real, fft_X2_imag, fft_X3_real, fft_X3_imag;
wire [31:0] fft_X4_real, fft_X4_imag, fft_X5_real, fft_X5_imag;
wire [31:0] fft_X6_real, fft_X6_imag, fft_X7_real, fft_X7_imag;

// Pipeline registers for FFT outputs
reg [31:0] pipe_X0_real, pipe_X0_imag, pipe_X1_real, pipe_X1_imag;
reg [31:0] pipe_X2_real, pipe_X2_imag, pipe_X3_real, pipe_X3_imag;
reg [31:0] pipe_X4_real, pipe_X4_imag, pipe_X5_real, pipe_X5_imag;
reg [31:0] pipe_X6_real, pipe_X6_imag, pipe_X7_real, pipe_X7_imag;

// State machine states
reg [1:0] state;
localparam IDLE = 2'b00;
localparam PROCESSING = 2'b01;
localparam DONE = 2'b10;

// Additional control signals
reg processing_valid;
reg output_valid;

always @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        ready_in <= 1'b1;
        valid_out <= 1'b0;
        current_buffer <= 1'b0;
        processing_buffer <= 1'b0;
        processing_valid <= 1'b0;
        output_valid <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                if (valid_in && ready_in) begin
                    // Store inputs in current buffer
                    x0_real_reg[current_buffer] <= x0_real; x0_imag_reg[current_buffer] <= x0_imag;
                    x1_real_reg[current_buffer] <= x1_real; x1_imag_reg[current_buffer] <= x1_imag;
                    x2_real_reg[current_buffer] <= x2_real; x2_imag_reg[current_buffer] <= x2_imag;
                    x3_real_reg[current_buffer] <= x3_real; x3_imag_reg[current_buffer] <= x3_imag;
                    x4_real_reg[current_buffer] <= x4_real; x4_imag_reg[current_buffer] <= x4_imag;
                    x5_real_reg[current_buffer] <= x5_real; x5_imag_reg[current_buffer] <= x5_imag;
                    x6_real_reg[current_buffer] <= x6_real; x6_imag_reg[current_buffer] <= x6_imag;
                    x7_real_reg[current_buffer] <= x7_real; x7_imag_reg[current_buffer] <= x7_imag;
                    
                    processing_buffer <= current_buffer;
                    current_buffer <= ~current_buffer;
                    state <= PROCESSING;
                    processing_valid <= 1'b1;
                end
            end
            
            PROCESSING: begin
                processing_valid <= 1'b0;
                state <= DONE;
                
                // Pipeline stage - store FFT outputs
                pipe_X0_real <= fft_X0_real; pipe_X0_imag <= fft_X0_imag;
                pipe_X1_real <= fft_X1_real; pipe_X1_imag <= fft_X1_imag;
                pipe_X2_real <= fft_X2_real; pipe_X2_imag <= fft_X2_imag;
                pipe_X3_real <= fft_X3_real; pipe_X3_imag <= fft_X3_imag;
                pipe_X4_real <= fft_X4_real; pipe_X4_imag <= fft_X4_imag;
                pipe_X5_real <= fft_X5_real; pipe_X5_imag <= fft_X5_imag;
                pipe_X6_real <= fft_X6_real; pipe_X6_imag <= fft_X6_imag;
                pipe_X7_real <= fft_X7_real; pipe_X7_imag <= fft_X7_imag;
                
                output_valid <= 1'b1;
            end
            
            DONE: begin
                if (ready_out) begin
                    // Output the pipelined results
                    X0_real <= pipe_X0_real; X0_imag <= pipe_X0_imag;
                    X1_real <= pipe_X1_real; X1_imag <= pipe_X1_imag;
                    X2_real <= pipe_X2_real; X2_imag <= pipe_X2_imag;
                    X3_real <= pipe_X3_real; X3_imag <= pipe_X3_imag;
                    X4_real <= pipe_X4_real; X4_imag <= pipe_X4_imag;
                    X5_real <= pipe_X5_real; X5_imag <= pipe_X5_imag;
                    X6_real <= pipe_X6_real; X6_imag <= pipe_X6_imag;
                    X7_real <= pipe_X7_real; X7_imag <= pipe_X7_imag;
                    
                    valid_out <= 1'b1;
                    output_valid <= 1'b0;
                    state <= IDLE;
                end
            end
        endcase
        
        // Control ready_in based on buffer availability
        ready_in <= (state == IDLE) || (state == PROCESSING && !processing_valid);
        
        if (valid_out && ready_out) begin
            valid_out <= 1'b0;
        end
    end
end

// FFT computation - connected to the processing buffer
fft8pt ins2(
    .xr0(x0_real_reg[processing_buffer]), .xi0(x0_imag_reg[processing_buffer]),
    .xr1(x1_real_reg[processing_buffer]), .xi1(x1_imag_reg[processing_buffer]),
    .xr2(x2_real_reg[processing_buffer]), .xi2(x2_imag_reg[processing_buffer]),
    .xr3(x3_real_reg[processing_buffer]), .xi3(x3_imag_reg[processing_buffer]),
    .xr4(x4_real_reg[processing_buffer]), .xi4(x4_imag_reg[processing_buffer]),
    .xr5(x5_real_reg[processing_buffer]), .xi5(x5_imag_reg[processing_buffer]),
    .xr6(x6_real_reg[processing_buffer]), .xi6(x6_imag_reg[processing_buffer]),
    .xr7(x7_real_reg[processing_buffer]), .xi7(x7_imag_reg[processing_buffer]),
    .Xr0(fft_X0_real), .Xi0(fft_X0_imag),
    .Xr1(fft_X1_real), .Xi1(fft_X1_imag),
    .Xr2(fft_X2_real), .Xi2(fft_X2_imag),
    .Xr3(fft_X3_real), .Xi3(fft_X3_imag),
    .Xr4(fft_X4_real), .Xi4(fft_X4_imag),
    .Xr5(fft_X5_real), .Xi5(fft_X5_imag),
    .Xr6(fft_X6_real), .Xi6(fft_X6_imag),
    .Xr7(fft_X7_real), .Xi7(fft_X7_imag)
);

endmodule