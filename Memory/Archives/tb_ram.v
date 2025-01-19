module ram_tb();
    // Clock generation
    reg clkA, clkB, clkC, clkD;
    
    // Test signals for Port A
    reg write_enA, read_enA;
    reg [31:0] data_inA;
    wire [31:0] data_outA;
    reg [31:0] read_addrA, write_addrA;
    
    // Test signals for Port B
    reg write_enB, read_enB;
    reg [31:0] data_inB;
    wire [31:0] data_outB;
    reg [31:0] read_addrB, write_addrB;
    
    // Test signals for Port C
    reg write_enC, read_enC;
    reg [31:0] data_inC;
    wire [31:0] data_outC;
    reg [31:0] read_addrC, write_addrC;
    
    // Test signals for Port D
    reg write_enD, read_enD;
    reg [31:0] data_inD;
    wire [31:0] data_outD;
    reg [31:0] read_addrD, write_addrD;
    
    // Instantiate RAM module
    ram dut (
        // Port A
        .clkA(clkA),
        .write_enA(write_enA),
        .read_enA(read_enA),
        .data_inA(data_inA),
        .data_outA(data_outA),
        .read_addrA(read_addrA),
        .write_addrA(write_addrA),
        
        // Port B
        .clkB(clkB),
        .write_enB(write_enB),
        .read_enB(read_enB),
        .data_inB(data_inB),
        .data_outB(data_outB),
        .read_addrB(read_addrB),
        .write_addrB(write_addrB),
        
        // Port C
        .clkC(clkC),
        .write_enC(write_enC),
        .read_enC(read_enC),
        .data_inC(data_inC),
        .data_outC(data_outC),
        .read_addrC(read_addrC),
        .write_addrC(write_addrC),
        
        // Port D
        .clkD(clkD),
        .write_enD(write_enD),
        .read_enD(read_enD),
        .data_inD(data_inD),
        .data_outD(data_outD),
        .read_addrD(read_addrD),
        .write_addrD(write_addrD)
    );
    
    // Clock generation
    initial begin
        clkA = 0;
        clkB = 0;
        clkC = 0;
        clkD = 0;
        forever begin
            #5 clkA = ~clkA;
            #5 clkB = ~clkB;
            #5 clkC = ~clkC;
            #5 clkD = ~clkD;
        end
    end
    
    // Test stimulus
    initial begin
        // Initialize signals
        write_enA = 0; read_enA = 0; data_inA = 0; read_addrA = 0; write_addrA = 0;
        write_enB = 0; read_enB = 0; data_inB = 0; read_addrB = 0; write_addrB = 0;
        write_enC = 0; read_enC = 0; data_inC = 0; read_addrC = 0; write_addrC = 0;
        write_enD = 0; read_enD = 0; data_inD = 0; read_addrD = 0; write_addrD = 0;
        
        // Wait for 100ns after reset
        #100;
        
        // Test 1: Write to all ports simultaneously
        @(posedge clkA) begin
            write_enA = 1;
            write_addrA = 32'h0;
            data_inA = 32'hAAAAAAAA;
        end
        
        @(posedge clkB) begin
            write_enB = 1;
            write_addrB = 32'h1;
            data_inB = 32'hBBBBBBBB;
        end
        
        @(posedge clkC) begin
            write_enC = 1;
            write_addrC = 32'h2;
            data_inC = 32'hCCCCCCCC;
        end
        
        @(posedge clkD) begin
            write_enD = 1;
            write_addrD = 32'h3;
            data_inD = 32'hDDDDDDDD;
        end
        
        // Wait for writes to complete
        #20;
        
        // Disable writes
        write_enA = 0;
        write_enB = 0;
        write_enC = 0;
        write_enD = 0;
        
        // Test 2: Read from all ports simultaneously
        @(posedge clkA) begin
            read_enA = 1;
            read_addrA = 32'h0;
        end
        
        @(posedge clkB) begin
            read_enB = 1;
            read_addrB = 32'h1;
        end
        
        @(posedge clkC) begin
            read_enC = 1;
            read_addrC = 32'h2;
        end
        
        @(posedge clkD) begin
            read_enD = 1;
            read_addrD = 32'h3;
        end
        
        // Wait for reads to complete and verify
        #20;
        
        // Test 3: Verify read data
        if (data_outA !== 32'hAAAAAAAA) $display("Error: Port A read data mismatch");
        if (data_outB !== 32'hBBBBBBBB) $display("Error: Port B read data mismatch");
        if (data_outC !== 32'hCCCCCCCC) $display("Error: Port C read data mismatch");
        if (data_outD !== 32'hDDDDDDDD) $display("Error: Port D read data mismatch");
        
        // Test 4: Read initial data from hex file
        read_addrA = 32'h4;
        read_addrB = 32'h5;
        read_addrC = 32'h6;
        read_addrD = 32'h7;
        
        #20;
        
        // Display results
        $display("Port A reads: %h", data_outA);
        $display("Port B reads: %h", data_outB);
        $display("Port C reads: %h", data_outC);
        $display("Port D reads: %h", data_outD);
        
        // End simulation
        #100 $finish;
    end
    
    // Add waveform dumping
    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars(0, ram_tb);
    end
    
endmodule