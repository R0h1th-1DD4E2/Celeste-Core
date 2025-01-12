module axi_Slave #(
    parameter ADDRESS = 32,
    parameter DATA_WIDTH = 32
)(
    // Global Signals
    input ACLK,
    input ARESETN,

    // Read Address Channel INPUTS
    input [ADDRESS-1:0] S_ARADDR,
    input S_ARVALID,
    // Read Data Channel INPUTS
    input S_RREADY,
    // Write Address Channel INPUTS
    input [ADDRESS-1:0] S_AWADDR,
    input S_AWVALID,
    // Write Data Channel INPUTS
    input [DATA_WIDTH-1:0] S_WDATA,
    input [3:0] S_WSTRB,
    input S_WVALID,
    // Write Response Channel INPUTS
    input S_BREADY,    

    // Read Address Channel OUTPUTS
    output reg S_ARREADY,
    // Read Data Channel OUTPUTS
    output reg [DATA_WIDTH-1:0] S_RDATA,
    output reg [1:0] S_RRESP,
    output reg S_RVALID,
    // Write Address Channel OUTPUTS
    output reg S_AWREADY,
    output reg S_WREADY,
    // Write Response Channel OUTPUTS
    output reg [1:0] S_BRESP,
    output reg S_BVALID
);

    // Define reset and initialization
    integer i;
    localparam no_of_registers = 32;

    reg [DATA_WIDTH-1:0] register [no_of_registers-1:0];
    reg [ADDRESS-1:0] addr;
    reg write_addr;
    reg write_data;

    // State definition using parameter
    parameter IDLE = 3'b000,
              WRITE_CHANNEL = 3'b001,
              WRESP_CHANNEL = 3'b010,
              RADDR_CHANNEL = 3'b011,
              RDATA_CHANNEL = 3'b100;

    reg [2:0] state, next_state;

    // AR
    always @(*) begin
        if (state == RADDR_CHANNEL) 
            S_ARREADY = 1;
        else 
            S_ARREADY = 0;
    end

    // R
    always @(*) begin
        if (state == RDATA_CHANNEL) begin
            S_RVALID = 1;
            S_RDATA = register[addr];
            S_RRESP = 2'b00;
        end else begin
            S_RVALID = 0;
            S_RDATA = 0;
            S_RRESP = 0;
        end
    end

    // AW
    always @(*) begin
        if (state == WRITE_CHANNEL) 
            S_AWREADY = 1;
        else 
            S_AWREADY = 0;
    end

    // W
    always @(*) begin
        if (state == WRITE_CHANNEL) 
            S_WREADY = 1;
        else 
            S_WREADY = 0;
    end

    // Write Address and Data handling
    always @(*) begin
        write_addr = S_AWVALID && S_AWREADY;
        write_data = S_WREADY && S_WVALID;
    end

    // B
    always @(*) begin
        if (state == WRESP_CHANNEL) begin
            S_BVALID = 1;
            S_BRESP = 2'b00;
        end else begin
            S_BVALID = 0;
            S_BRESP = 0;
        end
    end

    // Register Handling (corrected)
    always @(posedge ACLK) begin
        if (~ARESETN) begin
            // Reset all registers individually to avoid long loops
            for (i = 0; i < no_of_registers; i = i + 1) begin
                register[i] <= 32'b0; // Reset each register
            end
        end else begin
            if (state == WRITE_CHANNEL) begin
                register[S_AWADDR] <= S_WDATA;
            end else if (state == RADDR_CHANNEL) begin
                addr <= S_ARADDR;
            end
        end
    end

    // State Machine
    always @(posedge ACLK) begin
        if (~ARESETN)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE : begin
                if (S_AWVALID) 
                    next_state = WRITE_CHANNEL;
                else if (S_ARVALID) 
                    next_state = RADDR_CHANNEL;
                else 
                    next_state = IDLE;
            end
            RADDR_CHANNEL : if (S_ARVALID && S_ARREADY) next_state = RDATA_CHANNEL;
            RDATA_CHANNEL : if (S_RVALID && S_RREADY) next_state = IDLE;
            WRITE_CHANNEL : if (write_addr && write_data) next_state = WRESP_CHANNEL;
            WRESP_CHANNEL : if (S_BVALID && S_BREADY) next_state = IDLE;
            default : next_state = IDLE;
        endcase
    end

endmodule
