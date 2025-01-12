module DMA #(
    parameter ADDR_WIDTH = 14,     
    parameter DATA_WIDTH = 32,      
    parameter BURST_LENGTH = 8      
) (
    input                   clk,    // Added missing clock input
    input                   rst_n,
    
    // AXI Interface signals remain the same
    input                   axi_awvalid,
    output                  axi_awready,
    input  [ADDR_WIDTH-1:0] axi_awaddr,
    output [1:0]           axi_awburst,
    output [7:0]           axi_awlen,
    output [2:0]           axi_awsize,
    
    input                   axi_wvalid,
    output                  axi_wready,
    input  [DATA_WIDTH-1:0] axi_wdata,
    input                   axi_wlast,
    
    output                  axi_bvalid,
    input                   axi_bready,
    
    input                   axi_arvalid,
    output                  axi_arready,
    input  [ADDR_WIDTH-1:0] axi_araddr,
    output [1:0]           axi_arburst,
    output [7:0]           axi_arlen,
    output [2:0]           axi_arsize,
    
    output                  axi_rvalid,
    input                   axi_rready,
    output [DATA_WIDTH-1:0] axi_rdata,
    output                  axi_rlast
);

    // Internal connections for RAM port A
    wire                    ram_write_enA;
    wire                    ram_read_enA;  // Added read enable
    wire [ADDR_WIDTH-1:0]   ram_write_addrA;
    wire [ADDR_WIDTH-1:0]   ram_read_addrA;  // Added read address
    wire [DATA_WIDTH-1:0]   ram_data_inA;
    wire [DATA_WIDTH-1:0]   ram_data_outA;   // Added data output

    // Instantiate AXI4 DMA Controller
    axi4_DMA_controller #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .BURST_LENGTH(BURST_LENGTH)
    ) axi_DMA_inst (
        // Controller connections remain the same
        .clk(clk),
        .rst_n(rst_n),
        .axi_awvalid(axi_awvalid),
        .axi_awready(axi_awready),
        .axi_awaddr(axi_awaddr),
        .axi_awburst(axi_awburst),
        .axi_awlen(axi_awlen),
        .axi_awsize(axi_awsize),
        .axi_wvalid(axi_wvalid),
        .axi_wready(axi_wready),
        .axi_wdata(axi_wdata),
        .axi_wlast(axi_wlast),
        .axi_bvalid(axi_bvalid),
        .axi_bready(axi_bready),
        .axi_arvalid(axi_arvalid),
        .axi_arready(axi_arready),
        .axi_araddr(axi_araddr),
        .axi_arburst(axi_arburst),
        .axi_arlen(axi_arlen),
        .axi_arsize(axi_arsize),
        .axi_rvalid(axi_rvalid),
        .axi_rready(axi_rready),
        .axi_rdata(axi_rdata),
        .axi_rlast(axi_rlast),
        
        // AXI signals remain the same...
        
        // RAM Interface - Updated with read signals
        .ram_write_enA(ram_write_enA),
        .ram_read_enA(ram_read_enA),
        .ram_write_addrA(ram_write_addrA),
        .ram_read_addrA(ram_read_addrA),
        .ram_data_inA(ram_data_inA),
        .ram_data_outA(ram_data_outA)

    );

    // Instantiate Dual-Port RAM with proper connections
    ram dual_port_ram (
        // Port A - Complete connections
        .clkA(clk),
        .write_enA(ram_write_enA),
        .read_enA(ram_read_enA),
        .data_inA(ram_data_inA),
        .data_outA(ram_data_outA),
        .write_addrA(ram_write_addrA),
        .read_addrA(ram_read_addrA),
        
        // Port B - All signals tied to inactive state
        .clkB(1'b0),
        .write_enB(1'b0),
        .read_enB(1'b0),
        .data_inB({DATA_WIDTH{1'b0}}),
        .data_outB(),  // Left unconnected
        .write_addrB({ADDR_WIDTH{1'b0}}),
        .read_addrB({ADDR_WIDTH{1'b0}})
    );

endmodule
