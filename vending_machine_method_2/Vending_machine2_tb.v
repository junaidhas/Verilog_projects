`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2023 04:07:19
// Design Name: 
// Module Name: Vending_machine2_tb
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




`define clk_period 10

module Vending_machine_tb();

reg nickel_in, dime_in, quarter_in, clk, rst;
wire collect, nickel_out, dime_out, dispense ;

Vending_machine VM(
    .nickel_in(nickel_in),
    .dime_in(dime_in),
    .quarter_in(quarter_in),
    .clk(clk),
    .rst(rst),
    .collect(collect),
    .nickel_out(nickel_out),
    .dime_out(dime_out),
    .dispense(dispense)
    );
    
    initial clk = 1;
    always #(`clk_period/2) clk = ~clk;
    
    initial begin
    nickel_in = 0;
    dime_in = 0;
    quarter_in = 0;
    rst = 0;
    #`clk_period;
    
    rst = 1;  //begin to reset;
    #`clk_period;
    
    rst = 0;
    #(`clk_period);
    
    
    nickel_in = 1;  //5 cents
    dime_in = 0;
    quarter_in = 0;
    #(`clk_period);
    
    nickel_in = 0;  //10 cents
    dime_in = 1;
    quarter_in = 0;
    #(`clk_period);
    
    nickel_in = 0;  //25 cents
    dime_in = 0;
    quarter_in = 1;
    #(`clk_period);
    
    nickel_in = 0;  //25 cents
    dime_in = 0;
    quarter_in = 0;
    #(`clk_period);
    
    //5+10+25 = 40; The price of drink is 35 cents, It should output one nickel
    // It means the nickel_out will be "1"
    // collect, dispense will also be "1", and dime_out will be "0";
    
    #(`clk_period *5);
    
    $finish;
    
    end

endmodule     
    
    