module ram_mul_push (
    input                   clkA,
    input                   reset,
    input                   write_enA,
    input                   read_enA,
    input  [255:0]          data_inA,
    output reg [255:0]      data_outA,
    input  [31:0]           write_addrA,
    input  [31:0]           read_addrA
);

    // Define memory array (8639 locations, 32 bits wide)
    reg [31:0] mem [0:8639];

    // Port A Logic
    always @(posedge clkA) begin
        if (reset) begin
            data_outA <= 256'b0;
        end else begin
            if (write_enA && !read_enA) begin
                // Write 256-bit data as 8 consecutive 32-bit words
                mem[write_addrA + 0] <= data_inA[255:224];
                mem[write_addrA + 1] <= data_inA[223:192];
                mem[write_addrA + 2] <= data_inA[191:160];
                mem[write_addrA + 3] <= data_inA[159:128];
                mem[write_addrA + 4] <= data_inA[127:96];
                mem[write_addrA + 5] <= data_inA[95:64];
                mem[write_addrA + 6] <= data_inA[63:32];
                mem[write_addrA + 7] <= data_inA[31:0];
            end else if (!write_enA && read_enA) begin
                // Read 256-bit data from 8 consecutive 32-bit words
                data_outA <= {mem[read_addrA + 0], mem[read_addrA + 1],
                              mem[read_addrA + 2], mem[read_addrA + 3],
                              mem[read_addrA + 4], mem[read_addrA + 5],
                              mem[read_addrA + 6], mem[read_addrA + 7]};
            end else begin
                data_outA <= 256'b0;
            end
        end
    end
endmodule
