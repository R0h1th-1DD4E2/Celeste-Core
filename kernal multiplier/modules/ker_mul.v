`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 11:51:06 AM
// Design Name: 
// Module Name: cmpx_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ker_mul#(parameter N =32)
( input clk,

    input wire rst,
    
    // Handshake signals
    input wire in_valid,
    output reg in_ready,
    output reg out_valid,
    input wire out_ready,

  input [N-1:0] x0_real, x0_imag,
  input [N-1:0] x1_real, x1_imag,
  input [N-1:0] x2_real, x2_imag,
  input [N-1:0] x3_real, x3_imag,
  input [N-1:0] x4_real, x4_imag,
  input [N-1:0] x5_real, x5_imag,
  input [N-1:0] x6_real, x6_imag,
  input [N-1:0] x7_real, x7_imag,
  input [N-1:0] x8_real, x8_imag,
  input [N-1:0] x9_real, x9_imag,
  input [N-1:0] x10_real, x10_imag,
  input [N-1:0] x11_real, x11_imag,
  input [N-1:0] x12_real, x12_imag,
  input [N-1:0] x13_real, x13_imag,
  input [N-1:0] x14_real, x14_imag,
  input [N-1:0] x15_real, x15_imag,

  output reg [N-1:0] X0_real, X0_imag,
  output reg [N-1:0] X1_real, X1_imag,
  output reg [N-1:0] X2_real, X2_imag,
  output reg [N-1:0] X3_real, X3_imag,
  output reg [N-1:0] X4_real, X4_imag,
  output reg [N-1:0] X5_real, X5_imag,
  output reg [N-1:0] X6_real, X6_imag,
  output reg [N-1:0] X7_real, X7_imag,
  output reg [N-1:0] X8_real, X8_imag,
  output reg [N-1:0] X9_real, X9_imag,
  output reg [N-1:0] X10_real, X10_imag,
  output reg [N-1:0] X11_real, X11_imag,
  output reg [N-1:0] X12_real, X12_imag,
  output reg [N-1:0] X13_real, X13_imag,
  output reg [N-1:0] X14_real, X14_imag,
  output reg [N-1:0] X15_real, X15_imag);


localparam signed [N-1:0] 
    ker_r0  = 32'h3951b717, ker_r1  = 32'h399d4952, ker_r2  = 32'h3a03126f, ker_r3  = 32'h3b2a64c3, ker_r4  = 32'hbc7765fe, ker_r5  = 32'h3b2a64c3, ker_r6  = 32'h3a03126f, ker_r7  = 32'h399d4952,
    ker_r8  = 32'h399d4952, ker_r9  = 32'h399d4952, ker_r10 = 32'h3a1d4952, ker_r11 = 32'h3b4b295f, ker_r12 = 32'hbc91d14e, ker_r13 = 32'h3b4b295f, ker_r14 = 32'h3a1d4952, ker_r15 = 32'h399d4952,
    ker_r16 = 32'h3a03126f, ker_r17 = 32'h3a1d4952, ker_r18 = 32'h3a83126f, ker_r19 = 32'h3bb0f27c, ker_r20 = 32'hbcfec56d, ker_r21 = 32'h3bb0f27c, ker_r22 = 32'h3a83126f, ker_r23 = 32'h3a1d4952,
    ker_r24 = 32'h3b2a64c3, ker_r25 = 32'h3b4b295f, ker_r26 = 32'h3bb0f27c, ker_r27 = 32'h3cf9db23, ker_r28 = 32'hbe32e48f, ker_r29 = 32'h3cf9db23, ker_r30 = 32'h3bb0f27c, ker_r31 = 32'h3b4b295f,
    ker_r32 = 32'hbc7765fe, ker_r33 = 32'hbc91d14e, ker_r34 = 32'hbcfec56d, ker_r35 = 32'hbe32e48f, ker_r36 = 32'h3f800000, ker_r37 = 32'hbe32e48f, ker_r38 = 32'hbcfec56d, ker_r39 = 32'hbc91d14e,
    ker_r40 = 32'h3b2a64c3, ker_r41 = 32'h3b4b295f, ker_r42 = 32'h3bb0f27c, ker_r43 = 32'h3cf9db23, ker_r44 = 32'hbe32e48f, ker_r45 = 32'h3cf9db23, ker_r46 = 32'h3bb0f27c, ker_r47 = 32'h3b4b295f,
    ker_r48 = 32'h3a03126f, ker_r49 = 32'h3a1d4952, ker_r50 = 32'h3a83126f, ker_r51 = 32'h3bb0f27c, ker_r52 = 32'hbcfec56d, ker_r53 = 32'h3bb0f27c, ker_r54 = 32'h3a83126f, ker_r55 = 32'h3a1d4952,
    ker_r56 = 32'h399d4952, ker_r57 = 32'h399d4952, ker_r58 = 32'h3a1d4952, ker_r59 = 32'h3b4b295f, ker_r60 = 32'hbc91d14e, ker_r61 = 32'h3b4b295f, ker_r62 = 32'h3a1d4952, ker_r63 = 32'h399d4952;

    localparam signed [N-1:0] ker_i0 = 32'h0, ker_i1 = 32'h0, ker_i2 = 32'h0, ker_i3 = 32'h0, ker_i4 = 32'h0, ker_i5 = 32'h0, ker_i6 = 32'h0, ker_i7 = 32'h0,
                        ker_i8 = 32'h0, ker_i9 = 32'h0, ker_i10 = 32'h0, ker_i11 = 32'h0, ker_i12 = 32'h0, ker_i13 = 32'h0, ker_i14 = 32'h0, ker_i15 = 32'h0,
                        ker_i16 = 32'h0, ker_i17 = 32'h0, ker_i18 = 32'h0, ker_i19 = 32'h0, ker_i20 = 32'h0, ker_i21 = 32'h0, ker_i22 = 32'h0, ker_i23 = 32'h0,
                        ker_i24 = 32'h0, ker_i25 = 32'h0, ker_i26 = 32'h0, ker_i27 = 32'h0, ker_i28 = 32'h0, ker_i29 = 32'h0, ker_i30 = 32'h0, ker_i31 = 32'h0,
                        ker_i32 = 32'h0, ker_i33 = 32'h0, ker_i34 = 32'h0, ker_i35 = 32'h0, ker_i36 = 32'h0, ker_i37 = 32'h0, ker_i38 = 32'h0, ker_i39 = 32'h0,
                        ker_i40 = 32'h0, ker_i41 = 32'h0, ker_i42 = 32'h0, ker_i43 = 32'h0, ker_i44 = 32'h0, ker_i45 = 32'h0, ker_i46 = 32'h0, ker_i47 = 32'h0,
                        ker_i48 = 32'h0, ker_i49 = 32'h0, ker_i50 = 32'h0, ker_i51 = 32'h0, ker_i52 = 32'h0, ker_i53 = 32'h0, ker_i54 = 32'h0, ker_i55 = 32'h0,
                        ker_i56 = 32'h0, ker_i57 = 32'h0, ker_i58 = 32'h0, ker_i59 = 32'h0, ker_i60 = 32'h0, ker_i61 = 32'h0, ker_i62 = 32'h0, ker_i63 = 32'h0;


    localparam IDLE = 2'b00;
    localparam PROCESSING = 2'b01;
    localparam DONE = 2'b10;
    
    reg [1:0] state, next_state;
    reg processing_done;
    reg [1:0]ker_cnt = 0;


// wires for the clock 
    reg [N-1:0] mul_x0_real, mul_x0_imag;
    reg [N-1:0] mul_x1_real, mul_x1_imag;
    reg [N-1:0] mul_x2_real, mul_x2_imag;
    reg [N-1:0] mul_x3_real, mul_x3_imag;
    reg [N-1:0] mul_x4_real, mul_x4_imag;
    reg [N-1:0] mul_x5_real, mul_x5_imag;
    reg [N-1:0] mul_x6_real, mul_x6_imag;
    reg [N-1:0] mul_x7_real, mul_x7_imag;
    reg [N-1:0] mul_x8_real, mul_x8_imag;
    reg [N-1:0] mul_x9_real, mul_x9_imag;
    reg [N-1:0] mul_x10_real, mul_x10_imag;
    reg [N-1:0] mul_x11_real, mul_x11_imag;
    reg [N-1:0] mul_x12_real, mul_x12_imag;
    reg [N-1:0] mul_x13_real, mul_x13_imag;
    reg [N-1:0] mul_x14_real, mul_x14_imag;
    reg [N-1:0] mul_x15_real, mul_x15_imag;

    reg [N-1:0] mul_y0_real, mul_y0_imag;
    reg [N-1:0] mul_y1_real, mul_y1_imag;
    reg [N-1:0] mul_y2_real, mul_y2_imag;
    reg [N-1:0] mul_y3_real, mul_y3_imag;
    reg [N-1:0] mul_y4_real, mul_y4_imag;
    reg [N-1:0] mul_y5_real, mul_y5_imag;
    reg [N-1:0] mul_y6_real, mul_y6_imag;
    reg [N-1:0] mul_y7_real, mul_y7_imag;
    reg [N-1:0] mul_y8_real, mul_y8_imag;
    reg [N-1:0] mul_y9_real, mul_y9_imag;
    reg [N-1:0] mul_y10_real, mul_y10_imag;
    reg [N-1:0] mul_y11_real, mul_y11_imag;
    reg [N-1:0] mul_y12_real, mul_y12_imag;
    reg [N-1:0] mul_y13_real, mul_y13_imag;
    reg [N-1:0] mul_y14_real, mul_y14_imag;
    reg [N-1:0] mul_y15_real, mul_y15_imag;

    wire [N-1:0] mul_X0_real, mul_X0_imag;
    wire [N-1:0] mul_X1_real, mul_X1_imag;
    wire [N-1:0] mul_X2_real, mul_X2_imag;
    wire [N-1:0] mul_X3_real, mul_X3_imag;
    wire [N-1:0] mul_X4_real, mul_X4_imag;
    wire [N-1:0] mul_X5_real, mul_X5_imag;
    wire [N-1:0] mul_X6_real, mul_X6_imag;
    wire [N-1:0] mul_X7_real, mul_X7_imag;
    wire [N-1:0] mul_X8_real, mul_X8_imag;
    wire [N-1:0] mul_X9_real, mul_X9_imag;
    wire [N-1:0] mul_X10_real, mul_X10_imag;
    wire [N-1:0] mul_X11_real, mul_X11_imag;
    wire [N-1:0] mul_X12_real, mul_X12_imag;
    wire [N-1:0] mul_X13_real, mul_X13_imag;
    wire [N-1:0] mul_X14_real, mul_X14_imag;
    wire [N-1:0] mul_X15_real, mul_X15_imag;


    cmpx_mul #(
    .N(32)  
) u_cmpx_mul (
    // Inputs for x0 to x15
    .x0_real(mul_x0_real),  .x0_imag(mul_x0_imag),
    .x1_real(mul_x1_real),  .x1_imag(mul_x1_imag),
    .x2_real(mul_x2_real),  .x2_imag(mul_x2_imag),
    .x3_real(mul_x3_real),  .x3_imag(mul_x3_imag),
    .x4_real(mul_x4_real),  .x4_imag(mul_x4_imag),
    .x5_real(mul_x5_real),  .x5_imag(mul_x5_imag),
    .x6_real(mul_x6_real),  .x6_imag(mul_x6_imag),
    .x7_real(mul_x7_real),  .x7_imag(mul_x7_imag),
    .x8_real(mul_x8_real),  .x8_imag(mul_x8_imag),
    .x9_real(mul_x9_real),  .x9_imag(mul_x9_imag),
    .x10_real(mul_x10_real), .x10_imag(mul_x10_imag),
    .x11_real(mul_x11_real), .x11_imag(mul_x11_imag),
    .x12_real(mul_x12_real), .x12_imag(mul_x12_imag),
    .x13_real(mul_x13_real), .x13_imag(mul_x13_imag),
    .x14_real(mul_x14_real), .x14_imag(mul_x14_imag),
    .x15_real(mul_x15_real), .x15_imag(mul_x15_imag),

    // Inputs for y0 to y15
    .y0_real(mul_y0_real),  .y0_imag(mul_y0_imag),
    .y1_real(mul_y1_real),  .y1_imag(mul_y1_imag),
    .y2_real(mul_y2_real),  .y2_imag(mul_y2_imag),
    .y3_real(mul_y3_real),  .y3_imag(mul_y3_imag),
    .y4_real(mul_y4_real),  .y4_imag(mul_y4_imag),
    .y5_real(mul_y5_real),  .y5_imag(mul_y5_imag),
    .y6_real(mul_y6_real),  .y6_imag(mul_y6_imag),
    .y7_real(mul_y7_real),  .y7_imag(mul_y7_imag),
    .y8_real(mul_y8_real),  .y8_imag(mul_y8_imag),
    .y9_real(mul_y9_real),  .y9_imag(mul_y9_imag),
    .y10_real(mul_y10_real), .y10_imag(mul_y10_imag),
    .y11_real(mul_y11_real), .y11_imag(mul_y11_imag),
    .y12_real(mul_y12_real), .y12_imag(mul_y12_imag),
    .y13_real(mul_y13_real), .y13_imag(mul_y13_imag),
    .y14_real(mul_y14_real), .y14_imag(mul_y14_imag),
    .y15_real(mul_y15_real), .y15_imag(mul_y15_imag),

    // Outputs for X0 to X15
    .X0_real(mul_X0_real), .X0_imag(mul_X0_imag),
    .X1_real(mul_X1_real), .X1_imag(mul_X1_imag),
    .X2_real(mul_X2_real), .X2_imag(mul_X2_imag),
    .X3_real(mul_X3_real), .X3_imag(mul_X3_imag),
    .X4_real(mul_X4_real), .X4_imag(mul_X4_imag),
    .X5_real(mul_X5_real), .X5_imag(mul_X5_imag),
    .X6_real(mul_X6_real), .X6_imag(mul_X6_imag),
    .X7_real(mul_X7_real), .X7_imag(mul_X7_imag),
    .X8_real(mul_X8_real), .X8_imag(mul_X8_imag),
    .X9_real(mul_X9_real), .X9_imag(mul_X9_imag),
    .X10_real(mul_X10_real), .X10_imag(mul_X10_imag),
    .X11_real(mul_X11_real), .X11_imag(mul_X11_imag),
    .X12_real(mul_X12_real), .X12_imag(mul_X12_imag),
    .X13_real(mul_X13_real), .X13_imag(mul_X13_imag),
    .X14_real(mul_X14_real), .X14_imag(mul_X14_imag),
    .X15_real(mul_X15_real), .X15_imag(mul_X15_imag)
);


 // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            in_ready <= 1'b1;
            out_valid <= 1'b0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    in_ready <= 1'b1;
                    out_valid <= 1'b0;
                end
                
                PROCESSING: begin
                    in_ready <= 1'b0;
                    out_valid <= 1'b0;
                    
                    mul_x0_real <= x0_real;  mul_x0_imag <= x0_imag;
                    mul_x1_real <= x1_real;  mul_x1_imag <= x1_imag;
                    mul_x2_real <= x2_real;  mul_x2_imag <= x2_imag;
                    mul_x3_real <= x3_real;  mul_x3_imag <= x3_imag;
                    mul_x4_real <= x4_real;  mul_x4_imag <= x4_imag;
                    mul_x5_real <= x5_real;  mul_x5_imag <= x5_imag;
                    mul_x6_real <= x6_real;  mul_x6_imag <= x6_imag;
                    mul_x7_real <= x7_real;  mul_x7_imag <= x7_imag;
                    mul_x8_real <= x8_real;  mul_x8_imag <= x8_imag;
                    mul_x9_real <= x9_real;  mul_x9_imag <= x9_imag;
                    mul_x10_real <= x10_real; mul_x10_imag <= x10_imag;
                    mul_x11_real <= x11_real; mul_x11_imag <= x11_imag;
                    mul_x12_real <= x12_real; mul_x12_imag <= x12_imag;
                    mul_x13_real <= x13_real; mul_x13_imag <= x13_imag;
                    mul_x14_real <= x14_real; mul_x14_imag <= x14_imag;
                    mul_x15_real <= x15_real; mul_x15_imag <= x15_imag;

                    case(ker_cnt)
                    2'd0:begin
                        $display("ker_cnt %d",ker_cnt);
                        mul_y0_real  <= ker_r0; mul_y0_imag  <= ker_i0;
                        mul_y1_real  <= ker_r8; mul_y1_imag  <= ker_i8;
                        mul_y2_real <= ker_r16; mul_y2_imag <= ker_i16;
                        mul_y3_real <= ker_r24; mul_y3_imag <= ker_i24;
                        mul_y4_real <= ker_r32; mul_y4_imag <= ker_i32;
                        mul_y5_real <= ker_r40; mul_y5_imag <= ker_i40;
                        mul_y6_real <= ker_r48; mul_y6_imag <= ker_i48;
                        mul_y7_real <= ker_r56; mul_y7_imag <= ker_i56;

                        mul_y8_real  <= ker_r1;  mul_y8_imag  <= ker_i1;
                        mul_y9_real  <= ker_r9;  mul_y9_imag  <= ker_i9;
                        mul_y10_real <= ker_r17; mul_y10_imag <= ker_i17;
                        mul_y11_real <= ker_r25; mul_y11_imag <= ker_i25;
                        mul_y12_real <= ker_r33; mul_y12_imag <= ker_i33;
                        mul_y13_real <= ker_r41; mul_y13_imag <= ker_i41;
                        mul_y14_real <= ker_r49; mul_y14_imag <= ker_i49;
                        mul_y15_real <= ker_r57; mul_y15_imag <= ker_i57;
                    end

                    2'd1:begin
                        $display("ker_cnt %d",ker_cnt);
                        mul_y0_real  <= ker_r2; mul_y0_imag  <= ker_i2;
                        mul_y1_real <= ker_r10; mul_y1_imag <= ker_i10;
                        mul_y2_real <= ker_r18; mul_y2_imag <= ker_i18;
                        mul_y3_real <= ker_r26; mul_y3_imag <= ker_i26;
                        mul_y4_real <= ker_r34; mul_y4_imag <= ker_i34;
                        mul_y5_real <= ker_r42; mul_y5_imag <= ker_i42;
                        mul_y6_real <= ker_r50; mul_y6_imag <= ker_i50;
                        mul_y7_real <= ker_r58; mul_y7_imag <= ker_i58;

                        mul_y8_real <= ker_r3;  mul_y8_imag <= ker_i3;
                        mul_y9_real <= ker_r11; mul_y9_imag <= ker_i11;
                        mul_y10_real<= ker_r19; mul_y10_imag<= ker_i19;
                        mul_y11_real<= ker_r27; mul_y11_imag<= ker_i27;
                        mul_y12_real<= ker_r35; mul_y12_imag<= ker_i35;
                        mul_y13_real<= ker_r43; mul_y13_imag<= ker_i43;
                        mul_y14_real<= ker_r51; mul_y14_imag<= ker_i51;
                        mul_y15_real<= ker_r59; mul_y15_imag<= ker_i59;
                    end
                    2'd2:begin
                        $display("ker_cnt %d",ker_cnt);
                        mul_y0_real  <= ker_r4; mul_y0_imag  <= ker_i4;
                        mul_y1_real <= ker_r12; mul_y1_imag <= ker_i12;
                        mul_y2_real <= ker_r20; mul_y2_imag <= ker_i20;
                        mul_y3_real <= ker_r28; mul_y3_imag <= ker_i28;
                        mul_y4_real <= ker_r36; mul_y4_imag <= ker_i36;
                        mul_y5_real <= ker_r44; mul_y5_imag <= ker_i44;
                        mul_y6_real <= ker_r52; mul_y6_imag <= ker_i52;
                        mul_y7_real <= ker_r60; mul_y7_imag <= ker_i60;

                        mul_y8_real  <= ker_r5;  mul_y8_imag <= ker_i5;
                        mul_y9_real  <= ker_r13; mul_y9_imag <= ker_i13;
                        mul_y10_real <= ker_r21; mul_y10_imag<= ker_i21;
                        mul_y11_real <= ker_r29; mul_y11_imag<= ker_i29;
                        mul_y12_real <= ker_r37; mul_y12_imag<= ker_i37;
                        mul_y13_real <= ker_r45; mul_y13_imag<= ker_i45;
                        mul_y14_real <= ker_r53; mul_y14_imag<= ker_i53;
                        mul_y15_real <= ker_r61; mul_y15_imag<= ker_i61;
                    end
                    2'd3:begin
                        $display("ker_cnt %d",ker_cnt);
                        mul_y0_real  <= ker_r6;  mul_y0_imag  <= ker_i6;
                        mul_y1_real <= ker_r14; mul_y1_imag <= ker_i14;
                        mul_y2_real <= ker_r22; mul_y2_imag <= ker_i22;
                        mul_y3_real <= ker_r30; mul_y3_imag <= ker_i30;
                        mul_y4_real <= ker_r38; mul_y4_imag <= ker_i38;
                        mul_y5_real <= ker_r46; mul_y5_imag <= ker_i46;
                        mul_y6_real <= ker_r54; mul_y6_imag <= ker_i54;
                        mul_y7_real <= ker_r62; mul_y7_imag <= ker_i62;

                        mul_y8_real <= ker_r7;  mul_y8_imag <= ker_i7;
                        mul_y9_real <= ker_r15; mul_y9_imag <= ker_i15;
                        mul_y10_real<= ker_r23; mul_y10_imag<= ker_i23;
                        mul_y11_real<= ker_r31; mul_y11_imag<= ker_i31;
                        mul_y12_real<= ker_r39; mul_y12_imag<= ker_i39;
                        mul_y13_real<= ker_r47; mul_y13_imag<= ker_i47;
                        mul_y14_real<= ker_r55; mul_y14_imag<= ker_i55;
                        mul_y15_real<= ker_r63; mul_y15_imag<= ker_i63;
                    end

                    endcase
                    if (processing_done) begin
                        out_valid <= 1'b1;
                        ker_cnt <= ker_cnt + 1'b1;
                            X0_real <= mul_X0_real;  X0_imag <= mul_X0_imag;
                            X1_real <= mul_X1_real;  X1_imag <= mul_X1_imag;
                            X2_real <= mul_X2_real;  X2_imag <= mul_X2_imag;
                            X3_real <= mul_X3_real;  X3_imag <= mul_X3_imag;
                            X4_real <= mul_X4_real;  X4_imag <= mul_X4_imag;
                            X5_real <= mul_X5_real;  X5_imag <= mul_X5_imag;
                            X6_real <= mul_X6_real;  X6_imag <= mul_X6_imag;
                            X7_real <= mul_X7_real;  X7_imag <= mul_X7_imag;
                            X8_real <= mul_X8_real;  X8_imag <= mul_X8_imag;
                            X9_real <= mul_X9_real;  X9_imag <= mul_X9_imag;
                            X10_real <= mul_X10_real; X10_imag <= mul_X10_imag;
                            X11_real <= mul_X11_real; X11_imag <= mul_X11_imag;
                            X12_real <= mul_X12_real; X12_imag <= mul_X12_imag;
                            X13_real <= mul_X13_real; X13_imag <= mul_X13_imag;
                            X14_real <= mul_X14_real; X14_imag <= mul_X14_imag;
                            X15_real <= mul_X15_real; X15_imag <= mul_X15_imag;

                    end
                end
                
                DONE: begin
                    if (out_ready && out_valid) begin
                        out_valid <= 1'b0;
                        in_ready <= 1'b1;

                    end
                end
                
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        
        case (state)
            IDLE: begin
                if (in_valid && in_ready) begin
                    next_state = PROCESSING;
                end
            end
            
            PROCESSING: begin
                if (processing_done) begin
                    next_state = DONE;
                end
            end
            
            DONE: begin
                if (out_ready) begin
                    next_state = IDLE;
                end
            end
            
            default: next_state = IDLE;
        endcase
    end

    // Processing done detection
    reg [2:0] process_counter;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            process_counter <= 3'd0;
            processing_done <= 1'b0;
        end else if (state == PROCESSING) begin
            if (process_counter == 3'd5) begin  
                processing_done <= 1'b1;
                process_counter <= 3'd0;
            end else begin
                process_counter <= process_counter + 1'b1;
                processing_done <= 1'b0;
            end
        end else begin
            process_counter <= 3'd0;
            processing_done <= 1'b0;
        end
    end

endmodule



