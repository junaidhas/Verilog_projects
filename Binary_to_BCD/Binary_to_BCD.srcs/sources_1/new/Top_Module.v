`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 23:26:49
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input [7:0] sw,
    input clk,
    output [3:0] an,
    output [6:0] seg
    
    );
    
    wire clk_out; // Its the slow clock as Basys 3 frequency is 1MHZ we use only 100Hz in circuit
    wire [1:0] counter_out;
    wire [3:0] mux_out;
    wire [3:0] zeros, ones, tens, hundreds;
    // parameter zeros = 4'b0000;
    
    // put the system together by instantiating all the modules.
    
    Binary_BCD_Converter L1(sw, ones, tens, hundreds);
    four_one_Mux L2(zeros, ones, tens, hundreds, counter_out, mux_out);
    Slow_Clock L3 (clk_in, clk_out);    
    two_bit_counter L4 (clk_out, counter_out);
    Decoder L5 (counter_out, an);
    BCD_Seven_segment L6 (mux_out, seg);
    
endmodule
