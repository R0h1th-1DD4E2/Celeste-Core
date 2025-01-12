module axi_Master #(
    parameter ADDRESS = 32,
    parameter DATA_WIDTH = 32
)(
    // Global Signals
    input                           ACLK,
    input                           ARESETN,
    input                           START_READ,
    input                           START_WRITE,
    input      [ADDRESS-1 : 0]      address,
    input      [DATA_WIDTH-1:0]     W_data,

    // Read Address Channel INPUTS
    input                           M_ARREADY,
    // Read Data Channel INPUTS
    input      [DATA_WIDTH-1:0]     M_RDATA,
    input      [1:0]                M_RRESP,
    input                           M_RVALID,
    // Write Address Channel INPUTS
    input                           M_AWREADY,
    input                           M_WREADY,  // Declare M_WREADY here
    // Write Response Channel INPUTS
    input      [1:0]                M_BRESP,
    input                           M_BVALID,
    // Read Address Channel OUTPUTS
    output reg [ADDRESS-1 : 0]      M_ARADDR,
    output reg                      M_ARVALID,
    // Read Data Channel OUTPUTS
    output reg                      M_RREADY,
    // Write Address Channel OUTPUTS
    output reg [ADDRESS-1 : 0]      M_AWADDR,
    output reg                      M_AWVALID,
    // Write Data Channel OUTPUTS
    output reg [DATA_WIDTH-1:0]     M_WDATA,
    output reg [3:0]                M_WSTRB,
    output reg                      M_WVALID,
    // Write Response Channel OUTPUTS
    output reg                      M_BREADY
);

    reg read_start;
    reg write_start;

    // State machine states
    reg [2:0] state, next_state;
    localparam IDLE            = 3'b000,
               WRITE_CHANNEL   = 3'b001,
               WRESP_CHANNEL   = 3'b010,
               RADDR_CHANNEL   = 3'b011,
               RDATA_CHANNEL   = 3'b100;

    // Sequential logic for state transition
    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Sequential logic for read/write start signals
    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            read_start <= 1'b0;
            write_start <= 1'b0;
        end else begin
            read_start <= START_READ;
            write_start <= START_WRITE;
        end
    end

    // Combinational logic for next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (write_start)
                    next_state = WRITE_CHANNEL;
                else if (read_start)
                    next_state = RADDR_CHANNEL;
                else
                    next_state = IDLE;
            end
            RADDR_CHANNEL: 
                if (M_ARREADY)
                    next_state = RDATA_CHANNEL;
                else
                    next_state = RADDR_CHANNEL;
            RDATA_CHANNEL: 
                if (M_RVALID && M_RREADY)
                    next_state = IDLE;
                else
                    next_state = RDATA_CHANNEL;
            WRITE_CHANNEL: 
                if (M_AWREADY && M_WREADY)
                    next_state = WRESP_CHANNEL;
                else
                    next_state = WRITE_CHANNEL;
            WRESP_CHANNEL: 
                if (M_BVALID && M_BREADY)
                    next_state = IDLE;
                else
                    next_state = WRESP_CHANNEL;
            default: 
                next_state = IDLE;
        endcase
    end

    // Outputs logic
    always @(*) begin
        // Default assignments
        M_ARADDR = 0;
        M_ARVALID = 0;
        M_RREADY = 0;
        M_AWADDR = 0;
        M_AWVALID = 0;
        M_WDATA = 0;
        M_WSTRB = 4'b0000;
        M_WVALID = 0;
        M_BREADY = 0;

        case (state)
            RADDR_CHANNEL: begin
                M_ARADDR = address;
                M_ARVALID = 1'b1;
                M_RREADY = 1'b1;
            end
            RDATA_CHANNEL: begin
                M_RREADY = 1'b1;
            end
            WRITE_CHANNEL: begin
                M_AWADDR = address;
                M_AWVALID = 1'b1;
                M_WDATA = W_data;
                M_WSTRB = 4'b1111;
                M_WVALID = 1'b1;
            end
            WRESP_CHANNEL: begin
                M_BREADY = 1'b1;
            end
        endcase
    end
endmodule
