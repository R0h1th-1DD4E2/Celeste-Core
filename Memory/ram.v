module ram(
    // Port A
    input clkA,
    input write_enA,
    input read_enA,
    input [31:0] data_inA,
    output reg [31:0] data_outA,
    input [31:0] read_addrA,
    input [31:0] write_addrA,
    
    // Port B
    input clkB,
    input write_enB,
    input read_enB,
    input [31:0] data_inB,
    output reg [31:0] data_outB,
    input [31:0] read_addrB,
    input [31:0] write_addrB,
    
    // Port C
    input clkC,
    input write_enC,
    input read_enC,
    input [31:0] data_inC,
    output reg [31:0] data_outC,
    input [31:0] read_addrC,
    input [31:0] write_addrC,
    
    // Port D
    input clkD,
    input write_enD,
    input read_enD,
    input [31:0] data_inD,
    output reg [31:0] data_outD,
    input [31:0] read_addrD,
    input [31:0] write_addrD
);
    // Memory array
    reg [31:0] mem [0:1023];
    
    // Initialize memory from hex file
    initial begin
        $readmemh("/home/sateesh/pico_ws/RAM/ram_test.hex", mem);
        $display("Initial RAM content: %h", mem[0]);
    end


    // Port A logic
    always @(posedge clkA) begin
        if (write_enA)
            mem[write_addrA] <= data_inA;
        else if (read_enA)
            data_outA <= mem[read_addrA];
    end

    // Port B logic
    always @(posedge clkB) begin
        if (write_enB)
            mem[write_addrB] <= data_inB;
        else if (read_enB)
            data_outB <= mem[read_addrB];
    end

    // Port C logic
    always @(posedge clkC) begin
        if (write_enC)
            mem[write_addrC] <= data_inC;
        else if (read_enC)
            data_outC <= mem[read_addrC];
    end

    // Port D logic
    always @(posedge clkD) begin
        if (write_enD)
            mem[write_addrD] <= data_inD;
        else if (read_enD)
            data_outD <= mem[read_addrD];
    end

endmodule