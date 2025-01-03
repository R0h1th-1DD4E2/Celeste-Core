module tb_ADD;

    // Parameters
    parameter XLEN = 32;

    // Inputs
    reg [XLEN-1:0] A;
    reg [XLEN-1:0] B;

    // Outputs
    wire [XLEN-1:0] result;

    // Instantiate the Unit Under Test (UUT)
    fp_add #(XLEN) uut (
        .A(A), 
        .B(B), 
        .result(result)
    );

    initial begin
        // Initialize Inputs
        A = 32'h40400000; // 3.0 in IEEE 754
        B = 32'h40000000; // 2.0 in IEEE 754

        // Wait for global reset
        #10;
        
        // Display the result
        $display("A = %h, B = %h, result = %h", A, B, result);

        // Add stimulus here
        A = 32'hC0400000; // -3.0 in IEEE 754
        B = 32'h40000000; // 2.0 in IEEE 754

        // Wait for global reset
        #10;
        
        // Display the result
        $display("A = %h, B = %h, result = %h", A, B, result);

        // Add more test cases as needed
        A = 32'h3F800000; // 1.0 in IEEE 754
        B = 32'h3F800000; // -1.0 in IEEE 754

        // Wait for global reset
        #10;
        
        // Display the result
        $display("A = %h, B = %h, result = %h", A, B, result);

        // Finish simulation
        $finish;
    end
            
endmodule