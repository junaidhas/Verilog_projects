`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 13:31:11
// Design Name: 
// Module Name: TFF
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


module TFF(Q,T,clk,rst);

input T,clk,rst;
output reg Q;

always @ (posedge clk or posedge rst)
begin
    if (rst)
        Q = 1'b0;
    else
        begin
            if (T)
            Q = ~Q;
            else
            Q = Q;
        end
end
endmodule
