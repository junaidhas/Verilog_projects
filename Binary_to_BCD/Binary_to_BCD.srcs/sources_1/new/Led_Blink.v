`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2024 04:14:17
// Design Name: 
// Module Name: Slow_Clock
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


module Slow_Clock(
    input clk_in, // input clock which is 100mhz from Basys 3 board
    output reg clk_out // slow clock at 100hz frequency
    );
    
    reg [20:0] count = 0;
    
    
    always @(posedge clk_in) // whenever the positive edge if clock arrives
    begin
    count<=count+1; //counter goes up by 1 
    if (count==500_000)//once the counter reaches the value of 500,000
    begin
    count<=0;//counter reset itself to zero
    clk_out = ~clk_out;//clock signal should invert
    end
    end
endmodule
