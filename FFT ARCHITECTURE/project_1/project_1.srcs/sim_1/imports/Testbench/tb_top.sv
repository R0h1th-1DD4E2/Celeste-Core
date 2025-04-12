`timescale 1ns/1ps

module TOP_tb;
    // Clock and reset
    reg clk;
    reg rst;
    
    // Input and output signals (64 complex inputs and outputs)
    reg [31:0] Ip_Real[0:63];
    reg [31:0] Ip_Img[0:63];
    wire [31:0] Op_Real[0:63];
    wire [31:0] Op_Img[0:63];
    
    // Individual port connections
    reg [31:0] Ip_0_Real, Ip_0_Img, Ip_1_Real, Ip_1_Img;
    reg [31:0] Ip_2_Real, Ip_2_Img, Ip_3_Real, Ip_3_Img;
    reg [31:0] Ip_4_Real, Ip_4_Img, Ip_5_Real, Ip_5_Img;
    reg [31:0] Ip_6_Real, Ip_6_Img, Ip_7_Real, Ip_7_Img;
    reg [31:0] Ip_8_Real, Ip_8_Img, Ip_9_Real, Ip_9_Img;
    reg [31:0] Ip_10_Real, Ip_10_Img, Ip_11_Real, Ip_11_Img;
    reg [31:0] Ip_12_Real, Ip_12_Img, Ip_13_Real, Ip_13_Img;
    reg [31:0] Ip_14_Real, Ip_14_Img, Ip_15_Real, Ip_15_Img;
    reg [31:0] Ip_16_Real, Ip_16_Img, Ip_17_Real, Ip_17_Img;
    reg [31:0] Ip_18_Real, Ip_18_Img, Ip_19_Real, Ip_19_Img;
    reg [31:0] Ip_20_Real, Ip_20_Img, Ip_21_Real, Ip_21_Img;
    reg [31:0] Ip_22_Real, Ip_22_Img, Ip_23_Real, Ip_23_Img;
    reg [31:0] Ip_24_Real, Ip_24_Img, Ip_25_Real, Ip_25_Img;
    reg [31:0] Ip_26_Real, Ip_26_Img, Ip_27_Real, Ip_27_Img;
    reg [31:0] Ip_28_Real, Ip_28_Img, Ip_29_Real, Ip_29_Img;
    reg [31:0] Ip_30_Real, Ip_30_Img, Ip_31_Real, Ip_31_Img;
    reg [31:0] Ip_32_Real, Ip_32_Img, Ip_33_Real, Ip_33_Img;
    reg [31:0] Ip_34_Real, Ip_34_Img, Ip_35_Real, Ip_35_Img;
    reg [31:0] Ip_36_Real, Ip_36_Img, Ip_37_Real, Ip_37_Img;
    reg [31:0] Ip_38_Real, Ip_38_Img, Ip_39_Real, Ip_39_Img;
    reg [31:0] Ip_40_Real, Ip_40_Img, Ip_41_Real, Ip_41_Img;
    reg [31:0] Ip_42_Real, Ip_42_Img, Ip_43_Real, Ip_43_Img;
    reg [31:0] Ip_44_Real, Ip_44_Img, Ip_45_Real, Ip_45_Img;
    reg [31:0] Ip_46_Real, Ip_46_Img, Ip_47_Real, Ip_47_Img;
    reg [31:0] Ip_48_Real, Ip_48_Img, Ip_49_Real, Ip_49_Img;
    reg [31:0] Ip_50_Real, Ip_50_Img, Ip_51_Real, Ip_51_Img;
    reg [31:0] Ip_52_Real, Ip_52_Img, Ip_53_Real, Ip_53_Img;
    reg [31:0] Ip_54_Real, Ip_54_Img, Ip_55_Real, Ip_55_Img;
    reg [31:0] Ip_56_Real, Ip_56_Img, Ip_57_Real, Ip_57_Img;
    reg [31:0] Ip_58_Real, Ip_58_Img, Ip_59_Real, Ip_59_Img;
    reg [31:0] Ip_60_Real, Ip_60_Img, Ip_61_Real, Ip_61_Img;
    reg [31:0] Ip_62_Real, Ip_62_Img, Ip_63_Real, Ip_63_Img;
    
    bit [31:0] Op_0_Real, Op_0_Img, Op_1_Real, Op_1_Img;
    bit [31:0] Op_2_Real, Op_2_Img, Op_3_Real, Op_3_Img;
    bit [31:0] Op_4_Real, Op_4_Img, Op_5_Real, Op_5_Img;
    bit [31:0] Op_6_Real, Op_6_Img, Op_7_Real, Op_7_Img;
    bit [31:0] Op_8_Real, Op_8_Img, Op_9_Real, Op_9_Img;
    bit [31:0] Op_10_Real, Op_10_Img, Op_11_Real, Op_11_Img;
    bit [31:0] Op_12_Real, Op_12_Img, Op_13_Real, Op_13_Img;
    bit [31:0] Op_14_Real, Op_14_Img, Op_15_Real, Op_15_Img;
    bit [31:0] Op_16_Real, Op_16_Img, Op_17_Real, Op_17_Img;
    bit [31:0] Op_18_Real, Op_18_Img, Op_19_Real, Op_19_Img;
    bit [31:0] Op_20_Real, Op_20_Img, Op_21_Real, Op_21_Img;
    bit [31:0] Op_22_Real, Op_22_Img, Op_23_Real, Op_23_Img;
    bit [31:0] Op_24_Real, Op_24_Img, Op_25_Real, Op_25_Img;
    bit [31:0] Op_26_Real, Op_26_Img, Op_27_Real, Op_27_Img;
    bit [31:0] Op_28_Real, Op_28_Img, Op_29_Real, Op_29_Img;
    bit [31:0] Op_30_Real, Op_30_Img, Op_31_Real, Op_31_Img;
    bit [31:0] Op_32_Real, Op_32_Img, Op_33_Real, Op_33_Img;
    bit [31:0] Op_34_Real, Op_34_Img, Op_35_Real, Op_35_Img;
    bit [31:0] Op_36_Real, Op_36_Img, Op_37_Real, Op_37_Img;
    bit [31:0] Op_38_Real, Op_38_Img, Op_39_Real, Op_39_Img;
    bit [31:0] Op_40_Real, Op_40_Img, Op_41_Real, Op_41_Img;
    bit [31:0] Op_42_Real, Op_42_Img, Op_43_Real, Op_43_Img;
    bit [31:0] Op_44_Real, Op_44_Img, Op_45_Real, Op_45_Img;
    bit [31:0] Op_46_Real, Op_46_Img, Op_47_Real, Op_47_Img;
    bit [31:0] Op_48_Real, Op_48_Img, Op_49_Real, Op_49_Img;
    bit [31:0] Op_50_Real, Op_50_Img, Op_51_Real, Op_51_Img;
    bit [31:0] Op_52_Real, Op_52_Img, Op_53_Real, Op_53_Img;
    bit [31:0] Op_54_Real, Op_54_Img, Op_55_Real, Op_55_Img;
    bit [31:0] Op_56_Real, Op_56_Img, Op_57_Real, Op_57_Img;
    bit [31:0] Op_58_Real, Op_58_Img, Op_59_Real, Op_59_Img;
    bit [31:0] Op_60_Real, Op_60_Img, Op_61_Real, Op_61_Img;
    bit [31:0] Op_62_Real, Op_62_Img, Op_63_Real, Op_63_Img;
    
    // File handles for reading test vectors and writing results
    integer input_file, kernel_file, output_file;
    integer status, i, j;
    
    // Instantiate the DUT (Design Under Test)
    TOP dut (
        .clk(clk),
        .rst(rst),
        .ker_sel(3'b101),
        .Ip_0_Real(Ip_0_Real), .Ip_0_Img(Ip_0_Img), .Ip_1_Real(Ip_1_Real), .Ip_1_Img(Ip_1_Img),
        .Ip_2_Real(Ip_2_Real), .Ip_2_Img(Ip_2_Img), .Ip_3_Real(Ip_3_Real), .Ip_3_Img(Ip_3_Img),
        .Ip_4_Real(Ip_4_Real), .Ip_4_Img(Ip_4_Img), .Ip_5_Real(Ip_5_Real), .Ip_5_Img(Ip_5_Img),
        .Ip_6_Real(Ip_6_Real), .Ip_6_Img(Ip_6_Img), .Ip_7_Real(Ip_7_Real), .Ip_7_Img(Ip_7_Img),
        .Ip_8_Real(Ip_8_Real), .Ip_8_Img(Ip_8_Img), .Ip_9_Real(Ip_9_Real), .Ip_9_Img(Ip_9_Img),
        .Ip_10_Real(Ip_10_Real), .Ip_10_Img(Ip_10_Img), .Ip_11_Real(Ip_11_Real), .Ip_11_Img(Ip_11_Img),
        .Ip_12_Real(Ip_12_Real), .Ip_12_Img(Ip_12_Img), .Ip_13_Real(Ip_13_Real), .Ip_13_Img(Ip_13_Img),
        .Ip_14_Real(Ip_14_Real), .Ip_14_Img(Ip_14_Img), .Ip_15_Real(Ip_15_Real), .Ip_15_Img(Ip_15_Img),
        .Ip_16_Real(Ip_16_Real), .Ip_16_Img(Ip_16_Img), .Ip_17_Real(Ip_17_Real), .Ip_17_Img(Ip_17_Img),
        .Ip_18_Real(Ip_18_Real), .Ip_18_Img(Ip_18_Img), .Ip_19_Real(Ip_19_Real), .Ip_19_Img(Ip_19_Img),
        .Ip_20_Real(Ip_20_Real), .Ip_20_Img(Ip_20_Img), .Ip_21_Real(Ip_21_Real), .Ip_21_Img(Ip_21_Img),
        .Ip_22_Real(Ip_22_Real), .Ip_22_Img(Ip_22_Img), .Ip_23_Real(Ip_23_Real), .Ip_23_Img(Ip_23_Img),
        .Ip_24_Real(Ip_24_Real), .Ip_24_Img(Ip_24_Img), .Ip_25_Real(Ip_25_Real), .Ip_25_Img(Ip_25_Img),
        .Ip_26_Real(Ip_26_Real), .Ip_26_Img(Ip_26_Img), .Ip_27_Real(Ip_27_Real), .Ip_27_Img(Ip_27_Img),
        .Ip_28_Real(Ip_28_Real), .Ip_28_Img(Ip_28_Img), .Ip_29_Real(Ip_29_Real), .Ip_29_Img(Ip_29_Img),
        .Ip_30_Real(Ip_30_Real), .Ip_30_Img(Ip_30_Img), .Ip_31_Real(Ip_31_Real), .Ip_31_Img(Ip_31_Img),
        .Ip_32_Real(Ip_32_Real), .Ip_32_Img(Ip_32_Img), .Ip_33_Real(Ip_33_Real), .Ip_33_Img(Ip_33_Img),
        .Ip_34_Real(Ip_34_Real), .Ip_34_Img(Ip_34_Img), .Ip_35_Real(Ip_35_Real), .Ip_35_Img(Ip_35_Img),
        .Ip_36_Real(Ip_36_Real), .Ip_36_Img(Ip_36_Img), .Ip_37_Real(Ip_37_Real), .Ip_37_Img(Ip_37_Img),
        .Ip_38_Real(Ip_38_Real), .Ip_38_Img(Ip_38_Img), .Ip_39_Real(Ip_39_Real), .Ip_39_Img(Ip_39_Img),
        .Ip_40_Real(Ip_40_Real), .Ip_40_Img(Ip_40_Img), .Ip_41_Real(Ip_41_Real), .Ip_41_Img(Ip_41_Img),
        .Ip_42_Real(Ip_42_Real), .Ip_42_Img(Ip_42_Img), .Ip_43_Real(Ip_43_Real), .Ip_43_Img(Ip_43_Img),
        .Ip_44_Real(Ip_44_Real), .Ip_44_Img(Ip_44_Img), .Ip_45_Real(Ip_45_Real), .Ip_45_Img(Ip_45_Img),
        .Ip_46_Real(Ip_46_Real), .Ip_46_Img(Ip_46_Img), .Ip_47_Real(Ip_47_Real), .Ip_47_Img(Ip_47_Img),
        .Ip_48_Real(Ip_48_Real), .Ip_48_Img(Ip_48_Img), .Ip_49_Real(Ip_49_Real), .Ip_49_Img(Ip_49_Img),
        .Ip_50_Real(Ip_50_Real), .Ip_50_Img(Ip_50_Img), .Ip_51_Real(Ip_51_Real), .Ip_51_Img(Ip_51_Img),
        .Ip_52_Real(Ip_52_Real), .Ip_52_Img(Ip_52_Img), .Ip_53_Real(Ip_53_Real), .Ip_53_Img(Ip_53_Img),
        .Ip_54_Real(Ip_54_Real), .Ip_54_Img(Ip_54_Img), .Ip_55_Real(Ip_55_Real), .Ip_55_Img(Ip_55_Img),
        .Ip_56_Real(Ip_56_Real), .Ip_56_Img(Ip_56_Img), .Ip_57_Real(Ip_57_Real), .Ip_57_Img(Ip_57_Img),
        .Ip_58_Real(Ip_58_Real), .Ip_58_Img(Ip_58_Img), .Ip_59_Real(Ip_59_Real), .Ip_59_Img(Ip_59_Img),
        .Ip_60_Real(Ip_60_Real), .Ip_60_Img(Ip_60_Img), .Ip_61_Real(Ip_61_Real), .Ip_61_Img(Ip_61_Img),
        .Ip_62_Real(Ip_62_Real), .Ip_62_Img(Ip_62_Img), .Ip_63_Real(Ip_63_Real), .Ip_63_Img(Ip_63_Img),
        
        .Op_0_Real(Op_0_Real), .Op_0_Img(Op_0_Img), .Op_1_Real(Op_1_Real), .Op_1_Img(Op_1_Img),
        .Op_2_Real(Op_2_Real), .Op_2_Img(Op_2_Img), .Op_3_Real(Op_3_Real), .Op_3_Img(Op_3_Img),
        .Op_4_Real(Op_4_Real), .Op_4_Img(Op_4_Img), .Op_5_Real(Op_5_Real), .Op_5_Img(Op_5_Img),
        .Op_6_Real(Op_6_Real), .Op_6_Img(Op_6_Img), .Op_7_Real(Op_7_Real), .Op_7_Img(Op_7_Img),
        .Op_8_Real(Op_8_Real), .Op_8_Img(Op_8_Img), .Op_9_Real(Op_9_Real), .Op_9_Img(Op_9_Img),
        .Op_10_Real(Op_10_Real), .Op_10_Img(Op_10_Img), .Op_11_Real(Op_11_Real), .Op_11_Img(Op_11_Img),
        .Op_12_Real(Op_12_Real), .Op_12_Img(Op_12_Img), .Op_13_Real(Op_13_Real), .Op_13_Img(Op_13_Img),
        .Op_14_Real(Op_14_Real), .Op_14_Img(Op_14_Img), .Op_15_Real(Op_15_Real), .Op_15_Img(Op_15_Img),
        .Op_16_Real(Op_16_Real), .Op_16_Img(Op_16_Img), .Op_17_Real(Op_17_Real), .Op_17_Img(Op_17_Img),
        .Op_18_Real(Op_18_Real), .Op_18_Img(Op_18_Img), .Op_19_Real(Op_19_Real), .Op_19_Img(Op_19_Img),
        .Op_20_Real(Op_20_Real), .Op_20_Img(Op_20_Img), .Op_21_Real(Op_21_Real), .Op_21_Img(Op_21_Img),
        .Op_22_Real(Op_22_Real), .Op_22_Img(Op_22_Img), .Op_23_Real(Op_23_Real), .Op_23_Img(Op_23_Img),
        .Op_24_Real(Op_24_Real), .Op_24_Img(Op_24_Img), .Op_25_Real(Op_25_Real), .Op_25_Img(Op_25_Img),
        .Op_26_Real(Op_26_Real), .Op_26_Img(Op_26_Img), .Op_27_Real(Op_27_Real), .Op_27_Img(Op_27_Img),
        .Op_28_Real(Op_28_Real), .Op_28_Img(Op_28_Img), .Op_29_Real(Op_29_Real), .Op_29_Img(Op_29_Img),
        .Op_30_Real(Op_30_Real), .Op_30_Img(Op_30_Img), .Op_31_Real(Op_31_Real), .Op_31_Img(Op_31_Img),
        .Op_32_Real(Op_32_Real), .Op_32_Img(Op_32_Img), .Op_33_Real(Op_33_Real), .Op_33_Img(Op_33_Img),
        .Op_34_Real(Op_34_Real), .Op_34_Img(Op_34_Img), .Op_35_Real(Op_35_Real), .Op_35_Img(Op_35_Img),
        .Op_36_Real(Op_36_Real), .Op_36_Img(Op_36_Img), .Op_37_Real(Op_37_Real), .Op_37_Img(Op_37_Img),
        .Op_38_Real(Op_38_Real), .Op_38_Img(Op_38_Img), .Op_39_Real(Op_39_Real), .Op_39_Img(Op_39_Img),
        .Op_40_Real(Op_40_Real), .Op_40_Img(Op_40_Img), .Op_41_Real(Op_41_Real), .Op_41_Img(Op_41_Img),
        .Op_42_Real(Op_42_Real), .Op_42_Img(Op_42_Img), .Op_43_Real(Op_43_Real), .Op_43_Img(Op_43_Img),
        .Op_44_Real(Op_44_Real), .Op_44_Img(Op_44_Img), .Op_45_Real(Op_45_Real), .Op_45_Img(Op_45_Img),
        .Op_46_Real(Op_46_Real), .Op_46_Img(Op_46_Img), .Op_47_Real(Op_47_Real), .Op_47_Img(Op_47_Img),
        .Op_48_Real(Op_48_Real), .Op_48_Img(Op_48_Img), .Op_49_Real(Op_49_Real), .Op_49_Img(Op_49_Img),
        .Op_50_Real(Op_50_Real), .Op_50_Img(Op_50_Img), .Op_51_Real(Op_51_Real), .Op_51_Img(Op_51_Img),
        .Op_52_Real(Op_52_Real), .Op_52_Img(Op_52_Img), .Op_53_Real(Op_53_Real), .Op_53_Img(Op_53_Img),
        .Op_54_Real(Op_54_Real), .Op_54_Img(Op_54_Img), .Op_55_Real(Op_55_Real), .Op_55_Img(Op_55_Img),
        .Op_56_Real(Op_56_Real), .Op_56_Img(Op_56_Img), .Op_57_Real(Op_57_Real), .Op_57_Img(Op_57_Img),
        .Op_58_Real(Op_58_Real), .Op_58_Img(Op_58_Img), .Op_59_Real(Op_59_Real), .Op_59_Img(Op_59_Img),
        .Op_60_Real(Op_60_Real), .Op_60_Img(Op_60_Img), .Op_61_Real(Op_61_Real), .Op_61_Img(Op_61_Img),
        .Op_62_Real(Op_62_Real), .Op_62_Img(Op_62_Img), .Op_63_Real(Op_63_Real), .Op_63_Img(Op_63_Img)
    );
    
    // Store output values for comparison
    reg [31:0] output_matlab_real[0:63];
    reg [31:0] output_matlab_img[0:63];
    
    // Clock generation
    initial begin
        clk = 0;
        forever #100 clk = ~clk; // 100MHz clock
    end
    
    // Map array indices to individual signals for inputs
    always @(*) begin
        // Real inputs 0-63
        Ip_0_Real = Ip_Real[0];
        Ip_1_Real = Ip_Real[1];
        Ip_2_Real = Ip_Real[2];
        Ip_3_Real = Ip_Real[3];
        Ip_4_Real = Ip_Real[4];
        Ip_5_Real = Ip_Real[5];
        Ip_6_Real = Ip_Real[6];
        Ip_7_Real = Ip_Real[7];
        Ip_8_Real = Ip_Real[8];
        Ip_9_Real = Ip_Real[9];
        Ip_10_Real = Ip_Real[10];
        Ip_11_Real = Ip_Real[11];
        Ip_12_Real = Ip_Real[12];
        Ip_13_Real = Ip_Real[13];
        Ip_14_Real = Ip_Real[14];
        Ip_15_Real = Ip_Real[15];
        Ip_16_Real = Ip_Real[16];
        Ip_17_Real = Ip_Real[17];
        Ip_18_Real = Ip_Real[18];
        Ip_19_Real = Ip_Real[19];
        Ip_20_Real = Ip_Real[20];
        Ip_21_Real = Ip_Real[21];
        Ip_22_Real = Ip_Real[22];
        Ip_23_Real = Ip_Real[23];
        Ip_24_Real = Ip_Real[24];
        Ip_25_Real = Ip_Real[25];
        Ip_26_Real = Ip_Real[26];
        Ip_27_Real = Ip_Real[27];
        Ip_28_Real = Ip_Real[28];
        Ip_29_Real = Ip_Real[29];
        Ip_30_Real = Ip_Real[30];
        Ip_31_Real = Ip_Real[31];
        Ip_32_Real = Ip_Real[32];
        Ip_33_Real = Ip_Real[33];
        Ip_34_Real = Ip_Real[34];
        Ip_35_Real = Ip_Real[35];
        Ip_36_Real = Ip_Real[36];
        Ip_37_Real = Ip_Real[37];
        Ip_38_Real = Ip_Real[38];
        Ip_39_Real = Ip_Real[39];
        Ip_40_Real = Ip_Real[40];
        Ip_41_Real = Ip_Real[41];
        Ip_42_Real = Ip_Real[42];
        Ip_43_Real = Ip_Real[43];
        Ip_44_Real = Ip_Real[44];
        Ip_45_Real = Ip_Real[45];
        Ip_46_Real = Ip_Real[46];
        Ip_47_Real = Ip_Real[47];
        Ip_48_Real = Ip_Real[48];
        Ip_49_Real = Ip_Real[49];
        Ip_50_Real = Ip_Real[50];
        Ip_51_Real = Ip_Real[51];
        Ip_52_Real = Ip_Real[52];
        Ip_53_Real = Ip_Real[53];
        Ip_54_Real = Ip_Real[54];
        Ip_55_Real = Ip_Real[55];
        Ip_56_Real = Ip_Real[56];
        Ip_57_Real = Ip_Real[57];
        Ip_58_Real = Ip_Real[58];
        Ip_59_Real = Ip_Real[59];
        Ip_60_Real = Ip_Real[60];
        Ip_61_Real = Ip_Real[61];
        Ip_62_Real = Ip_Real[62];
        Ip_63_Real = Ip_Real[63];

        // Imaginary inputs 0-63
        Ip_0_Img = Ip_Img[0];
        Ip_1_Img = Ip_Img[1];
        Ip_2_Img = Ip_Img[2];
        Ip_3_Img = Ip_Img[3];
        Ip_4_Img = Ip_Img[4];
        Ip_5_Img = Ip_Img[5];
        Ip_6_Img = Ip_Img[6];
        Ip_7_Img = Ip_Img[7];
        Ip_8_Img = Ip_Img[8];
        Ip_9_Img = Ip_Img[9];
        Ip_10_Img = Ip_Img[10];
        Ip_11_Img = Ip_Img[11];
        Ip_12_Img = Ip_Img[12];
        Ip_13_Img = Ip_Img[13];
        Ip_14_Img = Ip_Img[14];
        Ip_15_Img = Ip_Img[15];
        Ip_16_Img = Ip_Img[16];
        Ip_17_Img = Ip_Img[17];
        Ip_18_Img = Ip_Img[18];
        Ip_19_Img = Ip_Img[19];
        Ip_20_Img = Ip_Img[20];
        Ip_21_Img = Ip_Img[21];
        Ip_22_Img = Ip_Img[22];
        Ip_23_Img = Ip_Img[23];
        Ip_24_Img = Ip_Img[24];
        Ip_25_Img = Ip_Img[25];
        Ip_26_Img = Ip_Img[26];
        Ip_27_Img = Ip_Img[27];
        Ip_28_Img = Ip_Img[28];
        Ip_29_Img = Ip_Img[29];
        Ip_30_Img = Ip_Img[30];
        Ip_31_Img = Ip_Img[31];
        Ip_32_Img = Ip_Img[32];
        Ip_33_Img = Ip_Img[33];
        Ip_34_Img = Ip_Img[34];
        Ip_35_Img = Ip_Img[35];
        Ip_36_Img = Ip_Img[36];
        Ip_37_Img = Ip_Img[37];
        Ip_38_Img = Ip_Img[38];
        Ip_39_Img = Ip_Img[39];
        Ip_40_Img = Ip_Img[40];
        Ip_41_Img = Ip_Img[41];
        Ip_42_Img = Ip_Img[42];
        Ip_43_Img = Ip_Img[43];
        Ip_44_Img = Ip_Img[44];
        Ip_45_Img = Ip_Img[45];
        Ip_46_Img = Ip_Img[46];
        Ip_47_Img = Ip_Img[47];
        Ip_48_Img = Ip_Img[48];
        Ip_49_Img = Ip_Img[49];
        Ip_50_Img = Ip_Img[50];
        Ip_51_Img = Ip_Img[51];
        Ip_52_Img = Ip_Img[52];
        Ip_53_Img = Ip_Img[53];
        Ip_54_Img = Ip_Img[54];
        Ip_55_Img = Ip_Img[55];
        Ip_56_Img = Ip_Img[56];
        Ip_57_Img = Ip_Img[57];
        Ip_58_Img = Ip_Img[58];
        Ip_59_Img = Ip_Img[59];
        Ip_60_Img = Ip_Img[60];
        Ip_61_Img = Ip_Img[61];
        Ip_62_Img = Ip_Img[62];
        Ip_63_Img = Ip_Img[63];
    end

    // Collect output signals into arrays
    
        // Real outputs 0-63
        assign Op_Real[0] = Op_0_Real;
        assign Op_Real[1] = Op_1_Real;
        assign Op_Real[2] = Op_2_Real;
        assign Op_Real[3] = Op_3_Real;
        assign Op_Real[4] = Op_4_Real;
        assign Op_Real[5] = Op_5_Real;
        assign Op_Real[6] = Op_6_Real;
        assign Op_Real[7] = Op_7_Real;
        assign Op_Real[8] = Op_8_Real;
        assign Op_Real[9] = Op_9_Real;
        assign Op_Real[10] = Op_10_Real;
        assign Op_Real[11] = Op_11_Real;
        assign Op_Real[12] = Op_12_Real;
        assign Op_Real[13] = Op_13_Real;
        assign Op_Real[14] = Op_14_Real;
        assign Op_Real[15] = Op_15_Real;
        assign Op_Real[16] = Op_16_Real;
        assign Op_Real[17] = Op_17_Real;
        assign Op_Real[18] = Op_18_Real;
        assign Op_Real[19] = Op_19_Real;
        assign Op_Real[20] = Op_20_Real;
        assign Op_Real[21] = Op_21_Real;
        assign Op_Real[22] = Op_22_Real;
        assign Op_Real[23] = Op_23_Real;
        assign Op_Real[24] = Op_24_Real;
        assign Op_Real[25] = Op_25_Real;
        assign Op_Real[26] = Op_26_Real;
        assign Op_Real[27] = Op_27_Real;
        assign Op_Real[28] = Op_28_Real;
        assign Op_Real[29] = Op_29_Real;
        assign Op_Real[30] = Op_30_Real;
        assign Op_Real[31] = Op_31_Real;
        assign Op_Real[32] = Op_32_Real;
        assign Op_Real[33] = Op_33_Real;
        assign Op_Real[34] = Op_34_Real;
        assign Op_Real[35] = Op_35_Real;
        assign Op_Real[36] = Op_36_Real;
        assign Op_Real[37] = Op_37_Real;
        assign Op_Real[38] = Op_38_Real;
        assign Op_Real[39] = Op_39_Real;
        assign Op_Real[40] = Op_40_Real;
        assign Op_Real[41] = Op_41_Real;
        assign Op_Real[42] = Op_42_Real;
        assign Op_Real[43] = Op_43_Real;
        assign Op_Real[44] = Op_44_Real;
        assign Op_Real[45] = Op_45_Real;
        assign Op_Real[46] = Op_46_Real;
        assign Op_Real[47] = Op_47_Real;
        assign Op_Real[48] = Op_48_Real;
        assign Op_Real[49] = Op_49_Real;
        assign Op_Real[50] = Op_50_Real;
        assign Op_Real[51] = Op_51_Real;
        assign Op_Real[52] = Op_52_Real;
        assign Op_Real[53] = Op_53_Real;
        assign Op_Real[54] = Op_54_Real;
        assign Op_Real[55] = Op_55_Real;
        assign Op_Real[56] = Op_56_Real;
        assign Op_Real[57] = Op_57_Real;
        assign Op_Real[58] = Op_58_Real;
        assign Op_Real[59] = Op_59_Real;
        assign Op_Real[60] = Op_60_Real;
        assign Op_Real[61] = Op_61_Real;
        assign Op_Real[62] = Op_62_Real;
        assign Op_Real[63] = Op_63_Real;

        // Imaginary outputs 0-63
        assign Op_Img[0] = Op_0_Img;
        assign Op_Img[1] = Op_1_Img;
        assign Op_Img[2] = Op_2_Img;
        assign Op_Img[3] = Op_3_Img;
        assign Op_Img[4] = Op_4_Img;
        assign Op_Img[5] = Op_5_Img;
        assign Op_Img[6] = Op_6_Img;
        assign Op_Img[7] = Op_7_Img;
        assign Op_Img[8] = Op_8_Img;
        assign Op_Img[9] = Op_9_Img;
        assign Op_Img[10] = Op_10_Img;
        assign Op_Img[11] = Op_11_Img;
        assign Op_Img[12] = Op_12_Img;
        assign Op_Img[13] = Op_13_Img;
        assign Op_Img[14] = Op_14_Img;
        assign Op_Img[15] = Op_15_Img;
        assign Op_Img[16] = Op_16_Img;
        assign Op_Img[17] = Op_17_Img;
        assign Op_Img[18] = Op_18_Img;
        assign Op_Img[19] = Op_19_Img;
        assign Op_Img[20] = Op_20_Img;
        assign Op_Img[21] = Op_21_Img;
        assign Op_Img[22] = Op_22_Img;
        assign Op_Img[23] = Op_23_Img;
        assign Op_Img[24] = Op_24_Img;
        assign Op_Img[25] = Op_25_Img;
        assign Op_Img[26] = Op_26_Img;
        assign Op_Img[27] = Op_27_Img;
        assign Op_Img[28] = Op_28_Img;
        assign Op_Img[29] = Op_29_Img;
        assign Op_Img[30] = Op_30_Img;
        assign Op_Img[31] = Op_31_Img;
        assign Op_Img[32] = Op_32_Img;
        assign Op_Img[33] = Op_33_Img;
        assign Op_Img[34] = Op_34_Img;
        assign Op_Img[35] = Op_35_Img;
        assign Op_Img[36] = Op_36_Img;
        assign Op_Img[37] = Op_37_Img;
        assign Op_Img[38] = Op_38_Img;
        assign Op_Img[39] = Op_39_Img;
        assign Op_Img[40] = Op_40_Img;
        assign Op_Img[41] = Op_41_Img;
        assign Op_Img[42] = Op_42_Img;
        assign Op_Img[43] = Op_43_Img;
        assign Op_Img[44] = Op_44_Img;
        assign Op_Img[45] = Op_45_Img;
        assign Op_Img[46] = Op_46_Img;
        assign Op_Img[47] = Op_47_Img;
        assign Op_Img[48] = Op_48_Img;
        assign Op_Img[49] = Op_49_Img;
        assign Op_Img[50] = Op_50_Img;
        assign Op_Img[51] = Op_51_Img;
        assign Op_Img[52] = Op_52_Img;
        assign Op_Img[53] = Op_53_Img;
        assign Op_Img[54] = Op_54_Img;
        assign Op_Img[55] = Op_55_Img;
        assign Op_Img[56] = Op_56_Img;
        assign Op_Img[57] = Op_57_Img;
        assign Op_Img[58] = Op_58_Img;
        assign Op_Img[59] = Op_59_Img;
        assign Op_Img[60] = Op_60_Img;
        assign Op_Img[61] = Op_61_Img;
        assign Op_Img[62] = Op_62_Img;
        assign Op_Img[63] = Op_63_Img;
    
    
    // Main test procedure
    initial begin
        // Initialize all inputs
        rst = 1;
        for (i = 0; i < 64; i = i + 1) begin
            Ip_Real[i] = 0;
            Ip_Img[i] = 0;
        end
        
        // Apply reset and then release
        #20;
        rst = 0;
        #20;
        
        // Open files for input data and expected output
        input_file = $fopen("input_data_ieee754.txt", "r");
        if (input_file == 0) begin
            $display("Error: Could not open input_data.txt");
            $finish;
        end
        
        // Read input data
        for (i = 0; i < 64; i = i + 1) begin
            status = $fscanf(input_file, "%h %h", Ip_Real[i], Ip_Img[i]);
            if (status != 2) begin
                $display("Error reading input_data.txt at element %d", i);
                $display("Elements at %d is %h %h", i,Ip_Real[i], Ip_Img[i]);
                $finish;
            end
        end
        $fclose(input_file);
        
        // Wait for processing to complete (adjust timing as needed)
        #500;  // Allow enough clock cycles for processing
        
        // Open file for MATLAB-generated expected outputs
        input_file = $fopen("expected_output_ieee754.txt", "r");
        if (input_file == 0) begin
            $display("Error: Could not open expected_output.txt");
            $finish;
        end
        
        #1000;
        
        // Read expected outputs
        for (i = 0; i < 64; i = i + 1) begin
            status = $fscanf(input_file, "%h %h", output_matlab_real[i], output_matlab_img[i]);
            if (status != 2) begin
                $display("Error reading expected_output.txt at element %d", i);
                $display("Elements at %d is %h %h", i,output_matlab_real[i], output_matlab_img[i]);
                $finish;
            end
        end
        $fclose(input_file);
        
        // Open file to write actual hardware outputs
        output_file = $fopen("hw_output.txt", "w");
        if (output_file == 0) begin
            $display("Error: Could not open hw_output.txt for writing");
            $finish;
        end
        
        // Write hardware outputs to file
        for (i = 0; i < 64; i = i + 1) begin
            $fdisplay(output_file, "%h %h", Op_Real[i], Op_Img[i]);
        end
        $fclose(output_file);
        
        // Compare hardware output with expected MATLAB output
        for (i = 0; i < 64; i = i + 1) begin
            if ((Op_Real[i] != output_matlab_real[i]) || (Op_Img[i] != output_matlab_img[i])) begin
                $display("Mismatch at element %d: HW = (%d, %d), MATLAB = (%d, %d)", 
                         i, Op_Real[i], Op_Img[i], output_matlab_real[i], output_matlab_img[i]);
            end
        end
        
        $display("Simulation complete. Check hw_output.txt for hardware results.");
        $finish;
    end

    // Monitor for debugging
    initial begin
        $monitor("Time: %t, Reset: %b", $time, rst);
    end
endmodule