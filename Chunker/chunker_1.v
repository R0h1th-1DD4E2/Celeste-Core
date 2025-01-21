`timescale 1ns / 1ps

module chunker_1 (
    input wire clk,                    // Clock signal
    input wire rst,
    input wire start,
    input wire [31:0] image_base_addr, // Base address of image in memory
    input wire [31:0] image_width,     // Image width
    input wire [31:0] image_height,    // Image height
    input wire [255:0] mem_data_in1,    // Memory data input (8 pixels, 1 rows)
    input wire [255:0] mem_data_in2,    // Memory data input (8 pixels, 1 rows)
    // input wire mem_valid,              // Memory data valid signal
    output  [511:0] chunk_data_out, // Converted floating-point data
    output reg chunk_valid,            // Output data valid signal
    output reg [31:0] mem_addr_out1,    // Memory address for next fetch
    output reg [31:0] mem_addr_out2,    // Memory address for next fetch
    output reg done                    // Processing complete signal
);

    // FSM states
    parameter
        IDLE    = 3'b000,
        INIT    = 3'b001,
        FETCH   = 3'b011,
        CONVERT = 3'b010,
        SEND    = 3'b110,
        NEXT    = 3'b111,
        DONE    = 3'b101;

    // Internal registers
    reg [2:0] current_state, next_state;
    reg [31:0] current_row;        // Current row being processed
    reg [31:0] current_col;        // Current column being processed
    reg [31:0] chunks_processed;   // Counter for processed chunks
    reg [31:0] total_chunks;       // Total number of chunks to process
    reg [31:0] base_addr;
    reg [1:0] chunk_count;
    
    // Pipeline registers
    reg [511:0] conversion_buffer; // Buffer for parallel conversion
    reg conversion_in_progress;    // Flag for conversion status
    
    // Calculate total chunks based on image dimensions
    wire [31:0] total_col = (image_width + 7) >> 3;  // Ceiling division by 8
    wire [31:0] total_rows = (image_height + 7) >> 3;     // Ceiling division by 8

    // 16 Float converter instantiation 
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : fp_converters
            dec_2_fp converter (
                .dec(conversion_buffer[i*32 +: 32]),
                .ieee_out(chunk_data_out[i*32 +: 32])
            );
        end
    endgenerate

    // FSM state transitions
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // FSM combinational logic
    always @(*) begin
        next_state = current_state;
        
        case (current_state)
            IDLE: begin
                if (start) next_state = INIT;
            end
            
            INIT: begin
                next_state = FETCH;
            end
            
            FETCH: begin
                if (mem_data_in1 && mem_data_in2) next_state = CONVERT;
            end
            
            CONVERT: begin
                next_state = SEND;
            end
            
            SEND: begin
                if (chunks_processed == total_chunks-1) begin
                    next_state = DONE;
                end else begin
                    next_state = FETCH;
                end
            end
            
            DONE: begin
                next_state = IDLE;
            end
        endcase
    end

    // Sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers
            current_row <= 32'b0;
            current_col <= 32'b0;
            chunks_processed <= 32'b0;
            chunk_count<= 0;
            total_chunks <= 32'b0;
            mem_addr_out1 <= 32'b0;
            mem_addr_out2 <= 32'b0;
            chunk_valid <= 1'b0;
            done <= 1'b0;
            conversion_in_progress <= 1'b0;
            conversion_buffer <= 512'b0;
            base_addr <= image_base_addr;
        end else begin
            case (current_state)
                IDLE: begin
                    chunk_valid <= 1'b0;
                    done <= 1'b0;
                    base_addr <= image_base_addr;
                end

                INIT: begin
                    // Initialize counters and addresses
                    current_row <= 32'b0;
                    current_col <= 32'b0;
                    chunks_processed <= 32'b0;
                    chunk_count<=0;
                    total_chunks <= total_col*total_rows;
                    mem_addr_out1 <= base_addr;
                    mem_addr_out2 <= base_addr + image_width;
                end

                FETCH: begin
                    chunk_valid <= 1'b0;
                    if (mem_data_in1 && mem_data_in2) begin
                        conversion_buffer <= {mem_data_in1, mem_data_in2};
                        conversion_in_progress <= 1'b1;
                    end
                end

                CONVERT: begin
                    conversion_in_progress <= 1'b0;
                end

                SEND: begin
                    chunk_valid <= 1'b1;
                    if (chunk_count == 3)begin
                    chunks_processed <= chunks_processed + 1;
                    chunk_count<=0;
                    end
                    chunk_count <= chunk_count+1;
                    // Update row and column counters
                    if (current_row == total_rows - 1) begin
                        current_row <= 0;
                        current_col <= current_col + 1;
                        // When moving to a new column, update base address
                        base_addr <= base_addr + 8;  // Move 8 pixels right
                        // Update memory addresses for the start of the new column
                        mem_addr_out1 <= base_addr + 8;
                        mem_addr_out2 <= base_addr + 8 + image_width;
                    end else begin
                        current_row <= current_row + 1;
                        // Update memory addresses for the next two rows in the current column
                        mem_addr_out1 <= mem_addr_out1 + (image_width << 1);  // Skip two rows
                        mem_addr_out2 <= mem_addr_out2 + (image_width << 1);  // Skip two rows
                    end
                end

                DONE: begin
                    done <= 1'b1;
                    chunk_valid <= 1'b0;
                end
            endcase
        end
    end

endmodule