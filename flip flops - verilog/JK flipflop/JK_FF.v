`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 22:31:37
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(j,k,clk,rst,Q,Qbar);
    
    input j,k,clk,rst;
    output reg Q,Qbar;
    
    reg Q =0; 
    always @ (posedge clk)
    if (rst==1'b1)
        begin 
            Q<=1'b0; Qbar<=1'b1;
        end
    else 
        case ({j,k})
        2'b00:begin Q<=Q; Qbar<=Qbar; end 
        2'b01:begin Q<=1'b0; Qbar<=1'b1;end 
        2'b10:begin Q<=1'b1; Qbar<=1'b0; end 
        2'b11:begin Q<=~Q; Qbar<=~Qbar;end 
        default: {Q,Qbar}<=2'bxx;
        endcase        
        
endmodule        

