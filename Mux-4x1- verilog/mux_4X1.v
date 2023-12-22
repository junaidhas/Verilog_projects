`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2023 18:14:53
// Design Name: 
// Module Name: mux_4X1
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


module mux_4X1(inp,sel_in,op);
    input [3:0] inp;
    input [1:0] sel_in;
    output reg op; // by default op is wire type, as it is assigned in
    // a always block it should be reg type.
    
    wire [1:0] sel_in_b;
    wire [3:0] and_op;
    
    // data flow level modelling style
    /*assign op = ((~ sel_in[1]) & ( ~ sel_in[0]) & (inp[0]))
         | ((~ sel_in[1]) & (  sel_in[0]) & (inp[1]))
         | (( sel_in[1]) & ( ~ sel_in[0]) & (inp[2]))
         | (( sel_in[1]) & (  sel_in[01]) & (inp[3]));
         
    // gate level modelling style
    not (sel_in_b[0],sel_in[0]);
    not (sel_in_b[1],sel_in[1]);
    
    and (and_op[0],sel_in_b[1],sel_in_b[0],inp[0]);
    and (and_op[1],sel_in_b[1],sel_in[0],inp[1]);
    and (and_op[2],sel_in[1],sel_in_b[0],inp[2]);
    and (and_op[3],sel_in[1],sel_in[0],inp[3]);     
    
    or (op,and_op[0],and_op[1],and_op[2],and_op[3]);
    */
    // behavioural modelling style
    
    always @ (inp, sel_in) begin
        if (sel_in==2'b00)op = inp[0];
        else if (sel_in==2'b01)op = inp[1];
        else if (sel_in==2'b10)op = inp[2];
        else if (sel_in==2'b11)op = inp[3];
        else op=1'bx;
    end
        
           
endmodule
