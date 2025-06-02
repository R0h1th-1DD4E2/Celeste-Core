//`timescale 1ns / 1ps

module ker_reg(
    input clk, rst,
    input [2:0] ker_sel,
    output reg [31:0] ker_r0,ker_r1,ker_r2,ker_r3,ker_r4,ker_r5,ker_r6,ker_r7,ker_r8,ker_r9,ker_r10,ker_r11,ker_r12,ker_r13,ker_r14,ker_r15,ker_r16,ker_r17,ker_r18,ker_r19,ker_r20,ker_r21,ker_r22,ker_r23,ker_r24,ker_r25,ker_r26,ker_r27,ker_r28,ker_r29,ker_r30,ker_r31,
    output reg [31:0] ker_r32,ker_r33,ker_r34,ker_r35,ker_r36,ker_r37,ker_r38,ker_r39,ker_r40,ker_r41,ker_r42,ker_r43,ker_r44,ker_r45,ker_r46,ker_r47,ker_r48,ker_r49,ker_r50,ker_r51,ker_r52,ker_r53,ker_r54,ker_r55,ker_r56,ker_r57,ker_r58,ker_r59,ker_r60,ker_r61,ker_r62,ker_r63,
    output reg [31:0] ker_i0,ker_i1,ker_i2,ker_i3,ker_i4,ker_i5,ker_i6,ker_i7,ker_i8,ker_i9,ker_i10,ker_i11,ker_i12,ker_i13,ker_i14,ker_i15,ker_i16,ker_i17,ker_i18,ker_i19,ker_i20,ker_i21,ker_i22,ker_i23,ker_i24,ker_i25,ker_i26,ker_i27,ker_i28,ker_i29,ker_i30,ker_i31,
    output reg [31:0] ker_i32,ker_i33,ker_i34,ker_i35,ker_i36,ker_i37,ker_i38,ker_i39,ker_i40,ker_i41,ker_i42,ker_i43,ker_i44,ker_i45,ker_i46,ker_i47,ker_i48,ker_i49,ker_i50,ker_i51,ker_i52,ker_i53,ker_i54,ker_i55,ker_i56,ker_i57,ker_i58,ker_i59,ker_i60,ker_i61,ker_i62,ker_i63
);

    always@(posedge clk or posedge rst) begin
        if(rst) begin
            // First 32 registers
          ker_r0<=32'b0; ker_r1<=32'b0; ker_r2<=32'b0; ker_r3<=32'b0; ker_r4<=32'b0; ker_r5<=32'b0; ker_r6<=32'b0; ker_r7<=32'b0;
          ker_r8<=32'b0; ker_r9<=32'b0; ker_r10<=32'b0; ker_r11<=32'b0; ker_r12<=32'b0; ker_r13<=32'b0; ker_r14<=32'b0; ker_r15<=32'b0;
          ker_r16<=32'b0; ker_r17<=32'b0; ker_r18<=32'b0; ker_r19<=32'b0; ker_r20<=32'b0; ker_r21<=32'b0; ker_r22<=32'b0; ker_r23<=32'b0;
          ker_r24<=32'b0; ker_r25<=32'b0; ker_r26<=32'b0; ker_r27<=32'b0; ker_r28<=32'b0; ker_r29<=32'b0; ker_r30<=32'b0; ker_r31<=32'b0;
          // Additional 32 registers
          ker_r32<=32'b0; ker_r33<=32'b0; ker_r34<=32'b0; ker_r35<=32'b0; ker_r36<=32'b0; ker_r37<=32'b0; ker_r38<=32'b0; ker_r39<=32'b0;
          ker_r40<=32'b0; ker_r41<=32'b0; ker_r42<=32'b0; ker_r43<=32'b0; ker_r44<=32'b0; ker_r45<=32'b0; ker_r46<=32'b0; ker_r47<=32'b0;
          ker_r48<=32'b0; ker_r49<=32'b0; ker_r50<=32'b0; ker_r51<=32'b0; ker_r52<=32'b0; ker_r53<=32'b0; ker_r54<=32'b0; ker_r55<=32'b0;
          ker_r56<=32'b0; ker_r57<=32'b0; ker_r58<=32'b0; ker_r59<=32'b0; ker_r60<=32'b0; ker_r61<=32'b0; ker_r62<=32'b0; ker_r63<=32'b0;
          // Imaginary part registers
          ker_i0<=32'b0; ker_i1<=32'b0; ker_i2<=32'b0; ker_i3<=32'b0; ker_i4<=32'b0; ker_i5<=32'b0; ker_i6<=32'b0; ker_i7<=32'b0;
          ker_i8<=32'b0; ker_i9<=32'b0; ker_i10<=32'b0; ker_i11<=32'b0; ker_i12<=32'b0; ker_i13<=32'b0; ker_i14<=32'b0; ker_i15<=32'b0;
          ker_i16<=32'b0; ker_i17<=32'b0; ker_i18<=32'b0; ker_i19<=32'b0; ker_i20<=32'b0; ker_i21<=32'b0; ker_i22<=32'b0; ker_i23<=32'b0;
          ker_i24<=32'b0; ker_i25<=32'b0; ker_i26<=32'b0; ker_i27<=32'b0; ker_i28<=32'b0; ker_i29<=32'b0; ker_i30<=32'b0; ker_i31<=32'b0;
          ker_i32<=32'b0; ker_i33<=32'b0; ker_i34<=32'b0; ker_i35<=32'b0; ker_i36<=32'b0; ker_i37<=32'b0; ker_i38<=32'b0; ker_i39<=32'b0;
          ker_i40<=32'b0; ker_i41<=32'b0; ker_i42<=32'b0; ker_i43<=32'b0; ker_i44<=32'b0; ker_i45<=32'b0; ker_i46<=32'b0; ker_i47<=32'b0;
          ker_i48<=32'b0; ker_i49<=32'b0; ker_i50<=32'b0; ker_i51<=32'b0; ker_i52<=32'b0; ker_i53<=32'b0; ker_i54<=32'b0; ker_i55<=32'b0;
          ker_i56<=32'b0; ker_i57<=32'b0; ker_i58<=32'b0; ker_i59<=32'b0; ker_i60<=32'b0; ker_i61<=32'b0; ker_i62<=32'b0; ker_i63<=32'b0;
      end

        else begin
            case(ker_sel)
            //sobel 
            3'd0:begin
                ker_r0  <= 32'h00000000; ker_r1  <= 32'hC2DA827A; ker_r2  <= 32'h42800000; ker_r3  <= 32'hC195F61A; ker_r4  <= 32'h00000000; ker_r5  <= 32'hC195F61A; ker_r6  <= 32'h42800000; ker_r7  <= 32'hC2DA827A;
                ker_r8  <= 32'h00000000; ker_r9  <= 32'h4283E1DB; ker_r10 <= 32'hC19A827A; ker_r11 <= 32'h00000000; ker_r12 <= 32'h00000000; ker_r13 <= 32'h413504F3; ker_r14 <= 32'hC19A827A; ker_r15 <= 32'h00000000;
                ker_r16 <= 32'h00000000; ker_r17 <= 32'h00000000; ker_r18 <= 32'h00000000; ker_r19 <= 32'h00000000; ker_r20 <= 32'h00000000; ker_r21 <= 32'h00000000; ker_r22 <= 32'h00000000; ker_r23 <= 32'h00000000;
                ker_r24 <= 32'h00000000; ker_r25 <= 32'h00000000; ker_r26 <= 32'h405413CD; ker_r27 <= 32'hBFF876CD; ker_r28 <= 32'h00000000; ker_r29 <= 32'h00000000; ker_r30 <= 32'h405413CD; ker_r31 <= 32'hC13504F3;
                ker_r32 <= 32'h00000000; ker_r33 <= 32'h00000000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h00000000; ker_r39 <= 32'h00000000;
                ker_r40 <= 32'h00000000; ker_r41 <= 32'hC13504F3; ker_r42 <= 32'h405413CD; ker_r43 <= 32'h00000000; ker_r44 <= 32'h00000000; ker_r45 <= 32'hBFF876CD; ker_r46 <= 32'h405413CD; ker_r47 <= 32'h00000000;
                ker_r48 <= 32'h00000000; ker_r49 <= 32'h00000000; ker_r50 <= 32'h00000000; ker_r51 <= 32'h00000000; ker_r52 <= 32'h00000000; ker_r53 <= 32'h00000000; ker_r54 <= 32'h00000000; ker_r55 <= 32'h00000000;
                ker_r56 <= 32'h00000000; ker_r57 <= 32'h00000000; ker_r58 <= 32'hC19A827A; ker_r59 <= 32'h413504F3; ker_r60 <= 32'h00000000; ker_r61 <= 32'h00000000; ker_r62 <= 32'hC19A827A; ker_r63 <= 32'h4283E1DB;

                
                // Set all imaginary parts to zero
               ker_i0  <= 32'h00000000; ker_i1  <= 32'h42DA827A; ker_i2  <= 32'h00000000; ker_i3  <= 32'hC195F61A; ker_i4  <= 32'h00000000; ker_i5  <= 32'h4195F61A; ker_i6  <= 32'h00000000; ker_i7  <= 32'hC2DA827A;
                ker_i8  <= 32'h00000000; ker_i9  <= 32'h00000000; ker_i10 <= 32'hC19A827A; ker_i11 <= 32'h413504F3; ker_i12 <= 32'h00000000; ker_i13 <= 32'h00000000; ker_i14 <= 32'hC19A827A; ker_i15 <= 32'h4283E1DB;
                ker_i16 <= 32'h00000000; ker_i17 <= 32'h00000000; ker_i18 <= 32'h00000000; ker_i19 <= 32'h00000000; ker_i20 <= 32'h00000000; ker_i21 <= 32'h00000000; ker_i22 <= 32'h00000000; ker_i23 <= 32'h00000000;
                ker_i24 <= 32'h00000000; ker_i25 <= 32'h413504F3; ker_i26 <= 32'hC05413CD; ker_i27 <= 32'h00000000; ker_i28 <= 32'h00000000; ker_i29 <= 32'h3FF876CD; ker_i30 <= 32'hC05413CD; ker_i31 <= 32'h00000000;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h00000000; ker_i34 <= 32'h00000000; ker_i35 <= 32'h00000000; ker_i36 <= 32'h00000000; ker_i37 <= 32'h00000000; ker_i38 <= 32'h00000000; ker_i39 <= 32'h00000000;
                ker_i40 <= 32'h00000000; ker_i41 <= 32'h00000000; ker_i42 <= 32'h405413CD; ker_i43 <= 32'hBFF876CD; ker_i44 <= 32'h00000000; ker_i45 <= 32'h00000000; ker_i46 <= 32'h405413CD; ker_i47 <= 32'hC13504F3;
                ker_i48 <= 32'h00000000; ker_i49 <= 32'h00000000; ker_i50 <= 32'h00000000; ker_i51 <= 32'h00000000; ker_i52 <= 32'h00000000; ker_i53 <= 32'h00000000; ker_i54 <= 32'h00000000; ker_i55 <= 32'h00000000;
                ker_i56 <= 32'h00000000; ker_i57 <= 32'hC283E1DB; ker_i58 <= 32'h419A827A; ker_i59 <= 32'h00000000; ker_i60 <= 32'h00000000; ker_i61 <= 32'hC13504F3; ker_i62 <= 32'h419A827A; ker_i63 <= 32'h00000000;

                end
            // emboss
            3'd1:begin
                ker_r0 <=  32'h00000000; ker_r1 <=  32'hC1257D86; ker_r2 <=  32'hC1C00000; ker_r3 <=  32'hC1AD413D; ker_r4 <=  32'hC1800000; ker_r5 <=  32'hC1AD413D; ker_r6 <=  32'hC1C00000; ker_r7 <=  32'hC1257D86;
                ker_r8 <=  32'h00000000; ker_r9 <=  32'h00000000; ker_r10 <= 32'h00000000; ker_r11 <= 32'h00000000; ker_r12 <= 32'h00000000; ker_r13 <= 32'h00000000; ker_r14 <= 32'h00000000; ker_r15 <= 32'h00000000;
                ker_r16 <= 32'h00000000; ker_r17 <= 32'h00000000; ker_r18 <= 32'h00000000; ker_r19 <= 32'h00000000; ker_r20 <= 32'h00000000; ker_r21 <= 32'h00000000; ker_r22 <= 32'h00000000; ker_r23 <= 32'h00000000;
                ker_r24 <= 32'h00000000; ker_r25 <= 32'h00000000; ker_r26 <= 32'h00000000; ker_r27 <= 32'h00000000; ker_r28 <= 32'h00000000; ker_r29 <= 32'h00000000; ker_r30 <= 32'h00000000; ker_r31 <= 32'h00000000;
                ker_r32 <= 32'h00000000; ker_r33 <= 32'h00000000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h00000000; ker_r39 <= 32'h00000000;
                ker_r40 <= 32'h00000000; ker_r41 <= 32'h00000000; ker_r42 <= 32'h00000000; ker_r43 <= 32'h00000000; ker_r44 <= 32'h00000000; ker_r45 <= 32'h00000000; ker_r46 <= 32'h00000000; ker_r47 <= 32'h00000000;
                ker_r48 <= 32'h00000000; ker_r49 <= 32'h00000000; ker_r50 <= 32'h00000000; ker_r51 <= 32'h00000000; ker_r52 <= 32'h00000000; ker_r53 <= 32'h00000000; ker_r54 <= 32'h00000000; ker_r55 <= 32'h00000000;
                ker_r56 <= 32'h00000000; ker_r57 <= 32'h00000000; ker_r58 <= 32'h00000000; ker_r59 <= 32'h00000000; ker_r60 <= 32'h00000000; ker_r61 <= 32'h00000000; ker_r62 <= 32'h00000000; ker_r63 <= 32'h00000000;
                
                // Set all imaginary parts to zero
                ker_i0 <= 32'h00000000; ker_i1 <= 32'h41C7C3B6; ker_i2 <= 32'h41C00000; ker_i3 <= 32'h410F876D; ker_i4 <= 32'h00000000; ker_i5 <= 32'hC10F876D; ker_i6 <= 32'hC1C00000; ker_i7 <= 32'hC1C7C3B6;
                ker_i8 <= 32'h00000000; ker_i9 <= 32'h00000000; ker_i10 <= 32'h00000000; ker_i11 <= 32'h00000000; ker_i12 <= 32'h00000000; ker_i13 <= 32'h00000000; ker_i14 <= 32'h00000000; ker_i15 <= 32'h00000000;
                ker_i16 <= 32'h00000000; ker_i17 <= 32'h00000000; ker_i18 <= 32'h00000000; ker_i19 <= 32'h00000000; ker_i20 <= 32'h00000000; ker_i21 <= 32'h00000000; ker_i22 <= 32'h00000000; ker_i23 <= 32'h00000000;
                ker_i24 <= 32'h00000000; ker_i25 <= 32'h00000000; ker_i26 <= 32'h00000000; ker_i27 <= 32'h00000000; ker_i28 <= 32'h00000000; ker_i29 <= 32'h00000000; ker_i30 <= 32'h00000000; ker_i31 <= 32'h00000000;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h00000000; ker_i34 <= 32'h00000000; ker_i35 <= 32'h00000000; ker_i36 <= 32'h00000000; ker_i37 <= 32'h00000000; ker_i38 <= 32'h00000000; ker_i39 <= 32'h00000000;
                ker_i40 <= 32'h00000000; ker_i41 <= 32'h00000000; ker_i42 <= 32'h00000000; ker_i43 <= 32'h00000000; ker_i44 <= 32'h00000000; ker_i45 <= 32'h00000000; ker_i46 <= 32'h00000000; ker_i47 <= 32'h00000000;
                ker_i48 <= 32'h00000000; ker_i49 <= 32'h00000000; ker_i50 <= 32'h00000000; ker_i51 <= 32'h00000000; ker_i52 <= 32'h00000000; ker_i53 <= 32'h00000000; ker_i54 <= 32'h00000000; ker_i55 <= 32'h00000000;
                ker_i56 <= 32'h00000000; ker_i57 <= 32'h00000000; ker_i58 <= 32'h00000000; ker_i59 <= 32'h00000000; ker_i60 <= 32'h00000000; ker_i61 <= 32'h00000000; ker_i62 <= 32'h00000000; ker_i63 <= 32'h00000000;
                end
            // edge enhancement
            3'd2:begin
                ker_r0 <=  32'h42400000; ker_r1 <=  32'hC2A4DA52; ker_r2 <=  32'h42200000; ker_r3 <=  32'h401B4A40; ker_r4 <=  32'h00000000; ker_r5 <=  32'h401B4A40; ker_r6 <=  32'h42200000; ker_r7 <=  32'hC2A4DA52;
                ker_r8 <=  32'hC2A4DA52; ker_r9 <=  32'h428239B4; ker_r10 <= 32'hC15504F3; ker_r11 <= 32'h00000000; ker_r12 <= 32'h00000000; ker_r13 <= 32'hC1200000; ker_r14 <= 32'hC200918C; ker_r15 <= 32'h42B82AA1;
                ker_r16 <= 32'h42200000; ker_r17 <= 32'hC15504F3; ker_r18 <= 32'h00000000; ker_r19 <= 32'hC076E740; ker_r20 <= 32'h00000000; ker_r21 <= 32'h411504F3; ker_r22 <= 32'h00000000; ker_r23 <= 32'hC200918C;
                ker_r24 <= 32'h401B4A40; ker_r25 <= 32'hA7C00000; ker_r26 <= 32'hC076E740; ker_r27 <= 32'h4038C98D; ker_r28 <= 32'h00000000; ker_r29 <= 32'hC082AA13; ker_r30 <= 32'h411504F3; ker_r31 <= 32'hC1200000;
                ker_r32 <= 32'h00000000; ker_r33 <= 32'h00000000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h00000000; ker_r39 <= 32'h00000000;
                ker_r40 <= 32'h401B4A40; ker_r41 <= 32'hC1200000; ker_r42 <= 32'h411504F3; ker_r43 <= 32'hC082AA13; ker_r44 <= 32'h00000000; ker_r45 <= 32'h4038C98D; ker_r46 <= 32'hC076E740; ker_r47 <= 32'hA7C00000;
                ker_r48 <= 32'h42200000; ker_r49 <= 32'hC200918C; ker_r50 <= 32'h00000000; ker_r51 <= 32'h411504F3; ker_r52 <= 32'h00000000; ker_r53 <= 32'hC076E740; ker_r54 <= 32'h00000000; ker_r55 <= 32'hC15504F3;
                ker_r56 <= 32'hC2A4DA52; ker_r57 <= 32'h42B82AA1; ker_r58 <= 32'hC200918C; ker_r59 <= 32'hC1200000; ker_r60 <= 32'h00000000; ker_r61 <= 32'h00000000; ker_r62 <= 32'hC15504F3; ker_r63 <= 32'h428239B4;
                
                // Set all imaginary parts 
                ker_i0 <= 32'h00000000; ker_i1 <= 32'hC208918C; ker_i2 <= 32'h42200000; ker_i3 <= 32'h40BB73A0; ker_i4 <= 32'h00000000; ker_i5 <= 32'hC0BB73A0; ker_i6 <= 32'hC2200000; ker_i7 <= 32'h4208918C;
                ker_i8 <= 32'hC208918C; ker_i9 <= 32'h428239B4; ker_i10 <= 32'hC200918C; ker_i11 <= 32'hC1624630; ker_i12 <= 32'h00000000; ker_i13 <= 32'h41200000; ker_i14 <= 32'h415504F3; ker_i15 <= 32'h00000000;
                ker_i16 <= 32'h42200000; ker_i17 <= 32'hC200918C; ker_i18 <= 32'h00000000; ker_i19 <= 32'h411504F3; ker_i20 <= 32'h00000000; ker_i21 <= 32'hC076E740; ker_i22 <= 32'h00000000; ker_i23 <= 32'hC15504F3;
                ker_i24 <= 32'h40BB73A0; ker_i25 <= 32'hC1624630; ker_i26 <= 32'h411504F3; ker_i27 <= 32'hC038C98D; ker_i28 <= 32'h00000000; ker_i29 <= 32'h26A00000; ker_i30 <= 32'h4076E740; ker_i31 <= 32'hC1200000;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h00000000; ker_i34 <= 32'h00000000; ker_i35 <= 32'h00000000; ker_i36 <= 32'h00000000; ker_i37 <= 32'h00000000; ker_i38 <= 32'h00000000; ker_i39 <= 32'h00000000;
                ker_i40 <= 32'hC0BB73A0; ker_i41 <= 32'h41200000; ker_i42 <= 32'hC076E740; ker_i43 <= 32'hA6A00000; ker_i44 <= 32'h00000000; ker_i45 <= 32'h4038C98D; ker_i46 <= 32'hC11504F3; ker_i47 <= 32'h41624630;
                ker_i48 <= 32'hC2200000; ker_i49 <= 32'h415504F3; ker_i50 <= 32'h00000000; ker_i51 <= 32'h4076E740; ker_i52 <= 32'h00000000; ker_i53 <= 32'hC11504F3; ker_i54 <= 32'h00000000; ker_i55 <= 32'h4200918C;
                ker_i56 <= 32'h4208918C; ker_i57 <= 32'h00000000; ker_i58 <= 32'hC15504F3; ker_i59 <= 32'hC1200000; ker_i60 <= 32'h00000000; ker_i61 <= 32'h41624630; ker_i62 <= 32'h4200918C; ker_i63 <= 32'hC28239B4;
                end
            // high pass
            3'd3:begin
                ker_r0 <=  32'h3F800000; ker_r1 <=  32'hC237D907; ker_r2 <=  32'h00000000; ker_r3 <=  32'h4237D907; ker_r4 <=  32'hC2820000; ker_r5 <=  32'h4237D907; ker_r6 <=  32'h00000000; ker_r7 <=  32'hC237D907;
                ker_r8 <=  32'hC237D907; ker_r9 <=  32'h00000000; ker_r10 <= 32'h4237D907; ker_r11 <= 32'hC2820000; ker_r12 <= 32'h4237D907; ker_r13 <= 32'h00000000; ker_r14 <= 32'hC237D907; ker_r15 <= 32'h42820000;
                ker_r16 <= 32'h00000000; ker_r17 <= 32'h4237D907; ker_r18 <= 32'hC2820000; ker_r19 <= 32'h4237D907; ker_r20 <= 32'h00000000; ker_r21 <= 32'hC237D907; ker_r22 <= 32'h42820000; ker_r23 <= 32'hC237D907;
                ker_r24 <= 32'h4237D907; ker_r25 <= 32'hC2820000; ker_r26 <= 32'h4237D907; ker_r27 <= 32'h00000000; ker_r28 <= 32'hC237D907; ker_r29 <= 32'h42820000; ker_r30 <= 32'hC237D907; ker_r31 <= 32'h00000000;
                ker_r32 <= 32'hC2820000; ker_r33 <= 32'h4237D907; ker_r34 <= 32'h00000000; ker_r35 <= 32'hC237D907; ker_r36 <= 32'h42820000; ker_r37 <= 32'hC237D907; ker_r38 <= 32'h00000000; ker_r39 <= 32'h4237D907;
                ker_r40 <= 32'h4237D907; ker_r41 <= 32'h00000000; ker_r42 <= 32'hC237D907; ker_r43 <= 32'h42820000; ker_r44 <= 32'hC237D907; ker_r45 <= 32'h00000000; ker_r46 <= 32'h4237D907; ker_r47 <= 32'hC2820000;
                ker_r48 <= 32'h00000000; ker_r49 <= 32'hC237D907; ker_r50 <= 32'h42820000; ker_r51 <= 32'hC237D907; ker_r52 <= 32'h00000000; ker_r53 <= 32'h4237D907; ker_r54 <= 32'hC2820000; ker_r55 <= 32'h4237D907;
                ker_r56 <= 32'hC237D907; ker_r57 <= 32'h42820000; ker_r58 <= 32'hC237D907; ker_r59 <= 32'h00000000; ker_r60 <= 32'h4237D907; ker_r61 <= 32'hC2820000; ker_r62 <= 32'h4237D907; ker_r63 <= 32'h00000000;            
            
                ker_i0 <= 32'h00000000; ker_i1 <= 32'hC237D907; ker_i2 <= 32'h42820000; ker_i3 <= 32'hC237D907; ker_i4 <= 32'h00000000; ker_i5 <= 32'h4237D907; ker_i6 <= 32'hC2820000; ker_i7 <= 32'h4237D907;
                ker_i8 <= 32'hC237D907; ker_i9 <= 32'h42820000; ker_i10 <= 32'hC237D907; ker_i11 <= 32'h00000000; ker_i12 <= 32'h4237D907; ker_i13 <= 32'hC2820000; ker_i14 <= 32'h4237D907; ker_i15 <= 32'h00000000;
                ker_i16 <= 32'h42820000; ker_i17 <= 32'hC237D907; ker_i18 <= 32'h00000000; ker_i19 <= 32'h4237D907; ker_i20 <= 32'hC2820000; ker_i21 <= 32'h4237D907; ker_i22 <= 32'h00000000; ker_i23 <= 32'hC237D907;
                ker_i24 <= 32'hC237D907; ker_i25 <= 32'h00000000; ker_i26 <= 32'h4237D907; ker_i27 <= 32'hC2820000; ker_i28 <= 32'h4237D907; ker_i29 <= 32'h00000000; ker_i30 <= 32'hC237D907; ker_i31 <= 32'h42820000;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h4237D907; ker_i34 <= 32'hC2820000; ker_i35 <= 32'h4237D907; ker_i36 <= 32'h00000000; ker_i37 <= 32'hC237D907; ker_i38 <= 32'h42820000; ker_i39 <= 32'hC237D907;
                ker_i40 <= 32'h4237D907; ker_i41 <= 32'hC2820000; ker_i42 <= 32'h4237D907; ker_i43 <= 32'h00000000; ker_i44 <= 32'hC237D907; ker_i45 <= 32'h42820000; ker_i46 <= 32'hC237D907; ker_i47 <= 32'h00000000;
                ker_i48 <= 32'h42820000; ker_i49 <= 32'hC237D907; ker_i50 <= 32'h00000000; ker_i51 <= 32'h4237D907; ker_i52 <= 32'hC2820000; ker_i53 <= 32'h4237D907; ker_i54 <= 32'h00000000; ker_i55 <= 32'hC237D907;
                ker_i56 <= 32'h4237D907; ker_i57 <= 32'hC2820000; ker_i58 <= 32'h4237D907; ker_i59 <= 32'h00000000; ker_i60 <= 32'hC237D907; ker_i61 <= 32'h42820000; ker_i62 <= 32'hC237D907; ker_i63 <= 32'h00000000;
 
                end
            //low pass
            3'd4:begin
                ker_r0 <=  32'h42800000; ker_r1 <=  32'h00000000; ker_r2 <=  32'h00000000; ker_r3 <=  32'h00000000; ker_r4 <=  32'h00000000; ker_r5 <=  32'h00000000; ker_r6 <=  32'h00000000; ker_r7 <=  32'h00000000;
                ker_r8 <=  32'h00000000; ker_r9 <=  32'h00000000; ker_r10 <= 32'h00000000; ker_r11 <= 32'h00000000; ker_r12 <= 32'h00000000; ker_r13 <= 32'h00000000; ker_r14 <= 32'h00000000; ker_r15 <=  32'h00000000;
                ker_r16 <= 32'h00000000; ker_r17 <= 32'h00000000; ker_r18 <= 32'h00000000; ker_r19 <= 32'h00000000; ker_r20 <= 32'h00000000; ker_r21 <= 32'h00000000; ker_r22 <= 32'h00000000; ker_r23 <= 32'h00000000;
                ker_r24 <= 32'h00000000; ker_r25 <= 32'h00000000; ker_r26 <= 32'h00000000; ker_r27 <= 32'h00000000; ker_r28 <= 32'h00000000; ker_r29 <= 32'h00000000; ker_r30 <= 32'h00000000; ker_r31 <= 32'h00000000;
                ker_r32 <= 32'h00000000; ker_r33 <= 32'h00000000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h00000000; ker_r39 <= 32'h00000000;
                ker_r40 <= 32'h00000000; ker_r41 <= 32'h00000000; ker_r42 <= 32'h00000000; ker_r43 <= 32'h00000000; ker_r44 <= 32'h00000000; ker_r45 <= 32'h00000000; ker_r46 <= 32'h00000000; ker_r47 <= 32'h00000000;
                ker_r48 <= 32'h00000000; ker_r49 <= 32'h00000000; ker_r50 <= 32'h00000000; ker_r51 <= 32'h00000000; ker_r52 <= 32'h00000000; ker_r53 <= 32'h00000000; ker_r54 <= 32'h00000000; ker_r55 <= 32'h00000000;
                ker_r56 <= 32'h00000000; ker_r57 <= 32'h00000000; ker_r58 <= 32'h00000000; ker_r59 <= 32'h00000000; ker_r60 <= 32'h00000000; ker_r61 <= 32'h00000000; ker_r62 <= 32'h00000000; ker_r63 <= 32'h00000000;

            // Set all imaginary parts to zero
                ker_i0 <= 32'h00000000; ker_i1 <= 32'h00000000; ker_i2 <= 32'h00000000; ker_i3 <= 32'h00000000; ker_i4 <= 32'h00000000; ker_i5 <= 32'h00000000; ker_i6 <= 32'h00000000; ker_i7 <= 32'h00000000;
                ker_i8 <= 32'h00000000; ker_i9 <= 32'h00000000; ker_i10 <= 32'h00000000; ker_i11 <= 32'h00000000; ker_i12 <= 32'h00000000; ker_i13 <= 32'h00000000; ker_i14 <= 32'h00000000; ker_i15 <= 32'h00000000;
                ker_i16 <= 32'h00000000; ker_i17 <= 32'h00000000; ker_i18 <= 32'h00000000; ker_i19 <= 32'h00000000; ker_i20 <= 32'h00000000; ker_i21 <= 32'h00000000; ker_i22 <= 32'h00000000; ker_i23 <= 32'h00000000;
                ker_i24 <= 32'h00000000; ker_i25 <= 32'h00000000; ker_i26 <= 32'h00000000; ker_i27 <= 32'h00000000; ker_i28 <= 32'h00000000; ker_i29 <= 32'h00000000; ker_i30 <= 32'h00000000; ker_i31 <= 32'h00000000;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h00000000; ker_i34 <= 32'h00000000; ker_i35 <= 32'h00000000; ker_i36 <= 32'h00000000; ker_i37 <= 32'h00000000; ker_i38 <= 32'h00000000; ker_i39 <= 32'h00000000;
                ker_i40 <= 32'h00000000; ker_i41 <= 32'h00000000; ker_i42 <= 32'h00000000; ker_i43 <= 32'h00000000; ker_i44 <= 32'h00000000; ker_i45 <= 32'h00000000; ker_i46 <= 32'h00000000; ker_i47 <= 32'h00000000;
                ker_i48 <= 32'h00000000; ker_i49 <= 32'h00000000; ker_i50 <= 32'h00000000; ker_i51 <= 32'h00000000; ker_i52 <= 32'h00000000; ker_i53 <= 32'h00000000; ker_i54 <= 32'h00000000; ker_i55 <= 32'h00000000;
                ker_i56 <= 32'h00000000; ker_i57 <= 32'h00000000; ker_i58 <= 32'h00000000; ker_i59 <= 32'h00000000; ker_i60 <= 32'h00000000; ker_i61 <= 32'h00000000; ker_i62 <= 32'h00000000; ker_i63 <= 32'h00000000; 
                end
            // guassian blur
            3'd5:begin
                ker_r0  <= 32'h3F800D1B; ker_r1  <= 32'hBDB5E55A; ker_r2  <= 32'hBC4154CA; ker_r3  <= 32'hBB020005; ker_r4  <= 32'h00000000; ker_r5  <= 32'hBB020005; ker_r6  <= 32'hBC4154CA; ker_r7  <= 32'hBDB5E55A;
                ker_r8  <= 32'hBDB5E55A; ker_r9  <= 32'h3BD02A3C; ker_r10 <= 32'h3A4D37AF; ker_r11 <= 32'hA1400000; ker_r12 <= 32'h00000000; ker_r13 <= 32'h399D4952; ker_r14 <= 32'h3AF7B82F; ker_r15 <= 32'h3C1331E3;
                ker_r16 <= 32'hBC4154CA; ker_r17 <= 32'h3A4D37AF; ker_r18 <= 32'h00000000; ker_r19 <= 32'hB8BCA344; ker_r20 <= 32'h00000000; ker_r21 <= 32'h3963B4B7; ker_r22 <= 32'h3951B717; ker_r23 <= 32'h3AF7B82F;
                ker_r24 <= 32'hBB020005; ker_r25 <= 32'h9FC00000; ker_r26 <= 32'hB8BCA344; ker_r27 <= 32'hB9201BBB; ker_r28 <= 32'h00000000; ker_r29 <= 32'h39626D67; ker_r30 <= 32'h3963B4B7; ker_r31 <= 32'h399D4952;
                ker_r32 <= 32'h00000000; ker_r33 <= 32'h00000000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h00000000; ker_r39 <= 32'h00000000;
                ker_r40 <= 32'hBB020005; ker_r41 <= 32'h399D4952; ker_r42 <= 32'h3963B4B7; ker_r43 <= 32'h39626D67; ker_r44 <= 32'h00000000; ker_r45 <= 32'hB9201BBB; ker_r46 <= 32'hB8BCA344; ker_r47 <= 32'h9FC00000;
                ker_r48 <= 32'hBC4154CA; ker_r49 <= 32'h3AF7B82F; ker_r50 <= 32'h3951B717; ker_r51 <= 32'h3963B4B7; ker_r52 <= 32'h00000000; ker_r53 <= 32'hB8BCA344; ker_r54 <= 32'h00000000; ker_r55 <= 32'h3A4D37AF;
                ker_r56 <= 32'hBDB5E55A; ker_r57 <= 32'h3C1331E3; ker_r58 <= 32'h3AF7B82F; ker_r59 <= 32'h399D4952; ker_r60 <= 32'h00000000; ker_r61 <= 32'hA1400000; ker_r62 <= 32'h3A4D37AF; ker_r63 <= 32'h3BD02A3C;

                ker_i0 <= 32'h00000000; ker_i1 <= 32'hBD16B000; ker_i2 <= 32'hBC4154CA; ker_i3 <= 32'hBB9CEC89; ker_i4 <= 32'h00000000; ker_i5 <= 32'h3B9CEC89; ker_i6 <= 32'h3C4154CA; ker_i7 <= 32'h3D16B000;
                ker_i8 <= 32'hBD16B000; ker_i9 <= 32'h3BD02A3C; ker_i10 <= 32'h3AF7B82F; ker_i11 <= 32'h39DE6FC2; ker_i12 <= 32'h00000000; ker_i13 <= 32'hB99D4952; ker_i14 <= 32'hBA4D37AF; ker_i15 <= 32'hA2000000;
                ker_i16 <= 32'hBC4154CA; ker_i17 <= 32'h3AF7B82F; ker_i18 <= 32'h3951B717; ker_i19 <= 32'h3963B4B7; ker_i20 <= 32'h00000000; ker_i21 <= 32'hB8BCA344; ker_i22 <= 32'h00000000; ker_i23 <= 32'h3A4D37AF;
                ker_i24 <= 32'hBB9CEC89; ker_i25 <= 32'h39DE6FC2; ker_i26 <= 32'h3963B4B7; ker_i27 <= 32'h39201BBB; ker_i28 <= 32'h00000000; ker_i29 <= 32'h1F800000; ker_i30 <= 32'h38BCA344; ker_i31 <= 32'h399D4952;
                ker_i32 <= 32'h00000000; ker_i33 <= 32'h00000000; ker_i34 <= 32'h00000000; ker_i35 <= 32'h00000000; ker_i36 <= 32'h00000000; ker_i37 <= 32'h00000000; ker_i38 <= 32'h00000000; ker_i39 <= 32'h00000000;
                ker_i40 <= 32'h3B9CEC89; ker_i41 <= 32'hB99D4952; ker_i42 <= 32'hB8BCA344; ker_i43 <= 32'h9F800000; ker_i44 <= 32'h00000000; ker_i45 <= 32'hB9201BBB; ker_i46 <= 32'hB963B4B7; ker_i47 <= 32'hB9DE6FC2;
                ker_i48 <= 32'h3C4154CA; ker_i49 <= 32'hBA4D37AF; ker_i50 <= 32'h00000000; ker_i51 <= 32'h38BCA344; ker_i52 <= 32'h00000000; ker_i53 <= 32'hB963B4B7; ker_i54 <= 32'hB951B717; ker_i55 <= 32'hBAF7B82F;
                ker_i56 <= 32'h3D16B000; ker_i57 <= 32'h22000000; ker_i58 <= 32'h3A4D37AF; ker_i59 <= 32'h399D4952; ker_i60 <= 32'h00000000; ker_i61 <= 32'hB9DE6FC2; ker_i62 <= 32'hBAF7B82F; ker_i63 <= 32'hBBD02A3C;
                end
              default:begin
                 // First 32 registers
                ker_r0<=32'b0; ker_r1<=32'b0; ker_r2<=32'b0; ker_r3<=32'b0; ker_r4<=32'b0; ker_r5<=32'b0; ker_r6<=32'b0; ker_r7<=32'b0;
                ker_r8<=32'b0; ker_r9<=32'b0; ker_r10<=32'b0; ker_r11<=32'b0; ker_r12<=32'b0; ker_r13<=32'b0; ker_r14<=32'b0; ker_r15<=32'b0;
                ker_r16<=32'b0; ker_r17<=32'b0; ker_r18<=32'b0; ker_r19<=32'b0; ker_r20<=32'b0; ker_r21<=32'b0; ker_r22<=32'b0; ker_r23<=32'b0;
                ker_r24<=32'b0; ker_r25<=32'b0; ker_r26<=32'b0; ker_r27<=32'b0; ker_r28<=32'b0; ker_r29<=32'b0; ker_r30<=32'b0; ker_r31<=32'b0;
                // Additional 32 registers
                ker_r32<=32'b0; ker_r33<=32'b0; ker_r34<=32'b0; ker_r35<=32'b0; ker_r36<=32'b0; ker_r37<=32'b0; ker_r38<=32'b0; ker_r39<=32'b0;
                ker_r40<=32'b0; ker_r41<=32'b0; ker_r42<=32'b0; ker_r43<=32'b0; ker_r44<=32'b0; ker_r45<=32'b0; ker_r46<=32'b0; ker_r47<=32'b0;
                ker_r48<=32'b0; ker_r49<=32'b0; ker_r50<=32'b0; ker_r51<=32'b0; ker_r52<=32'b0; ker_r53<=32'b0; ker_r54<=32'b0; ker_r55<=32'b0;
                ker_r56<=32'b0; ker_r57<=32'b0; ker_r58<=32'b0; ker_r59<=32'b0; ker_r60<=32'b0; ker_r61<=32'b0; ker_r62<=32'b0; ker_r63<=32'b0;
                // Imaginary part registers
                ker_i0<=32'b0; ker_i1<=32'b0; ker_i2<=32'b0; ker_i3<=32'b0; ker_i4<=32'b0; ker_i5<=32'b0; ker_i6<=32'b0; ker_i7<=32'b0;
                ker_i8<=32'b0; ker_i9<=32'b0; ker_i10<=32'b0; ker_i11<=32'b0; ker_i12<=32'b0; ker_i13<=32'b0; ker_i14<=32'b0; ker_i15<=32'b0;
                ker_i16<=32'b0; ker_i17<=32'b0; ker_i18<=32'b0; ker_i19<=32'b0; ker_i20<=32'b0; ker_i21<=32'b0; ker_i22<=32'b0; ker_i23<=32'b0;
                ker_i24<=32'b0; ker_i25<=32'b0; ker_i26<=32'b0; ker_i27<=32'b0; ker_i28<=32'b0; ker_i29<=32'b0; ker_i30<=32'b0; ker_i31<=32'b0;
                ker_i32<=32'b0; ker_i33<=32'b0; ker_i34<=32'b0; ker_i35<=32'b0; ker_i36<=32'b0; ker_i37<=32'b0; ker_i38<=32'b0; ker_i39<=32'b0;
                ker_i40<=32'b0; ker_i41<=32'b0; ker_i42<=32'b0; ker_i43<=32'b0; ker_i44<=32'b0; ker_i45<=32'b0; ker_i46<=32'b0; ker_i47<=32'b0;
                ker_i48<=32'b0; ker_i49<=32'b0; ker_i50<=32'b0; ker_i51<=32'b0; ker_i52<=32'b0; ker_i53<=32'b0; ker_i54<=32'b0; ker_i55<=32'b0;
                ker_i56<=32'b0; ker_i57<=32'b0; ker_i58<=32'b0; ker_i59<=32'b0; ker_i60<=32'b0; ker_i61<=32'b0; ker_i62<=32'b0; ker_i63<=32'b0;
          end 
            endcase
        end
    end

endmodule