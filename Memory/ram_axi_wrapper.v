module ram_axi_wrapper (
    // Clock and Reset
    input         clk,
    input         resetn,
    
    // AXI Write Address Channel
    input  [31:0] S_AXI_AWADDR,
    input         S_AXI_AWVALID,
    output reg    S_AXI_AWREADY,
    
    // AXI Write Data Channel
    input  [31:0] S_AXI_WDATA,
    input  [3:0]  S_AXI_WSTRB,
    input         S_AXI_WVALID,
    output reg    S_AXI_WREADY,
    
    // AXI Write Response Channel
    output reg    S_AXI_BVALID,
    input         S_AXI_BREADY,
    
    // AXI Read Address Channel
    input  [31:0] S_AXI_ARADDR,
    input         S_AXI_ARVALID,
    output reg    S_AXI_ARREADY,
    
    // AXI Read Data Channel
    output reg [31:0] S_AXI_RDATA,
    output reg        S_AXI_RVALID,
    input             S_AXI_RREADY
);

    // Internal signals for RAM control
    reg        write_en;
    reg        read_en;
    reg [31:0] write_data;
    wire [31:0] read_data;
    reg [13:0] write_addr;
    reg [13:0] read_addr;

    // State machine states
    reg [1:0] write_state;
    reg [1:0] read_state;
    localparam IDLE = 2'b00;
    localparam ACTIVE = 2'b01;
    localparam RESP = 2'b10;

    // Instantiate your dual port RAM with Port B disabled
    ram ram_inst (
        .clkA(clk),
        .write_enA(write_en),
        .read_enA(read_en),
        .data_inA(write_data),
        .data_outA(read_data),
        .write_addrA(write_addr),
        .read_addrA(read_addr),
        
        // Port B tied off
        .clkB(1'b0),
        .write_enB(1'b0),
        .read_enB(1'b0),
        .data_inB(32'b0),
        .write_addrB(14'b0),
        .read_addrB(14'b0)
    );

    // Write state machine
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            write_state <= IDLE;
            S_AXI_AWREADY <= 1'b1; // Start ready
            S_AXI_WREADY <= 1'b1;  // Start ready
            S_AXI_BVALID <= 1'b0;
            write_en <= 1'b0;
        end else begin
            case (write_state)
                IDLE: begin
                    // Wait for both address and data
                    if (S_AXI_AWVALID && S_AXI_WVALID) begin
                        write_addr <= S_AXI_AWADDR[15:2]; // Word addressing
                        write_data <= S_AXI_WDATA;
                        write_en <= 1'b1;
                        S_AXI_AWREADY <= 1'b0;
                        S_AXI_WREADY <= 1'b0;
                        write_state <= ACTIVE;
                    end
                end
                
                ACTIVE: begin
                    write_en <= 1'b0;
                    S_AXI_BVALID <= 1'b1;
                    write_state <= RESP;
                end
                
                RESP: begin
                    if (S_AXI_BREADY) begin
                        S_AXI_BVALID <= 1'b0;
                        S_AXI_AWREADY <= 1'b1; // Ready for next transaction
                        S_AXI_WREADY <= 1'b1;
                        write_state <= IDLE;
                    end
                end
                
                default: write_state <= IDLE;
            endcase
        end
    end

    // Read state machine
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            read_state <= IDLE;
            S_AXI_ARREADY <= 1'b1; // Start ready
            S_AXI_RVALID <= 1'b0;
            read_en <= 1'b0;
            read_addr <= 14'b0;
        end else begin
            case (read_state)
                IDLE: begin
                    if (S_AXI_ARVALID) begin
                        read_addr <= S_AXI_ARADDR[15:2];
                        read_en <= 1'b1;
                        S_AXI_ARREADY <= 1'b0;
                        read_state <= ACTIVE;
                    end
                end
                
                ACTIVE: begin
                    read_en <= 1'b0;
                    S_AXI_RDATA <= read_data;
                    S_AXI_RVALID <= 1'b1;
                    read_state <= RESP;
                end
                
                RESP: begin
                    if (S_AXI_RREADY) begin
                        S_AXI_RVALID <= 1'b0;
                        S_AXI_ARREADY <= 1'b1; // Ready for next transaction
                        read_state <= IDLE;
                    end
                end
                
                default: read_state <= IDLE;
            endcase
        end
    end

endmodule
