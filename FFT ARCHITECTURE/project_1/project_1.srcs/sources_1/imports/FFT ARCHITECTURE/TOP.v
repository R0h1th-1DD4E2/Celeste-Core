/**********************************************************************
 * Signal Reference Documentation
 *
 * Main Inputs:
 *   - Ip_0_R - Ip_63_R : Real components of the primary data inputs.
 *   - Ip_0_I - Ip_63_I : Imaginary components of the primary data inputs.
 *
 * Main Outputs:
 *   - Op_0_R - Op_63_R : Real components of the primary data outputs.
 *   - Op_0_I - Op_63_I : Imaginary components of the primary data outputs.
 *
 * Kernel Inputs:
 *   - ker_in_0_R - ker_in_63_R : Real components of the kernel inputs used in
 *                                spectral filtering.
 *   - ker_in_0_I - ker_in_63_I : Imaginary components of the kernel inputs.
 *                              (Often set to zero if the kernel is real-valued.)
 *
 * Register Buffers:
 *   1. Input Buffer (rg1):
 *       - rg1_0_real - rg1_63_real       : Real parts of the input data.
 *       - rg1_0_imaginary - rg1_63_imaginary: Imaginary parts of the input data.
 *
 *   2. Transpose Buffer (rg2):
 *       - rg2_0_real - rg2_63_real       : Real components after row-wise FFT.
 *       - rg2_0_imaginary - rg2_63_imaginary: Imaginary components after row-wise FFT.
 *
 *   3. Spectral Data Buffer (rg3):
 *       - rg3_0_real - rg3_63_real       : Real data from FFT (before kernel multiplication).
 *       - rg3_0_imaginary - rg3_63_imaginary: Imaginary data from FFT.
 *
 *   4. Filtered Frequency Buffer (rg4):
 *       - rg4_0_real - rg4_63_real       : Real parts after kernel (Gaussian) filtering.
 *       - rg4_0_imaginary - rg4_63_imaginary: Imaginary parts after filtering.
 *
 *   5. Transpose Buffer 2 (rg5):
 *       - rg5_0_real - rg5_63_real       : Real parts after column-IFFT, before final stage.
 *       - rg5_0_imaginary - rg5_63_imaginary: Imaginary parts before final processing.
 *
 * FFT/IFFT Outputs:
 *   - FFT Row Outputs:
 *       - FTR_0_real - FTR_63_real       : Real part of row-wise FFT output.
 *       - FTR_0_imaginary - FTR_63_imaginary: Imaginary part of row-wise FFT output.
 *
 *   - FFT Column Outputs:
 *       - FTC_0_real - FTC_63_real       : Real part of column-wise FFT output.
 *       - FTC_0_imaginary - FTC_63_imaginary: Imaginary part of column-wise FFT output.
 *
 *   - IFFT Row Outputs:
 *       - IFTR_0_real - IFTR_63_real      : Real part of row-wise IFFT output.
 *       - IFTR_0_imaginary - IFTR_63_imaginary: Imaginary part of row-wise IFFT output.
 *
 * Additional Notes:
 *   - The index ranges mentioned above are guidelines. Adjust the ranges or extend them
 *     as needed for your specific design.
 *
 **********************************************************************/

module TOP(
    input clk,
    input rst,
 
    input [31:0] Ip_0_Real, Ip_0_Img, Ip_1_Real, Ip_1_Img,
                 Ip_2_Real, Ip_2_Img, Ip_3_Real, Ip_3_Img,
                 Ip_4_Real, Ip_4_Img, Ip_5_Real, Ip_5_Img,
                 Ip_6_Real, Ip_6_Img, Ip_7_Real, Ip_7_Img,
                 Ip_8_Real, Ip_8_Img, Ip_9_Real, Ip_9_Img,
                 Ip_10_Real, Ip_10_Img, Ip_11_Real, Ip_11_Img,
                 Ip_12_Real, Ip_12_Img, Ip_13_Real, Ip_13_Img,
                 Ip_14_Real, Ip_14_Img, Ip_15_Real, Ip_15_Img,
                 Ip_16_Real, Ip_16_Img, Ip_17_Real, Ip_17_Img, 
                 Ip_18_Real, Ip_18_Img, Ip_19_Real, Ip_19_Img,
                 Ip_20_Real, Ip_20_Img, Ip_21_Real, Ip_21_Img,
                 Ip_22_Real, Ip_22_Img, Ip_23_Real, Ip_23_Img,
                 Ip_24_Real, Ip_24_Img, Ip_25_Real, Ip_25_Img,
                 Ip_26_Real, Ip_26_Img, Ip_27_Real, Ip_27_Img,
                 Ip_28_Real, Ip_28_Img, Ip_29_Real, Ip_29_Img,
                 Ip_30_Real, Ip_30_Img, Ip_31_Real, Ip_31_Img,
                 Ip_32_Real, Ip_32_Img, Ip_33_Real, Ip_33_Img,
                 Ip_34_Real, Ip_34_Img, Ip_35_Real, Ip_35_Img,
                 Ip_36_Real, Ip_36_Img, Ip_37_Real, Ip_37_Img,
                 Ip_38_Real, Ip_38_Img, Ip_39_Real, Ip_39_Img,
                 Ip_40_Real, Ip_40_Img, Ip_41_Real, Ip_41_Img,
                 Ip_42_Real, Ip_42_Img, Ip_43_Real, Ip_43_Img,
                 Ip_44_Real, Ip_44_Img, Ip_45_Real, Ip_45_Img,
                 Ip_46_Real, Ip_46_Img, Ip_47_Real, Ip_47_Img,
                 Ip_48_Real, Ip_48_Img, Ip_49_Real, Ip_49_Img,
                 Ip_50_Real, Ip_50_Img, Ip_51_Real, Ip_51_Img,
                 Ip_52_Real, Ip_52_Img, Ip_53_Real, Ip_53_Img,
                 Ip_54_Real, Ip_54_Img, Ip_55_Real, Ip_55_Img,
                 Ip_56_Real, Ip_56_Img, Ip_57_Real, Ip_57_Img,
                 Ip_58_Real, Ip_58_Img, Ip_59_Real, Ip_59_Img,
                 Ip_60_Real, Ip_60_Img, Ip_61_Real, Ip_61_Img,
                 Ip_62_Real, Ip_62_Img, Ip_63_Real, Ip_63_Img,

    output [31:0] Op_0_Real, Op_0_Img, Op_1_Real, Op_1_Img,
                  Op_2_Real, Op_2_Img, Op_3_Real, Op_3_Img,
                  Op_4_Real, Op_4_Img, Op_5_Real, Op_5_Img,
                  Op_6_Real, Op_6_Img, Op_7_Real, Op_7_Img,
                  Op_8_Real, Op_8_Img, Op_9_Real, Op_9_Img,
                  Op_10_Real, Op_10_Img, Op_11_Real, Op_11_Img,
                  Op_12_Real, Op_12_Img, Op_13_Real, Op_13_Img,
                  Op_14_Real, Op_14_Img, Op_15_Real, Op_15_Img,
                  Op_16_Real, Op_16_Img, Op_17_Real, Op_17_Img,
                  Op_18_Real, Op_18_Img, Op_19_Real, Op_19_Img,
                  Op_20_Real, Op_20_Img, Op_21_Real, Op_21_Img,
                  Op_22_Real, Op_22_Img, Op_23_Real, Op_23_Img,
                  Op_24_Real, Op_24_Img, Op_25_Real, Op_25_Img,
                  Op_26_Real, Op_26_Img, Op_27_Real, Op_27_Img,
                  Op_28_Real, Op_28_Img, Op_29_Real, Op_29_Img,
                  Op_30_Real, Op_30_Img, Op_31_Real, Op_31_Img,
                  Op_32_Real, Op_32_Img, Op_33_Real, Op_33_Img,
                  Op_34_Real, Op_34_Img, Op_35_Real, Op_35_Img,
                  Op_36_Real, Op_36_Img, Op_37_Real, Op_37_Img,
                  Op_38_Real, Op_38_Img, Op_39_Real, Op_39_Img,
                  Op_40_Real, Op_40_Img, Op_41_Real, Op_41_Img,
                  Op_42_Real, Op_42_Img, Op_43_Real, Op_43_Img,
                  Op_44_Real, Op_44_Img, Op_45_Real, Op_45_Img,
                  Op_46_Real, Op_46_Img, Op_47_Real, Op_47_Img,
                  Op_48_Real, Op_48_Img, Op_49_Real, Op_49_Img,
                  Op_50_Real, Op_50_Img, Op_51_Real, Op_51_Img,
                  Op_52_Real, Op_52_Img, Op_53_Real, Op_53_Img,
                  Op_54_Real, Op_54_Img, Op_55_Real, Op_55_Img,
                  Op_56_Real, Op_56_Img, Op_57_Real, Op_57_Img,
                  Op_58_Real, Op_58_Img, Op_59_Real, Op_59_Img,
                  Op_60_Real, Op_60_Img, Op_61_Real, Op_61_Img,
                  Op_62_Real, Op_62_Img, Op_63_Real, Op_63_Img

);

//FOR MAKING WRITING OF TESTBENCH-EASIER ,KERNEL CAN BE WRITTEN USING assign OR USING MODULE INP/OP
wire [31:0] ker_in_0_R, ker_in_0_I, ker_in_1_R, ker_in_1_I, ker_in_2_R, ker_in_2_I, ker_in_3_R, ker_in_3_I,
            ker_in_4_R, ker_in_4_I, ker_in_5_R, ker_in_5_I, ker_in_6_R, ker_in_6_I, ker_in_7_R, ker_in_7_I,
            ker_in_8_R, ker_in_8_I, ker_in_9_R, ker_in_9_I, ker_in_10_R, ker_in_10_I, ker_in_11_R, ker_in_11_I,
            ker_in_12_R, ker_in_12_I, ker_in_13_R, ker_in_13_I, ker_in_14_R, ker_in_14_I, ker_in_15_R, ker_in_15_I,
            ker_in_16_R, ker_in_16_I, ker_in_17_R, ker_in_17_I, ker_in_18_R, ker_in_18_I, ker_in_19_R, ker_in_19_I,
            ker_in_20_R, ker_in_20_I, ker_in_21_R, ker_in_21_I, ker_in_22_R, ker_in_22_I, ker_in_23_R, ker_in_23_I,
            ker_in_24_R, ker_in_24_I, ker_in_25_R, ker_in_25_I, ker_in_26_R, ker_in_26_I, ker_in_27_R, ker_in_27_I,
            ker_in_28_R, ker_in_28_I, ker_in_29_R, ker_in_29_I, ker_in_30_R, ker_in_30_I, ker_in_31_R, ker_in_31_I,
            ker_in_32_R, ker_in_32_I, ker_in_33_R, ker_in_33_I, ker_in_34_R, ker_in_34_I, ker_in_35_R, ker_in_35_I,
            ker_in_36_R, ker_in_36_I, ker_in_37_R, ker_in_37_I, ker_in_38_R, ker_in_38_I, ker_in_39_R, ker_in_39_I,
            ker_in_40_R, ker_in_40_I, ker_in_41_R, ker_in_41_I, ker_in_42_R, ker_in_42_I, ker_in_43_R, ker_in_43_I,
            ker_in_44_R, ker_in_44_I, ker_in_45_R, ker_in_45_I, ker_in_46_R, ker_in_46_I, ker_in_47_R, ker_in_47_I,
            ker_in_48_R, ker_in_48_I, ker_in_49_R, ker_in_49_I, ker_in_50_R, ker_in_50_I, ker_in_51_R, ker_in_51_I,
            ker_in_52_R, ker_in_52_I, ker_in_53_R, ker_in_53_I, ker_in_54_R, ker_in_54_I, ker_in_55_R, ker_in_55_I,
            ker_in_56_R, ker_in_56_I, ker_in_57_R, ker_in_57_I, ker_in_58_R, ker_in_58_I, ker_in_59_R, ker_in_59_I,
            ker_in_60_R, ker_in_60_I, ker_in_61_R, ker_in_61_I, ker_in_62_R, ker_in_62_I, ker_in_63_R, ker_in_63_I;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUASSIAN KERNAL IEEE 754
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign ker_in_0_R  = 32'h3951b717, ker_in_1_R  = 32'h399d4952, ker_in_2_R  = 32'h3a03126f, ker_in_3_R  = 32'h3b2a64c3,
    ker_in_4_R  = 32'hbc7765fe, ker_in_5_R  = 32'h3b2a64c3, ker_in_6_R  = 32'h3a03126f, ker_in_7_R  = 32'h399d4952;

assign ker_in_8_R  = 32'h399d4952, ker_in_9_R  = 32'h399d4952, ker_in_10_R = 32'h3a1d4952, ker_in_11_R = 32'h3b4b295f,
    ker_in_12_R = 32'hbc91d14e, ker_in_13_R = 32'h3b4b295f, ker_in_14_R = 32'h3a1d4952, ker_in_15_R = 32'h399d4952;

assign ker_in_16_R = 32'h3a03126f, ker_in_17_R = 32'h3a1d4952, ker_in_18_R = 32'h3a83126f, ker_in_19_R = 32'h3bb0f27c,
    ker_in_20_R = 32'hbcfec56d, ker_in_21_R = 32'h3bb0f27c, ker_in_22_R = 32'h3a83126f, ker_in_23_R = 32'h3a1d4952;

assign ker_in_24_R = 32'h3b2a64c3, ker_in_25_R = 32'h3b4b295f, ker_in_26_R = 32'h3bb0f27c, ker_in_27_R = 32'h3cf9db23,
    ker_in_28_R = 32'hbe32e48f, ker_in_29_R = 32'h3cf9db23, ker_in_30_R = 32'h3bb0f27c, ker_in_31_R = 32'h3b4b295f;

assign ker_in_32_R = 32'hbc7765fe, ker_in_33_R = 32'hbc91d14e, ker_in_34_R = 32'hbcfec56d, ker_in_35_R = 32'hbe32e48f,
    ker_in_36_R = 32'h3f800000, ker_in_37_R = 32'hbe32e48f, ker_in_38_R = 32'hbcfec56d, ker_in_39_R = 32'hbc91d14e;

assign ker_in_40_R = 32'h3b2a64c3, ker_in_41_R = 32'h3b4b295f, ker_in_42_R = 32'h3bb0f27c, ker_in_43_R = 32'h3cf9db23,
    ker_in_44_R = 32'hbe32e48f, ker_in_45_R = 32'h3cf9db23, ker_in_46_R = 32'h3bb0f27c, ker_in_47_R = 32'h3b4b295f;

assign ker_in_48_R = 32'h3a03126f, ker_in_49_R = 32'h3a1d4952, ker_in_50_R = 32'h3a83126f, ker_in_51_R = 32'h3bb0f27c,
    ker_in_52_R = 32'hbcfec56d, ker_in_53_R = 32'h3bb0f27c, ker_in_54_R = 32'h3a83126f, ker_in_55_R = 32'h3a1d4952;

assign ker_in_56_R = 32'h399d4952, ker_in_57_R = 32'h399d4952, ker_in_58_R = 32'h3a1d4952, ker_in_59_R = 32'h3b4b295f,
    ker_in_60_R = 32'hbc91d14e, ker_in_61_R = 32'h3b4b295f, ker_in_62_R = 32'h3a1d4952, ker_in_63_R = 32'h399d4952;

assign ker_in_0_I = 32'h0, ker_in_1_I = 32'h0, ker_in_2_I = 32'h0, ker_in_3_I = 32'h0,
    ker_in_4_I = 32'h0, ker_in_5_I = 32'h0, ker_in_6_I = 32'h0, ker_in_7_I = 32'h0;

assign ker_in_8_I = 32'h0, ker_in_9_I = 32'h0, ker_in_10_I = 32'h0, ker_in_11_I = 32'h0,
    ker_in_12_I = 32'h0, ker_in_13_I = 32'h0, ker_in_14_I = 32'h0, ker_in_15_I = 32'h0;

assign ker_in_16_I = 32'h0, ker_in_17_I = 32'h0, ker_in_18_I = 32'h0, ker_in_19_I = 32'h0,
    ker_in_20_I = 32'h0, ker_in_21_I = 32'h0, ker_in_22_I = 32'h0, ker_in_23_I = 32'h0;

assign ker_in_24_I = 32'h0, ker_in_25_I = 32'h0, ker_in_26_I = 32'h0, ker_in_27_I = 32'h0,
    ker_in_28_I = 32'h0, ker_in_29_I = 32'h0, ker_in_30_I = 32'h0, ker_in_31_I = 32'h0;

assign ker_in_32_I = 32'h0, ker_in_33_I = 32'h0, ker_in_34_I = 32'h0, ker_in_35_I = 32'h0,
    ker_in_36_I = 32'h0, ker_in_37_I = 32'h0, ker_in_38_I = 32'h0, ker_in_39_I = 32'h0;

assign ker_in_40_I = 32'h0, ker_in_41_I = 32'h0, ker_in_42_I = 32'h0, ker_in_43_I = 32'h0,
    ker_in_44_I = 32'h0, ker_in_45_I = 32'h0, ker_in_46_I = 32'h0, ker_in_47_I = 32'h0;

assign ker_in_48_I = 32'h0, ker_in_49_I = 32'h0, ker_in_50_I = 32'h0, ker_in_51_I = 32'h0,
    ker_in_52_I = 32'h0, ker_in_53_I = 32'h0, ker_in_54_I = 32'h0, ker_in_55_I = 32'h0;

assign ker_in_56_I = 32'h0, ker_in_57_I = 32'h0, ker_in_58_I = 32'h0, ker_in_59_I = 32'h0,
    ker_in_60_I = 32'h0, ker_in_61_I = 32'h0, ker_in_62_I = 32'h0, ker_in_63_I = 32'h0;

wire [31:0] rg1_0_R, rg1_0_I, rg1_1_R, rg1_1_I, rg1_2_R, rg1_2_I, rg1_3_R, rg1_3_I, rg1_4_R, rg1_4_I, rg1_5_R, rg1_5_I, rg1_6_R, rg1_6_I, rg1_7_R, rg1_7_I,
                rg1_8_R, rg1_8_I, rg1_9_R, rg1_9_I, rg1_10_R, rg1_10_I, rg1_11_R, rg1_11_I, rg1_12_R, rg1_12_I, rg1_13_R, rg1_13_I, rg1_14_R, rg1_14_I, rg1_15_R, rg1_15_I, rg1_16_R, rg1_16_I,
                rg1_17_R, rg1_17_I, rg1_18_R, rg1_18_I, rg1_19_R, rg1_19_I, rg1_20_R, rg1_20_I, rg1_21_R, rg1_21_I, rg1_22_R, rg1_22_I, rg1_23_R, rg1_23_I, rg1_24_R, rg1_24_I,
                rg1_25_R, rg1_25_I, rg1_26_R, rg1_26_I, rg1_27_R, rg1_27_I, rg1_28_R, rg1_28_I, rg1_29_R, rg1_29_I, rg1_30_R, rg1_30_I, rg1_31_R, rg1_31_I, rg1_32_R, rg1_32_I,
                rg1_33_R, rg1_33_I, rg1_34_R, rg1_34_I, rg1_35_R, rg1_35_I, rg1_36_R, rg1_36_I, rg1_37_R, rg1_37_I, rg1_38_R, rg1_38_I, rg1_39_R, rg1_39_I, rg1_40_R, rg1_40_I,
                rg1_41_R, rg1_41_I, rg1_42_R, rg1_42_I, rg1_43_R, rg1_43_I, rg1_44_R, rg1_44_I, rg1_45_R, rg1_45_I, rg1_46_R, rg1_46_I, rg1_47_R, rg1_47_I, rg1_48_R, rg1_48_I,
                rg1_49_R, rg1_49_I, rg1_50_R, rg1_50_I, rg1_51_R, rg1_51_I, rg1_52_R, rg1_52_I, rg1_53_R, rg1_53_I, rg1_54_R, rg1_54_I, rg1_55_R, rg1_55_I, rg1_56_R, rg1_56_I,
                rg1_57_R, rg1_57_I, rg1_58_R, rg1_58_I, rg1_59_R, rg1_59_I, rg1_60_R, rg1_60_I, rg1_61_R, rg1_61_I, rg1_62_R, rg1_62_I, rg1_63_R, rg1_63_I;

Register InputBuffer_rg1(
    .clk(clk),
    .rst(rst),
    .in_0_R(Ip_0_Real), .in_0_I(Ip_0_Img), .in_1_R(Ip_1_Real), .in_1_I(Ip_1_Img),
    .in_2_R(Ip_2_Real), .in_2_I(Ip_2_Img), .in_3_R(Ip_3_Real), .in_3_I(Ip_3_Img),
    .in_4_R(Ip_4_Real), .in_4_I(Ip_4_Img), .in_5_R(Ip_5_Real), .in_5_I(Ip_5_Img),
    .in_6_R(Ip_6_Real), .in_6_I(Ip_6_Img), .in_7_R(Ip_7_Real), .in_7_I(Ip_7_Img),
    .in_8_R(Ip_8_Real), .in_8_I(Ip_8_Img), .in_9_R(Ip_9_Real), .in_9_I(Ip_9_Img),
    .in_10_R(Ip_10_Real), .in_10_I(Ip_10_Img), .in_11_R(Ip_11_Real), .in_11_I(Ip_11_Img),
    .in_12_R(Ip_12_Real), .in_12_I(Ip_12_Img), .in_13_R(Ip_13_Real), .in_13_I(Ip_13_Img),
    .in_14_R(Ip_14_Real), .in_14_I(Ip_14_Img), .in_15_R(Ip_15_Real), .in_15_I(Ip_15_Img),
    .in_16_R(Ip_16_Real), .in_16_I(Ip_16_Img), .in_17_R(Ip_17_Real), .in_17_I(Ip_17_Img),
    .in_18_R(Ip_18_Real), .in_18_I(Ip_18_Img), .in_19_R(Ip_19_Real), .in_19_I(Ip_19_Img),
    .in_20_R(Ip_20_Real), .in_20_I(Ip_20_Img), .in_21_R(Ip_21_Real), .in_21_I(Ip_21_Img),
    .in_22_R(Ip_22_Real), .in_22_I(Ip_22_Img), .in_23_R(Ip_23_Real), .in_23_I(Ip_23_Img),
    .in_24_R(Ip_24_Real), .in_24_I(Ip_24_Img), .in_25_R(Ip_25_Real), .in_25_I(Ip_25_Img),
    .in_26_R(Ip_26_Real), .in_26_I(Ip_26_Img), .in_27_R(Ip_27_Real), .in_27_I(Ip_27_Img),
    .in_28_R(Ip_28_Real), .in_28_I(Ip_28_Img), .in_29_R(Ip_29_Real), .in_29_I(Ip_29_Img),
    .in_30_R(Ip_30_Real), .in_30_I(Ip_30_Img), .in_31_R(Ip_31_Real), .in_31_I(Ip_31_Img),
    .in_32_R(Ip_32_Real), .in_32_I(Ip_32_Img), .in_33_R(Ip_33_Real), .in_33_I(Ip_33_Img),
    .in_34_R(Ip_34_Real), .in_34_I(Ip_34_Img), .in_35_R(Ip_35_Real), .in_35_I(Ip_35_Img),
    .in_36_R(Ip_36_Real), .in_36_I(Ip_36_Img), .in_37_R(Ip_37_Real), .in_37_I(Ip_37_Img),
    .in_38_R(Ip_38_Real), .in_38_I(Ip_38_Img), .in_39_R(Ip_39_Real), .in_39_I(Ip_39_Img),
    .in_40_R(Ip_40_Real), .in_40_I(Ip_40_Img), .in_41_R(Ip_41_Real), .in_41_I(Ip_41_Img),
    .in_42_R(Ip_42_Real), .in_42_I(Ip_42_Img), .in_43_R(Ip_43_Real), .in_43_I(Ip_43_Img),
    .in_44_R(Ip_44_Real), .in_44_I(Ip_44_Img), .in_45_R(Ip_45_Real), .in_45_I(Ip_45_Img),
    .in_46_R(Ip_46_Real), .in_46_I(Ip_46_Img), .in_47_R(Ip_47_Real), .in_47_I(Ip_47_Img),
    .in_48_R(Ip_48_Real), .in_48_I(Ip_48_Img), .in_49_R(Ip_49_Real), .in_49_I(Ip_49_Img),
    .in_50_R(Ip_50_Real), .in_50_I(Ip_50_Img), .in_51_R(Ip_51_Real), .in_51_I(Ip_51_Img),
    .in_52_R(Ip_52_Real), .in_52_I(Ip_52_Img), .in_53_R(Ip_53_Real), .in_53_I(Ip_53_Img),
    .in_54_R(Ip_54_Real), .in_54_I(Ip_54_Img), .in_55_R(Ip_55_Real), .in_55_I(Ip_55_Img),
    .in_56_R(Ip_56_Real), .in_56_I(Ip_56_Img), .in_57_R(Ip_57_Real), .in_57_I(Ip_57_Img),
    .in_58_R(Ip_58_Real), .in_58_I(Ip_58_Img), .in_59_R(Ip_59_Real), .in_59_I(Ip_59_Img),
    .in_60_R(Ip_60_Real), .in_60_I(Ip_60_Img), .in_61_R(Ip_61_Real), .in_61_I(Ip_61_Img),
    .in_62_R(Ip_62_Real), .in_62_I(Ip_62_Img), .in_63_R(Ip_63_Real), .in_63_I(Ip_63_Img),

    .out_0_R(rg1_0_R), .out_0_I(rg1_0_I), .out_1_R(rg1_1_R), .out_1_I(rg1_1_I),
    .out_2_R(rg1_2_R), .out_2_I(rg1_2_I), .out_3_R(rg1_3_R), .out_3_I(rg1_3_I),
    .out_4_R(rg1_4_R), .out_4_I(rg1_4_I), .out_5_R(rg1_5_R), .out_5_I(rg1_5_I),
    .out_6_R(rg1_6_R), .out_6_I(rg1_6_I), .out_7_R(rg1_7_R), .out_7_I(rg1_7_I),
    .out_8_R(rg1_8_R), .out_8_I(rg1_8_I), .out_9_R(rg1_9_R), .out_9_I(rg1_9_I),
    .out_10_R(rg1_10_R), .out_10_I(rg1_10_I), .out_11_R(rg1_11_R), .out_11_I(rg1_11_I),
    .out_12_R(rg1_12_R), .out_12_I(rg1_12_I), .out_13_R(rg1_13_R), .out_13_I(rg1_13_I),
    .out_14_R(rg1_14_R), .out_14_I(rg1_14_I), .out_15_R(rg1_15_R), .out_15_I(rg1_15_I),
    .out_16_R(rg1_16_R), .out_16_I(rg1_16_I), .out_17_R(rg1_17_R), .out_17_I(rg1_17_I),
    .out_18_R(rg1_18_R), .out_18_I(rg1_18_I), .out_19_R(rg1_19_R), .out_19_I(rg1_19_I),
    .out_20_R(rg1_20_R), .out_20_I(rg1_20_I), .out_21_R(rg1_21_R), .out_21_I(rg1_21_I),
    .out_22_R(rg1_22_R), .out_22_I(rg1_22_I), .out_23_R(rg1_23_R), .out_23_I(rg1_23_I),
    .out_24_R(rg1_24_R), .out_24_I(rg1_24_I), .out_25_R(rg1_25_R), .out_25_I(rg1_25_I),
    .out_26_R(rg1_26_R), .out_26_I(rg1_26_I), .out_27_R(rg1_27_R), .out_27_I(rg1_27_I),
    .out_28_R(rg1_28_R), .out_28_I(rg1_28_I), .out_29_R(rg1_29_R), .out_29_I(rg1_29_I),
    .out_30_R(rg1_30_R), .out_30_I(rg1_30_I), .out_31_R(rg1_31_R), .out_31_I(rg1_31_I),
    .out_32_R(rg1_32_R), .out_32_I(rg1_32_I), .out_33_R(rg1_33_R), .out_33_I(rg1_33_I),
    .out_34_R(rg1_34_R), .out_34_I(rg1_34_I), .out_35_R(rg1_35_R), .out_35_I(rg1_35_I),
    .out_36_R(rg1_36_R), .out_36_I(rg1_36_I), .out_37_R(rg1_37_R), .out_37_I(rg1_37_I),
    .out_38_R(rg1_38_R), .out_38_I(rg1_38_I), .out_39_R(rg1_39_R), .out_39_I(rg1_39_I),
    .out_40_R(rg1_40_R), .out_40_I(rg1_40_I), .out_41_R(rg1_41_R), .out_41_I(rg1_41_I),
    .out_42_R(rg1_42_R), .out_42_I(rg1_42_I), .out_43_R(rg1_43_R), .out_43_I(rg1_43_I),
    .out_44_R(rg1_44_R), .out_44_I(rg1_44_I), .out_45_R(rg1_45_R), .out_45_I(rg1_45_I),
    .out_46_R(rg1_46_R), .out_46_I(rg1_46_I), .out_47_R(rg1_47_R), .out_47_I(rg1_47_I),
    .out_48_R(rg1_48_R), .out_48_I(rg1_48_I), .out_49_R(rg1_49_R), .out_49_I(rg1_49_I),
    .out_50_R(rg1_50_R), .out_50_I(rg1_50_I), .out_51_R(rg1_51_R), .out_51_I(rg1_51_I),
    .out_52_R(rg1_52_R), .out_52_I(rg1_52_I), .out_53_R(rg1_53_R), .out_53_I(rg1_53_I),
    .out_54_R(rg1_54_R), .out_54_I(rg1_54_I), .out_55_R(rg1_55_R), .out_55_I(rg1_55_I),
    .out_56_R(rg1_56_R), .out_56_I(rg1_56_I), .out_57_R(rg1_57_R), .out_57_I(rg1_57_I),
    .out_58_R(rg1_58_R), .out_58_I(rg1_58_I), .out_59_R(rg1_59_R), .out_59_I(rg1_59_I),
    .out_60_R(rg1_60_R), .out_60_I(rg1_60_I), .out_61_R(rg1_61_R), .out_61_I(rg1_61_I),
    .out_62_R(rg1_62_R), .out_62_I(rg1_62_I), .out_63_R(rg1_63_R), .out_63_I(rg1_63_I)
);

   wire [31:0] ftr_0_R, ftr_0_I, ftr_1_R, ftr_1_I, ftr_2_R, ftr_2_I, ftr_3_R, ftr_3_I,
            ftr_4_R, ftr_4_I, ftr_5_R, ftr_5_I, ftr_6_R, ftr_6_I, ftr_7_R, ftr_7_I,
            ftr_8_R, ftr_8_I, ftr_9_R, ftr_9_I, ftr_10_R, ftr_10_I, ftr_11_R, ftr_11_I,
            ftr_12_R, ftr_12_I, ftr_13_R, ftr_13_I, ftr_14_R, ftr_14_I, ftr_15_R, ftr_15_I,
            ftr_16_R, ftr_16_I, ftr_17_R, ftr_17_I, ftr_18_R, ftr_18_I, ftr_19_R, ftr_19_I,
            ftr_20_R, ftr_20_I, ftr_21_R, ftr_21_I, ftr_22_R, ftr_22_I, ftr_23_R, ftr_23_I,
            ftr_24_R, ftr_24_I, ftr_25_R, ftr_25_I, ftr_26_R, ftr_26_I, ftr_27_R, ftr_27_I,
            ftr_28_R, ftr_28_I, ftr_29_R, ftr_29_I, ftr_30_R, ftr_30_I, ftr_31_R, ftr_31_I,
            ftr_32_R, ftr_32_I, ftr_33_R, ftr_33_I, ftr_34_R, ftr_34_I, ftr_35_R, ftr_35_I,
            ftr_36_R, ftr_36_I, ftr_37_R, ftr_37_I, ftr_38_R, ftr_38_I, ftr_39_R, ftr_39_I,
            ftr_40_R, ftr_40_I, ftr_41_R, ftr_41_I, ftr_42_R, ftr_42_I, ftr_43_R, ftr_43_I,
            ftr_44_R, ftr_44_I, ftr_45_R, ftr_45_I, ftr_46_R, ftr_46_I, ftr_47_R, ftr_47_I,
            ftr_48_R, ftr_48_I, ftr_49_R, ftr_49_I, ftr_50_R, ftr_50_I, ftr_51_R, ftr_51_I,
            ftr_52_R, ftr_52_I, ftr_53_R, ftr_53_I, ftr_54_R, ftr_54_I, ftr_55_R, ftr_55_I,
            ftr_56_R, ftr_56_I, ftr_57_R, ftr_57_I, ftr_58_R, ftr_58_I, ftr_59_R, ftr_59_I,
            ftr_60_R, ftr_60_I, ftr_61_R, ftr_61_I, ftr_62_R, ftr_62_I, ftr_63_R, ftr_63_I;

    fft8pt fft_row_0(
        .xr0(rg1_0_R), .xi0(rg1_0_I), .xr1(rg1_1_R), .xi1(rg1_1_I), .xr2(rg1_2_R), .xi2(rg1_2_I), .xr3(rg1_3_R), .xi3(rg1_3_I),
        .xr4(rg1_4_R), .xi4(rg1_4_I), .xr5(rg1_5_R), .xi5(rg1_5_I), .xr6(rg1_6_R), .xi6(rg1_6_I), .xr7(rg1_7_R), .xi7(rg1_7_I),
        .Xr0(ftr_0_R), .Xi0(ftr_0_I), .Xr1(ftr_1_R), .Xi1(ftr_1_I), .Xr2(ftr_2_R), .Xi2(ftr_2_I), .Xr3(ftr_3_R), .Xi3(ftr_3_I),
        .Xr4(ftr_4_R), .Xi4(ftr_4_I), .Xr5(ftr_5_R), .Xi5(ftr_5_I), .Xr6(ftr_6_R), .Xi6(ftr_6_I), .Xr7(ftr_7_R), .Xi7(ftr_7_I)
    );

    fft8pt fft_row_1(
        .xr0(rg1_8_R), .xi0(rg1_8_I), .xr1(rg1_9_R), .xi1(rg1_9_I), .xr2(rg1_10_R), .xi2(rg1_10_I), .xr3(rg1_11_R), .xi3(rg1_11_I),
        .xr4(rg1_12_R), .xi4(rg1_12_I), .xr5(rg1_13_R), .xi5(rg1_13_I), .xr6(rg1_14_R), .xi6(rg1_14_I), .xr7(rg1_15_R), .xi7(rg1_15_I),
        .Xr0(ftr_8_R), .Xi0(ftr_8_I), .Xr1(ftr_9_R), .Xi1(ftr_9_I), .Xr2(ftr_10_R), .Xi2(ftr_10_I), .Xr3(ftr_11_R), .Xi3(ftr_11_I),
        .Xr4(ftr_12_R), .Xi4(ftr_12_I), .Xr5(ftr_13_R), .Xi5(ftr_13_I), .Xr6(ftr_14_R), .Xi6(ftr_14_I), .Xr7(ftr_15_R), .Xi7(ftr_15_I)
    );

    fft8pt fft_row_2(
        .xr0(rg1_16_R), .xi0(rg1_16_I), .xr1(rg1_17_R), .xi1(rg1_17_I), .xr2(rg1_18_R), .xi2(rg1_18_I), .xr3(rg1_19_R), .xi3(rg1_19_I),
        .xr4(rg1_20_R), .xi4(rg1_20_I), .xr5(rg1_21_R), .xi5(rg1_21_I), .xr6(rg1_22_R), .xi6(rg1_22_I), .xr7(rg1_23_R), .xi7(rg1_23_I),
        .Xr0(ftr_16_R), .Xi0(ftr_16_I), .Xr1(ftr_17_R), .Xi1(ftr_17_I), .Xr2(ftr_18_R), .Xi2(ftr_18_I), .Xr3(ftr_19_R), .Xi3(ftr_19_I),
        .Xr4(ftr_20_R), .Xi4(ftr_20_I), .Xr5(ftr_21_R), .Xi5(ftr_21_I), .Xr6(ftr_22_R), .Xi6(ftr_22_I), .Xr7(ftr_23_R), .Xi7(ftr_23_I)
    );

    fft8pt fft_row_3(
        .xr0(rg1_24_R), .xi0(rg1_24_I), .xr1(rg1_25_R), .xi1(rg1_25_I), .xr2(rg1_26_R), .xi2(rg1_26_I), .xr3(rg1_27_R), .xi3(rg1_27_I),
        .xr4(rg1_28_R), .xi4(rg1_28_I), .xr5(rg1_29_R), .xi5(rg1_29_I), .xr6(rg1_30_R), .xi6(rg1_30_I), .xr7(rg1_31_R), .xi7(rg1_31_I),
        .Xr0(ftr_24_R), .Xi0(ftr_24_I), .Xr1(ftr_25_R), .Xi1(ftr_25_I), .Xr2(ftr_26_R), .Xi2(ftr_26_I), .Xr3(ftr_27_R), .Xi3(ftr_27_I),
        .Xr4(ftr_28_R), .Xi4(ftr_28_I), .Xr5(ftr_29_R), .Xi5(ftr_29_I), .Xr6(ftr_30_R), .Xi6(ftr_30_I), .Xr7(ftr_31_R), .Xi7(ftr_31_I)
    );

    fft8pt fft_row_4(
        .xr0(rg1_32_R), .xi0(rg1_32_I), .xr1(rg1_33_R), .xi1(rg1_33_I), .xr2(rg1_34_R), .xi2(rg1_34_I), .xr3(rg1_35_R), .xi3(rg1_35_I),
        .xr4(rg1_36_R), .xi4(rg1_36_I), .xr5(rg1_37_R), .xi5(rg1_37_I), .xr6(rg1_38_R), .xi6(rg1_38_I), .xr7(rg1_39_R), .xi7(rg1_39_I),
        .Xr0(ftr_32_R), .Xi0(ftr_32_I), .Xr1(ftr_33_R), .Xi1(ftr_33_I), .Xr2(ftr_34_R), .Xi2(ftr_34_I), .Xr3(ftr_35_R), .Xi3(ftr_35_I),
        .Xr4(ftr_36_R), .Xi4(ftr_36_I), .Xr5(ftr_37_R), .Xi5(ftr_37_I), .Xr6(ftr_38_R), .Xi6(ftr_38_I), .Xr7(ftr_39_R), .Xi7(ftr_39_I)
    );

    fft8pt fft_row_5(
        .xr0(rg1_40_R), .xi0(rg1_40_I), .xr1(rg1_41_R), .xi1(rg1_41_I), .xr2(rg1_42_R), .xi2(rg1_42_I), .xr3(rg1_43_R), .xi3(rg1_43_I),
        .xr4(rg1_44_R), .xi4(rg1_44_I), .xr5(rg1_45_R), .xi5(rg1_45_I), .xr6(rg1_46_R), .xi6(rg1_46_I), .xr7(rg1_47_R), .xi7(rg1_47_I),
        .Xr0(ftr_40_R), .Xi0(ftr_40_I), .Xr1(ftr_41_R), .Xi1(ftr_41_I), .Xr2(ftr_42_R), .Xi2(ftr_42_I), .Xr3(ftr_43_R), .Xi3(ftr_43_I),
        .Xr4(ftr_44_R), .Xi4(ftr_44_I), .Xr5(ftr_45_R), .Xi5(ftr_45_I), .Xr6(ftr_46_R), .Xi6(ftr_46_I), .Xr7(ftr_47_R), .Xi7(ftr_47_I)
    );

    fft8pt fft_row_6(
        .xr0(rg1_48_R), .xi0(rg1_48_I), .xr1(rg1_49_R), .xi1(rg1_49_I), .xr2(rg1_50_R), .xi2(rg1_50_I), .xr3(rg1_51_R), .xi3(rg1_51_I),
        .xr4(rg1_52_R), .xi4(rg1_52_I), .xr5(rg1_53_R), .xi5(rg1_53_I), .xr6(rg1_54_R), .xi6(rg1_54_I), .xr7(rg1_55_R), .xi7(rg1_55_I),
        .Xr0(ftr_48_R), .Xi0(ftr_48_I), .Xr1(ftr_49_R), .Xi1(ftr_49_I), .Xr2(ftr_50_R), .Xi2(ftr_50_I), .Xr3(ftr_51_R), .Xi3(ftr_51_I),
        .Xr4(ftr_52_R), .Xi4(ftr_52_I), .Xr5(ftr_53_R), .Xi5(ftr_53_I), .Xr6(ftr_54_R), .Xi6(ftr_54_I), .Xr7(ftr_55_R), .Xi7(ftr_55_I)
    );

    fft8pt fft_row_7(
        .xr0(rg1_56_R), .xi0(rg1_56_I), .xr1(rg1_57_R), .xi1(rg1_57_I), .xr2(rg1_58_R), .xi2(rg1_58_I), .xr3(rg1_59_R), .xi3(rg1_59_I),
        .xr4(rg1_60_R), .xi4(rg1_60_I), .xr5(rg1_61_R), .xi5(rg1_61_I), .xr6(rg1_62_R), .xi6(rg1_62_I), .xr7(rg1_63_R), .xi7(rg1_63_I),
        .Xr0(ftr_56_R), .Xi0(ftr_56_I), .Xr1(ftr_57_R), .Xi1(ftr_57_I), .Xr2(ftr_58_R), .Xi2(ftr_58_I), .Xr3(ftr_59_R), .Xi3(ftr_59_I),
        .Xr4(ftr_60_R), .Xi4(ftr_60_I), .Xr5(ftr_61_R), .Xi5(ftr_61_I), .Xr6(ftr_62_R), .Xi6(ftr_62_I), .Xr7(ftr_63_R), .Xi7(ftr_63_I)
    );


 wire [31:0]    rg2_0_R, rg2_0_I, rg2_1_R, rg2_1_I, rg2_2_R, rg2_2_I, rg2_3_R, rg2_3_I, rg2_4_R, rg2_4_I, rg2_5_R, rg2_5_I, rg2_6_R, rg2_6_I, rg2_7_R, rg2_7_I,
                rg2_8_R, rg2_8_I, rg2_9_R, rg2_9_I, rg2_10_R, rg2_10_I, rg2_11_R, rg2_11_I, rg2_12_R, rg2_12_I, rg2_13_R, rg2_13_I, rg2_14_R, rg2_14_I, rg2_15_R, rg2_15_I, rg2_16_R, rg2_16_I,
                rg2_17_R, rg2_17_I, rg2_18_R, rg2_18_I, rg2_19_R, rg2_19_I, rg2_20_R, rg2_20_I, rg2_21_R, rg2_21_I, rg2_22_R, rg2_22_I, rg2_23_R, rg2_23_I, rg2_24_R, rg2_24_I,
                rg2_25_R, rg2_25_I, rg2_26_R, rg2_26_I, rg2_27_R, rg2_27_I, rg2_28_R, rg2_28_I, rg2_29_R, rg2_29_I, rg2_30_R, rg2_30_I, rg2_31_R, rg2_31_I, rg2_32_R, rg2_32_I,
                rg2_33_R, rg2_33_I, rg2_34_R, rg2_34_I, rg2_35_R, rg2_35_I, rg2_36_R, rg2_36_I, rg2_37_R, rg2_37_I, rg2_38_R, rg2_38_I, rg2_39_R, rg2_39_I, rg2_40_R, rg2_40_I,
                rg2_41_R, rg2_41_I, rg2_42_R, rg2_42_I, rg2_43_R, rg2_43_I, rg2_44_R, rg2_44_I, rg2_45_R, rg2_45_I, rg2_46_R, rg2_46_I, rg2_47_R, rg2_47_I, rg2_48_R, rg2_48_I,
                rg2_49_R, rg2_49_I, rg2_50_R, rg2_50_I, rg2_51_R, rg2_51_I, rg2_52_R, rg2_52_I, rg2_53_R, rg2_53_I, rg2_54_R, rg2_54_I, rg2_55_R, rg2_55_I, rg2_56_R, rg2_56_I,
                rg2_57_R, rg2_57_I, rg2_58_R, rg2_58_I, rg2_59_R, rg2_59_I, rg2_60_R, rg2_60_I, rg2_61_R, rg2_61_I, rg2_62_R, rg2_62_I, rg2_63_R, rg2_63_I;




Register TransposeBuffer_rg2(
    .clk(clk),
    .rst(rst),
    .in_0_R(ftr_0_R), .in_0_I(ftr_0_I), .in_1_R(ftr_1_R), .in_1_I(ftr_1_I),
    .in_2_R(ftr_2_R), .in_2_I(ftr_2_I), .in_3_R(ftr_3_R), .in_3_I(ftr_3_I),
    .in_4_R(ftr_4_R), .in_4_I(ftr_4_I), .in_5_R(ftr_5_R), .in_5_I(ftr_5_I),
    .in_6_R(ftr_6_R), .in_6_I(ftr_6_I), .in_7_R(ftr_7_R), .in_7_I(ftr_7_I),
    .in_8_R(ftr_8_R), .in_8_I(ftr_8_I), .in_9_R(ftr_9_R), .in_9_I(ftr_9_I),
    .in_10_R(ftr_10_R), .in_10_I(ftr_10_I), .in_11_R(ftr_11_R), .in_11_I(ftr_11_I),
    .in_12_R(ftr_12_R), .in_12_I(ftr_12_I), .in_13_R(ftr_13_R), .in_13_I(ftr_13_I),
    .in_14_R(ftr_14_R), .in_14_I(ftr_14_I), .in_15_R(ftr_15_R), .in_15_I(ftr_15_I),
    .in_16_R(ftr_16_R), .in_16_I(ftr_16_I), .in_17_R(ftr_17_R), .in_17_I(ftr_17_I),
    .in_18_R(ftr_18_R), .in_18_I(ftr_18_I), .in_19_R(ftr_19_R), .in_19_I(ftr_19_I),
    .in_20_R(ftr_20_R), .in_20_I(ftr_20_I), .in_21_R(ftr_21_R), .in_21_I(ftr_21_I),
    .in_22_R(ftr_22_R), .in_22_I(ftr_22_I), .in_23_R(ftr_23_R), .in_23_I(ftr_23_I),
    .in_24_R(ftr_24_R), .in_24_I(ftr_24_I), .in_25_R(ftr_25_R), .in_25_I(ftr_25_I),
    .in_26_R(ftr_26_R), .in_26_I(ftr_26_I), .in_27_R(ftr_27_R), .in_27_I(ftr_27_I),
    .in_28_R(ftr_28_R), .in_28_I(ftr_28_I), .in_29_R(ftr_29_R), .in_29_I(ftr_29_I),
    .in_30_R(ftr_30_R), .in_30_I(ftr_30_I), .in_31_R(ftr_31_R), .in_31_I(ftr_31_I),
    .in_32_R(ftr_32_R), .in_32_I(ftr_32_I), .in_33_R(ftr_33_R), .in_33_I(ftr_33_I),
    .in_34_R(ftr_34_R), .in_34_I(ftr_34_I), .in_35_R(ftr_35_R), .in_35_I(ftr_35_I),
    .in_36_R(ftr_36_R), .in_36_I(ftr_36_I), .in_37_R(ftr_37_R), .in_37_I(ftr_37_I),
    .in_38_R(ftr_38_R), .in_38_I(ftr_38_I), .in_39_R(ftr_39_R), .in_39_I(ftr_39_I),
    .in_40_R(ftr_40_R), .in_40_I(ftr_40_I), .in_41_R(ftr_41_R), .in_41_I(ftr_41_I),
    .in_42_R(ftr_42_R), .in_42_I(ftr_42_I), .in_43_R(ftr_43_R), .in_43_I(ftr_43_I),
    .in_44_R(ftr_44_R), .in_44_I(ftr_44_I), .in_45_R(ftr_45_R), .in_45_I(ftr_45_I),
    .in_46_R(ftr_46_R), .in_46_I(ftr_46_I), .in_47_R(ftr_47_R), .in_47_I(ftr_47_I),
    .in_48_R(ftr_48_R), .in_48_I(ftr_48_I), .in_49_R(ftr_49_R), .in_49_I(ftr_49_I),
    .in_50_R(ftr_50_R), .in_50_I(ftr_50_I), .in_51_R(ftr_51_R), .in_51_I(ftr_51_I),
    .in_52_R(ftr_52_R), .in_52_I(ftr_52_I), .in_53_R(ftr_53_R), .in_53_I(ftr_53_I),
    .in_54_R(ftr_54_R), .in_54_I(ftr_54_I), .in_55_R(ftr_55_R), .in_55_I(ftr_55_I),
    .in_56_R(ftr_56_R), .in_56_I(ftr_56_I), .in_57_R(ftr_57_R), .in_57_I(ftr_57_I),
    .in_58_R(ftr_58_R), .in_58_I(ftr_58_I), .in_59_R(ftr_59_R), .in_59_I(ftr_59_I),
    .in_60_R(ftr_60_R), .in_60_I(ftr_60_I), .in_61_R(ftr_61_R), .in_61_I(ftr_61_I),
    .in_62_R(ftr_62_R), .in_62_I(ftr_62_I), .in_63_R(ftr_63_R), .in_63_I(ftr_63_I),




    .out_0_R(rg2_0_R), .out_0_I(rg2_0_I), .out_1_R(rg2_1_R), .out_1_I(rg2_1_I),
    .out_2_R(rg2_2_R), .out_2_I(rg2_2_I), .out_3_R(rg2_3_R), .out_3_I(rg2_3_I),
    .out_4_R(rg2_4_R), .out_4_I(rg2_4_I), .out_5_R(rg2_5_R), .out_5_I(rg2_5_I),
    .out_6_R(rg2_6_R), .out_6_I(rg2_6_I), .out_7_R(rg2_7_R), .out_7_I(rg2_7_I),
    .out_8_R(rg2_8_R), .out_8_I(rg2_8_I), .out_9_R(rg2_9_R), .out_9_I(rg2_9_I),
    .out_10_R(rg2_10_R), .out_10_I(rg2_10_I), .out_11_R(rg2_11_R), .out_11_I(rg2_11_I),
    .out_12_R(rg2_12_R), .out_12_I(rg2_12_I), .out_13_R(rg2_13_R), .out_13_I(rg2_13_I),
    .out_14_R(rg2_14_R), .out_14_I(rg2_14_I), .out_15_R(rg2_15_R), .out_15_I(rg2_15_I),
    .out_16_R(rg2_16_R), .out_16_I(rg2_16_I), .out_17_R(rg2_17_R), .out_17_I(rg2_17_I),
    .out_18_R(rg2_18_R), .out_18_I(rg2_18_I), .out_19_R(rg2_19_R), .out_19_I(rg2_19_I),
    .out_20_R(rg2_20_R), .out_20_I(rg2_20_I), .out_21_R(rg2_21_R), .out_21_I(rg2_21_I),
    .out_22_R(rg2_22_R), .out_22_I(rg2_22_I), .out_23_R(rg2_23_R), .out_23_I(rg2_23_I),
    .out_24_R(rg2_24_R), .out_24_I(rg2_24_I), .out_25_R(rg2_25_R), .out_25_I(rg2_25_I),
    .out_26_R(rg2_26_R), .out_26_I(rg2_26_I), .out_27_R(rg2_27_R), .out_27_I(rg2_27_I),
    .out_28_R(rg2_28_R), .out_28_I(rg2_28_I), .out_29_R(rg2_29_R), .out_29_I(rg2_29_I),
    .out_30_R(rg2_30_R), .out_30_I(rg2_30_I), .out_31_R(rg2_31_R), .out_31_I(rg2_31_I),
    .out_32_R(rg2_32_R), .out_32_I(rg2_32_I), .out_33_R(rg2_33_R), .out_33_I(rg2_33_I),
    .out_34_R(rg2_34_R), .out_34_I(rg2_34_I), .out_35_R(rg2_35_R), .out_35_I(rg2_35_I),
    .out_36_R(rg2_36_R), .out_36_I(rg2_36_I), .out_37_R(rg2_37_R), .out_37_I(rg2_37_I),
    .out_38_R(rg2_38_R), .out_38_I(rg2_38_I), .out_39_R(rg2_39_R), .out_39_I(rg2_39_I),
    .out_40_R(rg2_40_R), .out_40_I(rg2_40_I), .out_41_R(rg2_41_R), .out_41_I(rg2_41_I),
    .out_42_R(rg2_42_R), .out_42_I(rg2_42_I), .out_43_R(rg2_43_R), .out_43_I(rg2_43_I),
    .out_44_R(rg2_44_R), .out_44_I(rg2_44_I), .out_45_R(rg2_45_R), .out_45_I(rg2_45_I),
    .out_46_R(rg2_46_R), .out_46_I(rg2_46_I), .out_47_R(rg2_47_R), .out_47_I(rg2_47_I),
    .out_48_R(rg2_48_R), .out_48_I(rg2_48_I), .out_49_R(rg2_49_R), .out_49_I(rg2_49_I),
    .out_50_R(rg2_50_R), .out_50_I(rg2_50_I), .out_51_R(rg2_51_R), .out_51_I(rg2_51_I),
    .out_52_R(rg2_52_R), .out_52_I(rg2_52_I), .out_53_R(rg2_53_R), .out_53_I(rg2_53_I),
    .out_54_R(rg2_54_R), .out_54_I(rg2_54_I), .out_55_R(rg2_55_R), .out_55_I(rg2_55_I),
    .out_56_R(rg2_56_R), .out_56_I(rg2_56_I), .out_57_R(rg2_57_R), .out_57_I(rg2_57_I),
    .out_58_R(rg2_58_R), .out_58_I(rg2_58_I), .out_59_R(rg2_59_R), .out_59_I(rg2_59_I),
    .out_60_R(rg2_60_R), .out_60_I(rg2_60_I), .out_61_R(rg2_61_R), .out_61_I(rg2_61_I),
    .out_62_R(rg2_62_R), .out_62_I(rg2_62_I), .out_63_R(rg2_63_R), .out_63_I(rg2_63_I)
);


wire [31:0] ftc_0_R, ftc_0_I, ftc_1_R, ftc_1_I, ftc_2_R, ftc_2_I, ftc_3_R, ftc_3_I,
            ftc_4_R, ftc_4_I, ftc_5_R, ftc_5_I, ftc_6_R, ftc_6_I, ftc_7_R, ftc_7_I,
            ftc_8_R, ftc_8_I, ftc_9_R, ftc_9_I, ftc_10_R, ftc_10_I, ftc_11_R, ftc_11_I,
            ftc_12_R, ftc_12_I, ftc_13_R, ftc_13_I, ftc_14_R, ftc_14_I, ftc_15_R, ftc_15_I,
            ftc_16_R, ftc_16_I, ftc_17_R, ftc_17_I, ftc_18_R, ftc_18_I, ftc_19_R, ftc_19_I,
            ftc_20_R, ftc_20_I, ftc_21_R, ftc_21_I, ftc_22_R, ftc_22_I, ftc_23_R, ftc_23_I,
            ftc_24_R, ftc_24_I, ftc_25_R, ftc_25_I, ftc_26_R, ftc_26_I, ftc_27_R, ftc_27_I,
            ftc_28_R, ftc_28_I, ftc_29_R, ftc_29_I, ftc_30_R, ftc_30_I, ftc_31_R, ftc_31_I,
            ftc_32_R, ftc_32_I, ftc_33_R, ftc_33_I, ftc_34_R, ftc_34_I, ftc_35_R, ftc_35_I,
            ftc_36_R, ftc_36_I, ftc_37_R, ftc_37_I, ftc_38_R, ftc_38_I, ftc_39_R, ftc_39_I,
            ftc_40_R, ftc_40_I, ftc_41_R, ftc_41_I, ftc_42_R, ftc_42_I, ftc_43_R, ftc_43_I,
            ftc_44_R, ftc_44_I, ftc_45_R, ftc_45_I, ftc_46_R, ftc_46_I, ftc_47_R, ftc_47_I,
            ftc_48_R, ftc_48_I, ftc_49_R, ftc_49_I, ftc_50_R, ftc_50_I, ftc_51_R, ftc_51_I,
            ftc_52_R, ftc_52_I, ftc_53_R, ftc_53_I, ftc_54_R, ftc_54_I, ftc_55_R, ftc_55_I,
            ftc_56_R, ftc_56_I, ftc_57_R, ftc_57_I, ftc_58_R, ftc_58_I, ftc_59_R, ftc_59_I,
            ftc_60_R, ftc_60_I, ftc_61_R, ftc_61_I, ftc_62_R, ftc_62_I, ftc_63_R, ftc_63_I;

fft8pt fft_col_0(
    .xr0(rg2_0_R), .xi0(rg2_0_I), .xr1(rg2_1_R), .xi1(rg2_1_I), .xr2(rg2_2_R), .xi2(rg2_2_I), .xr3(rg2_3_R), .xi3(rg2_3_I),
    .xr4(rg2_4_R), .xi4(rg2_4_I), .xr5(rg2_5_R), .xi5(rg2_5_I), .xr6(rg2_6_R), .xi6(rg2_6_I), .xr7(rg2_7_R), .xi7(rg2_7_I),
    .Xr0(ftc_0_R), .Xi0(ftc_0_I), .Xr1(ftc_1_R), .Xi1(ftc_1_I), .Xr2(ftc_2_R), .Xi2(ftc_2_I), .Xr3(ftc_3_R), .Xi3(ftc_3_I),
    .Xr4(ftc_4_R), .Xi4(ftc_4_I), .Xr5(ftc_5_R), .Xi5(ftc_5_I), .Xr6(ftc_6_R), .Xi6(ftc_6_I), .Xr7(ftc_7_R), .Xi7(ftc_7_I)
);

fft8pt fft_col_1(
    .xr0(rg2_8_R), .xi0(rg2_8_I), .xr1(rg2_9_R), .xi1(rg2_9_I), .xr2(rg2_10_R), .xi2(rg2_10_I), .xr3(rg2_11_R), .xi3(rg2_11_I),
    .xr4(rg2_12_R), .xi4(rg2_12_I), .xr5(rg2_13_R), .xi5(rg2_13_I), .xr6(rg2_14_R), .xi6(rg2_14_I), .xr7(rg2_15_R), .xi7(rg2_15_I),
    .Xr0(ftc_8_R), .Xi0(ftc_8_I), .Xr1(ftc_9_R), .Xi1(ftc_9_I), .Xr2(ftc_10_R), .Xi2(ftc_10_I), .Xr3(ftc_11_R), .Xi3(ftc_11_I),
    .Xr4(ftc_12_R), .Xi4(ftc_12_I), .Xr5(ftc_13_R), .Xi5(ftc_13_I), .Xr6(ftc_14_R), .Xi6(ftc_14_I), .Xr7(ftc_15_R), .Xi7(ftc_15_I)
);

fft8pt fft_col_2(
    .xr0(rg2_16_R), .xi0(rg2_16_I), .xr1(rg2_17_R), .xi1(rg2_17_I), .xr2(rg2_18_R), .xi2(rg2_18_I), .xr3(rg2_19_R), .xi3(rg2_19_I),
    .xr4(rg2_20_R), .xi4(rg2_20_I), .xr5(rg2_21_R), .xi5(rg2_21_I), .xr6(rg2_22_R), .xi6(rg2_22_I), .xr7(rg2_23_R), .xi7(rg2_23_I),
    .Xr0(ftc_16_R), .Xi0(ftc_16_I), .Xr1(ftc_17_R), .Xi1(ftc_17_I), .Xr2(ftc_18_R), .Xi2(ftc_18_I), .Xr3(ftc_19_R), .Xi3(ftc_19_I),
    .Xr4(ftc_20_R), .Xi4(ftc_20_I), .Xr5(ftc_21_R), .Xi5(ftc_21_I), .Xr6(ftc_22_R), .Xi6(ftc_22_I), .Xr7(ftc_23_R), .Xi7(ftc_23_I)
);

fft8pt fft_col_3(
    .xr0(rg2_24_R), .xi0(rg2_24_I), .xr1(rg2_25_R), .xi1(rg2_25_I), .xr2(rg2_26_R), .xi2(rg2_26_I), .xr3(rg2_27_R), .xi3(rg2_27_I),
    .xr4(rg2_28_R), .xi4(rg2_28_I), .xr5(rg2_29_R), .xi5(rg2_29_I), .xr6(rg2_30_R), .xi6(rg2_30_I), .xr7(rg2_31_R), .xi7(rg2_31_I),
    .Xr0(ftc_24_R), .Xi0(ftc_24_I), .Xr1(ftc_25_R), .Xi1(ftc_25_I), .Xr2(ftc_26_R), .Xi2(ftc_26_I), .Xr3(ftc_27_R), .Xi3(ftc_27_I),
    .Xr4(ftc_28_R), .Xi4(ftc_28_I), .Xr5(ftc_29_R), .Xi5(ftc_29_I), .Xr6(ftc_30_R), .Xi6(ftc_30_I), .Xr7(ftc_31_R), .Xi7(ftc_31_I)
);

fft8pt fft_col_4(
    .xr0(rg2_32_R), .xi0(rg2_32_I), .xr1(rg2_33_R), .xi1(rg2_33_I), .xr2(rg2_34_R), .xi2(rg2_34_I), .xr3(rg2_35_R), .xi3(rg2_35_I),
    .xr4(rg2_36_R), .xi4(rg2_36_I), .xr5(rg2_37_R), .xi5(rg2_37_I), .xr6(rg2_38_R), .xi6(rg2_38_I), .xr7(rg2_39_R), .xi7(rg2_39_I),
    .Xr0(ftc_32_R), .Xi0(ftc_32_I), .Xr1(ftc_33_R), .Xi1(ftc_33_I), .Xr2(ftc_34_R), .Xi2(ftc_34_I), .Xr3(ftc_35_R), .Xi3(ftc_35_I),
    .Xr4(ftc_36_R), .Xi4(ftc_36_I), .Xr5(ftc_37_R), .Xi5(ftc_37_I), .Xr6(ftc_38_R), .Xi6(ftc_38_I), .Xr7(ftc_39_R), .Xi7(ftc_39_I)
);

fft8pt fft_col_5(
    .xr0(rg2_40_R), .xi0(rg2_40_I), .xr1(rg2_41_R), .xi1(rg2_41_I), .xr2(rg2_42_R), .xi2(rg2_42_I), .xr3(rg2_43_R), .xi3(rg2_43_I),
    .xr4(rg2_44_R), .xi4(rg2_44_I), .xr5(rg2_45_R), .xi5(rg2_45_I), .xr6(rg2_46_R), .xi6(rg2_46_I), .xr7(rg2_47_R), .xi7(rg2_47_I),
    .Xr0(ftc_40_R), .Xi0(ftc_40_I), .Xr1(ftc_41_R), .Xi1(ftc_41_I), .Xr2(ftc_42_R), .Xi2(ftc_42_I), .Xr3(ftc_43_R), .Xi3(ftc_43_I),
    .Xr4(ftc_44_R), .Xi4(ftc_44_I), .Xr5(ftc_45_R), .Xi5(ftc_45_I), .Xr6(ftc_46_R), .Xi6(ftc_46_I), .Xr7(ftc_47_R), .Xi7(ftc_47_I)
);

fft8pt fft_col_6(
    .xr0(rg2_48_R), .xi0(rg2_48_I), .xr1(rg2_49_R), .xi1(rg2_49_I), .xr2(rg2_50_R), .xi2(rg2_50_I), .xr3(rg2_51_R), .xi3(rg2_51_I),
    .xr4(rg2_52_R), .xi4(rg2_52_I), .xr5(rg2_53_R), .xi5(rg2_53_I), .xr6(rg2_54_R), .xi6(rg2_54_I), .xr7(rg2_55_R), .xi7(rg2_55_I),
    .Xr0(ftc_48_R), .Xi0(ftc_48_I), .Xr1(ftc_49_R), .Xi1(ftc_49_I), .Xr2(ftc_50_R), .Xi2(ftc_50_I), .Xr3(ftc_51_R), .Xi3(ftc_51_I),
    .Xr4(ftc_52_R), .Xi4(ftc_52_I), .Xr5(ftc_53_R), .Xi5(ftc_53_I), .Xr6(ftc_54_R), .Xi6(ftc_54_I), .Xr7(ftc_55_R), .Xi7(ftc_55_I)
);

fft8pt fft_col_7(
    .xr0(rg2_56_R), .xi0(rg2_56_I), .xr1(rg2_57_R), .xi1(rg2_57_I), .xr2(rg2_58_R), .xi2(rg2_58_I), .xr3(rg2_59_R), .xi3(rg2_59_I),
    .xr4(rg2_60_R), .xi4(rg2_60_I), .xr5(rg2_61_R), .xi5(rg2_61_I), .xr6(rg2_62_R), .xi6(rg2_62_I), .xr7(rg2_63_R), .xi7(rg2_63_I),
    .Xr0(ftc_56_R), .Xi0(ftc_56_I), .Xr1(ftc_57_R), .Xi1(ftc_57_I), .Xr2(ftc_58_R), .Xi2(ftc_58_I), .Xr3(ftc_59_R), .Xi3(ftc_59_I),
    .Xr4(ftc_60_R), .Xi4(ftc_60_I), .Xr5(ftc_61_R), .Xi5(ftc_61_I), .Xr6(ftc_62_R), .Xi6(ftc_62_I), .Xr7(ftc_63_R), .Xi7(ftc_63_I)
);

wire [31:0] rg3_0_R, rg3_0_I, rg3_1_R, rg3_1_I, rg3_2_R, rg3_2_I, rg3_3_R, rg3_3_I, rg3_4_R, rg3_4_I, rg3_5_R, rg3_5_I, rg3_6_R, rg3_6_I, rg3_7_R, rg3_7_I,
                rg3_8_R, rg3_8_I, rg3_9_R, rg3_9_I, rg3_10_R, rg3_10_I, rg3_11_R, rg3_11_I, rg3_12_R, rg3_12_I, rg3_13_R, rg3_13_I, rg3_14_R, rg3_14_I, rg3_15_R, rg3_15_I, rg3_16_R, rg3_16_I,
                rg3_17_R, rg3_17_I, rg3_18_R, rg3_18_I, rg3_19_R, rg3_19_I, rg3_20_R, rg3_20_I, rg3_21_R, rg3_21_I, rg3_22_R, rg3_22_I, rg3_23_R, rg3_23_I, rg3_24_R, rg3_24_I,
                rg3_25_R, rg3_25_I, rg3_26_R, rg3_26_I, rg3_27_R, rg3_27_I, rg3_28_R, rg3_28_I, rg3_29_R, rg3_29_I, rg3_30_R, rg3_30_I, rg3_31_R, rg3_31_I, rg3_32_R, rg3_32_I,
                rg3_33_R, rg3_33_I, rg3_34_R, rg3_34_I, rg3_35_R, rg3_35_I, rg3_36_R, rg3_36_I, rg3_37_R, rg3_37_I, rg3_38_R, rg3_38_I, rg3_39_R, rg3_39_I, rg3_40_R, rg3_40_I,
                rg3_41_R, rg3_41_I, rg3_42_R, rg3_42_I, rg3_43_R, rg3_43_I, rg3_44_R, rg3_44_I, rg3_45_R, rg3_45_I, rg3_46_R, rg3_46_I, rg3_47_R, rg3_47_I, rg3_48_R, rg3_48_I,
                rg3_49_R, rg3_49_I, rg3_50_R, rg3_50_I, rg3_51_R, rg3_51_I, rg3_52_R, rg3_52_I, rg3_53_R, rg3_53_I, rg3_54_R, rg3_54_I, rg3_55_R, rg3_55_I, rg3_56_R, rg3_56_I,
                rg3_57_R, rg3_57_I, rg3_58_R, rg3_58_I, rg3_59_R, rg3_59_I, rg3_60_R, rg3_60_I, rg3_61_R, rg3_61_I, rg3_62_R, rg3_62_I, rg3_63_R, rg3_63_I;




SpectralRegister SpectralDataBuffer(
    .clk(clk),
    .rst(rst),
    .in_0_R(ftc_0_R), .in_0_I(ftc_0_I), .in_1_R(ftc_1_R), .in_1_I(ftc_1_I),
    .in_2_R(ftc_2_R), .in_2_I(ftc_2_I), .in_3_R(ftc_3_R), .in_3_I(ftc_3_I),
    .in_4_R(ftc_4_R), .in_4_I(ftc_4_I), .in_5_R(ftc_5_R), .in_5_I(ftc_5_I),
    .in_6_R(ftc_6_R), .in_6_I(ftc_6_I), .in_7_R(ftc_7_R), .in_7_I(ftc_7_I),
    .in_8_R(ftc_8_R), .in_8_I(ftc_8_I), .in_9_R(ftc_9_R), .in_9_I(ftc_9_I),
    .in_10_R(ftc_10_R), .in_10_I(ftc_10_I), .in_11_R(ftc_11_R), .in_11_I(ftc_11_I),
    .in_12_R(ftc_12_R), .in_12_I(ftc_12_I), .in_13_R(ftc_13_R), .in_13_I(ftc_13_I),
    .in_14_R(ftc_14_R), .in_14_I(ftc_14_I), .in_15_R(ftc_15_R), .in_15_I(ftc_15_I),
    .in_16_R(ftc_16_R), .in_16_I(ftc_16_I), .in_17_R(ftc_17_R), .in_17_I(ftc_17_I),
    .in_18_R(ftc_18_R), .in_18_I(ftc_18_I), .in_19_R(ftc_19_R), .in_19_I(ftc_19_I),
    .in_20_R(ftc_20_R), .in_20_I(ftc_20_I), .in_21_R(ftc_21_R), .in_21_I(ftc_21_I),
    .in_22_R(ftc_22_R), .in_22_I(ftc_22_I), .in_23_R(ftc_23_R), .in_23_I(ftc_23_I),
    .in_24_R(ftc_24_R), .in_24_I(ftc_24_I), .in_25_R(ftc_25_R), .in_25_I(ftc_25_I),
    .in_26_R(ftc_26_R), .in_26_I(ftc_26_I), .in_27_R(ftc_27_R), .in_27_I(ftc_27_I),
    .in_28_R(ftc_28_R), .in_28_I(ftc_28_I), .in_29_R(ftc_29_R), .in_29_I(ftc_29_I),
    .in_30_R(ftc_30_R), .in_30_I(ftc_30_I), .in_31_R(ftc_31_R), .in_31_I(ftc_31_I),
    .in_32_R(ftc_32_R), .in_32_I(ftc_32_I), .in_33_R(ftc_33_R), .in_33_I(ftc_33_I),
    .in_34_R(ftc_34_R), .in_34_I(ftc_34_I), .in_35_R(ftc_35_R), .in_35_I(ftc_35_I),
    .in_36_R(ftc_36_R), .in_36_I(ftc_36_I), .in_37_R(ftc_37_R), .in_37_I(ftc_37_I),
    .in_38_R(ftc_38_R), .in_38_I(ftc_38_I), .in_39_R(ftc_39_R), .in_39_I(ftc_39_I),
    .in_40_R(ftc_40_R), .in_40_I(ftc_40_I), .in_41_R(ftc_41_R), .in_41_I(ftc_41_I),
    .in_42_R(ftc_42_R), .in_42_I(ftc_42_I), .in_43_R(ftc_43_R), .in_43_I(ftc_43_I),
    .in_44_R(ftc_44_R), .in_44_I(ftc_44_I), .in_45_R(ftc_45_R), .in_45_I(ftc_45_I),
    .in_46_R(ftc_46_R), .in_46_I(ftc_46_I), .in_47_R(ftc_47_R), .in_47_I(ftc_47_I),
    .in_48_R(ftc_48_R), .in_48_I(ftc_48_I), .in_49_R(ftc_49_R), .in_49_I(ftc_49_I),
    .in_50_R(ftc_50_R), .in_50_I(ftc_50_I), .in_51_R(ftc_51_R), .in_51_I(ftc_51_I),
    .in_52_R(ftc_52_R), .in_52_I(ftc_52_I), .in_53_R(ftc_53_R), .in_53_I(ftc_53_I),
    .in_54_R(ftc_54_R), .in_54_I(ftc_54_I), .in_55_R(ftc_55_R), .in_55_I(ftc_55_I),
    .in_56_R(ftc_56_R), .in_56_I(ftc_56_I), .in_57_R(ftc_57_R), .in_57_I(ftc_57_I),
    .in_58_R(ftc_58_R), .in_58_I(ftc_58_I), .in_59_R(ftc_59_R), .in_59_I(ftc_59_I),
    .in_60_R(ftc_60_R), .in_60_I(ftc_60_I), .in_61_R(ftc_61_R), .in_61_I(ftc_61_I),
    .in_62_R(ftc_62_R), .in_62_I(ftc_62_I), .in_63_R(ftc_63_R), .in_63_I(ftc_63_I),

    .out_0_R(rg3_0_R), .out_0_I(rg3_0_I), .out_1_R(rg3_1_R), .out_1_I(rg3_1_I),
    .out_2_R(rg3_2_R), .out_2_I(rg3_2_I), .out_3_R(rg3_3_R), .out_3_I(rg3_3_I),
    .out_4_R(rg3_4_R), .out_4_I(rg3_4_I), .out_5_R(rg3_5_R), .out_5_I(rg3_5_I),
    .out_6_R(rg3_6_R), .out_6_I(rg3_6_I), .out_7_R(rg3_7_R), .out_7_I(rg3_7_I),
    .out_8_R(rg3_8_R), .out_8_I(rg3_8_I), .out_9_R(rg3_9_R), .out_9_I(rg3_9_I),
    .out_10_R(rg3_10_R), .out_10_I(rg3_10_I), .out_11_R(rg3_11_R), .out_11_I(rg3_11_I),
    .out_12_R(rg3_12_R), .out_12_I(rg3_12_I), .out_13_R(rg3_13_R), .out_13_I(rg3_13_I),
    .out_14_R(rg3_14_R), .out_14_I(rg3_14_I), .out_15_R(rg3_15_R), .out_15_I(rg3_15_I),
    .out_16_R(rg3_16_R), .out_16_I(rg3_16_I), .out_17_R(rg3_17_R), .out_17_I(rg3_17_I),
    .out_18_R(rg3_18_R), .out_18_I(rg3_18_I), .out_19_R(rg3_19_R), .out_19_I(rg3_19_I),
    .out_20_R(rg3_20_R), .out_20_I(rg3_20_I), .out_21_R(rg3_21_R), .out_21_I(rg3_21_I),
    .out_22_R(rg3_22_R), .out_22_I(rg3_22_I), .out_23_R(rg3_23_R), .out_23_I(rg3_23_I),
    .out_24_R(rg3_24_R), .out_24_I(rg3_24_I), .out_25_R(rg3_25_R), .out_25_I(rg3_25_I),
    .out_26_R(rg3_26_R), .out_26_I(rg3_26_I), .out_27_R(rg3_27_R), .out_27_I(rg3_27_I),
    .out_28_R(rg3_28_R), .out_28_I(rg3_28_I), .out_29_R(rg3_29_R), .out_29_I(rg3_29_I),
    .out_30_R(rg3_30_R), .out_30_I(rg3_30_I), .out_31_R(rg3_31_R), .out_31_I(rg3_31_I),
    .out_32_R(rg3_32_R), .out_32_I(rg3_32_I), .out_33_R(rg3_33_R), .out_33_I(rg3_33_I),
    .out_34_R(rg3_34_R), .out_34_I(rg3_34_I), .out_35_R(rg3_35_R), .out_35_I(rg3_35_I),
    .out_36_R(rg3_36_R), .out_36_I(rg3_36_I), .out_37_R(rg3_37_R), .out_37_I(rg3_37_I),
    .out_38_R(rg3_38_R), .out_38_I(rg3_38_I), .out_39_R(rg3_39_R), .out_39_I(rg3_39_I),
    .out_40_R(rg3_40_R), .out_40_I(rg3_40_I), .out_41_R(rg3_41_R), .out_41_I(rg3_41_I),
    .out_42_R(rg3_42_R), .out_42_I(rg3_42_I), .out_43_R(rg3_43_R), .out_43_I(rg3_43_I),
    .out_44_R(rg3_44_R), .out_44_I(rg3_44_I), .out_45_R(rg3_45_R), .out_45_I(rg3_45_I),
    .out_46_R(rg3_46_R), .out_46_I(rg3_46_I), .out_47_R(rg3_47_R), .out_47_I(rg3_47_I),
    .out_48_R(rg3_48_R), .out_48_I(rg3_48_I), .out_49_R(rg3_49_R), .out_49_I(rg3_49_I),
    .out_50_R(rg3_50_R), .out_50_I(rg3_50_I), .out_51_R(rg3_51_R), .out_51_I(rg3_51_I),
    .out_52_R(rg3_52_R), .out_52_I(rg3_52_I), .out_53_R(rg3_53_R), .out_53_I(rg3_53_I),
    .out_54_R(rg3_54_R), .out_54_I(rg3_54_I), .out_55_R(rg3_55_R), .out_55_I(rg3_55_I),
    .out_56_R(rg3_56_R), .out_56_I(rg3_56_I), .out_57_R(rg3_57_R), .out_57_I(rg3_57_I),
    .out_58_R(rg3_58_R), .out_58_I(rg3_58_I), .out_59_R(rg3_59_R), .out_59_I(rg3_59_I),
    .out_60_R(rg3_60_R), .out_60_I(rg3_60_I), .out_61_R(rg3_61_R), .out_61_I(rg3_61_I),
    .out_62_R(rg3_62_R), .out_62_I(rg3_62_I), .out_63_R(rg3_63_R), .out_63_I(rg3_63_I)
);



wire [31:0] ker_out_0_R, ker_out_0_I, ker_out_1_R, ker_out_1_I, ker_out_2_R, ker_out_2_I, ker_out_3_R, ker_out_3_I,
            ker_out_4_R, ker_out_4_I, ker_out_5_R, ker_out_5_I, ker_out_6_R, ker_out_6_I, ker_out_7_R, ker_out_7_I,
            ker_out_8_R, ker_out_8_I, ker_out_9_R, ker_out_9_I, ker_out_10_R, ker_out_10_I, ker_out_11_R, ker_out_11_I,
            ker_out_12_R, ker_out_12_I, ker_out_13_R, ker_out_13_I, ker_out_14_R, ker_out_14_I, ker_out_15_R, ker_out_15_I,
            ker_out_16_R, ker_out_16_I, ker_out_17_R, ker_out_17_I, ker_out_18_R, ker_out_18_I, ker_out_19_R, ker_out_19_I,
            ker_out_20_R, ker_out_20_I, ker_out_21_R, ker_out_21_I, ker_out_22_R, ker_out_22_I, ker_out_23_R, ker_out_23_I,
            ker_out_24_R, ker_out_24_I, ker_out_25_R, ker_out_25_I, ker_out_26_R, ker_out_26_I, ker_out_27_R, ker_out_27_I,
            ker_out_28_R, ker_out_28_I, ker_out_29_R, ker_out_29_I, ker_out_30_R, ker_out_30_I, ker_out_31_R, ker_out_31_I,
            ker_out_32_R, ker_out_32_I, ker_out_33_R, ker_out_33_I, ker_out_34_R, ker_out_34_I, ker_out_35_R, ker_out_35_I,
            ker_out_36_R, ker_out_36_I, ker_out_37_R, ker_out_37_I, ker_out_38_R, ker_out_38_I, ker_out_39_R, ker_out_39_I,
            ker_out_40_R, ker_out_40_I, ker_out_41_R, ker_out_41_I, ker_out_42_R, ker_out_42_I, ker_out_43_R, ker_out_43_I,
            ker_out_44_R, ker_out_44_I, ker_out_45_R, ker_out_45_I, ker_out_46_R, ker_out_46_I, ker_out_47_R, ker_out_47_I,
            ker_out_48_R, ker_out_48_I, ker_out_49_R, ker_out_49_I, ker_out_50_R, ker_out_50_I, ker_out_51_R, ker_out_51_I,
            ker_out_52_R, ker_out_52_I, ker_out_53_R, ker_out_53_I, ker_out_54_R, ker_out_54_I, ker_out_55_R, ker_out_55_I,
            ker_out_56_R, ker_out_56_I, ker_out_57_R, ker_out_57_I, ker_out_58_R, ker_out_58_I, ker_out_59_R, ker_out_59_I,
            ker_out_60_R, ker_out_60_I, ker_out_61_R, ker_out_61_I, ker_out_62_R, ker_out_62_I, ker_out_63_R, ker_out_63_I;

KernelMultiplier inst(
    .x0_real(rg3_0_R), .x0_imag(rg3_0_I), .x1_real(rg3_1_R), .x1_imag(rg3_1_I),
    .x2_real(rg3_2_R), .x2_imag(rg3_2_I), .x3_real(rg3_3_R), .x3_imag(rg3_3_I),
    .x4_real(rg3_4_R), .x4_imag(rg3_4_I), .x5_real(rg3_5_R), .x5_imag(rg3_5_I),
    .x6_real(rg3_6_R), .x6_imag(rg3_6_I), .x7_real(rg3_7_R), .x7_imag(rg3_7_I),
    .x8_real(rg3_8_R), .x8_imag(rg3_8_I), .x9_real(rg3_9_R), .x9_imag(rg3_9_I),
    .x10_real(rg3_10_R), .x10_imag(rg3_10_I), .x11_real(rg3_11_R), .x11_imag(rg3_11_I),
    .x12_real(rg3_12_R), .x12_imag(rg3_12_I), .x13_real(rg3_13_R), .x13_imag(rg3_13_I),
    .x14_real(rg3_14_R), .x14_imag(rg3_14_I), .x15_real(rg3_15_R), .x15_imag(rg3_15_I),
    .x16_real(rg3_16_R), .x16_imag(rg3_16_I), .x17_real(rg3_17_R), .x17_imag(rg3_17_I),
    .x18_real(rg3_18_R), .x18_imag(rg3_18_I), .x19_real(rg3_19_R), .x19_imag(rg3_19_I),
    .x20_real(rg3_20_R), .x20_imag(rg3_20_I), .x21_real(rg3_21_R), .x21_imag(rg3_21_I),
    .x22_real(rg3_22_R), .x22_imag(rg3_22_I), .x23_real(rg3_23_R), .x23_imag(rg3_23_I),
    .x24_real(rg3_24_R), .x24_imag(rg3_24_I), .x25_real(rg3_25_R), .x25_imag(rg3_25_I),
    .x26_real(rg3_26_R), .x26_imag(rg3_26_I), .x27_real(rg3_27_R), .x27_imag(rg3_27_I),
    .x28_real(rg3_28_R), .x28_imag(rg3_28_I), .x29_real(rg3_29_R), .x29_imag(rg3_29_I),
    .x30_real(rg3_30_R), .x30_imag(rg3_30_I), .x31_real(rg3_31_R), .x31_imag(rg3_31_I),
    .x32_real(rg3_32_R), .x32_imag(rg3_32_I), .x33_real(rg3_33_R), .x33_imag(rg3_33_I),
    .x34_real(rg3_34_R), .x34_imag(rg3_34_I), .x35_real(rg3_35_R), .x35_imag(rg3_35_I),
    .x36_real(rg3_36_R), .x36_imag(rg3_36_I), .x37_real(rg3_37_R), .x37_imag(rg3_37_I),
    .x38_real(rg3_38_R), .x38_imag(rg3_38_I), .x39_real(rg3_39_R), .x39_imag(rg3_39_I),
    .x40_real(rg3_40_R), .x40_imag(rg3_40_I), .x41_real(rg3_41_R), .x41_imag(rg3_41_I),
    .x42_real(rg3_42_R), .x42_imag(rg3_42_I), .x43_real(rg3_43_R), .x43_imag(rg3_43_I),
    .x44_real(rg3_44_R), .x44_imag(rg3_44_I), .x45_real(rg3_45_R), .x45_imag(rg3_45_I),
    .x46_real(rg3_46_R), .x46_imag(rg3_46_I), .x47_real(rg3_47_R), .x47_imag(rg3_47_I),
    .x48_real(rg3_48_R), .x48_imag(rg3_48_I), .x49_real(rg3_49_R), .x49_imag(rg3_49_I),
    .x50_real(rg3_50_R), .x50_imag(rg3_50_I), .x51_real(rg3_51_R), .x51_imag(rg3_51_I),
    .x52_real(rg3_52_R), .x52_imag(rg3_52_I), .x53_real(rg3_53_R), .x53_imag(rg3_53_I),
    .x54_real(rg3_54_R), .x54_imag(rg3_54_I), .x55_real(rg3_55_R), .x55_imag(rg3_55_I),
    .x56_real(rg3_56_R), .x56_imag(rg3_56_I), .x57_real(rg3_57_R), .x57_imag(rg3_57_I),
    .x58_real(rg3_58_R), .x58_imag(rg3_58_I), .x59_real(rg3_59_R), .x59_imag(rg3_59_I),
    .x60_real(rg3_60_R), .x60_imag(rg3_60_I), .x61_real(rg3_61_R), .x61_imag(rg3_61_I),
    .x62_real(rg3_62_R), .x62_imag(rg3_62_I), .x63_real(rg3_63_R), .x63_imag(rg3_63_I),

    .y0_real(ker_in_0_R), .y0_imag(ker_in_0_I), .y1_real(ker_in_1_R), .y1_imag(ker_in_1_I),
    .y2_real(ker_in_2_R), .y2_imag(ker_in_2_I), .y3_real(ker_in_3_R), .y3_imag(ker_in_3_I),
    .y4_real(ker_in_4_R), .y4_imag(ker_in_4_I), .y5_real(ker_in_5_R), .y5_imag(ker_in_5_I),
    .y6_real(ker_in_6_R), .y6_imag(ker_in_6_I), .y7_real(ker_in_7_R), .y7_imag(ker_in_7_I),
    .y8_real(ker_in_8_R), .y8_imag(ker_in_8_I), .y9_real(ker_in_9_R), .y9_imag(ker_in_9_I),
    .y10_real(ker_in_10_R), .y10_imag(ker_in_10_I), .y11_real(ker_in_11_R), .y11_imag(ker_in_11_I),
    .y12_real(ker_in_12_R), .y12_imag(ker_in_12_I), .y13_real(ker_in_13_R), .y13_imag(ker_in_13_I),
    .y14_real(ker_in_14_R), .y14_imag(ker_in_14_I), .y15_real(ker_in_15_R), .y15_imag(ker_in_15_I),
    .y16_real(ker_in_16_R), .y16_imag(ker_in_16_I), .y17_real(ker_in_17_R), .y17_imag(ker_in_17_I),
    .y18_real(ker_in_18_R), .y18_imag(ker_in_18_I), .y19_real(ker_in_19_R), .y19_imag(ker_in_19_I),
    .y20_real(ker_in_20_R), .y20_imag(ker_in_20_I), .y21_real(ker_in_21_R), .y21_imag(ker_in_21_I),
    .y22_real(ker_in_22_R), .y22_imag(ker_in_22_I), .y23_real(ker_in_23_R), .y23_imag(ker_in_23_I),
    .y24_real(ker_in_24_R), .y24_imag(ker_in_24_I), .y25_real(ker_in_25_R), .y25_imag(ker_in_25_I),
    .y26_real(ker_in_26_R), .y26_imag(ker_in_26_I), .y27_real(ker_in_27_R), .y27_imag(ker_in_27_I),
    .y28_real(ker_in_28_R), .y28_imag(ker_in_28_I), .y29_real(ker_in_29_R), .y29_imag(ker_in_29_I),
    .y30_real(ker_in_30_R), .y30_imag(ker_in_30_I), .y31_real(ker_in_31_R), .y31_imag(ker_in_31_I),
    .y32_real(ker_in_32_R), .y32_imag(ker_in_32_I), .y33_real(ker_in_33_R), .y33_imag(ker_in_33_I),
    .y34_real(ker_in_34_R), .y34_imag(ker_in_34_I), .y35_real(ker_in_35_R), .y35_imag(ker_in_35_I),
    .y36_real(ker_in_36_R), .y36_imag(ker_in_36_I), .y37_real(ker_in_37_R), .y37_imag(ker_in_37_I),
    .y38_real(ker_in_38_R), .y38_imag(ker_in_38_I), .y39_real(ker_in_39_R), .y39_imag(ker_in_39_I),
    .y40_real(ker_in_40_R), .y40_imag(ker_in_40_I), .y41_real(ker_in_41_R), .y41_imag(ker_in_41_I),
    .y42_real(ker_in_42_R), .y42_imag(ker_in_42_I), .y43_real(ker_in_43_R), .y43_imag(ker_in_43_I),
    .y44_real(ker_in_44_R), .y44_imag(ker_in_44_I), .y45_real(ker_in_45_R), .y45_imag(ker_in_45_I),
    .y46_real(ker_in_46_R), .y46_imag(ker_in_46_I), .y47_real(ker_in_47_R), .y47_imag(ker_in_47_I),
    .y48_real(ker_in_48_R), .y48_imag(ker_in_48_I), .y49_real(ker_in_49_R), .y49_imag(ker_in_49_I),
    .y50_real(ker_in_50_R), .y50_imag(ker_in_50_I), .y51_real(ker_in_51_R), .y51_imag(ker_in_51_I),
    .y52_real(ker_in_52_R), .y52_imag(ker_in_52_I), .y53_real(ker_in_53_R), .y53_imag(ker_in_53_I),
    .y54_real(ker_in_54_R), .y54_imag(ker_in_54_I), .y55_real(ker_in_55_R), .y55_imag(ker_in_55_I),
    .y56_real(ker_in_56_R), .y56_imag(ker_in_56_I), .y57_real(ker_in_57_R), .y57_imag(ker_in_57_I),
    .y58_real(ker_in_58_R), .y58_imag(ker_in_58_I), .y59_real(ker_in_59_R), .y59_imag(ker_in_59_I),
    .y60_real(ker_in_60_R), .y60_imag(ker_in_60_I), .y61_real(ker_in_61_R), .y61_imag(ker_in_61_I),
    .y62_real(ker_in_62_R), .y62_imag(ker_in_62_I), .y63_real(ker_in_63_R), .y63_imag(ker_in_63_I),

    .X0_real(ker_out_0_R), .X0_imag(ker_out_0_I), .X1_real(ker_out_1_R), .X1_imag(ker_out_1_I),
    .X2_real(ker_out_2_R), .X2_imag(ker_out_2_I), .X3_real(ker_out_3_R), .X3_imag(ker_out_3_I),
    .X4_real(ker_out_4_R), .X4_imag(ker_out_4_I), .X5_real(ker_out_5_R), .X5_imag(ker_out_5_I),
    .X6_real(ker_out_6_R), .X6_imag(ker_out_6_I), .X7_real(ker_out_7_R), .X7_imag(ker_out_7_I),
    .X8_real(ker_out_8_R), .X8_imag(ker_out_8_I), .X9_real(ker_out_9_R), .X9_imag(ker_out_9_I),
    .X10_real(ker_out_10_R), .X10_imag(ker_out_10_I), .X11_real(ker_out_11_R), .X11_imag(ker_out_11_I),
    .X12_real(ker_out_12_R), .X12_imag(ker_out_12_I), .X13_real(ker_out_13_R), .X13_imag(ker_out_13_I),
    .X14_real(ker_out_14_R), .X14_imag(ker_out_14_I), .X15_real(ker_out_15_R), .X15_imag(ker_out_15_I),
    .X16_real(ker_out_16_R), .X16_imag(ker_out_16_I), .X17_real(ker_out_17_R), .X17_imag(ker_out_17_I),
    .X18_real(ker_out_18_R), .X18_imag(ker_out_18_I), .X19_real(ker_out_19_R), .X19_imag(ker_out_19_I),
    .X20_real(ker_out_20_R), .X20_imag(ker_out_20_I), .X21_real(ker_out_21_R), .X21_imag(ker_out_21_I),
    .X22_real(ker_out_22_R), .X22_imag(ker_out_22_I), .X23_real(ker_out_23_R), .X23_imag(ker_out_23_I),
    .X24_real(ker_out_24_R), .X24_imag(ker_out_24_I), .X25_real(ker_out_25_R), .X25_imag(ker_out_25_I),
    .X26_real(ker_out_26_R), .X26_imag(ker_out_26_I), .X27_real(ker_out_27_R), .X27_imag(ker_out_27_I),
    .X28_real(ker_out_28_R), .X28_imag(ker_out_28_I), .X29_real(ker_out_29_R), .X29_imag(ker_out_29_I),
    .X30_real(ker_out_30_R), .X30_imag(ker_out_30_I), .X31_real(ker_out_31_R), .X31_imag(ker_out_31_I),
    .X32_real(ker_out_32_R), .X32_imag(ker_out_32_I), .X33_real(ker_out_33_R), .X33_imag(ker_out_33_I),
    .X34_real(ker_out_34_R), .X34_imag(ker_out_34_I), .X35_real(ker_out_35_R), .X35_imag(ker_out_35_I),
    .X36_real(ker_out_36_R), .X36_imag(ker_out_36_I), .X37_real(ker_out_37_R), .X37_imag(ker_out_37_I),
    .X38_real(ker_out_38_R), .X38_imag(ker_out_38_I), .X39_real(ker_out_39_R), .X39_imag(ker_out_39_I),
    .X40_real(ker_out_40_R), .X40_imag(ker_out_40_I), .X41_real(ker_out_41_R), .X41_imag(ker_out_41_I),
    .X42_real(ker_out_42_R), .X42_imag(ker_out_42_I), .X43_real(ker_out_43_R), .X43_imag(ker_out_43_I),
    .X44_real(ker_out_44_R), .X44_imag(ker_out_44_I), .X45_real(ker_out_45_R), .X45_imag(ker_out_45_I),
    .X46_real(ker_out_46_R), .X46_imag(ker_out_46_I), .X47_real(ker_out_47_R), .X47_imag(ker_out_47_I),
    .X48_real(ker_out_48_R), .X48_imag(ker_out_48_I), .X49_real(ker_out_49_R), .X49_imag(ker_out_49_I),
    .X50_real(ker_out_50_R), .X50_imag(ker_out_50_I), .X51_real(ker_out_51_R), .X51_imag(ker_out_51_I),
    .X52_real(ker_out_52_R), .X52_imag(ker_out_52_I), .X53_real(ker_out_53_R), .X53_imag(ker_out_53_I),
    .X54_real(ker_out_54_R), .X54_imag(ker_out_54_I), .X55_real(ker_out_55_R), .X55_imag(ker_out_55_I),
    .X56_real(ker_out_56_R), .X56_imag(ker_out_56_I), .X57_real(ker_out_57_R), .X57_imag(ker_out_57_I),
    .X58_real(ker_out_58_R), .X58_imag(ker_out_58_I), .X59_real(ker_out_59_R), .X59_imag(ker_out_59_I),
    .X60_real(ker_out_60_R), .X60_imag(ker_out_60_I), .X61_real(ker_out_61_R), .X61_imag(ker_out_61_I),
    .X62_real(ker_out_62_R), .X62_imag(ker_out_62_I), .X63_real(ker_out_63_R), .X63_imag(ker_out_63_I)
);

wire [31:0] rg4_0_R, rg4_0_I, rg4_1_R, rg4_1_I, rg4_2_R, rg4_2_I, rg4_3_R, rg4_3_I, rg4_4_R, rg4_4_I, rg4_5_R, rg4_5_I, rg4_6_R, rg4_6_I, rg4_7_R, rg4_7_I,
                rg4_8_R, rg4_8_I, rg4_9_R, rg4_9_I, rg4_10_R, rg4_10_I, rg4_11_R, rg4_11_I, rg4_12_R, rg4_12_I, rg4_13_R, rg4_13_I, rg4_14_R, rg4_14_I, rg4_15_R, rg4_15_I, rg4_16_R, rg4_16_I,
                rg4_17_R, rg4_17_I, rg4_18_R, rg4_18_I, rg4_19_R, rg4_19_I, rg4_20_R, rg4_20_I, rg4_21_R, rg4_21_I, rg4_22_R, rg4_22_I, rg4_23_R, rg4_23_I, rg4_24_R, rg4_24_I,
                rg4_25_R, rg4_25_I, rg4_26_R, rg4_26_I, rg4_27_R, rg4_27_I, rg4_28_R, rg4_28_I, rg4_29_R, rg4_29_I, rg4_30_R, rg4_30_I, rg4_31_R, rg4_31_I, rg4_32_R, rg4_32_I,
                rg4_33_R, rg4_33_I, rg4_34_R, rg4_34_I, rg4_35_R, rg4_35_I, rg4_36_R, rg4_36_I, rg4_37_R, rg4_37_I, rg4_38_R, rg4_38_I, rg4_39_R, rg4_39_I, rg4_40_R, rg4_40_I,
                rg4_41_R, rg4_41_I, rg4_42_R, rg4_42_I, rg4_43_R, rg4_43_I, rg4_44_R, rg4_44_I, rg4_45_R, rg4_45_I, rg4_46_R, rg4_46_I, rg4_47_R, rg4_47_I, rg4_48_R, rg4_48_I,
                rg4_49_R, rg4_49_I, rg4_50_R, rg4_50_I, rg4_51_R, rg4_51_I, rg4_52_R, rg4_52_I, rg4_53_R, rg4_53_I, rg4_54_R, rg4_54_I, rg4_55_R, rg4_55_I, rg4_56_R, rg4_56_I,
                rg4_57_R, rg4_57_I, rg4_58_R, rg4_58_I, rg4_59_R, rg4_59_I, rg4_60_R, rg4_60_I, rg4_61_R, rg4_61_I, rg4_62_R, rg4_62_I, rg4_63_R, rg4_63_I;


Register FilteredFrequencyBuffer(
    .clk(clk),
    .rst(rst),
    .in_0_R(ker_out_0_R), .in_0_I(ker_out_0_I), .in_1_R(ker_out_1_R), .in_1_I(ker_out_1_I),
    .in_2_R(ker_out_2_R), .in_2_I(ker_out_2_I), .in_3_R(ker_out_3_R), .in_3_I(ker_out_3_I),
    .in_4_R(ker_out_4_R), .in_4_I(ker_out_4_I), .in_5_R(ker_out_5_R), .in_5_I(ker_out_5_I),
    .in_6_R(ker_out_6_R), .in_6_I(ker_out_6_I), .in_7_R(ker_out_7_R), .in_7_I(ker_out_7_I),
    .in_8_R(ker_out_8_R), .in_8_I(ker_out_8_I), .in_9_R(ker_out_9_R), .in_9_I(ker_out_9_I),
    .in_10_R(ker_out_10_R), .in_10_I(ker_out_10_I), .in_11_R(ker_out_11_R), .in_11_I(ker_out_11_I),
    .in_12_R(ker_out_12_R), .in_12_I(ker_out_12_I), .in_13_R(ker_out_13_R), .in_13_I(ker_out_13_I),
    .in_14_R(ker_out_14_R), .in_14_I(ker_out_14_I), .in_15_R(ker_out_15_R), .in_15_I(ker_out_15_I),
    .in_16_R(ker_out_16_R), .in_16_I(ker_out_16_I), .in_17_R(ker_out_17_R), .in_17_I(ker_out_17_I),
    .in_18_R(ker_out_18_R), .in_18_I(ker_out_18_I), .in_19_R(ker_out_19_R), .in_19_I(ker_out_19_I),
    .in_20_R(ker_out_20_R), .in_20_I(ker_out_20_I), .in_21_R(ker_out_21_R), .in_21_I(ker_out_21_I),
    .in_22_R(ker_out_22_R), .in_22_I(ker_out_22_I), .in_23_R(ker_out_23_R), .in_23_I(ker_out_23_I),
    .in_24_R(ker_out_24_R), .in_24_I(ker_out_24_I), .in_25_R(ker_out_25_R), .in_25_I(ker_out_25_I),
    .in_26_R(ker_out_26_R), .in_26_I(ker_out_26_I), .in_27_R(ker_out_27_R), .in_27_I(ker_out_27_I),
    .in_28_R(ker_out_28_R), .in_28_I(ker_out_28_I), .in_29_R(ker_out_29_R), .in_29_I(ker_out_29_I),
    .in_30_R(ker_out_30_R), .in_30_I(ker_out_30_I), .in_31_R(ker_out_31_R), .in_31_I(ker_out_31_I),
    .in_32_R(ker_out_32_R), .in_32_I(ker_out_32_I), .in_33_R(ker_out_33_R), .in_33_I(ker_out_33_I),
    .in_34_R(ker_out_34_R), .in_34_I(ker_out_34_I), .in_35_R(ker_out_35_R), .in_35_I(ker_out_35_I),
    .in_36_R(ker_out_36_R), .in_36_I(ker_out_36_I), .in_37_R(ker_out_37_R), .in_37_I(ker_out_37_I),
    .in_38_R(ker_out_38_R), .in_38_I(ker_out_38_I), .in_39_R(ker_out_39_R), .in_39_I(ker_out_39_I),
    .in_40_R(ker_out_40_R), .in_40_I(ker_out_40_I), .in_41_R(ker_out_41_R), .in_41_I(ker_out_41_I),
    .in_42_R(ker_out_42_R), .in_42_I(ker_out_42_I), .in_43_R(ker_out_43_R), .in_43_I(ker_out_43_I),
    .in_44_R(ker_out_44_R), .in_44_I(ker_out_44_I), .in_45_R(ker_out_45_R), .in_45_I(ker_out_45_I),
    .in_46_R(ker_out_46_R), .in_46_I(ker_out_46_I), .in_47_R(ker_out_47_R), .in_47_I(ker_out_47_I),
    .in_48_R(ker_out_48_R), .in_48_I(ker_out_48_I), .in_49_R(ker_out_49_R), .in_49_I(ker_out_49_I),
    .in_50_R(ker_out_50_R), .in_50_I(ker_out_50_I), .in_51_R(ker_out_51_R), .in_51_I(ker_out_51_I),
    .in_52_R(ker_out_52_R), .in_52_I(ker_out_52_I), .in_53_R(ker_out_53_R), .in_53_I(ker_out_53_I),
    .in_54_R(ker_out_54_R), .in_54_I(ker_out_54_I), .in_55_R(ker_out_55_R), .in_55_I(ker_out_55_I),
    .in_56_R(ker_out_56_R), .in_56_I(ker_out_56_I), .in_57_R(ker_out_57_R), .in_57_I(ker_out_57_I),
    .in_58_R(ker_out_58_R), .in_58_I(ker_out_58_I), .in_59_R(ker_out_59_R), .in_59_I(ker_out_59_I),
    .in_60_R(ker_out_60_R), .in_60_I(ker_out_60_I), .in_61_R(ker_out_61_R), .in_61_I(ker_out_61_I),
    .in_62_R(ker_out_62_R), .in_62_I(ker_out_62_I), .in_63_R(ker_out_63_R), .in_63_I(ker_out_63_I),

    .out_0_R(rg4_0_R), .out_0_I(rg4_0_I), .out_1_R(rg4_1_R), .out_1_I(rg4_1_I),
    .out_2_R(rg4_2_R), .out_2_I(rg4_2_I), .out_3_R(rg4_3_R), .out_3_I(rg4_3_I),
    .out_4_R(rg4_4_R), .out_4_I(rg4_4_I), .out_5_R(rg4_5_R), .out_5_I(rg4_5_I),
    .out_6_R(rg4_6_R), .out_6_I(rg4_6_I), .out_7_R(rg4_7_R), .out_7_I(rg4_7_I),
    .out_8_R(rg4_8_R), .out_8_I(rg4_8_I), .out_9_R(rg4_9_R), .out_9_I(rg4_9_I),
    .out_10_R(rg4_10_R), .out_10_I(rg4_10_I), .out_11_R(rg4_11_R), .out_11_I(rg4_11_I),
    .out_12_R(rg4_12_R), .out_12_I(rg4_12_I), .out_13_R(rg4_13_R), .out_13_I(rg4_13_I),
    .out_14_R(rg4_14_R), .out_14_I(rg4_14_I), .out_15_R(rg4_15_R), .out_15_I(rg4_15_I),
    .out_16_R(rg4_16_R), .out_16_I(rg4_16_I), .out_17_R(rg4_17_R), .out_17_I(rg4_17_I),
    .out_18_R(rg4_18_R), .out_18_I(rg4_18_I), .out_19_R(rg4_19_R), .out_19_I(rg4_19_I),
    .out_20_R(rg4_20_R), .out_20_I(rg4_20_I), .out_21_R(rg4_21_R), .out_21_I(rg4_21_I),
    .out_22_R(rg4_22_R), .out_22_I(rg4_22_I), .out_23_R(rg4_23_R), .out_23_I(rg4_23_I),
    .out_24_R(rg4_24_R), .out_24_I(rg4_24_I), .out_25_R(rg4_25_R), .out_25_I(rg4_25_I),
    .out_26_R(rg4_26_R), .out_26_I(rg4_26_I), .out_27_R(rg4_27_R), .out_27_I(rg4_27_I),
    .out_28_R(rg4_28_R), .out_28_I(rg4_28_I), .out_29_R(rg4_29_R), .out_29_I(rg4_29_I),
    .out_30_R(rg4_30_R), .out_30_I(rg4_30_I), .out_31_R(rg4_31_R), .out_31_I(rg4_31_I),
    .out_32_R(rg4_32_R), .out_32_I(rg4_32_I), .out_33_R(rg4_33_R), .out_33_I(rg4_33_I),
    .out_34_R(rg4_34_R), .out_34_I(rg4_34_I), .out_35_R(rg4_35_R), .out_35_I(rg4_35_I),
    .out_36_R(rg4_36_R), .out_36_I(rg4_36_I), .out_37_R(rg4_37_R), .out_37_I(rg4_37_I),
    .out_38_R(rg4_38_R), .out_38_I(rg4_38_I), .out_39_R(rg4_39_R), .out_39_I(rg4_39_I),
    .out_40_R(rg4_40_R), .out_40_I(rg4_40_I), .out_41_R(rg4_41_R), .out_41_I(rg4_41_I),
    .out_42_R(rg4_42_R), .out_42_I(rg4_42_I), .out_43_R(rg4_43_R), .out_43_I(rg4_43_I),
    .out_44_R(rg4_44_R), .out_44_I(rg4_44_I), .out_45_R(rg4_45_R), .out_45_I(rg4_45_I),
    .out_46_R(rg4_46_R), .out_46_I(rg4_46_I), .out_47_R(rg4_47_R), .out_47_I(rg4_47_I),
    .out_48_R(rg4_48_R), .out_48_I(rg4_48_I), .out_49_R(rg4_49_R), .out_49_I(rg4_49_I),
    .out_50_R(rg4_50_R), .out_50_I(rg4_50_I), .out_51_R(rg4_51_R), .out_51_I(rg4_51_I),
    .out_52_R(rg4_52_R), .out_52_I(rg4_52_I), .out_53_R(rg4_53_R), .out_53_I(rg4_53_I),
    .out_54_R(rg4_54_R), .out_54_I(rg4_54_I), .out_55_R(rg4_55_R), .out_55_I(rg4_55_I),
    .out_56_R(rg4_56_R), .out_56_I(rg4_56_I), .out_57_R(rg4_57_R), .out_57_I(rg4_57_I),
    .out_58_R(rg4_58_R), .out_58_I(rg4_58_I), .out_59_R(rg4_59_R), .out_59_I(rg4_59_I),
    .out_60_R(rg4_60_R), .out_60_I(rg4_60_I), .out_61_R(rg4_61_R), .out_61_I(rg4_61_I),
    .out_62_R(rg4_62_R), .out_62_I(rg4_62_I), .out_63_R(ker_out_63_R), .out_63_I(ker_out_63_I)
);

wire [31:0] iftc_0_R, iftc_0_I, iftc_1_R, iftc_1_I, iftc_2_R, iftc_2_I, iftc_3_R, iftc_3_I,
            iftc_4_R, iftc_4_I, iftc_5_R, iftc_5_I, iftc_6_R, iftc_6_I, iftc_7_R, iftc_7_I,
            iftc_8_R, iftc_8_I, iftc_9_R, iftc_9_I, iftc_10_R, iftc_10_I, iftc_11_R, iftc_11_I,
            iftc_12_R, iftc_12_I, iftc_13_R, iftc_13_I, iftc_14_R, iftc_14_I, iftc_15_R, iftc_15_I,
            iftc_16_R, iftc_16_I, iftc_17_R, iftc_17_I, iftc_18_R, iftc_18_I, iftc_19_R, iftc_19_I,
            iftc_20_R, iftc_20_I, iftc_21_R, iftc_21_I, iftc_22_R, iftc_22_I, iftc_23_R, iftc_23_I,
            iftc_24_R, iftc_24_I, iftc_25_R, iftc_25_I, iftc_26_R, iftc_26_I, iftc_27_R, iftc_27_I,
            iftc_28_R, iftc_28_I, iftc_29_R, iftc_29_I, iftc_30_R, iftc_30_I, iftc_31_R, iftc_31_I,
            iftc_32_R, iftc_32_I, iftc_33_R, iftc_33_I, iftc_34_R, iftc_34_I, iftc_35_R, iftc_35_I,
            iftc_36_R, iftc_36_I, iftc_37_R, iftc_37_I, iftc_38_R, iftc_38_I, iftc_39_R, iftc_39_I,
            iftc_40_R, iftc_40_I, iftc_41_R, iftc_41_I, iftc_42_R, iftc_42_I, iftc_43_R, iftc_43_I,
            iftc_44_R, iftc_44_I, iftc_45_R, iftc_45_I, iftc_46_R, iftc_46_I, iftc_47_R, iftc_47_I,
            iftc_48_R, iftc_48_I, iftc_49_R, iftc_49_I, iftc_50_R, iftc_50_I, iftc_51_R, iftc_51_I,
            iftc_52_R, iftc_52_I, iftc_53_R, iftc_53_I, iftc_54_R, iftc_54_I, iftc_55_R, iftc_55_I,
            iftc_56_R, iftc_56_I, iftc_57_R, iftc_57_I, iftc_58_R, iftc_58_I, iftc_59_R, iftc_59_I,
            iftc_60_R, iftc_60_I, iftc_61_R, iftc_61_I, iftc_62_R, iftc_62_I, iftc_63_R, iftc_63_I;




ifft8pt ifft_col_0(
    .xr0(rg4_0_R), .xi0(rg4_0_I), .xr1(rg4_1_R), .xi1(rg4_1_I), .xr2(rg4_2_R), .xi2(rg4_2_I), .xr3(rg4_3_R), .xi3(rg4_3_I),
    .xr4(rg4_4_R), .xi4(rg4_4_I), .xr5(rg4_5_R), .xi5(rg4_5_I), .xr6(rg4_6_R), .xi6(rg4_6_I), .xr7(rg4_7_R), .xi7(rg4_7_I),
    .Xr0(iftc_0_R), .Xi0(iftc_0_I), .Xr1(iftc_1_R), .Xi1(iftc_1_I), .Xr2(iftc_2_R), .Xi2(iftc_2_I), .Xr3(iftc_3_R), .Xi3(iftc_3_I),
    .Xr4(iftc_4_R), .Xi4(iftc_4_I), .Xr5(iftc_5_R), .Xi5(iftc_5_I), .Xr6(iftc_6_R), .Xi6(iftc_6_I), .Xr7(iftc_7_R), .Xi7(iftc_7_I)
);

ifft8pt ifft_col_1(
    .xr0(rg4_8_R), .xi0(rg4_8_I), .xr1(rg4_9_R), .xi1(rg4_9_I), .xr2(rg4_10_R), .xi2(rg4_10_I), .xr3(rg4_11_R), .xi3(rg4_11_I),
    .xr4(rg4_12_R), .xi4(rg4_12_I), .xr5(rg4_13_R), .xi5(rg4_13_I), .xr6(rg4_14_R), .xi6(rg4_14_I), .xr7(rg4_15_R), .xi7(rg4_15_I),
    .Xr0(iftc_8_R), .Xi0(iftc_8_I), .Xr1(iftc_9_R), .Xi1(iftc_9_I), .Xr2(iftc_10_R), .Xi2(iftc_10_I), .Xr3(iftc_11_R), .Xi3(iftc_11_I),
    .Xr4(iftc_12_R), .Xi4(iftc_12_I), .Xr5(iftc_13_R), .Xi5(iftc_13_I), .Xr6(iftc_14_R), .Xi6(iftc_14_I), .Xr7(iftc_15_R), .Xi7(iftc_15_I)
);

ifft8pt ifft_col_2(
    .xr0(rg4_16_R), .xi0(rg4_16_I), .xr1(rg4_17_R), .xi1(rg4_17_I), .xr2(rg4_18_R), .xi2(rg4_18_I), .xr3(rg4_19_R), .xi3(rg4_19_I),
    .xr4(rg4_20_R), .xi4(rg4_20_I), .xr5(rg4_21_R), .xi5(rg4_21_I), .xr6(rg4_22_R), .xi6(rg4_22_I), .xr7(rg4_23_R), .xi7(rg4_23_I),
    .Xr0(iftc_16_R), .Xi0(iftc_16_I), .Xr1(iftc_17_R), .Xi1(iftc_17_I), .Xr2(iftc_18_R), .Xi2(iftc_18_I), .Xr3(iftc_19_R), .Xi3(iftc_19_I),
    .Xr4(iftc_20_R), .Xi4(iftc_20_I), .Xr5(iftc_21_R), .Xi5(iftc_21_I), .Xr6(iftc_22_R), .Xi6(iftc_22_I), .Xr7(iftc_23_R), .Xi7(iftc_23_I)
);

ifft8pt ifft_col_3(
    .xr0(rg4_24_R), .xi0(rg4_24_I), .xr1(rg4_25_R), .xi1(rg4_25_I), .xr2(rg4_26_R), .xi2(rg4_26_I), .xr3(rg4_27_R), .xi3(rg4_27_I),
    .xr4(rg4_28_R), .xi4(rg4_28_I), .xr5(rg4_29_R), .xi5(rg4_29_I), .xr6(rg4_30_R), .xi6(rg4_30_I), .xr7(rg4_31_R), .xi7(rg4_31_I),
    .Xr0(iftc_24_R), .Xi0(iftc_24_I), .Xr1(iftc_25_R), .Xi1(iftc_25_I), .Xr2(iftc_26_R), .Xi2(iftc_26_I), .Xr3(iftc_27_R), .Xi3(iftc_27_I),
    .Xr4(iftc_28_R), .Xi4(iftc_28_I), .Xr5(iftc_29_R), .Xi5(iftc_29_I), .Xr6(iftc_30_R), .Xi6(iftc_30_I), .Xr7(iftc_31_R), .Xi7(iftc_31_I)
);

ifft8pt ifft_col_4(
    .xr0(rg4_32_R), .xi0(rg4_32_I), .xr1(rg4_33_R), .xi1(rg4_33_I), .xr2(rg4_34_R), .xi2(rg4_34_I), .xr3(rg4_35_R), .xi3(rg4_35_I),
    .xr4(rg4_36_R), .xi4(rg4_36_I), .xr5(rg4_37_R), .xi5(rg4_37_I), .xr6(rg4_38_R), .xi6(rg4_38_I), .xr7(rg4_39_R), .xi7(rg4_39_I),
    .Xr0(iftc_32_R), .Xi0(iftc_32_I), .Xr1(iftc_33_R), .Xi1(iftc_33_I), .Xr2(iftc_34_R), .Xi2(iftc_34_I), .Xr3(iftc_35_R), .Xi3(iftc_35_I),
    .Xr4(iftc_36_R), .Xi4(iftc_36_I), .Xr5(iftc_37_R), .Xi5(iftc_37_I), .Xr6(iftc_38_R), .Xi6(iftc_38_I), .Xr7(iftc_39_R), .Xi7(iftc_39_I)
);

ifft8pt ifft_col_5(
    .xr0(rg4_40_R), .xi0(rg4_40_I), .xr1(rg4_41_R), .xi1(rg4_41_I), .xr2(rg4_42_R), .xi2(rg4_42_I), .xr3(rg4_43_R), .xi3(rg4_43_I),
    .xr4(rg4_44_R), .xi4(rg4_44_I), .xr5(rg4_45_R), .xi5(rg4_45_I), .xr6(rg4_46_R), .xi6(rg4_46_I), .xr7(rg4_47_R), .xi7(rg4_47_I),
    .Xr0(iftc_40_R), .Xi0(iftc_40_I), .Xr1(iftc_41_R), .Xi1(iftc_41_I), .Xr2(iftc_42_R), .Xi2(iftc_42_I), .Xr3(iftc_43_R), .Xi3(iftc_43_I),
    .Xr4(iftc_44_R), .Xi4(iftc_44_I), .Xr5(iftc_45_R), .Xi5(iftc_45_I), .Xr6(iftc_46_R), .Xi6(iftc_46_I), .Xr7(iftc_47_R), .Xi7(iftc_47_I)
);

ifft8pt ifft_col_6(
    .xr0(rg4_48_R), .xi0(rg4_48_I), .xr1(rg4_49_R), .xi1(rg4_49_I), .xr2(rg4_50_R), .xi2(rg4_50_I), .xr3(rg4_51_R), .xi3(rg4_51_I),
    .xr4(rg4_52_R), .xi4(rg4_52_I), .xr5(rg4_53_R), .xi5(rg4_53_I), .xr6(rg4_54_R), .xi6(rg4_54_I), .xr7(rg4_55_R), .xi7(rg4_55_I),
    .Xr0(iftc_48_R), .Xi0(iftc_48_I), .Xr1(iftc_49_R), .Xi1(iftc_49_I), .Xr2(iftc_50_R), .Xi2(iftc_50_I), .Xr3(iftc_51_R), .Xi3(iftc_51_I),
    .Xr4(iftc_52_R), .Xi4(iftc_52_I), .Xr5(iftc_53_R), .Xi5(iftc_53_I), .Xr6(iftc_54_R), .Xi6(iftc_54_I), .Xr7(iftc_55_R), .Xi7(iftc_55_I)
);

ifft8pt ifft_col_7(
    .xr0(rg4_56_R), .xi0(rg4_56_I), .xr1(rg4_57_R), .xi1(rg4_57_I), .xr2(rg4_58_R), .xi2(rg4_58_I), .xr3(rg4_59_R), .xi3(rg4_59_I),
    .xr4(rg4_60_R), .xi4(rg4_60_I), .xr5(rg4_61_R), .xi5(rg4_61_I), .xr6(rg4_62_R), .xi6(rg4_62_I), .xr7(rg4_63_R), .xi7(rg4_63_I),
    .Xr0(iftc_56_R), .Xi0(iftc_56_I), .Xr1(iftc_57_R), .Xi1(iftc_57_I), .Xr2(iftc_58_R), .Xi2(iftc_58_I), .Xr3(iftc_59_R), .Xi3(iftc_59_I),
    .Xr4(iftc_60_R), .Xi4(iftc_60_I), .Xr5(iftc_61_R), .Xi5(iftc_61_I), .Xr6(iftc_62_R), .Xi6(iftc_62_I), .Xr7(iftc_63_R), .Xi7(iftc_63_I)
);


wire [31:0] rg5_0_R, rg5_0_I, rg5_1_R, rg5_1_I, rg5_2_R, rg5_2_I, rg5_3_R, rg5_3_I, rg5_4_R, rg5_4_I, rg5_5_R, rg5_5_I, rg5_6_R, rg5_6_I, rg5_7_R, rg5_7_I,
                rg5_8_R, rg5_8_I, rg5_9_R, rg5_9_I, rg5_10_R, rg5_10_I, rg5_11_R, rg5_11_I, rg5_12_R, rg5_12_I, rg5_13_R, rg5_13_I, rg5_14_R, rg5_14_I, rg5_15_R, rg5_15_I, rg5_16_R, rg5_16_I,
                rg5_17_R, rg5_17_I, rg5_18_R, rg5_18_I, rg5_19_R, rg5_19_I, rg5_20_R, rg5_20_I, rg5_21_R, rg5_21_I, rg5_22_R, rg5_22_I, rg5_23_R, rg5_23_I, rg5_24_R, rg5_24_I,
                rg5_25_R, rg5_25_I, rg5_26_R, rg5_26_I, rg5_27_R, rg5_27_I, rg5_28_R, rg5_28_I, rg5_29_R, rg5_29_I, rg5_30_R, rg5_30_I, rg5_31_R, rg5_31_I, rg5_32_R, rg5_32_I,
                rg5_33_R, rg5_33_I, rg5_34_R, rg5_34_I, rg5_35_R, rg5_35_I, rg5_36_R, rg5_36_I, rg5_37_R, rg5_37_I, rg5_38_R, rg5_38_I, rg5_39_R, rg5_39_I, rg5_40_R, rg5_40_I,
                rg5_41_R, rg5_41_I, rg5_42_R, rg5_42_I, rg5_43_R, rg5_43_I, rg5_44_R, rg5_44_I, rg5_45_R, rg5_45_I, rg5_46_R, rg5_46_I, rg5_47_R, rg5_47_I, rg5_48_R, rg5_48_I,
                rg5_49_R, rg5_49_I, rg5_50_R, rg5_50_I, rg5_51_R, rg5_51_I, rg5_52_R, rg5_52_I, rg5_53_R, rg5_53_I, rg5_54_R, rg5_54_I, rg5_55_R, rg5_55_I, rg5_56_R, rg5_56_I,
                rg5_57_R, rg5_57_I, rg5_58_R, rg5_58_I, rg5_59_R, rg5_59_I, rg5_60_R, rg5_60_I, rg5_61_R, rg5_61_I, rg5_62_R, rg5_62_I, rg5_63_R, rg5_63_I;

Register TransposeBuffer2_rg5(
    .clk(clk),
    .rst(rst),
    .in_0_R(iftc_0_R), .in_0_I(iftc_0_I), .in_1_R(iftc_1_R), .in_1_I(iftc_1_I),
    .in_2_R(iftc_2_R), .in_2_I(iftc_2_I), .in_3_R(iftc_3_R), .in_3_I(iftc_3_I),
    .in_4_R(iftc_4_R), .in_4_I(iftc_4_I), .in_5_R(iftc_5_R), .in_5_I(iftc_5_I),
    .in_6_R(iftc_6_R), .in_6_I(iftc_6_I), .in_7_R(iftc_7_R), .in_7_I(iftc_7_I),
    .in_8_R(iftc_8_R), .in_8_I(iftc_8_I), .in_9_R(iftc_9_R), .in_9_I(iftc_9_I),
    .in_10_R(iftc_10_R), .in_10_I(iftc_10_I), .in_11_R(iftc_11_R), .in_11_I(iftc_11_I),
    .in_12_R(iftc_12_R), .in_12_I(iftc_12_I), .in_13_R(iftc_13_R), .in_13_I(iftc_13_I),
    .in_14_R(iftc_14_R), .in_14_I(iftc_14_I), .in_15_R(iftc_15_R), .in_15_I(iftc_15_I),
    .in_16_R(iftc_16_R), .in_16_I(iftc_16_I), .in_17_R(iftc_17_R), .in_17_I(iftc_17_I),
    .in_18_R(iftc_18_R), .in_18_I(iftc_18_I), .in_19_R(iftc_19_R), .in_19_I(iftc_19_I),
    .in_20_R(iftc_20_R), .in_20_I(iftc_20_I), .in_21_R(iftc_21_R), .in_21_I(iftc_21_I),
    .in_22_R(iftc_22_R), .in_22_I(iftc_22_I), .in_23_R(iftc_23_R), .in_23_I(iftc_23_I),
    .in_24_R(iftc_24_R), .in_24_I(iftc_24_I), .in_25_R(iftc_25_R), .in_25_I(iftc_25_I),
    .in_26_R(iftc_26_R), .in_26_I(iftc_26_I), .in_27_R(iftc_27_R), .in_27_I(iftc_27_I),
    .in_28_R(iftc_28_R), .in_28_I(iftc_28_I), .in_29_R(iftc_29_R), .in_29_I(iftc_29_I),
    .in_30_R(iftc_30_R), .in_30_I(iftc_30_I), .in_31_R(iftc_31_R), .in_31_I(iftc_31_I),
    .in_32_R(iftc_32_R), .in_32_I(iftc_32_I), .in_33_R(iftc_33_R), .in_33_I(iftc_33_I),
    .in_34_R(iftc_34_R), .in_34_I(iftc_34_I), .in_35_R(iftc_35_R), .in_35_I(iftc_35_I),
    .in_36_R(iftc_36_R), .in_36_I(iftc_36_I), .in_37_R(iftc_37_R), .in_37_I(iftc_37_I),
    .in_38_R(iftc_38_R), .in_38_I(iftc_38_I), .in_39_R(iftc_39_R), .in_39_I(iftc_39_I),
    .in_40_R(iftc_40_R), .in_40_I(iftc_40_I), .in_41_R(iftc_41_R), .in_41_I(iftc_41_I),
    .in_42_R(iftc_42_R), .in_42_I(iftc_42_I), .in_43_R(iftc_43_R), .in_43_I(iftc_43_I),
    .in_44_R(iftc_44_R), .in_44_I(iftc_44_I), .in_45_R(iftc_45_R), .in_45_I(iftc_45_I),
    .in_46_R(iftc_46_R), .in_46_I(iftc_46_I), .in_47_R(iftc_47_R), .in_47_I(iftc_47_I),
    .in_48_R(iftc_48_R), .in_48_I(iftc_48_I), .in_49_R(iftc_49_R), .in_49_I(iftc_49_I),
    .in_50_R(iftc_50_R), .in_50_I(iftc_50_I), .in_51_R(iftc_51_R), .in_51_I(iftc_51_I),
    .in_52_R(iftc_52_R), .in_52_I(iftc_52_I), .in_53_R(iftc_53_R), .in_53_I(iftc_53_I),
    .in_54_R(iftc_54_R), .in_54_I(iftc_54_I), .in_55_R(iftc_55_R), .in_55_I(iftc_55_I),
    .in_56_R(iftc_56_R), .in_56_I(iftc_56_I), .in_57_R(iftc_57_R), .in_57_I(iftc_57_I),
    .in_58_R(iftc_58_R), .in_58_I(iftc_58_I), .in_59_R(iftc_59_R), .in_59_I(iftc_59_I),
    .in_60_R(iftc_60_R), .in_60_I(iftc_60_I), .in_61_R(iftc_61_R), .in_61_I(iftc_61_I),
    .in_62_R(iftc_62_R), .in_62_I(iftc_62_I), .in_63_R(iftc_63_R), .in_63_I(iftc_63_I),

    .out_0_R(rg5_0_R), .out_0_I(rg5_0_I), .out_1_R(rg5_1_R), .out_1_I(rg5_1_I),
    .out_2_R(rg5_2_R), .out_2_I(rg5_2_I), .out_3_R(rg5_3_R), .out_3_I(rg5_3_I),
    .out_4_R(rg5_4_R), .out_4_I(rg5_4_I), .out_5_R(rg5_5_R), .out_5_I(rg5_5_I),
    .out_6_R(rg5_6_R), .out_6_I(rg5_6_I), .out_7_R(rg5_7_R), .out_7_I(rg5_7_I),
    .out_8_R(rg5_8_R), .out_8_I(rg5_8_I), .out_9_R(rg5_9_R), .out_9_I(rg5_9_I),
    .out_10_R(rg5_10_R), .out_10_I(rg5_10_I), .out_11_R(rg5_11_R), .out_11_I(rg5_11_I),
    .out_12_R(rg5_12_R), .out_12_I(rg5_12_I), .out_13_R(rg5_13_R), .out_13_I(rg5_13_I),
    .out_14_R(rg5_14_R), .out_14_I(rg5_14_I), .out_15_R(rg5_15_R), .out_15_I(rg5_15_I),
    .out_16_R(rg5_16_R), .out_16_I(rg5_16_I), .out_17_R(rg5_17_R), .out_17_I(rg5_17_I),
    .out_18_R(rg5_18_R), .out_18_I(rg5_18_I), .out_19_R(rg5_19_R), .out_19_I(rg5_19_I),
    .out_20_R(rg5_20_R), .out_20_I(rg5_20_I), .out_21_R(rg5_21_R), .out_21_I(rg5_21_I),
    .out_22_R(rg5_22_R), .out_22_I(rg5_22_I), .out_23_R(rg5_23_R), .out_23_I(rg5_23_I),
    .out_24_R(rg5_24_R), .out_24_I(rg5_24_I), .out_25_R(rg5_25_R), .out_25_I(rg5_25_I),
    .out_26_R(rg5_26_R), .out_26_I(rg5_26_I), .out_27_R(rg5_27_R), .out_27_I(rg5_27_I),
    .out_28_R(rg5_28_R), .out_28_I(rg5_28_I), .out_29_R(rg5_29_R), .out_29_I(rg5_29_I),
    .out_30_R(rg5_30_R), .out_30_I(rg5_30_I), .out_31_R(rg5_31_R), .out_31_I(rg5_31_I),
    .out_32_R(rg5_32_R), .out_32_I(rg5_32_I), .out_33_R(rg5_33_R), .out_33_I(rg5_33_I),
    .out_34_R(rg5_34_R), .out_34_I(rg5_34_I), .out_35_R(rg5_35_R), .out_35_I(rg5_35_I),
    .out_36_R(rg5_36_R), .out_36_I(rg5_36_I), .out_37_R(rg5_37_R), .out_37_I(rg5_37_I),
    .out_38_R(rg5_38_R), .out_38_I(rg5_38_I), .out_39_R(rg5_39_R), .out_39_I(rg5_39_I),
    .out_40_R(rg5_40_R), .out_40_I(rg5_40_I), .out_41_R(rg5_41_R), .out_41_I(rg5_41_I),
    .out_42_R(rg5_42_R), .out_42_I(rg5_42_I), .out_43_R(rg5_43_R), .out_43_I(rg5_43_I),
    .out_44_R(rg5_44_R), .out_44_I(rg5_44_I), .out_45_R(rg5_45_R), .out_45_I(rg5_45_I),
    .out_46_R(rg5_46_R), .out_46_I(rg5_46_I), .out_47_R(rg5_47_R), .out_47_I(rg5_47_I),
    .out_48_R(rg5_48_R), .out_48_I(rg5_48_I), .out_49_R(rg5_49_R), .out_49_I(rg5_49_I),
    .out_50_R(rg5_50_R), .out_50_I(rg5_50_I), .out_51_R(rg5_51_R), .out_51_I(rg5_51_I),
    .out_52_R(rg5_52_R), .out_52_I(rg5_52_I), .out_53_R(rg5_53_R), .out_53_I(rg5_53_I),
    .out_54_R(rg5_54_R), .out_54_I(rg5_54_I), .out_55_R(rg5_55_R), .out_55_I(rg5_55_I),
    .out_56_R(rg5_56_R), .out_56_I(rg5_56_I), .out_57_R(rg5_57_R), .out_57_I(rg5_57_I),
    .out_58_R(rg5_58_R), .out_58_I(rg5_58_I), .out_59_R(rg5_59_R), .out_59_I(rg5_59_I),
    .out_60_R(rg5_60_R), .out_60_I(rg5_60_I), .out_61_R(rg5_61_R), .out_61_I(rg5_61_I),
    .out_62_R(rg5_62_R), .out_62_I(rg5_62_I), .out_63_R(rg5_63_R), .out_63_I(rg5_63_I)
);



wire [31:0] iftr0_R, iftr0_I, iftr1_R, iftr1_I, iftr2_R, iftr2_I, iftr3_R, iftr3_I,
            iftr4_R, iftr4_I, iftr5_R, iftr5_I, iftr6_R, iftr6_I, iftr7_R, iftr7_I,
            iftr8_R, iftr8_I, iftr9_R, iftr9_I, iftr10_R, iftr10_I, iftr11_R, iftr11_I,
            iftr12_R, iftr12_I, iftr13_R, iftr13_I, iftr14_R, iftr14_I, iftr15_R, iftr15_I,
            iftr16_R, iftr16_I, iftr17_R, iftr17_I, iftr18_R, iftr18_I, iftr19_R, iftr19_I,
            iftr20_R, iftr20_I, iftr21_R, iftr21_I, iftr22_R, iftr22_I, iftr23_R, iftr23_I,
            iftr24_R, iftr24_I, iftr25_R, iftr25_I, iftr26_R, iftr26_I, iftr27_R, iftr27_I,
            iftr28_R, iftr28_I, iftr29_R, iftr29_I, iftr30_R, iftr30_I, iftr31_R, iftr31_I,
            iftr32_R, iftr32_I, iftr33_R, iftr33_I, iftr34_R, iftr34_I, iftr35_R, iftr35_I,
            iftr36_R, iftr36_I, iftr37_R, iftr37_I, iftr38_R, iftr38_I, iftr39_R, iftr39_I,
            iftr40_R, iftr40_I, iftr41_R, iftr41_I, iftr42_R, iftr42_I, iftr43_R, iftr43_I,
            iftr44_R, iftr44_I, iftr45_R, iftr45_I, iftr46_R, iftr46_I, iftr47_R, iftr47_I,
            iftr48_R, iftr48_I, iftr49_R, iftr49_I, iftr50_R, iftr50_I, iftr51_R, iftr51_I,
            iftr52_R, iftr52_I, iftr53_R, iftr53_I, iftr54_R, iftr54_I, iftr55_R, iftr55_I,
            iftr56_R, iftr56_I, iftr57_R, iftr57_I, iftr58_R, iftr58_I, iftr59_R, iftr59_I,
            iftr60_R, iftr60_I, iftr61_R, iftr61_I, iftr62_R, iftr62_I, iftr63_R, iftr63_I;

ifft8pt ifft_row_0(
    .xr0(rg5_0_R), .xi0(rg5_0_I), .xr1(rg5_1_R), .xi1(rg5_1_I), .xr2(rg5_2_R), .xi2(rg5_2_I), .xr3(rg5_3_R), .xi3(rg5_3_I),
    .xr4(rg5_4_R), .xi4(rg5_4_I), .xr5(rg5_5_R), .xi5(rg5_5_I), .xr6(rg5_6_R), .xi6(rg5_6_I), .xr7(rg5_7_R), .xi7(rg5_7_I),
    .Xr0(iftr0_R), .Xi0(iftr0_I), .Xr1(iftr1_R), .Xi1(iftr1_I), .Xr2(iftr2_R), .Xi2(iftr2_I), .Xr3(iftr3_R), .Xi3(iftr3_I),
    .Xr4(iftr4_R), .Xi4(iftr4_I), .Xr5(iftr5_R), .Xi5(iftr5_I), .Xr6(iftr6_R), .Xi6(iftr6_I), .Xr7(iftr7_R), .Xi7(iftr7_I)
);

ifft8pt ifft_row_1(
    .xr0(rg5_8_R), .xi0(rg5_8_I), .xr1(rg5_9_R), .xi1(rg5_9_I), .xr2(rg5_10_R), .xi2(rg5_10_I), .xr3(rg5_11_R), .xi3(rg5_11_I),
    .xr4(rg5_12_R), .xi4(rg5_12_I), .xr5(rg5_13_R), .xi5(rg5_13_I), .xr6(rg5_14_R), .xi6(rg5_14_I), .xr7(rg5_15_R), .xi7(rg5_15_I),
    .Xr0(iftr8_R), .Xi0(iftr8_I), .Xr1(iftr9_R), .Xi1(iftr9_I), .Xr2(iftr10_R), .Xi2(iftr10_I), .Xr3(iftr11_R), .Xi3(iftr11_I),
    .Xr4(iftr12_R), .Xi4(iftr12_I), .Xr5(iftr13_R), .Xi5(iftr13_I), .Xr6(iftr14_R), .Xi6(iftr14_I), .Xr7(iftr15_R), .Xi7(iftr15_I)
);

ifft8pt ifft_row_2(
    .xr0(rg5_16_R), .xi0(rg5_16_I), .xr1(rg5_17_R), .xi1(rg5_17_I), .xr2(rg5_18_R), .xi2(rg5_18_I), .xr3(rg5_19_R), .xi3(rg5_19_I),
    .xr4(rg5_20_R), .xi4(rg5_20_I), .xr5(rg5_21_R), .xi5(rg5_21_I), .xr6(rg5_22_R), .xi6(rg5_22_I), .xr7(rg5_23_R), .xi7(rg5_23_I),
    .Xr0(iftr16_R), .Xi0(iftr16_I), .Xr1(iftr17_R), .Xi1(iftr17_I), .Xr2(iftr18_R), .Xi2(iftr18_I), .Xr3(iftr19_R), .Xi3(iftr19_I),
    .Xr4(iftr20_R), .Xi4(iftr20_I), .Xr5(iftr21_R), .Xi5(iftr21_I), .Xr6(iftr22_R), .Xi6(iftr22_I), .Xr7(iftr23_R), .Xi7(iftr23_I)
);

ifft8pt ifft_row_3(
    .xr0(rg5_24_R), .xi0(rg5_24_I), .xr1(rg5_25_R), .xi1(rg5_25_I), .xr2(rg5_26_R), .xi2(rg5_26_I), .xr3(rg5_27_R), .xi3(rg5_27_I),
    .xr4(rg5_28_R), .xi4(rg5_28_I), .xr5(rg5_29_R), .xi5(rg5_29_I), .xr6(rg5_30_R), .xi6(rg5_30_I), .xr7(rg5_31_R), .xi7(rg5_31_I),
    .Xr0(iftr24_R), .Xi0(iftr24_I), .Xr1(iftr25_R), .Xi1(iftr25_I), .Xr2(iftr26_R), .Xi2(iftr26_I), .Xr3(iftr27_R), .Xi3(iftr27_I),
    .Xr4(iftr28_R), .Xi4(iftr28_I), .Xr5(iftr29_R), .Xi5(iftr29_I), .Xr6(iftr30_R), .Xi6(iftr30_I), .Xr7(iftr31_R), .Xi7(iftr31_I)
);

ifft8pt ifft_row_4(
    .xr0(rg5_32_R), .xi0(rg5_32_I), .xr1(rg5_33_R), .xi1(rg5_33_I), .xr2(rg5_34_R), .xi2(rg5_34_I), .xr3(rg5_35_R), .xi3(rg5_35_I),
    .xr4(rg5_36_R), .xi4(rg5_36_I), .xr5(rg5_37_R), .xi5(rg5_37_I), .xr6(rg5_38_R), .xi6(rg5_38_I), .xr7(rg5_39_R), .xi7(rg5_39_I),
    .Xr0(iftr32_R), .Xi0(iftr32_I), .Xr1(iftr33_R), .Xi1(iftr33_I), .Xr2(iftr34_R), .Xi2(iftr34_I), .Xr3(iftr35_R), .Xi3(iftr35_I),
    .Xr4(iftr36_R), .Xi4(iftr36_I), .Xr5(iftr37_R), .Xi5(iftr37_I), .Xr6(iftr38_R), .Xi6(iftr38_I), .Xr7(iftr39_R), .Xi7(iftr39_I)
);

ifft8pt ifft_row_5(
    .xr0(rg5_40_R), .xi0(rg5_40_I), .xr1(rg5_41_R), .xi1(rg5_41_I), .xr2(rg5_42_R), .xi2(rg5_42_I), .xr3(rg5_43_R), .xi3(rg5_43_I),
    .xr4(rg5_44_R), .xi4(rg5_44_I), .xr5(rg5_45_R), .xi5(rg5_45_I), .xr6(rg5_46_R), .xi6(rg5_46_I), .xr7(rg5_47_R), .xi7(rg5_47_I),
    .Xr0(iftr40_R), .Xi0(iftr40_I), .Xr1(iftr41_R), .Xi1(iftr41_I), .Xr2(iftr42_R), .Xi2(iftr42_I), .Xr3(iftr43_R), .Xi3(iftr43_I),
    .Xr4(iftr44_R), .Xi4(iftr44_I), .Xr5(iftr45_R), .Xi5(iftr45_I), .Xr6(iftr46_R), .Xi6(iftr46_I), .Xr7(iftr47_R), .Xi7(iftr47_I)
);

ifft8pt ifft_row_6(
    .xr0(rg5_48_R), .xi0(rg5_48_I), .xr1(rg5_49_R), .xi1(rg5_49_I), .xr2(rg5_50_R), .xi2(rg5_50_I), .xr3(rg5_51_R), .xi3(rg5_51_I),
    .xr4(rg5_52_R), .xi4(rg5_52_I), .xr5(rg5_53_R), .xi5(rg5_53_I), .xr6(rg5_54_R), .xi6(rg5_54_I), .xr7(rg5_55_R), .xi7(rg5_55_I),
    .Xr0(iftr48_R), .Xi0(iftr48_I), .Xr1(iftr49_R), .Xi1(iftr49_I), .Xr2(iftr50_R), .Xi2(iftr50_I), .Xr3(iftr51_R), .Xi3(iftr51_I),
    .Xr4(iftr52_R), .Xi4(iftr52_I), .Xr5(iftr53_R), .Xi5(iftr53_I), .Xr6(iftr54_R), .Xi6(iftr54_I), .Xr7(iftr55_R), .Xi7(iftr55_I)
);

ifft8pt ifft_row_7(
    .xr0(rg5_56_R), .xi0(rg5_56_I), .xr1(rg5_57_R), .xi1(rg5_57_I), .xr2(rg5_58_R), .xi2(rg5_58_I), .xr3(rg5_59_R), .xi3(rg5_59_I),
    .xr4(rg5_60_R), .xi4(rg5_60_I), .xr5(rg5_61_R), .xi5(rg5_61_I), .xr6(rg5_62_R), .xi6(rg5_62_I), .xr7(rg5_63_R), .xi7(rg5_63_I),
    .Xr0(iftr56_R), .Xi0(iftr56_I), .Xr1(iftr57_R), .Xi1(iftr57_I), .Xr2(iftr58_R), .Xi2(iftr58_I), .Xr3(iftr59_R), .Xi3(iftr59_I),
    .Xr4(iftr60_R), .Xi4(iftr60_I), .Xr5(iftr61_R), .Xi5(iftr61_I), .Xr6(iftr62_R), .Xi6(iftr62_I), .Xr7(iftr63_R), .Xi7(iftr63_I)
);


Register OutputBuffer(
    .clk(clk),
    .rst(rst),
    .in_0_R(iftr0_R), .in_0_I(iftr0_I), .in_1_R(iftr1_R), .in_1_I(iftr1_I),
    .in_2_R(iftr2_R), .in_2_I(iftr2_I), .in_3_R(iftr3_R), .in_3_I(iftr3_I),
    .in_4_R(iftr4_R), .in_4_I(iftr4_I), .in_5_R(iftr5_R), .in_5_I(iftr5_I),
    .in_6_R(iftr6_R), .in_6_I(iftr6_I), .in_7_R(iftr7_R), .in_7_I(iftr7_I),
    .in_8_R(iftr8_R), .in_8_I(iftr8_I), .in_9_R(iftr9_R), .in_9_I(iftr9_I),
    .in_10_R(iftr10_R), .in_10_I(iftr10_I), .in_11_R(iftr11_R), .in_11_I(iftr11_I),
    .in_12_R(iftr12_R), .in_12_I(iftr12_I), .in_13_R(iftr13_R), .in_13_I(iftr13_I),
    .in_14_R(iftr14_R), .in_14_I(iftr14_I), .in_15_R(iftr15_R), .in_15_I(iftr15_I),
    .in_16_R(iftr16_R), .in_16_I(iftr16_I), .in_17_R(iftr17_R), .in_17_I(iftr17_I),
    .in_18_R(iftr18_R), .in_18_I(iftr18_I), .in_19_R(iftr19_R), .in_19_I(iftr19_I),
    .in_20_R(iftr20_R), .in_20_I(iftr20_I), .in_21_R(iftr21_R), .in_21_I(iftr21_I),
    .in_22_R(iftr22_R), .in_22_I(iftr22_I), .in_23_R(iftr23_R), .in_23_I(iftr23_I),
    .in_24_R(iftr24_R), .in_24_I(iftr24_I), .in_25_R(iftr25_R), .in_25_I(iftr25_I),
    .in_26_R(iftr26_R), .in_26_I(iftr26_I), .in_27_R(iftr27_R), .in_27_I(iftr27_I),
    .in_28_R(iftr28_R), .in_28_I(iftr28_I), .in_29_R(iftr29_R), .in_29_I(iftr29_I),
    .in_30_R(iftr30_R), .in_30_I(iftr30_I), .in_31_R(iftr31_R), .in_31_I(iftr31_I),
    .in_32_R(iftr32_R), .in_32_I(iftr32_I), .in_33_R(iftr33_R), .in_33_I(iftr33_I),
    .in_34_R(iftr34_R), .in_34_I(iftr34_I), .in_35_R(iftr35_R), .in_35_I(iftr35_I),
    .in_36_R(iftr36_R), .in_36_I(iftr36_I), .in_37_R(iftr37_R), .in_37_I(iftr37_I),
    .in_38_R(iftr38_R), .in_38_I(iftr38_I), .in_39_R(iftr39_R), .in_39_I(iftr39_I),
    .in_40_R(iftr40_R), .in_40_I(iftr40_I), .in_41_R(iftr41_R), .in_41_I(iftr41_I),
    .in_42_R(iftr42_R), .in_42_I(iftr42_I), .in_43_R(iftr43_R), .in_43_I(iftr43_I),
    .in_44_R(iftr44_R), .in_44_I(iftr44_I), .in_45_R(iftr45_R), .in_45_I(iftr45_I),
    .in_46_R(iftr46_R), .in_46_I(iftr46_I), .in_47_R(iftr47_R), .in_47_I(iftr47_I),
    .in_48_R(iftr48_R), .in_48_I(iftr48_I), .in_49_R(iftr49_R), .in_49_I(iftr49_I),
    .in_50_R(iftr50_R), .in_50_I(iftr50_I), .in_51_R(iftr51_R), .in_51_I(iftr51_I),
    .in_52_R(iftr52_R), .in_52_I(iftr52_I), .in_53_R(iftr53_R), .in_53_I(iftr53_I),
    .in_54_R(iftr54_R), .in_54_I(iftr54_I), .in_55_R(iftr55_R), .in_55_I(iftr55_I),
    .in_56_R(iftr56_R), .in_56_I(iftr56_I), .in_57_R(iftr57_R), .in_57_I(iftr57_I),
    .in_58_R(iftr58_R), .in_58_I(iftr58_I), .in_59_R(iftr59_R), .in_59_I(iftr59_I),
    .in_60_R(iftr60_R), .in_60_I(iftr60_I), .in_61_R(iftr61_R), .in_61_I(iftr61_I),
    .in_62_R(iftr62_R), .in_62_I(iftr62_I), .in_63_R(iftr63_R), .in_63_I(iftr63_I),

    .out_0_R(Op_0_Real), .out_0_I(Op_0_Img), .out_1_R(Op_1_Real), .out_1_I(Op_1_Img),
    .out_2_R(Op_2_Real), .out_2_I(Op_2_Img), .out_3_R(Op_3_Real), .out_3_I(Op_3_Img),
    .out_4_R(Op_4_Real), .out_4_I(Op_4_Img), .out_5_R(Op_5_Real), .out_5_I(Op_5_Img),
    .out_6_R(Op_6_Real), .out_6_I(Op_6_Img), .out_7_R(Op_7_Real), .out_7_I(Op_7_Img),
    .out_8_R(Op_8_Real), .out_8_I(Op_8_Img), .out_9_R(Op_9_Real), .out_9_I(Op_9_Img),
    .out_10_R(Op_10_Real), .out_10_I(Op_10_Img), .out_11_R(Op_11_Real), .out_11_I(Op_11_Img),
    .out_12_R(Op_12_Real), .out_12_I(Op_12_Img), .out_13_R(Op_13_Real), .out_13_I(Op_13_Img),
    .out_14_R(Op_14_Real), .out_14_I(Op_14_Img), .out_15_R(Op_15_Real), .out_15_I(Op_15_Img),
    .out_16_R(Op_16_Real), .out_16_I(Op_16_Img), .out_17_R(Op_17_Real), .out_17_I(Op_17_Img),
    .out_18_R(Op_18_Real), .out_18_I(Op_18_Img), .out_19_R(Op_19_Real), .out_19_I(Op_19_Img),
    .out_20_R(Op_20_Real), .out_20_I(Op_20_Img), .out_21_R(Op_21_Real), .out_21_I(Op_21_Img),
    .out_22_R(Op_22_Real), .out_22_I(Op_22_Img), .out_23_R(Op_23_Real), .out_23_I(Op_23_Img),
    .out_24_R(Op_24_Real), .out_24_I(Op_24_Img), .out_25_R(Op_25_Real), .out_25_I(Op_25_Img),
    .out_26_R(Op_26_Real), .out_26_I(Op_26_Img), .out_27_R(Op_27_Real), .out_27_I(Op_27_Img),
    .out_28_R(Op_28_Real), .out_28_I(Op_28_Img), .out_29_R(Op_29_Real), .out_29_I(Op_29_Img),
    .out_30_R(Op_30_Real), .out_30_I(Op_30_Img), .out_31_R(Op_31_Real), .out_31_I(Op_31_Img),
    .out_32_R(Op_32_Real), .out_32_I(Op_32_Img), .out_33_R(Op_33_Real), .out_33_I(Op_33_Img),
    .out_34_R(Op_34_Real), .out_34_I(Op_34_Img), .out_35_R(Op_35_Real), .out_35_I(Op_35_Img),
    .out_36_R(Op_36_Real), .out_36_I(Op_36_Img), .out_37_R(Op_37_Real), .out_37_I(Op_37_Img),
    .out_38_R(Op_38_Real), .out_38_I(Op_38_Img), .out_39_R(Op_39_Real), .out_39_I(Op_39_Img),
    .out_40_R(Op_40_Real), .out_40_I(Op_40_Img), .out_41_R(Op_41_Real), .out_41_I(Op_41_Img),
    .out_42_R(Op_42_Real), .out_42_I(Op_42_Img), .out_43_R(Op_43_Real), .out_43_I(Op_43_Img),
    .out_44_R(Op_44_Real), .out_44_I(Op_44_Img), .out_45_R(Op_45_Real), .out_45_I(Op_45_Img),
    .out_46_R(Op_46_Real), .out_46_I(Op_46_Img), .out_47_R(Op_47_Real), .out_47_I(Op_47_Img),
    .out_48_R(Op_48_Real), .out_48_I(Op_48_Img), .out_49_R(Op_49_Real), .out_49_I(Op_49_Img),
    .out_50_R(Op_50_Real), .out_50_I(Op_50_Img), .out_51_R(Op_51_Real), .out_51_I(Op_51_Img),
    .out_52_R(Op_52_Real), .out_52_I(Op_52_Img), .out_53_R(Op_53_Real), .out_53_I(Op_53_Img),
    .out_54_R(Op_54_Real), .out_54_I(Op_54_Img), .out_55_R(Op_55_Real), .out_55_I(Op_55_Img),
    .out_56_R(Op_56_Real), .out_56_I(Op_56_Img), .out_57_R(Op_57_Real), .out_57_I(Op_57_Img),
    .out_58_R(Op_58_Real), .out_58_I(Op_58_Img), .out_59_R(Op_59_Real), .out_59_I(Op_59_Img),
    .out_60_R(Op_60_Real), .out_60_I(Op_60_Img), .out_61_R(Op_61_Real), .out_61_I(Op_61_Img),
    .out_62_R(Op_62_Real), .out_62_I(Op_62_Img), .out_63_R(Op_63_Real), .out_63_I(Op_63_Img)
);
endmodule