`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 12:52:03
// Design Name: 
// Module Name: SR_FF
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


module SR_FF(Q,Qbar,S,R,clk,rst,preset);

input S,R,clk,rst, preset;
output reg Q, Qbar;

always @(posedge clk)
if (rst ==1'b1) 
    begin
    Q<=1'b0;Qbar <=1'b1;
    end
else if (preset ==1'b1)
    begin
    Q<=1'b1;Qbar <=1'b0;
    end
else
    case ({S,R})
    2'b00: begin Q<=Q; Qbar<=Qbar; end 
    2'b01: begin Q<=1'b0; Qbar<=1'b1; end 
    2'b10: begin Q<=1'b1; Qbar<=1'b0; end 
    2'b11:begin Q<=1'bx; Qbar<=1'bx; end 
    default: {Q,Qbar}<= 2'bxx;
    endcase
     
endmodule
