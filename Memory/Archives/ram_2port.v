`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 06:31:06 PM
// Design Name: 
// Module Name: ram
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



// parameters for port A
module ram(
    // parameters for port A
    input clkA,
    input write_enA,
    input read_enA,
    input [31:0] data_inA,          // Changed to 32-bit
    output reg [31:0] data_outA,    // Changed to 32-bit
    input [3:0] read_addrA,         // Changed to 4-bit
    input [3:0] write_addrA,        // Changed to 4-bit
    // input parameters for port B
    input clkB,
    input write_enB,
    input read_enB,
    input [31:0] data_inB,          // Changed to 32-bit
    output reg [31:0] data_outB,    // Changed to 32-bit
    input [3:0] read_addrB,         // Changed to 4-bit
    input [3:0] write_addrB         // Changed to 4-bit
);


    reg [31:0] mem [0:8639];
    


 
always@(posedge clkA)
begin
  if(write_enA && !read_enA)
    mem[write_addrA] <= data_inA;
  else if(!write_enA && read_enA)
    data_outA <= mem[read_addrA];
  else
    data_outA <= 8'b0;
end

always@(posedge clkB)
begin
  if(write_enB && !read_enB)
    mem[write_addrB] <= data_inB;
  else if(!write_enB && read_enB)
    data_outB <= mem[read_addrB];
  else
    data_outB <= 8'b0;
end

endmodule



