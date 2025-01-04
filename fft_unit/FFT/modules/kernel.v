`timescale 1ns/1ps
module kernel (
    output reg [31:0] real_kernel [0:63], // Real part in IEEE 754
    output reg [31:0] imag_kernel [0:63]  // Imaginary part in IEEE 754
);

    initial begin
        real_kernel[0] = 32'h41000000;  imag_kernel[0] = 32'h00000000;
        real_kernel[1] = 32'h00000000;  imag_kernel[1] = 32'hC0ED413D;
        real_kernel[2] = 32'hC0C00000;  imag_kernel[2] = 32'h00000000;
        real_kernel[3] = 32'h00000000;  imag_kernel[3] = 32'h4092BEC3;
        real_kernel[4] = 32'h40800000;  imag_kernel[4] = 32'h00000000;
        real_kernel[5] = 32'h00000000;  imag_kernel[5] = 32'hC092BEC3;
        real_kernel[6] = 32'hC0C00000;  imag_kernel[6] = 32'h00000000;
        real_kernel[7] = 32'h00000000;  imag_kernel[7] = 32'h40ED413D;
        real_kernel[8] = 32'h00000000;  imag_kernel[8] = 32'hC0ED413D;
        real_kernel[9] = 32'hC0DA827A;  imag_kernel[9] = 32'h00000000;
        real_kernel[10] = 32'h00000000;  imag_kernel[10] = 32'h40AD413D;
        real_kernel[11] = 32'h40800000;  imag_kernel[11] = 32'h00000000;
        real_kernel[12] = 32'h00000000;  imag_kernel[12] = 32'hC05A827A;
        real_kernel[13] = 32'hC0800000;  imag_kernel[13] = 32'h00000000;
        real_kernel[14] = 32'h00000000;  imag_kernel[14] = 32'h40AD413D;
        real_kernel[15] = 32'h40DA827A;  imag_kernel[15] = 32'h00000000;
        real_kernel[16] = 32'hC0C00000;  imag_kernel[16] = 32'h00000000;
        real_kernel[17] = 32'h00000000;  imag_kernel[17] = 32'h40AD413D;
        real_kernel[18] = 32'h40800000;  imag_kernel[18] = 32'h00000000;
        real_kernel[19] = 32'h00000000;  imag_kernel[19] = 32'hC0257D86;
        real_kernel[20] = 32'hC0000000;  imag_kernel[20] = 32'h00000000;
        real_kernel[21] = 32'h00000000;  imag_kernel[21] = 32'h40257D86;
        real_kernel[22] = 32'h40800000;  imag_kernel[22] = 32'h00000000;
        real_kernel[23] = 32'h00000000;  imag_kernel[23] = 32'hC0AD413D;
        real_kernel[24] = 32'h00000000;  imag_kernel[24] = 32'h4092BEC3;
        real_kernel[25] = 32'h40800000;  imag_kernel[25] = 32'h00000000;
        real_kernel[26] = 32'h00000000;  imag_kernel[26] = 32'hC0257D86;
        real_kernel[27] = 32'hBF95F61A;  imag_kernel[27] = 32'h00000000;
        real_kernel[28] = 32'h00000000;  imag_kernel[28] = 32'h3F15F61A;
        real_kernel[29] = 32'h3F95F61A;  imag_kernel[29] = 32'h00000000;
        real_kernel[30] = 32'h00000000;  imag_kernel[30] = 32'hC0257D86;
        real_kernel[31] = 32'hC0800000;  imag_kernel[31] = 32'h00000000;
        real_kernel[32] = 32'h40800000;  imag_kernel[32] = 32'h00000000;
        real_kernel[33] = 32'h00000000;  imag_kernel[33] = 32'hC05A827A;
        real_kernel[34] = 32'hC0000000;  imag_kernel[34] = 32'h00000000;
        real_kernel[35] = 32'h00000000;  imag_kernel[35] = 32'h3F15F61A;
        real_kernel[36] = 32'h00000000;  imag_kernel[36] = 32'h00000000;
        real_kernel[37] = 32'h00000000;  imag_kernel[37] = 32'hBF15F61A;
        real_kernel[38] = 32'hC0000000;  imag_kernel[38] = 32'h00000000;
        real_kernel[39] = 32'h00000000;  imag_kernel[39] = 32'h405A827A;
        real_kernel[40] = 32'h00000000;  imag_kernel[40] = 32'hC092BEC3;
        real_kernel[41] = 32'hC0800000;  imag_kernel[41] = 32'h00000000;
        real_kernel[42] = 32'h00000000;  imag_kernel[42] = 32'h40257D86;
        real_kernel[43] = 32'h3F95F61A;  imag_kernel[43] = 32'h00000000;
        real_kernel[44] = 32'h00000000;  imag_kernel[44] = 32'hBF15F61A;
        real_kernel[45] = 32'hBF95F61A;  imag_kernel[45] = 32'h00000000;
        real_kernel[46] = 32'h00000000;  imag_kernel[46] = 32'h40257D86;
        real_kernel[47] = 32'h40800000;  imag_kernel[47] = 32'h00000000;
        real_kernel[48] = 32'hC0C00000;  imag_kernel[48] = 32'h00000000;
        real_kernel[49] = 32'h00000000;  imag_kernel[49] = 32'h40AD413D;
        real_kernel[50] = 32'h40800000;  imag_kernel[50] = 32'h00000000;
        real_kernel[51] = 32'h00000000;  imag_kernel[51] = 32'hC0257D86;
        real_kernel[52] = 32'hC0000000;  imag_kernel[52] = 32'h00000000;
        real_kernel[53] = 32'h00000000;  imag_kernel[53] = 32'h40257D86;
        real_kernel[54] = 32'h40800000;  imag_kernel[54] = 32'h00000000;
        real_kernel[55] = 32'h00000000;  imag_kernel[55] = 32'hC0AD413D;
        real_kernel[56] = 32'h00000000;  imag_kernel[56] = 32'h40ED413D;
        real_kernel[57] = 32'h40DA827A;  imag_kernel[57] = 32'h00000000;
        real_kernel[58] = 32'h00000000;  imag_kernel[58] = 32'hC0AD413D;
        real_kernel[59] = 32'hC0800000;  imag_kernel[59] = 32'h00000000;
        real_kernel[60] = 32'h00000000;  imag_kernel[60] = 32'h405A827A;
        real_kernel[61] = 32'h40800000;  imag_kernel[61] = 32'h00000000;
        real_kernel[62] = 32'h00000000;  imag_kernel[62] = 32'hC0AD413D;
        real_kernel[63] = 32'hC0DA827A;  imag_kernel[63] = 32'h00000000;
    end

endmodule
