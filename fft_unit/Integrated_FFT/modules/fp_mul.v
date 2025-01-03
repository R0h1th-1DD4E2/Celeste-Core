module fp_mul #(parameter XLEN=32)
               (input [XLEN-1:0] A,
                input [XLEN-1:0] B,
                output [XLEN-1:0] result);

					 
					 reg [47:0] Temp_Mantissa;
reg [8:0] Temp_Exponent;  // one bit bigger because of potential overflow
reg [7:0] Exponent;       // Changed to reg to allow procedural assignment
reg Sign;
wire [23:0] A_Mantissa = {1'b1, A[22:0]}, B_Mantissa = {1'b1, B[22:0]};
wire [7:0] A_Exponent = A[30:23], B_Exponent = B[30:23];
wire A_sign = A[31], B_sign = B[31];

wire [22:0] Mantissa = Temp_Mantissa[45:23];  // highest bits of Temp_Mantissa, except for 1 carry bit (which causes bitshift)

wire Zero=(A==0)||(B==0);
assign result =Zero?0:( {Sign, Exponent, Mantissa});

always @(*) begin
    Temp_Exponent = (A_Exponent + B_Exponent < 'd127) ? 8'd0 : A_Exponent + B_Exponent - 'd127;  // prevent exponent underflow
    Temp_Mantissa = A_Mantissa * B_Mantissa;

    // "carry"... increase exponent, shift
    if (Temp_Mantissa[47]) begin
        Temp_Mantissa = Temp_Mantissa >> 1;  // Corrected: Mantissa = Temp_Mantissa[46:24]
        Exponent = Temp_Exponent[7:0] + 1;  // Use Temp_Exponent for addition
    end else begin
        Exponent = Temp_Exponent[7:0];      // No carry; direct assignment
    end

    // prevent exponent overflow
    if (Temp_Exponent[8]) begin
        Exponent = 8'hff;
    end

    Sign = A_sign ^ B_sign;
end
endmodule
