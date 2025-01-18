module ram(
    input clkA,
    input write_enA,
    input read_enA,
    input [31:0] data_inA,
    output reg [31:0] data_outA,
    input [31:0] read_addrA,
    input [31:0] write_addrA,
    input clkB,
    input write_enB,
    input read_enB,
    input [31:0] data_inB,
    output reg [31:0] data_outB,
    input [31:0] read_addrB,
    input [31:0] write_addrB
);

    // Increase memory size to match address width
    reg [31:0] mem [0:1023];

    initial begin
        $readmemh("/home/sateesh/pico_ws/RAM/ram_test.hex", mem);
        $display("Initial RAM content: %h", mem[0]);  // Check initial cont
    end
always @(posedge clkA) begin
    $display("Reading from address %h, data_outA: %h", read_addrA, data_outA);
end

    always @(posedge clkA) begin
        $display("dataoutA  %h ",data_outA);
        if (write_enA)
            mem[write_addrA] <= data_inA;
        else if (read_enA)
            data_outA <= mem[read_addrA];
    end

    always @(posedge clkB) begin
        if (write_enB)
            mem[write_addrB] <= data_inB;
        else if (read_enB)
            data_outB <= mem[read_addrB];
    end
endmodule
