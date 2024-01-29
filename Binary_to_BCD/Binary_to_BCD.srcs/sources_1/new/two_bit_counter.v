`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2024 05:14:12
// Design Name: 
// Module Name: two_bit_counter
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


module two_bit_counter(
    input clk, //slow clock
    output [1:0] Q
    );
    
    reg [1:0] temp=0;
    always @ (posedge clk)
    begin
    temp = temp +1;
    end
    assign Q =temp;
    
endmodule
