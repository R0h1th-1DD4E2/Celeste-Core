`timescale 1ns / 1ps

module tb_fp_div;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    fp_div uut (
        .a(a),
        .b(b),
        .result(result)
    );

    // Test stimulus
    initial begin
        // Test case 1: 4.0 / 2.0 = 2.0
        a = 32'h40800000; // 4.0 in IEEE-754
        b = 32'h00000000; // 2.0 in IEEE-754
        #10;

//        // Test case 2: -6.0 / 3.0 = -2.0
//        a = 32'hC0C00000; // -6.0 in IEEE-754
//        b = 32'h40400000; // 3.0 in IEEE-754
//        #10;

//        // Test case 3: 1.0 / 4.0 = 0.25
//        a = 32'h3F800000; // 1.0 in IEEE-754
//        b = 32'h40800000; // 4.0 in IEEE-754
//        #10;

//        // Test case 4: 0.0 / 5.0 = 0.0
//        a = 32'h00000000; // 0.0 in IEEE-754
//        b = 32'h40A00000; // 5.0 in IEEE-754
//        #10;

//        // Test case 5: -10.0 / -2.0 = 5.0
//        a = 32'hC1200000; // -10.0 in IEEE-754
//        b = 32'hC0000000; // -2.0 in IEEE-754
//        #10;

//        // Test case 6: 7.0 / 0.0 = Infinity (undefined in IEEE-754)
//        a = 32'h40E00000; // 7.0 in IEEE-754
//        b = 32'h00000000; // 0.0 in IEEE-754
//        #10;

        $stop;
    end

endmodule
