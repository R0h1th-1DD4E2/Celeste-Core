module axi_Controller #(
    parameter DATA_WIDTH = 32,
    parameter ADDRESS = 32
)(
    input ACLK,
    input ARESETN,
    input read_s,
    input write_s,
    input [ADDRESS-1:0] address,
    input [DATA_WIDTH-1:0] W_data,
    output [DATA_WIDTH-1:0] mem_data_out
);

    // Declare the AXI signals
    wire M_ARREADY, S_RVALID, M_ARVALID, M_RREADY, S_AWREADY, S_BVALID, M_AWVALID, M_BREADY, M_WVALID, S_WREADY,M_AWREADY,M_WREADY;
    wire [ADDRESS-1:0] M_ARADDR;
    wire [ADDRESS-1:0] M_AWADDR;
    wire [DATA_WIDTH-1:0] M_WDATA;
    wire [DATA_WIDTH-1:0] S_RDATA;
    wire [3:0] M_WSTRB;
    wire [1:0] S_RRESP, S_BRESP;

    // AXI Read and Write Enable Signals for RAM Port A
    wire ram_write_enA, ram_read_enA;
    wire [ADDRESS-1:0] ram_write_addrA, ram_read_addrA;
    wire [DATA_WIDTH-1:0] ram_data_inA, ram_data_outA;

    // Instantiate the AXI4-Lite master
    axi_Master u_axi4_lite_master0 (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
        .START_READ(read_s),
        .address(address),
        .W_data(W_data),
        .M_ARREADY(M_ARREADY),      // Master Read Address Ready
        .M_RDATA(S_RDATA),          // Master Read Data
        .M_RRESP(S_RRESP),          // Master Read Response
        .M_RVALID(S_RVALID),        // Master Read Valid
        .M_ARADDR(M_ARADDR),        // Master Read Address
        .M_ARVALID(M_ARVALID),      // Master Read Address Valid
        .M_RREADY(M_RREADY),        // Master Read Ready
        .START_WRITE(write_s),
        .M_AWREADY(S_AWREADY),      // Master Write Address Ready
        .M_WVALID(M_WVALID),        // Master Write Valid
        .M_WREADY(S_WREADY),        // Master Write Ready
        .M_BRESP(S_BRESP),          // Master Write Response
        .M_BVALID(S_BVALID),        // Master Write Response Valid
        .M_AWADDR(M_AWADDR),        // Master Write Address
        .M_AWVALID(M_AWVALID),      // Master Write Address Valid
        .M_WDATA(M_WDATA),          // Master Write Data
        .M_WSTRB(M_WSTRB),          // Master Write Byte Enable
        .M_BREADY(M_BREADY)         // Master Write Response Ready
    );

    // Instantiate the AXI4-Lite slave
    axi_Slave u_axi4_lite_slave0 (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .S_ARREADY(M_ARREADY),
        .S_RDATA(S_RDATA),
        .S_RRESP(S_RRESP),
        .S_RVALID(S_RVALID),
        .S_ARADDR(M_ARADDR),
        .S_ARVALID(M_ARVALID),
        .S_RREADY(M_RREADY),
        .S_AWREADY(S_AWREADY),
        .S_WVALID(M_WVALID),
        .S_WREADY(S_WREADY),
        .S_BRESP(S_BRESP),
        .S_BVALID(S_BVALID),
        .S_AWADDR(M_AWADDR),
        .S_AWVALID(M_AWVALID),
        .S_WDATA(M_WDATA),
        .S_WSTRB(M_WSTRB),
        .S_BREADY(M_BREADY)
    );

    // Instantiate the RAM with Port A only
    ram u_ram (
        .clkA(ACLK),
        .write_enA(ram_write_enA),
        .read_enA(ram_read_enA),
        .data_inA(M_WDATA),
        .data_outA(ram_data_outA),
        .write_addrA(M_AWADDR),
        .read_addrA(M_ARADDR),
        // Port B is unused
        .clkB(),
        .write_enB(),
        .read_enB(),
        .data_inB(),
        .data_outB(),
        .write_addrB(),
        .read_addrB()
    );

    // Control logic to manage read and write operations for RAM Port A
    assign ram_read_enA = M_ARVALID && M_ARREADY;
    assign ram_write_enA = M_AWVALID && M_AWREADY && M_WVALID && M_WREADY;

    // Data out from RAM to AXI signals
    assign S_RDATA = ram_data_outA;

endmodule
