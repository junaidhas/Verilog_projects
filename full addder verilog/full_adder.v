`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2023 01:54:17
// Design Name: 
// Module Name: full_adder
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

// Full adder
module full_adder(a,b,c,op_sum,op_carry);
   input a;
   input b;
   input c;
    
   output op_sum;
   output op_carry;
// design - 3 types - gate level, data flow, behavioural
// design - data flow- assign keyword, boolean expression + verilog operators
   assign op_sum = a ^ b ^ c; //(^=xor operator)
   assign op_carry = (a & b) | (b & c) | (c & a); //(&=and, |= or operator)
   // assign keyword: continous assignment operator
endmodule



