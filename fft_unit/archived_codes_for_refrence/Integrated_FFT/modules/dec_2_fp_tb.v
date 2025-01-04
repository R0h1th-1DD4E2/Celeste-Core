module dec_2_fp_tb;
    
    reg [31:0] dec;
    wire [31:0] ieee_out;

    // Instantiate the DUT (Device Under Test)
    dec_2_fp dut (
        .dec(dec),
        .ieee_out(ieee_out)
    );

    initial begin
        // $display("Time | dec (Decimal) | ieee_out (Hex)");
        // $monitor($time, " | %d | %h", dec, ieee_out);

        // Test case 1: Zero input
        dec = 32'b0;
        #10;

        // Test case 2: Positive number
        dec = 32'd3;
        #10;

        // Test case 3: Negative number
        dec = -32'd1;
        #10;

        // Test case 4: Large positive number
        dec = 32'd2;
        #10;

        // Test case 5: Large negative number
        dec = -32'd3;
        #10;

        $finish;
    end
endmodule
