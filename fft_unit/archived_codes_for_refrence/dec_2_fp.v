
module dec_2_fp(
    input [31:0] dec,
    output reg [31:0] ieee_out
);

    reg sign;                  
    reg [31:0] abs_value;      
    reg [7:0] exponent;
    reg [22:0] mantissa;
    reg [4:0] position;
    wire Zero=(dec==0);
	 
    always @(*) begin
        // if zero input
        if (dec == 32'b0) begin
            ieee_out = 32'b0;
        end else begin
            // sign and absolute value
            sign = dec[31];
            abs_value = sign ? (~dec + 1) : dec;

            // position of the MSB
            position = 5'd31;
            while (position > 0 && abs_value[position] == 0) begin
                position = position - 1;
            end

            // exponent 
            exponent = position + 8'd127;

            // calculate the mantissa
            // Shift left to align MSB with the 24th bit (1.mantissa format)
            mantissa = (abs_value << (23 - position)) & 23'h7FFFFF;

            ieee_out = Zero?0:({sign, exponent, mantissa});
        end
    end

endmodule

