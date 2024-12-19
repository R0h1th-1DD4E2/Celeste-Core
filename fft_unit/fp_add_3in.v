`timescale 1ns / 1ps

module fp_add_3in (
    // Floating-point (IEEE 754 format) inputs
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    output [31:0] result
);

    wire [31:0] intermediate_result;  // Intermediate result of adding first two inputs

    // Instantiate the 2-input floating-point adder (first adder)
    fp_add fp_add_inst1 (
        .a(a),
        .b(b),
        .result(intermediate_result)
    );

    // Instantiate the 2-input floating-point adder (second adder)
    fp_add fp_add_inst2 (
        .a(intermediate_result),
        .b(c),
        .result(result)
    );

endmodule
