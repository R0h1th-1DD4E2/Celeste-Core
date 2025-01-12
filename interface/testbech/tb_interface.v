module tb_interface;
    // Parameters
    parameter CLK_PERIOD = 10; // 10ns clock period (100MHz)
    
    // Signals to connect to DUT
    reg         clk;
    reg         rst_n;
    reg         pcpi_valid;
    reg  [31:0] pcpi_insn;
    reg  [31:0] pcpi_rs1;
    reg  [31:0] pcpi_rs2;
    wire        pcpi_wr;
    wire [31:0] pcpi_rd;
    wire        pcpi_wait;
    wire        pcpi_ready;
    
    // FFT Controller signals
    wire        fft_start;
    wire [31:0] length;
    wire [31:0] breadth;
    reg  [31:0] location;
    reg         fft_done;
    reg         fft_busy;
    
    // AXI Address signals
    wire [31:0] rs1_addr;
    wire [31:0] rs2_addr;

    // Instantiate the DUT
    interface dut (
        .clk(clk),
        .rst_n(rst_n),
        .pcpi_valid(pcpi_valid),
        .pcpi_insn(pcpi_insn),
        .pcpi_rs1(pcpi_rs1),
        .pcpi_rs2(pcpi_rs2),
        .pcpi_wr(pcpi_wr),
        .pcpi_rd(pcpi_rd),
        .pcpi_wait(pcpi_wait),
        .pcpi_ready(pcpi_ready),
        .fft_start(fft_start),
        .length(length),
        .breadth(breadth),
        .location(location),
        .fft_done(fft_done),
        .fft_busy(fft_busy),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst_n = 0;
        pcpi_valid = 0;
        pcpi_insn = 32'h0;
        pcpi_rs1 = 32'h0;
        pcpi_rs2 = 32'h0;
        location = 32'h0;
        fft_done = 0;
        fft_busy = 0;

        // Wait 100ns and release reset
        #100 rst_n = 1;
        
        // Test Case 1: Basic FFT Start Operation (Completes within 16 cycles)
        #100;
        // Set instruction with FFT_START_OP (0x53) and function7 (0x7F)
        pcpi_insn = {7'h7F, 5'h1, 5'h2, 3'h0, 5'h0, 7'b1010011};
        pcpi_rs1 = 32'h00000100; // Length = 256
        pcpi_rs2 = 32'h00000080; // Breadth = 128
        pcpi_valid = 1;
        
        // Wait 10 cycles
        #100;
        
        // Signal FFT completion
        fft_done = 1;
        location = 32'hABCD1234;
        
        // Wait for completion
        @(posedge pcpi_ready);
        #20;
        pcpi_valid = 0;
        fft_done = 0;

        // Test Case 2: FFT Operation exceeding 16 cycles
        #100;
        pcpi_insn = {7'h7F, 5'h3, 5'h4, 3'h0, 5'h0, 7'b1010011};
        pcpi_rs1 = 32'h00000200; // Length = 512
        pcpi_rs2 = 32'h00000100; // Breadth = 256
        pcpi_valid = 1;
        
        // Wait more than 16 cycles
        #200;
        
        // Signal FFT completion
        fft_done = 1;
        location = 32'hDEADBEEF;
        
        // Wait for completion
        @(posedge pcpi_ready);
        #20;
        pcpi_valid = 0;
        fft_done = 0;

        // Test Case 3: Invalid opcode
        #100;
        pcpi_insn = {7'h7F, 5'h5, 5'h6, 3'h0, 5'h0, 7'b0000000};
        pcpi_rs1 = 32'h00000300;
        pcpi_rs2 = 32'h00000150;
        pcpi_valid = 1;
        
        #20;
        pcpi_valid = 0;

        // End simulation
        #100;
        $display("Testbench completed successfully");
        $finish;
    end

    // Monitor important signals
    initial begin
        $monitor("Time=%0t rst_n=%0b state=%0h pcpi_valid=%0b fft_start=%0b fft_done=%0b pcpi_ready=%0b pcpi_wait=%0b",
                 $time, rst_n, dut.state, pcpi_valid, fft_start, fft_done, pcpi_ready, pcpi_wait);
    end

 


endmodule