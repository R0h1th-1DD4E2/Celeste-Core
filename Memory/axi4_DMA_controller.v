module axi4_DMA_controller #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 14,
    parameter BURST_LENGTH = 8,  // Fixed 8-beat bursts
    parameter BURST_SIZE = $clog2(DATA_WIDTH/8)  // Byte size of each transfer
) (
    input                   clk,
    input                   rst_n,
    // AXI Write Address Channel
    input                   axi_awvalid,
    output reg              axi_awready,
    input  [ADDR_WIDTH-1:0] axi_awaddr,
    input  [1:0]            axi_awburst,  // Changed to input
    input  [7:0]            axi_awlen,    // Changed to input
    input  [2:0]            axi_awsize,   // Changed to input
    // AXI Write Data Channel
    input                   axi_wvalid,
    output reg              axi_wready,
    input  [DATA_WIDTH-1:0] axi_wdata,
    input                   axi_wlast,
    // AXI Write Response Channel
    output reg              axi_bvalid,
    input                   axi_bready,
    // AXI Read Address Channel
    input                   axi_arvalid,
    output reg              axi_arready,
    input  [ADDR_WIDTH-1:0] axi_araddr,
    input  [1:0]            axi_arburst,  // Changed to input
    input  [7:0]            axi_arlen,    // Changed to input
    input  [2:0]            axi_arsize,   // Changed to input
    // AXI Read Data Channel
    output reg              axi_rvalid,
    input                   axi_rready,
    output reg [DATA_WIDTH-1:0] axi_rdata,
    output reg              axi_rlast,
    // Dual-Port RAM Interface (Port A only)
    output reg              ram_write_enA,
    output reg              ram_read_enA,
    output reg [ADDR_WIDTH-1:0] ram_write_addrA,
    output reg [ADDR_WIDTH-1:0] ram_read_addrA,
    output reg [DATA_WIDTH-1:0] ram_data_inA,
    input       [DATA_WIDTH-1:0] ram_data_outA
);

    
    // Burst type definitions
    localparam BURST_INCR = 2'b01;

    // State definitions
    localparam IDLE = 3'b000;
    localparam WRITE_ADDR = 3'b001;
    localparam WRITE_DATA = 3'b010;
    localparam WRITE_RESP = 3'b011;
    localparam READ_ADDR = 3'b100;
    localparam READ_DATA = 3'b101;

    reg [2:0] state;
    reg [ADDR_WIDTH-1:0] latched_awaddr;
    reg [ADDR_WIDTH-1:0] latched_araddr;
    reg [3:0] burst_counter;
    reg [ADDR_WIDTH-1:0] current_write_addr;
    reg [ADDR_WIDTH-1:0] current_read_addr;

    // Calculate address increment based on data width
    localparam ADDR_INCREMENT = DATA_WIDTH/8;

    // Main state machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            axi_awready <= 0;
            axi_wready <= 0;
            axi_bvalid <= 0;
            axi_arready <= 0;
            axi_rvalid <= 0;
            axi_rlast <= 0;
            ram_write_enA <= 0;
            ram_read_enA <= 0;
            burst_counter <= 0;
            current_write_addr <= 0;
            current_read_addr <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid) begin
                        state <= WRITE_ADDR;
                        axi_awready <= 1;
                        burst_counter <= 0;
                        current_write_addr <= axi_awaddr;
                    end else if (axi_arvalid) begin
                        state <= READ_ADDR;
                        axi_arready <= 1;
                        burst_counter <= 0;
                        current_read_addr <= axi_araddr;
                    end
                end

                WRITE_ADDR: begin
                    axi_awready <= 0;
                    latched_awaddr <= current_write_addr;
                    if (axi_wvalid) begin
                        state <= WRITE_DATA;
                        axi_wready <= 1;
                    end
                end

                WRITE_DATA: begin
                    if (axi_wvalid && axi_wready) begin
                        ram_write_enA <= 1;
                        ram_write_addrA <= current_write_addr;
                        ram_data_inA <= axi_wdata;

                        if (burst_counter == BURST_LENGTH-1) begin
                            axi_wready <= 0;
                            state <= WRITE_RESP;
                            burst_counter <= 0;
                        end else begin
                            burst_counter <= burst_counter + 1;
                            current_write_addr <= current_write_addr + ADDR_INCREMENT;
                        end
                    end
                end

                WRITE_RESP: begin
                    ram_write_enA <= 0;
                    axi_bvalid <= 1;
                    if (axi_bready) begin
                        axi_bvalid <= 0;
                        state <= IDLE;
                    end
                end

                READ_ADDR: begin
                    axi_arready <= 0;
                    latched_araddr <= current_read_addr;
                    state <= READ_DATA;
                    ram_read_enA <= 1;
                    ram_read_addrA <= current_read_addr;
                end

                READ_DATA: begin
                    if (!axi_rvalid || (axi_rvalid && axi_rready)) begin
                        axi_rvalid <= 1;
                        axi_rdata <= ram_data_outA;

                        if (burst_counter == BURST_LENGTH-1) begin
                            axi_rlast <= 1;
                            state <= IDLE;
                            burst_counter <= 0;
                            ram_read_enA <= 0;
                        end else begin
                            axi_rlast <= 0;
                            burst_counter <= burst_counter + 1;
                            current_read_addr <= current_read_addr + ADDR_INCREMENT;
                            ram_read_addrA <= current_read_addr + ADDR_INCREMENT;
                        end
                    end
                end
            endcase
        end
    end

endmodule
