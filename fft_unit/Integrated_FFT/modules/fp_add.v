module fp_add#(parameter XLEN=32)
                        (input [XLEN-1:0]A,
                         input [XLEN-1:0]B,
                         output reg [XLEN-1:0] result);

reg [31:0] A_swap, B_swap;  // comparison-based swap
wire [23:0] A_Mantissa = {1'b1, A_swap[22:0]}, B_Mantissa = {1'b1, B_swap[22:0]};  // stored mantissa is 23b, this is {1'b1, mantissa} = 24b long
wire [7:0] A_Exponent = A_swap[30:23], B_Exponent = B_swap[30:23];
wire A_sign = A_swap[31], B_sign = B_swap[31];

wire Zero = (A_sign !=B_sign && A[30:0] == B[30:0]);
reg [23:0] Temp_Mantissa, B_shifted_mantissa;
reg [22:0] Mantissa;
reg [7:0] Exponent;
reg Sign;

reg [7:0] diff_Exponent;
reg carry;
wire comp;

integer i;

// compare absolute values of A, B
FloatingCompare comp_abs(.A({1'b0, A[30:0]}), .B({1'b0, B[30:0]}), .result(comp));

always @(*) begin
    // let A >= B (switch numbers if needed)
    A_swap = comp ? A : B;
    B_swap = comp ? B : A;

    // shift B to same exponent (A >= B, exponent diff >= 0)
    diff_Exponent = A_Exponent - B_Exponent;
    B_shifted_mantissa = (B_Mantissa >> diff_Exponent);

    // sum the mantissas (and store potential carry)
    {carry, Temp_Mantissa} = (A_sign ~^ B_sign) ? A_Mantissa + B_shifted_mantissa : A_Mantissa - B_shifted_mantissa;
    Exponent = A_Exponent;

    // Handle zero result directly
    if (Temp_Mantissa == 0) begin
        result = 0;
    end

    // adjust mantissa to format 1.xxxx (bit 23 is 1)
    if (carry) begin
        Temp_Mantissa = Temp_Mantissa >> 1;
        Exponent = (Exponent < 8'hff) ? Exponent + 1 : 8'hff;  // protect exponent overflow
    end else begin
        // Normalize mantissa if needed
        for (i = 0; Temp_Mantissa[23] != 1'b1 && Exponent > 0 && i < 24; i = i + 1) begin
            Temp_Mantissa = Temp_Mantissa << 1;
            Exponent = Exponent - 1;
        end
    end

    Sign = A_sign;
    Mantissa = Temp_Mantissa[22:0];
    result = Zero ? 0 : {Sign, Exponent, Mantissa};
end

endmodule

module FloatingCompare (input [31:0]A,
                        input [31:0]B,
                        output reg result);

    always @(*) begin
        // compare signs
        if (A[31] != B[31])
            result = ~A[31];  // A is positive (0) -> A >= B -> result = 1

        // compare exponents
        else if (A[30:23] != B[30:23]) begin
            result = (A[30:23] > B[30:23]) ? 1'b1 : 1'b0;  // A has bigger exponent than B
            if (A[31]) result = ~result;  // if A is negative, flip the result
        end

        // compare mantissas
        else begin
            result = (A[22:0] > B[22:0]) ? 1'b1 : 1'b0;  // A has bigger mantissa
            if (A[31]) result = ~result;  // if A is negative, flip the result
        end
    end

endmodule
