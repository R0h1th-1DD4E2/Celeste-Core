module fp_sub#(parameter XLEN=32)
                        (input [XLEN-1:0]A,
                         input [XLEN-1:0]B,
                         output[XLEN-1:0] result);
								 
localparam minus_one = 32'hbf800000;
wire [XLEN-1:0]result1;
wire [XLEN-1:0]B1;
assign B1={~B[31],B[30:0]};

fp_add add(A,B1,result1);

//always@(*)begin
//$display("B %h",B);
//$display("A %h",A);
//$display("B1 %h",B1);
//
//$display("result1 %h",result1);
//end
assign result = result1;
endmodule
