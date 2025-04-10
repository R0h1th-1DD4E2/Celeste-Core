`timescale 1ns / 1ps

module Register(
    input [31:0] in_0_R,in_0_I,in_1_R, in_1_I, in_2_R, in_2_I, in_3_R, in_3_I, in_4_R, in_4_I,
    input [31:0] in_5_R, in_5_I, in_6_R, in_6_I, in_7_R, in_7_I, in_8_R, in_8_I,
    input [31:0] in_9_R, in_9_I, in_10_R, in_10_I, in_11_R, in_11_I, in_12_R, in_12_I,
    input [31:0] in_13_R, in_13_I, in_14_R, in_14_I, in_15_R, in_15_I, in_16_R, in_16_I,
    input [31:0] in_17_R, in_17_I, in_18_R, in_18_I, in_19_R, in_19_I, in_20_R, in_20_I,
    input [31:0] in_21_R, in_21_I, in_22_R, in_22_I, in_23_R, in_23_I, in_24_R, in_24_I,
    input [31:0] in_25_R, in_25_I, in_26_R, in_26_I, in_27_R, in_27_I, in_28_R, in_28_I,
    input [31:0] in_29_R, in_29_I, in_30_R, in_30_I, in_31_R, in_31_I, in_32_R, in_32_I,
    input [31:0] in_33_R, in_33_I, in_34_R, in_34_I, in_35_R, in_35_I, in_36_R, in_36_I,
    input [31:0] in_37_R, in_37_I, in_38_R, in_38_I, in_39_R, in_39_I, in_40_R, in_40_I,
    input [31:0] in_41_R, in_41_I, in_42_R, in_42_I, in_43_R, in_43_I, in_44_R, in_44_I,
    input [31:0] in_45_R, in_45_I, in_46_R, in_46_I, in_47_R, in_47_I, in_48_R, in_48_I,
    input [31:0] in_49_R, in_49_I, in_50_R, in_50_I, in_51_R, in_51_I, in_52_R, in_52_I,  
    input [31:0] in_53_R, in_53_I, in_54_R, in_54_I, in_55_R, in_55_I, in_56_R, in_56_I,
    input [31:0] in_57_R, in_57_I, in_58_R, in_58_I, in_59_R, in_59_I, in_60_R, in_60_I,
    input [31:0] in_61_R, in_61_I, in_62_R, in_62_I, in_63_R, in_63_I,
    input clk, rst,
    output reg [31:0] out_0_R, out_0_I, out_1_R, out_1_I, out_2_R, out_2_I, out_3_R, out_3_I,
    output reg [31:0] out_4_R, out_4_I, out_5_R, out_5_I, out_6_R, out_6_I, out_7_R, out_7_I,
    output reg [31:0] out_8_R, out_8_I, out_9_R, out_9_I, out_10_R, out_10_I, out_11_R, out_11_I,
    output reg [31:0] out_12_R, out_12_I, out_13_R, out_13_I, out_14_R, out_14_I, out_15_R, out_15_I,
    output reg [31:0] out_16_R, out_16_I, out_17_R, out_17_I, out_18_R, out_18_I, out_19_R, out_19_I,
    output reg [31:0] out_20_R, out_20_I, out_21_R, out_21_I, out_22_R, out_22_I, out_23_R, out_23_I,
    output reg [31:0] out_24_R, out_24_I, out_25_R, out_25_I, out_26_R, out_26_I, out_27_R, out_27_I,
    output reg [31:0] out_28_R, out_28_I, out_29_R, out_29_I, out_30_R, out_30_I, out_31_R, out_31_I,
    output reg [31:0] out_32_R, out_32_I, out_33_R, out_33_I, out_34_R, out_34_I, out_35_R, out_35_I,
    output reg [31:0] out_36_R, out_36_I, out_37_R, out_37_I, out_38_R, out_38_I, out_39_R, out_39_I,
    output reg [31:0] out_40_R, out_40_I, out_41_R, out_41_I, out_42_R, out_42_I, out_43_R, out_43_I,
    output reg [31:0] out_44_R, out_44_I, out_45_R, out_45_I, out_46_R, out_46_I, out_47_R, out_47_I,
    output reg [31:0] out_48_R, out_48_I, out_49_R, out_49_I, out_50_R, out_50_I, out_51_R, out_51_I,
    output reg [31:0] out_52_R, out_52_I, out_53_R, out_53_I, out_54_R, out_54_I, out_55_R, out_55_I,
    output reg [31:0] out_56_R, out_56_I, out_57_R, out_57_I, out_58_R, out_58_I, out_59_R, out_59_I,
    output reg [31:0] out_60_R, out_60_I, out_61_R, out_61_I, out_62_R, out_62_I, out_63_R, out_63_I
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all outputs to 0
            {out_0_R, out_0_I, out_1_R, out_1_I, out_2_R, out_2_I, out_3_R, out_3_I,
             out_4_R, out_4_I, out_5_R, out_5_I, out_6_R, out_6_I, out_7_R, out_7_I,
             out_8_R, out_8_I, out_9_R, out_9_I, out_10_R, out_10_I, out_11_R, out_11_I,
             out_12_R, out_12_I, out_13_R, out_13_I, out_14_R, out_14_I, out_15_R, out_15_I,
             out_16_R, out_16_I, out_17_R, out_17_I, out_18_R, out_18_I, out_19_R, out_19_I,
             out_20_R, out_20_I, out_21_R, out_21_I, out_22_R, out_22_I, out_23_R, out_23_I,
             out_24_R, out_24_I, out_25_R, out_25_I, out_26_R, out_26_I, out_27_R, out_27_I,
             out_28_R, out_28_I, out_29_R, out_29_I, out_30_R, out_30_I, out_31_R, out_31_I,
             out_32_R, out_32_I, out_33_R, out_33_I, out_34_R, out_34_I, out_35_R, out_35_I,
             out_36_R, out_36_I, out_37_R, out_37_I, out_38_R, out_38_I, out_39_R, out_39_I,
             out_40_R, out_40_I, out_41_R, out_41_I, out_42_R, out_42_I, out_43_R, out_43_I,
             out_44_R, out_44_I, out_45_R, out_45_I, out_46_R, out_46_I, out_47_R, out_47_I,
             out_48_R, out_48_I, out_49_R, out_49_I, out_50_R, out_50_I, out_51_R, out_51_I,
             out_52_R, out_52_I, out_53_R, out_53_I, out_54_R, out_54_I, out_55_R, out_55_I,
             out_56_R, out_56_I, out_57_R, out_57_I, out_58_R, out_58_I, out_59_R, out_59_I,
             out_60_R, out_60_I, out_61_R, out_61_I, out_62_R, out_62_I, out_63_R, out_63_I} <= {256{32'b0}};
        end else begin
            // Assign inputs to outputs
            out_0_R <= in_1_R; out_0_I <= in_1_I;
            out_1_R <= in_2_R; out_1_I <= in_2_I;
            out_2_R <= in_3_R; out_2_I <= in_3_I;
            out_3_R <= in_4_R; out_3_I <= in_4_I;
            out_4_R <= in_5_R; out_4_I <= in_5_I;
            out_5_R <= in_6_R; out_5_I <= in_6_I;
            out_6_R <= in_7_R; out_6_I <= in_7_I;
            out_7_R <= in_8_R; out_7_I <= in_8_I;
            out_8_R <= in_9_R; out_8_I <= in_9_I;
            out_9_R <= in_10_R; out_9_I <= in_10_I;
            out_10_R <= in_11_R; out_10_I <= in_11_I;
            out_11_R <= in_12_R; out_11_I <= in_12_I;
            out_12_R <= in_13_R; out_12_I <= in_13_I;
            out_13_R <= in_14_R; out_13_I <= in_14_I;
            out_14_R <= in_15_R; out_14_I <= in_15_I;
            out_15_R <= in_16_R; out_15_I <= in_16_I;
            out_16_R <= in_17_R; out_16_I <= in_17_I;
            out_17_R <= in_18_R; out_17_I <= in_18_I;
            out_18_R <= in_19_R; out_18_I <= in_19_I;
            out_19_R <= in_20_R; out_19_I <= in_20_I;
            out_20_R <= in_21_R; out_20_I <= in_21_I;
            out_21_R <= in_22_R; out_21_I <= in_22_I;
            out_22_R <= in_23_R; out_22_I <= in_23_I;
            out_23_R <= in_24_R; out_23_I <= in_24_I;
            out_24_R <= in_25_R; out_24_I <= in_25_I;
            out_25_R <= in_26_R; out_25_I <= in_26_I;
            out_26_R <= in_27_R; out_26_I <= in_27_I;
            out_27_R <= in_28_R; out_27_I <= in_28_I;
            out_28_R <= in_29_R; out_28_I <= in_29_I;
            out_29_R <= in_30_R; out_29_I <= in_30_I;
            out_30_R <= in_31_R; out_30_I <= in_31_I;
            out_31_R <= in_32_R; out_31_I <= in_32_I;
            out_32_R <= in_33_R; out_32_I <= in_33_I;
            out_33_R <= in_34_R; out_33_I <= in_34_I;
            out_34_R <= in_35_R; out_34_I <= in_35_I;
            out_35_R <= in_36_R; out_35_I <= in_36_I;
            out_36_R <= in_37_R; out_36_I <= in_37_I;
            out_37_R <= in_38_R; out_37_I <= in_38_I;
            out_38_R <= in_39_R; out_38_I <= in_39_I;
            out_39_R <= in_40_R; out_39_I <= in_40_I;
            out_40_R <= in_41_R; out_40_I <= in_41_I;
            out_41_R <= in_42_R; out_41_I <= in_42_I;
            out_42_R <= in_43_R; out_42_I <= in_43_I;
            out_43_R <= in_44_R; out_43_I <= in_44_I;
            out_44_R <= in_45_R; out_44_I <= in_45_I;
            out_45_R <= in_46_R; out_45_I <= in_46_I;
            out_46_R <= in_47_R; out_46_I <= in_47_I;
            out_47_R <= in_48_R; out_47_I <= in_48_I;
            out_48_R <= in_49_R; out_48_I <= in_49_I;
            out_49_R <= in_50_R; out_49_I <= in_50_I;
            out_50_R <= in_51_R; out_50_I <= in_51_I;
            out_51_R <= in_52_R; out_51_I <= in_52_I;
            out_52_R <= in_53_R; out_52_I <= in_53_I;
            out_53_R <= in_54_R; out_53_I <= in_54_I;
            out_54_R <= in_55_R; out_54_I <= in_55_I;
            out_55_R <= in_56_R; out_55_I <= in_56_I;
            out_56_R <= in_57_R; out_56_I <= in_57_I;
            out_57_R <= in_58_R; out_57_I <= in_58_I;
            out_58_R <= in_59_R; out_58_I <= in_59_I;
            out_59_R <= in_60_R; out_59_I <= in_60_I;
            out_60_R <= in_61_R; out_60_I <= in_61_I;
            out_61_R <= in_62_R; out_61_I <= in_62_I;
            out_62_R <= in_63_R; out_62_I <= in_63_I;
            out_63_R <= in_63_R; out_63_I <= in_63_I;
        end
    end
endmodule
 