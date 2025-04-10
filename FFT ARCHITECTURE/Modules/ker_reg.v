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
                ker_r0 <=  32'hBF800000;  ker_r1 <=  32'hC0000000;  ker_r2 <=  32'hC0400000;  ker_r3 <=  32'h00000000;ker_r4 <=  32'h40400000;  ker_r5 <=  32'h40000000;  ker_r6 <=  32'h3F800000;  ker_r7 <=  32'h00000000;
                ker_r8 <=  32'hC0000000;  ker_r9 <=  32'hC0800000;  ker_r10 <= 32'hC0C00000;  ker_r11 <= 32'h00000000;ker_r12 <= 32'h40C00000;  ker_r13 <= 32'h40800000;  ker_r14 <= 32'h40000000;  ker_r15 <= 32'h00000000;
                ker_r16 <= 32'hC0400000;  ker_r17 <= 32'hC0C00000;  ker_r18 <= 32'hC1100000;  ker_r19 <= 32'h00000000;ker_r20 <= 32'h41100000;  ker_r21 <= 32'h40C00000;  ker_r22 <= 32'h40400000;  ker_r23 <= 32'h00000000;
                ker_r24 <= 32'hC0800000;  ker_r25 <= 32'hC1000000;  ker_r26 <= 32'hC1400000;  ker_r27 <= 32'h00000000;ker_r28 <= 32'h41400000;  ker_r29 <= 32'h41000000;  ker_r30 <= 32'h40800000;  ker_r31 <= 32'h00000000;
                ker_r32 <= 32'hC0400000;  ker_r33 <= 32'hC0C00000;  ker_r34 <= 32'hC1100000;  ker_r35 <= 32'h00000000;ker_r36 <= 32'h41100000;  ker_r37 <= 32'h40C00000;  ker_r38 <= 32'h40400000;  ker_r39 <= 32'h00000000;
                ker_r40 <= 32'hC0000000;  ker_r41 <= 32'hC0800000;  ker_r42 <= 32'hC0C00000;  ker_r43 <= 32'h00000000;ker_r44 <= 32'h40C00000;  ker_r45 <= 32'h40800000;  ker_r46 <= 32'h40000000;  ker_r47 <= 32'h00000000;
                ker_r48 <= 32'hBF800000;  ker_r49 <= 32'hC0000000;  ker_r50 <= 32'hC0400000;  ker_r51 <= 32'h00000000;ker_r52 <= 32'h40400000;  ker_r53 <= 32'h40000000;  ker_r54 <= 32'h3F800000;  ker_r55 <= 32'h00000000;
                ker_r56 <= 32'h00000000;  ker_r57 <= 32'h00000000;  ker_r58 <= 32'h00000000;  ker_r59 <= 32'h00000000;ker_r60 <= 32'h00000000;  ker_r61 <= 32'h00000000;  ker_r62 <= 32'h00000000;  ker_r63 <= 32'h00000000;
                
                // Set all imaginary parts to zero
                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0;
                end
            // emboss
            3'd1:begin
                ker_r0 <=  32'hC0000000; ker_r1 <=  32'hBF800000; ker_r2 <=  32'h00000000; ker_r3 <=  32'h00000000; ker_r4 <=  32'h00000000; ker_r5 <=  32'h00000000; ker_r6 <=  32'h3F800000; ker_r7 <=  32'h40000000;
                ker_r8 <=  32'hC0000000; ker_r9 <=  32'hBF800000; ker_r10 <= 32'h00000000; ker_r11 <= 32'h00000000; ker_r12 <= 32'h00000000; ker_r13 <= 32'h00000000; ker_r14 <= 32'h3F800000; ker_r15 <= 32'h40000000;
                ker_r16 <= 32'hC0000000; ker_r17 <= 32'hBF800000; ker_r18 <= 32'h00000000; ker_r19 <= 32'h00000000; ker_r20 <= 32'h00000000; ker_r21 <= 32'h00000000; ker_r22 <= 32'h3F800000; ker_r23 <= 32'h40000000;
                ker_r24 <= 32'hC0000000; ker_r25 <= 32'hBF800000; ker_r26 <= 32'h00000000; ker_r27 <= 32'h00000000; ker_r28 <= 32'h00000000; ker_r29 <= 32'h00000000; ker_r30 <= 32'h3F800000; ker_r31 <= 32'h40000000;
                ker_r32 <= 32'hC0000000; ker_r33 <= 32'hBF800000; ker_r34 <= 32'h00000000; ker_r35 <= 32'h00000000; ker_r36 <= 32'h00000000; ker_r37 <= 32'h00000000; ker_r38 <= 32'h3F800000; ker_r39 <= 32'h40000000;
                ker_r40 <= 32'hC0000000; ker_r41 <= 32'hBF800000; ker_r42 <= 32'h00000000; ker_r43 <= 32'h00000000; ker_r44 <= 32'h00000000; ker_r45 <= 32'h00000000; ker_r46 <= 32'h3F800000; ker_r47 <= 32'h40000000;
                ker_r48 <= 32'hC0000000; ker_r49 <= 32'hBF800000; ker_r50 <= 32'h00000000; ker_r51 <= 32'h00000000; ker_r52 <= 32'h00000000; ker_r53 <= 32'h00000000; ker_r54 <= 32'h3F800000; ker_r55 <= 32'h40000000;
                ker_r56 <= 32'hC0000000; ker_r57 <= 32'hBF800000; ker_r58 <= 32'h00000000; ker_r59 <= 32'h00000000; ker_r60 <= 32'h00000000; ker_r61 <= 32'h00000000; ker_r62 <= 32'h3F800000; ker_r63 <= 32'h40000000;
                
                // Set all imaginary parts to zero
                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0;
                end
            // edge enhancement
            3'd2:begin
                ker_r0 <=  32'h00000000; ker_r1 <=  32'h00000000; ker_r2 <=  32'hBF800000; ker_r3 <=  32'hBF800000; ker_r4 <=  32'hBF800000; ker_r5 <=  32'hBF800000; ker_r6 <=  32'h00000000; ker_r7 <=  32'h00000000;
                ker_r8 <=  32'h00000000; ker_r9 <=  32'hBF800000; ker_r10 <= 32'hC0400000; ker_r11 <= 32'hC0400000; ker_r12 <= 32'hC0400000; ker_r13 <= 32'hC0400000; ker_r14 <= 32'hBF800000; ker_r15 <= 32'h00000000;
                ker_r16 <= 32'hBF800000; ker_r17 <= 32'hC0400000; ker_r18 <= 32'h00000000; ker_r19 <= 32'h40E00000; ker_r20 <= 32'h40E00000; ker_r21 <= 32'h00000000; ker_r22 <= 32'hC0400000; ker_r23 <= 32'hBF800000;
                ker_r24 <= 32'hBF800000; ker_r25 <= 32'hC0400000; ker_r26 <= 32'h40E00000; ker_r27 <= 32'h41700000; ker_r28 <= 32'h41700000; ker_r29 <= 32'h40E00000; ker_r30 <= 32'hC0400000; ker_r31 <= 32'hBF800000;
                ker_r32 <= 32'hBF800000; ker_r33 <= 32'hC0400000; ker_r34 <= 32'h40E00000; ker_r35 <= 32'h41700000; ker_r36 <= 32'h41700000; ker_r37 <= 32'h40E00000; ker_r38 <= 32'hC0400000; ker_r39 <= 32'hBF800000;
                ker_r40 <= 32'hBF800000; ker_r41 <= 32'hC0400000; ker_r42 <= 32'h00000000; ker_r43 <= 32'h40E00000; ker_r44 <= 32'h40E00000; ker_r45 <= 32'h00000000; ker_r46 <= 32'hC0400000; ker_r47 <= 32'hBF800000;
                ker_r48 <= 32'h00000000; ker_r49 <= 32'hBF800000; ker_r50 <= 32'hC0400000; ker_r51 <= 32'hC0400000; ker_r52 <= 32'hC0400000; ker_r53 <= 32'hC0400000; ker_r54 <= 32'hBF800000; ker_r55 <= 32'h00000000;
                ker_r56 <= 32'h00000000; ker_r57 <= 32'h00000000; ker_r58 <= 32'hBF800000; ker_r59 <= 32'hBF800000; ker_r60 <= 32'hBF800000; ker_r61 <= 32'hBF800000; ker_r62 <= 32'h00000000; ker_r63 <= 32'h00000000;
                
                // Set all imaginary parts to zero
                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0;
                end
            // high pass
            3'd3:begin
                ker_r0 <=  32'hBF800000; ker_r1 <=  32'hBF800000; ker_r2 <=  32'hBF800000; ker_r3 <=  32'hBF800000; ker_r4 <=  32'hBF800000; ker_r5 <=  32'hBF800000; ker_r6 <=  32'hBF800000; ker_r7 <=  32'hBF800000;
                ker_r8 <=  32'hBF800000; ker_r9 <=  32'hBF800000; ker_r10 <= 32'hBF800000; ker_r11 <= 32'hBF800000; ker_r12 <= 32'hBF800000; ker_r13 <= 32'hBF800000; ker_r14 <= 32'hBF800000; ker_r15 <= 32'hBF800000;
                ker_r16 <= 32'hBF800000; ker_r17 <= 32'hBF800000; ker_r18 <= 32'hBF800000; ker_r19 <= 32'hBF800000; ker_r20 <= 32'hBF800000; ker_r21 <= 32'hBF800000; ker_r22 <= 32'hBF800000; ker_r23 <= 32'hBF800000;
                ker_r24 <= 32'hBF800000; ker_r25 <= 32'hBF800000; ker_r26 <= 32'hBF800000; ker_r27 <= 32'h427C0000; ker_r28 <= 32'hBF800000; ker_r29 <= 32'hBF800000; ker_r30 <= 32'hBF800000; ker_r31 <= 32'hBF800000;
                ker_r32 <= 32'hBF800000; ker_r33 <= 32'hBF800000; ker_r34 <= 32'hBF800000; ker_r35 <= 32'hBF800000; ker_r36 <= 32'hBF800000; ker_r37 <= 32'hBF800000; ker_r38 <= 32'hBF800000; ker_r39 <= 32'hBF800000;
                ker_r40 <= 32'hBF800000; ker_r41 <= 32'hBF800000; ker_r42 <= 32'hBF800000; ker_r43 <= 32'hBF800000; ker_r44 <= 32'hBF800000; ker_r45 <= 32'hBF800000; ker_r46 <= 32'hBF800000; ker_r47 <= 32'hBF800000;
                ker_r48 <= 32'hBF800000; ker_r49 <= 32'hBF800000; ker_r50 <= 32'hBF800000; ker_r51 <= 32'hBF800000; ker_r52 <= 32'hBF800000; ker_r53 <= 32'hBF800000; ker_r54 <= 32'hBF800000; ker_r55 <= 32'hBF800000;
                ker_r56 <= 32'hBF800000; ker_r57 <= 32'hBF800000; ker_r58 <= 32'hBF800000; ker_r59 <= 32'hBF800000; ker_r60 <= 32'hBF800000; ker_r61 <= 32'hBF800000; ker_r62 <= 32'hBF800000; ker_r63 <= 32'hBF800000;            
            // Set all imaginary parts to zero
                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0;
 
                end
            //low pass
            3'd4:begin
                ker_r0 <=  32'h3C800000; ker_r1 <=  32'h3C800000; ker_r2 <=  32'h3C800000; ker_r3 <=  32'h3C800000; ker_r4 <=  32'h3C800000; ker_r5 <=  32'h3C800000; ker_r6 <=  32'h3C800000; ker_r7 <=  32'h3C800000;
                ker_r8 <=  32'h3C800000; ker_r9 <=  32'h3C800000; ker_r10 <= 32'h3C800000; ker_r11 <= 32'h3C800000; ker_r12 <= 32'h3C800000; ker_r13 <= 32'h3C800000; ker_r14 <= 32'h3C800000; ker_r15 <=  32'h3C800000;
                ker_r16 <= 32'h3C800000; ker_r17 <= 32'h3C800000; ker_r18 <= 32'h3C800000; ker_r19 <= 32'h3C800000; ker_r20 <= 32'h3C800000; ker_r21 <= 32'h3C800000; ker_r22 <= 32'h3C800000; ker_r23 <= 32'h3C800000;
                ker_r24 <= 32'h3C800000; ker_r25 <= 32'h3C800000; ker_r26 <= 32'h3C800000; ker_r27 <= 32'h3C800000; ker_r28 <= 32'h3C800000; ker_r29 <= 32'h3C800000; ker_r30 <= 32'h3C800000; ker_r31 <= 32'h3C800000;
                ker_r32 <= 32'h3C800000; ker_r33 <= 32'h3C800000; ker_r34 <= 32'h3C800000; ker_r35 <= 32'h3C800000; ker_r36 <= 32'h3C800000; ker_r37 <= 32'h3C800000; ker_r38 <= 32'h3C800000; ker_r39 <= 32'h3C800000;
                ker_r40 <= 32'h3C800000; ker_r41 <= 32'h3C800000; ker_r42 <= 32'h3C800000; ker_r43 <= 32'h3C800000; ker_r44 <= 32'h3C800000; ker_r45 <= 32'h3C800000; ker_r46 <= 32'h3C800000; ker_r47 <= 32'h3C800000;
                ker_r48 <= 32'h3C800000; ker_r49 <= 32'h3C800000; ker_r50 <= 32'h3C800000; ker_r51 <= 32'h3C800000; ker_r52 <= 32'h3C800000; ker_r53 <= 32'h3C800000; ker_r54 <= 32'h3C800000; ker_r55 <= 32'h3C800000;
                ker_r56 <= 32'h3C800000; ker_r57 <= 32'h3C800000; ker_r58 <= 32'h3C800000; ker_r59 <= 32'h3C800000; ker_r60 <= 32'h3C800000; ker_r61 <= 32'h3C800000; ker_r62 <= 32'h3C800000; ker_r63 <= 32'h3C800000;

            // Set all imaginary parts to zero
                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0; 
                end
            // guassian blur
            3'd5:begin
                ker_r0  <= 32'h3951b717; ker_r1  <= 32'h399d4952; ker_r2  <= 32'h3a03126f; ker_r3  <= 32'h3b2a64c3; ker_r4  <= 32'hbc7765fe; ker_r5  <= 32'h3b2a64c3; ker_r6  <= 32'h3a03126f; ker_r7  <= 32'h399d4952;
                ker_r8  <= 32'h399d4952; ker_r9  <= 32'h399d4952; ker_r10 <= 32'h3a1d4952; ker_r11 <= 32'h3b4b295f; ker_r12 <= 32'hbc91d14e; ker_r13 <= 32'h3b4b295f; ker_r14 <= 32'h3a1d4952; ker_r15 <= 32'h399d4952;
                ker_r16 <= 32'h3a03126f; ker_r17 <= 32'h3a1d4952; ker_r18 <= 32'h3a83126f; ker_r19 <= 32'h3bb0f27c; ker_r20 <= 32'hbcfec56d; ker_r21 <= 32'h3bb0f27c; ker_r22 <= 32'h3a83126f; ker_r23 <= 32'h3a1d4952;
                ker_r24 <= 32'h3b2a64c3; ker_r25 <= 32'h3b4b295f; ker_r26 <= 32'h3bb0f27c; ker_r27 <= 32'h3cf9db23; ker_r28 <= 32'hbe32e48f; ker_r29 <= 32'h3cf9db23; ker_r30 <= 32'h3bb0f27c; ker_r31 <= 32'h3b4b295f;
                ker_r32 <= 32'hbc7765fe; ker_r33 <= 32'hbc91d14e; ker_r34 <= 32'hbcfec56d; ker_r35 <= 32'hbe32e48f; ker_r36 <= 32'h3f800000; ker_r37 <= 32'hbe32e48f; ker_r38 <= 32'hbcfec56d; ker_r39 <= 32'hbc91d14e;
                ker_r40 <= 32'h3b2a64c3; ker_r41 <= 32'h3b4b295f; ker_r42 <= 32'h3bb0f27c; ker_r43 <= 32'h3cf9db23; ker_r44 <= 32'hbe32e48f; ker_r45 <= 32'h3cf9db23; ker_r46 <= 32'h3bb0f27c; ker_r47 <= 32'h3b4b295f;
                ker_r48 <= 32'h3a03126f; ker_r49 <= 32'h3a1d4952; ker_r50 <= 32'h3a83126f; ker_r51 <= 32'h3bb0f27c; ker_r52 <= 32'hbcfec56d; ker_r53 <= 32'h3bb0f27c; ker_r54 <= 32'h3a83126f; ker_r55 <= 32'h3a1d4952;
                ker_r56 <= 32'h399d4952; ker_r57 <= 32'h399d4952; ker_r58 <= 32'h3a1d4952; ker_r59 <= 32'h3b4b295f; ker_r60 <= 32'hbc91d14e; ker_r61 <= 32'h3b4b295f; ker_r62 <= 32'h3a1d4952; ker_r63 <= 32'h399d4952;

                ker_i0 <= 32'h0; ker_i1 <= 32'h0; ker_i2 <= 32'h0; ker_i3 <= 32'h0; ker_i4 <= 32'h0; ker_i5 <= 32'h0; ker_i6 <= 32'h0; ker_i7 <= 32'h0;
                ker_i8 <= 32'h0; ker_i9 <= 32'h0; ker_i10 <= 32'h0; ker_i11 <= 32'h0; ker_i12 <= 32'h0; ker_i13 <= 32'h0; ker_i14 <= 32'h0; ker_i15 <= 32'h0;
                ker_i16 <= 32'h0; ker_i17 <= 32'h0; ker_i18 <= 32'h0; ker_i19 <= 32'h0; ker_i20 <= 32'h0; ker_i21 <= 32'h0; ker_i22 <= 32'h0; ker_i23 <= 32'h0;
                ker_i24 <= 32'h0; ker_i25 <= 32'h0; ker_i26 <= 32'h0; ker_i27 <= 32'h0; ker_i28 <= 32'h0; ker_i29 <= 32'h0; ker_i30 <= 32'h0; ker_i31 <= 32'h0;
                ker_i32 <= 32'h0; ker_i33 <= 32'h0; ker_i34 <= 32'h0; ker_i35 <= 32'h0; ker_i36 <= 32'h0; ker_i37 <= 32'h0; ker_i38 <= 32'h0; ker_i39 <= 32'h0;
                ker_i40 <= 32'h0; ker_i41 <= 32'h0; ker_i42 <= 32'h0; ker_i43 <= 32'h0; ker_i44 <= 32'h0; ker_i45 <= 32'h0; ker_i46 <= 32'h0; ker_i47 <= 32'h0;
                ker_i48 <= 32'h0; ker_i49 <= 32'h0; ker_i50 <= 32'h0; ker_i51 <= 32'h0; ker_i52 <= 32'h0; ker_i53 <= 32'h0; ker_i54 <= 32'h0; ker_i55 <= 32'h0;
                ker_i56 <= 32'h0; ker_i57 <= 32'h0; ker_i58 <= 32'h0; ker_i59 <= 32'h0; ker_i60 <= 32'h0; ker_i61 <= 32'h0; ker_i62 <= 32'h0; ker_i63 <= 32'h0; 
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