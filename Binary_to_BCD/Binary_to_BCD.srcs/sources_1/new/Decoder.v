`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 23:04:17
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [1:0] en,
    output reg [3:0] an
    ); // 2 input 4 output 
    
    always @ (en)
         begin
         case(en)
         0: an=4'b1110;
         1: an=4'b1101;
         2: an=4'b1011;
         3: an=4'b1111;
         endcase
         end
endmodule
