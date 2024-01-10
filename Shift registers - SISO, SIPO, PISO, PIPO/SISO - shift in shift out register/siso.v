`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 03:05:38
// Design Name: 
// Module Name: siso
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


module siso(input clk,rst,din, output dout);
reg [3:0]temp ; //temp register temp
always @ (posedge clk)
if (rst==1)
begin 
temp<=4'b0000;
end 
else
begin
temp<=temp>>1; // right shift the 4 bit register by 1 bit
temp[3]<=din; // data_in is assigned to temp[3]
end
assign dout =temp[0]; // in every clock cycle the 0 th bit is captured as output.
endmodule
