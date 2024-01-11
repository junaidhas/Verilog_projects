`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2024 18:07:10
// Design Name: 
// Module Name: pipo
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


module pipo(dout,clk,rst,data_in);
output reg [3:0]dout;
input clk,rst;
input [3:0] data_in;
always @ (posedge clk)
if (rst == 1)
    dout =4'b0000;
else
    dout = data_in;
endmodule
