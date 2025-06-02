`timescale 1ns / 1ps

module tb;
    integer input_mem, output_mem;
    
    string line;
    string comment_identifier = "//";
    string check_comment;
    string image_meta;
    
    integer pixel,comment,char_count;
    integer img_height,img_width;
    integer chunk_in_x, chunk_in_y;
    integer pixel_count;
    integer chunkx, chunky;
    
    integer struct_count;
    
    integer chunk_position[2];
    integer chunk_data[8][8];
    integer processed_data[8][8][2];
    
    integer idx = 0;
    
    integer i = 0, j= 0;
    
    // output 
    string output_line;
    
    integer pipeline_latency = 7;  // Initial latency before first output appears
    integer total_chunks;
    // Module instant
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
    
    typedef struct {
        integer chunk_position[2];
        integer chunk_data[8][8];
    } chunk_block_struct;
    
    chunk_block_struct chunk_block[8100]; // chunk_in_x*chunk_in_y
    
     // Struct to store processed data (assuming we want to store outputs)
    typedef struct {
        integer chunk_position[2];
        integer processed_data[8][8][2]; // [row][col][0=real, 1=img]
    } processed_chunk_struct;
    
    processed_chunk_struct processed_chunks[8100];
    
    // Top module instantiation
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
    
    // Function to map 8×8 block to the 64 input ports
    task load_chunk_to_inputs(input int chunk_idx);
        idx = 0;
        
        // Map the 8×8 matrix from struct to the 64 inputs
        for (int r = 0; r < 8; r++) begin
            for (int c = 0; c < 8; c++) begin
                // Calculate flat index from row and column
                idx = r*8 + c;
                
                // Assign to the appropriate input port
                // Real part from chunk data, set imaginary part to 0 for this example
                case (idx)
                    0: begin Ip_0_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_0_Img = 0; end
                    1: begin Ip_1_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_1_Img = 0; end
                    2: begin Ip_2_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_2_Img = 0; end
                    3: begin Ip_3_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_3_Img = 0; end
                    4: begin Ip_4_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_4_Img = 0; end
                    5: begin Ip_5_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_5_Img = 0; end
                    6: begin Ip_6_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_6_Img = 0; end
                    7: begin Ip_7_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_7_Img = 0; end
                    8: begin Ip_8_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_8_Img = 0; end
                    9: begin Ip_9_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_9_Img = 0; end
                    10: begin Ip_10_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_10_Img = 0; end
                    11: begin Ip_11_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_11_Img = 0; end
                    12: begin Ip_12_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_12_Img = 0; end
                    13: begin Ip_13_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_13_Img = 0; end
                    14: begin Ip_14_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_14_Img = 0; end
                    15: begin Ip_15_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_15_Img = 0; end
                    16: begin Ip_16_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_16_Img = 0; end
                    17: begin Ip_17_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_17_Img = 0; end
                    18: begin Ip_18_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_18_Img = 0; end
                    19: begin Ip_19_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_19_Img = 0; end
                    20: begin Ip_20_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_20_Img = 0; end
                    21: begin Ip_21_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_21_Img = 0; end
                    22: begin Ip_22_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_22_Img = 0; end
                    23: begin Ip_23_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_23_Img = 0; end
                    24: begin Ip_24_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_24_Img = 0; end
                    25: begin Ip_25_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_25_Img = 0; end
                    26: begin Ip_26_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_26_Img = 0; end
                    27: begin Ip_27_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_27_Img = 0; end
                    28: begin Ip_28_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_28_Img = 0; end
                    29: begin Ip_29_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_29_Img = 0; end
                    30: begin Ip_30_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_30_Img = 0; end
                    31: begin Ip_31_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_31_Img = 0; end
                    32: begin Ip_32_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_32_Img = 0; end
                    33: begin Ip_33_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_33_Img = 0; end
                    34: begin Ip_34_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_34_Img = 0; end
                    35: begin Ip_35_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_35_Img = 0; end
                    36: begin Ip_36_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_36_Img = 0; end
                    37: begin Ip_37_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_37_Img = 0; end
                    38: begin Ip_38_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_38_Img = 0; end
                    39: begin Ip_39_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_39_Img = 0; end
                    40: begin Ip_40_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_40_Img = 0; end
                    41: begin Ip_41_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_41_Img = 0; end
                    42: begin Ip_42_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_42_Img = 0; end
                    43: begin Ip_43_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_43_Img = 0; end
                    44: begin Ip_44_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_44_Img = 0; end
                    45: begin Ip_45_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_45_Img = 0; end
                    46: begin Ip_46_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_46_Img = 0; end
                    47: begin Ip_47_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_47_Img = 0; end
                    48: begin Ip_48_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_48_Img = 0; end
                    49: begin Ip_49_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_49_Img = 0; end
                    50: begin Ip_50_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_50_Img = 0; end
                    51: begin Ip_51_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_51_Img = 0; end
                    52: begin Ip_52_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_52_Img = 0; end
                    53: begin Ip_53_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_53_Img = 0; end
                    54: begin Ip_54_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_54_Img = 0; end
                    55: begin Ip_55_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_55_Img = 0; end
                    56: begin Ip_56_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_56_Img = 0; end
                    57: begin Ip_57_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_57_Img = 0; end
                    58: begin Ip_58_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_58_Img = 0; end
                    59: begin Ip_59_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_59_Img = 0; end
                    60: begin Ip_60_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_60_Img = 0; end
                    61: begin Ip_61_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_61_Img = 0; end
                    62: begin Ip_62_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_62_Img = 0; end
                    63: begin Ip_63_Real = chunk_block[chunk_idx].chunk_data[r][c]; Ip_63_Img = 0; end
                endcase
            end
        end
    endtask
    
    // Task to save outputs back to a processed chunk struct
    task save_outputs_to_struct(input int chunk_idx);
        idx = 0;
        
        // Save positions
        processed_chunks[chunk_idx].chunk_position[0] = chunk_block[chunk_idx].chunk_position[0];
        processed_chunks[chunk_idx].chunk_position[1] = chunk_block[chunk_idx].chunk_position[1];
        
        $display("Saving output chunk %d", chunk_idx);
        // Store output values
        for (int r = 0; r < 8; r++) begin
            for (int c = 0; c < 8; c++) begin
                idx = r*8 + c;
                
                // Save Real and Imaginary parts to processed data struct
                case (idx)
                    0: begin
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_0_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_0_Img;
                    end
                    1: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_1_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_1_Img;
                    end
                    2: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_2_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_2_Img;
                    end
                    3: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_3_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_3_Img;
                    end
                    4: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_4_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_4_Img;
                    end
                    5: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_5_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_5_Img;
                    end
                    6: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_6_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_6_Img;
                    end
                    7: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_7_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_7_Img;
                    end
                    8: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_8_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_8_Img;
                    end
                    9: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_9_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_9_Img;
                    end
                    10: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_10_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_10_Img;
                    end
                    11: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_11_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_11_Img;
                    end
                    12: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_12_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_12_Img;
                    end
                    13: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_13_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_13_Img;
                    end
                    14: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_14_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_14_Img;
                    end
                    15: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_15_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_15_Img;
                    end
                    16: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_16_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_16_Img;
                    end
                    17: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_17_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_17_Img;
                    end
                    18: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_18_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_18_Img;
                    end
                    19: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_19_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_19_Img;
                    end
                    20: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_20_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_20_Img;
                    end
                    21: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_21_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_21_Img;
                    end
                    22: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_22_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_22_Img;
                    end
                    23: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_23_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_23_Img;
                    end
                    24: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_24_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_24_Img;
                    end
                    25: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_25_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_25_Img;
                    end
                    26: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_26_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_26_Img;
                    end
                    27: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_27_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_27_Img;
                    end
                    28: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_28_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_28_Img;
                    end
                    29: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_29_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_29_Img;
                    end
                    30: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_30_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_30_Img;
                    end
                    31: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_31_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_31_Img;
                    end
                    32: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_32_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_32_Img;
                    end
                    33: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_33_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_33_Img;
                    end
                    34: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_34_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_34_Img;
                    end
                    35: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_35_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_35_Img;
                    end
                    36: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_36_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_36_Img;
                    end
                    37: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_37_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_37_Img;
                    end
                    38: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_38_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_38_Img;
                    end
                    39: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_39_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_39_Img;
                    end
                    40: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_40_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_40_Img;
                    end
                    41: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_41_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_41_Img;
                    end
                    42: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_42_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_42_Img;
                    end
                    43: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_43_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_43_Img;
                    end
                    44: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_44_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_44_Img;
                    end
                    45: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_45_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_45_Img;
                    end
                    46: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_46_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_46_Img;
                    end
                    47: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_47_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_47_Img;
                    end
                    48: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_48_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_48_Img;
                    end
                    49: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_49_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_49_Img;
                    end
                    50: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_50_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_50_Img;
                    end
                    51: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_51_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_51_Img;
                    end
                    52: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_52_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_52_Img;
                    end
                    53: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_53_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_53_Img;
                    end
                    54: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_54_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_54_Img;
                    end
                    55: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_55_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_55_Img;
                    end
                    56: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_56_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_56_Img;
                    end
                    57: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_57_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_57_Img;
                    end
                    58: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_58_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_58_Img;
                    end
                    59: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_59_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_59_Img;
                    end
                    60: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_60_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_60_Img;
                    end
                    61: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_61_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_61_Img;
                    end
                    62: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_62_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_62_Img;
                    end
                    63: begin 
                        processed_chunks[chunk_idx].processed_data[r][c][0] = Op_63_Real;
                        processed_chunks[chunk_idx].processed_data[r][c][1] = Op_63_Img;
                    end
                endcase
            end
        end
        $display("Done! Saving output chunk %d", chunk_idx);
        
    endtask
        
    // Clock generation
    initial begin
        clk = 0;
        forever #100 clk = ~clk; // 10ns period clock
    end
    
    // Reset generation
    initial begin
        rst = 1;
        #200 rst = 0; // Release reset after 20ns
    end
    
    initial begin
        input_mem = $fopen("data.mem", "r");
        
        if (input_mem) begin
            $display("Opening input_mem file: %0d", input_mem);
            $fgets(image_meta,input_mem);
            $display("Reading line : %s", image_meta);
        end
        
        while (!$feof(input_mem)) begin
            char_count = $fgets(line, input_mem);
            // $display ("char count : %d", char_count);
            check_comment = line.substr(0,1);
            if (char_count == 9 && check_comment.compare(comment_identifier)) begin
//                $display("Inside chunk data");
                chunk_block[struct_count].chunk_data[i][j] = line.atohex();
                j += 1;
                if (j == 8) begin
                    j = 0;
                    i += 1;
                end 
            end
            else if (char_count > 3) begin
                if (!check_comment.compare(comment_identifier)) begin
//                    $display("Found comment \n %s",line);
                    if ($sscanf(line, "// Dimensions: %0dx%0d", img_height, img_width) == 2) begin
//                        $display("Found Image meta data \n Height: %d, Width: %d", img_height, img_width);
                    end
                    else if ($sscanf(line, "// Chunks: %0dx%0d", chunk_in_x, chunk_in_y) == 2) begin
//                        $display("Found Chunk count \n Height: %d, Width: %d", chunk_in_x, chunk_in_y);
                          total_chunks = chunk_in_x*chunk_in_x;
                    end
                    
                    else if ($sscanf(line, "// Total pixels: %0d", pixel_count) == 1) begin
//                        $display("Found pixel count \n No. of pixel: %d", pixel_count);
                    end
                    
                    else if ($sscanf(line, "// Chunk at position (%0d, %0d)", chunkx, chunky) == 2) begin
//                        $display("Currently in \n Chunk x : %d, Chunk y : %d", chunkx, chunky);
                        struct_count = (chunkx == 0 && chunky == 0) ? 0: struct_count + 1;
                        i = 0;
                        j = 0;
                        chunk_block[struct_count].chunk_position[0] = chunkx;
                        chunk_block[struct_count].chunk_position[1] = chunky;
                    end
                    else
                        $display("Found comment of other form\n %s",line);
                end
            end
            else
                $display("Line of other form\n %s",line);
        end
        
        $fclose(input_mem);
        
        // random read of input struct
//        $display("Block %0d - Coords: %0d, %0d", 0,
//                 chunk_block[0].chunk_position[0],
//                 chunk_block[0].chunk_position[1]);
//        for (int i = 0; i < 8; i++) begin
//            for (int j = 0; j < 8; j++) begin
//                $display("%h ", chunk_block[0].chunk_data[i][j]);
//            end
//            $display("\n");
//        end
        
        // Wait for reset to complete
        @(negedge rst);
        $display("Reset pulled low");
        
        // Start the pipeline by loading the first few chunks
        for (int i = 0; i < pipeline_latency; i++) begin
            if (i < total_chunks) begin
                load_chunk_to_inputs(i);
                @(posedge clk);
                $display("Flushing the inputs %d", i);
            end
        end
        
        // Process remaining chunks with pipelining
        // At this point, outputs should start appearing for the first chunk
        for (int i = 0; i < total_chunks; i++) begin
            // Load next chunk input (if available)
            if (i + pipeline_latency < total_chunks) begin
                load_chunk_to_inputs(i + pipeline_latency);
            end
            
            // Save output of current chunk
            save_outputs_to_struct(i);
            
            // Display progress
            $display("Processed chunk done %0d ", (i/total_chunks) * 100 );
            
            // Wait for next clock cycle
            @(posedge clk);
        end
        
        $display("All chunks processed!");
        
        output_mem = $fopen("output_data.mem", "w");
    
        if (output_mem) begin
            $display("Opening output_mem file for writing: %0d", output_mem);
            
            // Write header information
            $fdisplay(output_mem, "%s",image_meta);
            $fdisplay(output_mem, "// Dimensions: %0dx%0d", img_height, img_width);
            $fdisplay(output_mem, "// Chunks: %0dx%0d", chunk_in_x, chunk_in_y);
            $fdisplay(output_mem, "// Total pixels: %0d", pixel_count);
            $fdisplay(output_mem, "// Format: one pixel per line (8-bit hex value)");
            
            // Write chunk data
            for (int chunk_idx = 0; chunk_idx <= struct_count; chunk_idx++) begin
                // Write chunk position header
                $fdisplay(output_mem, "// Chunk at position (%0d, %0d)", 
                          processed_chunks[chunk_idx].chunk_position[0], 
                          processed_chunks[chunk_idx].chunk_position[1]);
                
                // Write the 8x8 chunk data
                for (int i = 0; i < 8; i++) begin
                    for (int j = 0; j < 8; j++) begin
                        // Convert from integer to hex string format without 0x prefix
                        $fdisplay(output_mem, "%0h", processed_chunks[chunk_idx].processed_data[i][j][0]);
                    end
                end
            end
            
            $fclose(output_mem);
            $display("Successfully wrote data to output_data.mem");
        end
        else begin
            $display("Error: Could not open output file");
        end
    end
endmodule
