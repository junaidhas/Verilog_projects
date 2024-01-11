`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 05:41:56
// Design Name: 
// Module Name: sipo
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


module sipo(input clk,rst,din, output reg [3:0] dout);
reg [3:0] temp;
always @ (posedge clk)
if (rst == 1)
dout = 4'b0000;
else
begin
temp = dout>>1;
dout = {din, temp[2:0]};
end 
endmodule
