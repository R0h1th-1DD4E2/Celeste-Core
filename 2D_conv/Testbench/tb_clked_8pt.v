`timescale 1ns / 1ps

module tb_clked_8pt();
    // Clock and reset
    reg clk;
    reg rst;
    
    // Control signals
    reg valid_in;
    wire ready_in;
    wire valid_out;
    reg ready_out;
    
    // Data signals
    reg [31:0] x0_real, x0_imag, x1_real, x1_imag;
    reg [31:0] x2_real, x2_imag, x3_real, x3_imag;
    reg [31:0] x4_real, x4_imag, x5_real, x5_imag;
    reg [31:0] x6_real, x6_imag, x7_real, x7_imag;
    
    wire [31:0] X0_real, X0_imag, X1_real, X1_imag;
    wire [31:0] X2_real, X2_imag, X3_real, X3_imag;
    wire [31:0] X4_real, X4_imag, X5_real, X5_imag;
    wire [31:0] X6_real, X6_imag, X7_real, X7_imag;

    // Pattern A: Impulse at start
    parameter [31:0] PATTERN_A [0:7][0:1] = '{
        '{32'h3f800000, 32'h00000000}, // 1.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}, // 0.0 + j0.0
        '{32'h00000000, 32'h00000000}  // 0.0 + j0.0
    };

    // Pattern B: Alternating 1, -1
    parameter [31:0] PATTERN_B [0:7][0:1] = '{
        '{32'h3f800000, 32'h00000000}, //  1.0 + j0.0
        '{32'hbf800000, 32'h00000000}, // -1.0 + j0.0
        '{32'h3f800000, 32'h00000000}, //  1.0 + j0.0
        '{32'hbf800000, 32'h00000000}, // -1.0 + j0.0
        '{32'h3f800000, 32'h00000000}, //  1.0 + j0.0
        '{32'hbf800000, 32'h00000000}, // -1.0 + j0.0
        '{32'h3f800000, 32'h00000000}, //  1.0 + j0.0
        '{32'hbf800000, 32'h00000000}  // -1.0 + j0.0
    };

    integer input_count;
    integer output_count;
    reg [7:0] pattern_sent;     // Track which pattern was sent
    reg [7:0] pattern_received; // Track which pattern was received
    
    // DUT instance
    clked_8pt dut (
        .clk(clk),
        .rst(rst),
        .valid_in(valid_in),
        .ready_in(ready_in),
        .x0_real(x0_real), .x0_imag(x0_imag),
        .x1_real(x1_real), .x1_imag(x1_imag),
        .x2_real(x2_real), .x2_imag(x2_imag),
        .x3_real(x3_real), .x3_imag(x3_imag),
        .x4_real(x4_real), .x4_imag(x4_imag),
        .x5_real(x5_real), .x5_imag(x5_imag),
        .x6_real(x6_real), .x6_imag(x6_imag),
        .x7_real(x7_real), .x7_imag(x7_imag),
        .valid_out(valid_out),
        .ready_out(ready_out),
        .X0_real(X0_real), .X0_imag(X0_imag),
        .X1_real(X1_real), .X1_imag(X1_imag),
        .X2_real(X2_real), .X2_imag(X2_imag),
        .X3_real(X3_real), .X3_imag(X3_imag),
        .X4_real(X4_real), .X4_imag(X4_imag),
        .X5_real(X5_real), .X5_imag(X5_imag),
        .X6_real(X6_real), .X6_imag(X6_imag),
        .X7_real(X7_real), .X7_imag(X7_imag)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Task to send an input pattern
    task send_pattern;
        input pattern_select; // 0 for Pattern A, 1 for Pattern B
        begin
            wait(ready_in);
            @(posedge clk);
            valid_in = 1;
            
            if (pattern_select == 0) begin
                // Send Pattern A
                x0_real = PATTERN_A[0][0]; x0_imag = PATTERN_A[0][1];
                x1_real = PATTERN_A[1][0]; x1_imag = PATTERN_A[1][1];
                x2_real = PATTERN_A[2][0]; x2_imag = PATTERN_A[2][1];
                x3_real = PATTERN_A[3][0]; x3_imag = PATTERN_A[3][1];
                x4_real = PATTERN_A[4][0]; x4_imag = PATTERN_A[4][1];
                x5_real = PATTERN_A[5][0]; x5_imag = PATTERN_A[5][1];
                x6_real = PATTERN_A[6][0]; x6_imag = PATTERN_A[6][1];
                x7_real = PATTERN_A[7][0]; x7_imag = PATTERN_A[7][1];
                $display("Time %0t: Sending Pattern A (Impulse)", $time);
            end else begin
                // Send Pattern B
                x0_real = PATTERN_B[0][0]; x0_imag = PATTERN_B[0][1];
                x1_real = PATTERN_B[1][0]; x1_imag = PATTERN_B[1][1];
                x2_real = PATTERN_B[2][0]; x2_imag = PATTERN_B[2][1];
                x3_real = PATTERN_B[3][0]; x3_imag = PATTERN_B[3][1];
                x4_real = PATTERN_B[4][0]; x4_imag = PATTERN_B[4][1];
                x5_real = PATTERN_B[5][0]; x5_imag = PATTERN_B[5][1];
                x6_real = PATTERN_B[6][0]; x6_imag = PATTERN_B[6][1];
                x7_real = PATTERN_B[7][0]; x7_imag = PATTERN_B[7][1];
                $display("Time %0t: Sending Pattern B (Alternating)", $time);
            end
            
            pattern_sent[input_count] = pattern_select;
            input_count = input_count + 1;
            
            @(posedge clk);
            valid_in = 0;
        end
    endtask

    // Main test sequence
    initial begin
        // Initialize
        rst = 1;
        valid_in = 0;
        ready_out = 1;
        input_count = 0;
        output_count = 0;
        pattern_sent = 0;
        pattern_received = 0;

        // Reset
        #100 rst = 0;
        #20;

        // Test pipeline by alternating patterns
        fork 
            // Input thread
            begin
                repeat(8) begin
                    send_pattern(input_count % 2); // Alternate between patterns
                    #10; // Small gap to test pipeline
                end
            end

            // Output monitor thread
            begin
                while(output_count < 8) begin
                    @(posedge clk);
                    if(valid_out && ready_out) begin
                        $display("\nTime %0t: Received output %0d (Pattern %s):", 
                                $time, output_count,
                                pattern_sent[output_count] ? "B" : "A");
                        $display("X0: %h + j%h", X0_real, X0_imag);
                        $display("X1: %h + j%h", X1_real, X1_imag);
                        $display("X2: %h + j%h", X2_real, X2_imag);
                        $display("X3: %h + j%h", X3_real, X3_imag);
                        $display("X4: %h + j%h", X4_real, X4_imag);
                        $display("X5: %h + j%h", X5_real, X5_imag);
                        $display("X6: %h + j%h", X6_real, X6_imag);
                        $display("X7: %h + j%h", X7_real, X7_imag);
                        
                        // Check pipeline operation
                        if(input_count > output_count) begin
                            $display("Pipeline active: Processing pattern %s while receiving pattern %s",
                                    pattern_sent[input_count-1] ? "B" : "A",
                                    pattern_sent[output_count] ? "B" : "A");
                        end
                        
                        output_count = output_count + 1;
                    end
                end
            end

            // Pipeline verification thread
            begin
                while(output_count < 8) begin
                    @(posedge clk);
                    if(ready_in && valid_out)
                        $display("Time %0t: Pipeline verified - ready for new input while producing output", $time);
                end
            end
        join

        // Test backpressure
        ready_out = 0;
        send_pattern(0);
        #30;
        ready_out = 1;
        
        // Wait for completion
        wait(output_count == 8);
        
        // Final report
        $display("\nTest Summary:");
        $display("Total patterns sent: %0d", input_count);
        $display("Total outputs received: %0d", output_count);
        
        #100;
        $finish;
    end

    // Timeout
    initial begin
        #10000;
        $display("ERROR: Test timeout");
        $finish;
    end

endmodule