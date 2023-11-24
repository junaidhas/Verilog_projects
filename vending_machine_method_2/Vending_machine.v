`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2023 03:47:33
// Design Name: 
// Module Name: Vending_machine
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


module Vending_machine(

    input nickel_in,
    input dime_in,
    input quarter_in,
    input clk,
    input rst,
    output reg collect,
    output reg nickel_out,
    output reg dime_out,
    output reg dispense

    );
    
    reg [3:0] nickel_num;
    reg return_change;
    
    /**************************/
    
always @ ( posedge clk or posedge rst)
if (rst) begin
    nickel_out = 0;
    dime_out = 0;
    dispense = 0;
    collect = 0;
    nickel_num = 0;
    return_change = 0;
end else begin
    nickel_out = 0;
    dime_out = 0;
    dispense = 0;
    collect = 0;
    
    //check whether money has come in 
    if (nickel_in)
        nickel_num = nickel_num + 1;
    else if (dime_in)
        nickel_num = nickel_num + 2;
    else if (quarter_in)    
        nickel_num = nickel_num + 5;
        
        
    // correct money deposited?
    if (nickel_num >=7 )
    begin
        nickel_num = nickel_num - 7;
        dispense = 1;
        collect = 1;
    end
    
    // return change
    if (return_change || collect )
    begin
        if (nickel_num >=2 )
        begin
            dime_out = 1;
            nickel_num = nickel_num - 2;
            return_change = 1;
        end
        
        if (nickel_num ==1 )
        begin
            nickel_out = 1;
            nickel_num = nickel_num - 1;
            return_change = 1;
        end    
     end          
end

    
endmodule
