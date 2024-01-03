`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:12:11
// Design Name: 
// Module Name: dff
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

 //sychronous reset, (reset) activated w.r.t clk. (reset and clk = 1, o/p <=0)
module dff( clk,rst, Din, Dout);
    input clk;
    input rst;
    input Din;
    output reg Dout;
    
   
    always @(posedge clk) begin
        if (rst) Dout<=0;
        else Dout <= Din;
    end    

    
endmodule

//asynchronous reset, (reset is independent of clk. reset is active o/p will become zero and it wont wait for clk to become active)
module dff_1( clk,rst, Din, Dout);
    input clk;
    input rst;
    input Din;
    output reg Dout;
    
   
    always @(posedge clk, posedge rst) begin
        if (rst) Dout<=0;
        else Dout <= Din;
    end    

    
endmodule