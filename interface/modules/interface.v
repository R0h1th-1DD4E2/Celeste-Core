module interface (
    // PCPI Interface signals
    input  wire        pcpi_valid,
    input  wire [31:0] pcpi_insn,
    input  wire [31:0] pcpi_rs1,
    input  wire [31:0] pcpi_rs2,
    output reg         pcpi_wr,
    output reg  [31:0] pcpi_rd,
    output reg         pcpi_wait,
    output reg         pcpi_ready,

    // Clock and reset
    input  wire        clk,
    input  wire        rst_n,

    // FFT Controller Interface
    output reg         fft_start,
    output reg  [31:0] length,
    output reg  [31:0] breadth,    
    input  wire [31:0] location,
    input  wire        fft_done,
    input  wire        fft_busy,

    // chunker  Interface
    output reg  [31:0] rs1_addr,   // Address from rs1 field
    output reg  [31:0] rs2_addr    // Address from rs2 field
);

    // Custom instruction opcodes
    localparam FFT_START_OP  = 7'b1010011;
    localparam function7 = 7'b1111111;
    
    // FSM states
    localparam IDLE      = 3'b000;
    localparam START_FFT = 3'b010;
    localparam WAIT_FFT  = 3'b011;

    reg [2:0] state, next_state;
    reg [4:0] cycle_count;  // Counter for tracking operation cycles

    // Extract fields from instruction
    wire [6:0] opcode = pcpi_insn[6:0];
    wire [4:0] rs1_field = pcpi_insn[19:15];  // rs1 address field
    wire [4:0] rs2_field = pcpi_insn[24:20];  // rs2 address field
    wire [6:0] func7  = pcpi_insn[31:25];

    // Cycle counter logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cycle_count <= 5'b0;
        else if (state == IDLE)
            cycle_count <= 5'b0;
        else if (pcpi_valid && !pcpi_ready && !fft_done)
            cycle_count <= cycle_count + 1;
    end

    // FSM Sequential Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // FSM Combinational Logic
    always @(*) begin
        // Default values
        next_state = state;
        pcpi_wr    = 0;
        pcpi_rd    = 0;
        pcpi_wait  = 0;
        pcpi_ready = 0;
        fft_start  = 0;
        length     = 0;
        breadth    = 0;
        rs1_addr   = 0;
        rs2_addr   = 0;

        case (state)
            IDLE: begin
                if (pcpi_valid) begin
                    case (opcode)
                        FFT_START_OP: begin
                            case(func7)
                                function7: begin
                                    next_state = START_FFT;
                                    pcpi_wait = 0;
                                    // Extract addresses from instruction fields
                                    rs1_addr = {27'b0, rs1_field};  // Zero-extended rs1 address
                                    rs2_addr = {27'b0, rs2_field};  // Zero-extended rs2 address
                                end
                            endcase
                        end
                        default: begin
                            pcpi_ready = 1;
                        end
                    endcase
                end
            end

            START_FFT: begin
                fft_start = 1;
                length = pcpi_rs1;
                breadth = pcpi_rs2;
                
                if (cycle_count >= 16) begin
                    next_state = WAIT_FFT;
                    pcpi_wait = 1;
                end
                else if (fft_done) begin
                    pcpi_ready = 1;
                    pcpi_wr = 1;
                    pcpi_rd = location;
                    next_state = IDLE;
                end

            end

            WAIT_FFT: begin
                pcpi_wait = 1;
                fft_start = 1;
                if (fft_done) begin
                    pcpi_ready = 1;
                    pcpi_wr = 1;
                    pcpi_rd = location;
                    next_state = IDLE;
                end
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule