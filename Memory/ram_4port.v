
module ram_4port(
    input reset,
    // Port A
    input clkA,
    input write_enA,
    input read_enA,
    input [255:0] data_inA,  // Changed to 256-bit
    output reg [255:0] data_outA,  // Changed to 256-bit
    input [31:0] read_addrA,
    input [31:0] write_addrA,
    
    // Port B
    input clkB,
    input write_enB,
    input read_enB,
    input [255:0] data_inB,  // Changed to 256-bit
    output reg [255:0] data_outB,  // Changed to 256-bit
    input [31:0] read_addrB,
    input [31:0] write_addrB,
    
    // Port C
    input clkC,
    input write_enC,
    input read_enC,
    input [255:0] data_inC,  // Changed to 256-bit
    output reg [255:0] data_outC,  // Changed to 256-bit
    input [31:0] read_addrC,
    input [31:0] write_addrC,
    
    // Port D
    input clkD,
    input write_enD,
    input read_enD,
    input [255:0] data_inD,  // Changed to 256-bit
    output reg [255:0] data_outD,  // Changed to 256-bit
    input [31:0] read_addrD,
    input [31:0] write_addrD
);
    // Memory array
    reg [31:0] mem [0:16384];
    
        initial begin
        $readmemh("/home/sateesh/pico_ws/Chunker/ram/result.hex",mem);
//        $display("Initial RAM content: %h", mem[0]);
       
    end
    
    // Address boundary checking function
    function automatic is_valid_addr;
        input [31:0] addr;
        begin
            is_valid_addr = (addr + 7) < 16384;  // Ensure 8-word block fits in memory
        end
    endfunction
    
    // Initialize memory on reset
//    integer i;
//    always @(posedge reset) begin
//        if (reset) begin
//            for (i = 0; i < 1024; i = i + 1) begin
//                mem[i] <= 32'b0;
//            end
//        end
//    end
    

    // Port A logic
    always @(posedge clkA) begin
        if (reset) begin
            data_outA <= 256'b0;
        end else begin
         
            if (write_enA && !read_enA && is_valid_addr(write_addrA)) begin
                mem[write_addrA + 0] <= data_inA[255:224];
                mem[write_addrA + 1] <= data_inA[223:192];
                mem[write_addrA + 2] <= data_inA[191:160];
                mem[write_addrA + 3] <= data_inA[159:128];
                mem[write_addrA + 4] <= data_inA[127:96];
                mem[write_addrA + 5] <= data_inA[95:64];
                mem[write_addrA + 6] <= data_inA[63:32];
                mem[write_addrA + 7] <= data_inA[31:0];
            end else if (!write_enA && read_enA && is_valid_addr(read_addrA)) begin
                data_outA = {mem[read_addrA + 0], mem[read_addrA + 1],
                            mem[read_addrA + 2], mem[read_addrA + 3],
                            mem[read_addrA + 4], mem[read_addrA + 5],
                            mem[read_addrA + 6], mem[read_addrA + 7]};
//                            $display("read_addrA: %h", read_addrA);
//                            $display("data_outA: %h", data_outA);
            end else begin
                data_outA <= 256'b0;
            end
        end
    end

    // Port B logic (similar changes as Port A)
    always @(posedge clkB) begin
        if (reset) begin
            data_outB <= 256'b0;
        end else begin
            if (write_enB && !read_enB && is_valid_addr(write_addrB)) begin
                mem[write_addrB + 0] <= data_inB[255:224];
                mem[write_addrB + 1] <= data_inB[223:192];
                mem[write_addrB + 2] <= data_inB[191:160];
                mem[write_addrB + 3] <= data_inB[159:128];
                mem[write_addrB + 4] <= data_inB[127:96];
                mem[write_addrB + 5] <= data_inB[95:64];
                mem[write_addrB + 6] <= data_inB[63:32];
                mem[write_addrB + 7] <= data_inB[31:0];
            end else if (!write_enB && read_enB && is_valid_addr(read_addrB)) begin
                data_outB = {mem[read_addrB + 0], mem[read_addrB + 1],
                            mem[read_addrB + 2], mem[read_addrB + 3],
                            mem[read_addrB + 4], mem[read_addrB + 5],
                            mem[read_addrB + 6], mem[read_addrB + 7]};
            end else begin
                data_outB <= 256'b0;
            end
        end
    end

    // Port C logic (similar changes as Port A)
    always @(posedge clkC) begin
        if (reset) begin
            data_outC <= 256'b0;
        end else begin
            if (write_enC && !read_enC && is_valid_addr(write_addrC)) begin
                mem[write_addrC + 0] <= data_inC[255:224];
                mem[write_addrC + 1] <= data_inC[223:192];
                mem[write_addrC + 2] <= data_inC[191:160];
                mem[write_addrC + 3] <= data_inC[159:128];
                mem[write_addrC + 4] <= data_inC[127:96];
                mem[write_addrC + 5] <= data_inC[95:64];
                mem[write_addrC + 6] <= data_inC[63:32];
                mem[write_addrC + 7] <= data_inC[31:0];
            end else if (!write_enC && read_enC && is_valid_addr(read_addrC)) begin
                data_outC = {mem[read_addrC + 0], mem[read_addrC + 1],
                            mem[read_addrC + 2], mem[read_addrC + 3],
                            mem[read_addrC + 4], mem[read_addrC + 5],
                            mem[read_addrC + 6], mem[read_addrC + 7]};
            end else begin
                data_outC <= 256'b0;
            end
        end
    end

    // Port D logic (similar changes as Port A)
    always @(posedge clkD) begin
        if (reset) begin
            data_outD <= 256'b0;
        end else begin
            if (write_enD && !read_enD && is_valid_addr(write_addrD)) begin
                mem[write_addrD + 0] <= data_inD[255:224];
                mem[write_addrD + 1] <= data_inD[223:192];
                mem[write_addrD + 2] <= data_inD[191:160];
                mem[write_addrD + 3] <= data_inD[159:128];
                mem[write_addrD + 4] <= data_inD[127:96];
                mem[write_addrD + 5] <= data_inD[95:64];
                mem[write_addrD + 6] <= data_inD[63:32];
                mem[write_addrD + 7] <= data_inD[31:0];
            end else if (!write_enD && read_enD && is_valid_addr(read_addrD)) begin
                data_outD = {mem[read_addrD + 0], mem[read_addrD + 1],
                            mem[read_addrD + 2], mem[read_addrD + 3],
                            mem[read_addrD + 4], mem[read_addrD + 5],
                            mem[read_addrD + 6], mem[read_addrD + 7]};
            end else begin
                data_outD <= 256'b0;
            end
        end
    end

endmodule
