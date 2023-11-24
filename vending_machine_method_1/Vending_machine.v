`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2023 10:46:11
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
    
    reg[11:0] current_state, next_state ;
    
    localparam S0 = 12'b0000_0000_0001,
               S5 = 12'b0000_0000_0010,
               S10 = 12'b0000_0000_0100,
               S15 = 12'b0000_0000_1000,
               S20 = 12'b0000_0001_0000,
               S25 = 12'b0000_0010_0000,
               S30 = 12'b0000_0100_0000,
               S35 = 12'b0000_1000_0000,
               S40 = 12'b0001_0000_0000,
               S45 = 12'b0010_0000_0000,
               S50 = 12'b0100_0000_0000,
               S55 = 12'b1000_0000_0000;
               
    always @(posedge clk or posedge rst)
                    if (rst) begin
                        current_state <= S0;
                    end else begin 
                        current_state <= next_state;
                    end               

/****    
    always @(nickel_in or dime_in or quarter_in)
        case(current_state)
            S0: if ( nickel_in == 1 )           begin next_state = S5; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else if ( dime_in == 1 )        begin next_state = S10; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else if ( quarter_in == 1 )     begin next_state = S25; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else begin                            next_state = S0; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                
            S5: if ( nickel_in == 1 )           begin next_state = S10; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else if ( dime_in == 1 )        begin next_state = S15; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else if ( quarter_in == 1 )     begin next_state = S30; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                else begin                            next_state = S5; { collect, nickel_out, dime_out, dispense } = 4'b0000; end

            S10: if ( nickel_in == 1 )           begin next_state = S15; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( dime_in == 1 )        begin next_state = S20; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( quarter_in == 1 )     begin next_state = S35; { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                 else begin                            next_state = S10; { collect, nickel_out, dime_out, dispense } = 4'b0000; end 

            S15: if ( nickel_in == 1 )           begin next_state = S20; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( dime_in == 1 )        begin next_state = S25; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( quarter_in == 1 )     begin next_state = S40; { collect, nickel_out, dime_out, dispense } = 4'b1101; end
                 else begin                            next_state = S15; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
            
            S20: if ( nickel_in == 1 )           begin next_state = S25; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( dime_in == 1 )        begin next_state = S30; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( quarter_in == 1 )     begin next_state = S45; { collect, nickel_out, dime_out, dispense } = 4'b1011; end
                 else begin                            next_state = S20; { collect, nickel_out, dime_out, dispense } = 4'b0000; end                                               

            S25: if ( nickel_in == 1 )           begin next_state = S30; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
                 else if ( dime_in == 1 )        begin next_state = S35; { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                 else if ( quarter_in == 1 )     begin next_state = S50; { collect, nickel_out, dime_out, dispense } = 4'b1111; end
                 else begin                            next_state = S25; { collect, nickel_out, dime_out, dispense } = 4'b0000; end                       

            S30: if ( nickel_in == 1 )           begin next_state = S35; { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                 else if ( dime_in == 1 )        begin next_state = S40; { collect, nickel_out, dime_out, dispense } = 4'b1101; end
                 else if ( quarter_in == 1 )     begin next_state = S55; { collect, nickel_out, dime_out, dispense } = 4'b1111; end
                 else begin                            next_state = S30; { collect, nickel_out, dime_out, dispense } = 4'b0000; end

            S35: next_state = S0;
            S40: next_state = S0;
            S45: next_state = S0;
            S50: next_state = S0;
            S55: begin next_state = S0; { collect, nickel_out, dime_out, dispense } = 4'b0010; end
            
default: begin  next_state = S0; { collect, nickel_out, dime_out, dispense } = 4'b0000; end
endcase
****/
    always @(nickel_in or dime_in or quarter_in)
        begin
        { collect, nickel_out, dime_out, dispense } = 4'b0000;
        case(current_state)
            S0: if ( nickel_in == 1 )           begin next_state = S5;   end
                else if ( dime_in == 1 )        begin next_state = S10;  end
                else if ( quarter_in == 1 )     begin next_state = S25;  end
                else begin                            next_state = S0;   end
            
            S5: if ( nickel_in == 1 )           begin next_state = S10;   end
                else if ( dime_in == 1 )        begin next_state = S15;  end
                else if ( quarter_in == 1 )     begin next_state = S30;  end
                else begin                            next_state = S5;   end
            
            S10: if ( nickel_in == 1 )           begin next_state = S15;   end
                 else if ( dime_in == 1 )        begin next_state = S20;  end
                 else if ( quarter_in == 1 )     begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                 else begin                            next_state = S10;   end            
                                
            
            S15: if ( nickel_in == 1 )           begin next_state = S20;   end
                 else if ( dime_in == 1 )        begin next_state = S25;  end
                 else if ( quarter_in == 1 )     begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1101; end
                 else begin                            next_state = S15;   end
            
            S20: if ( nickel_in == 1 )           begin next_state = S25;   end
                 else if ( dime_in == 1 )        begin next_state = S30;  end
                 else if ( quarter_in == 1 )     begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1011; end
                 else begin                            next_state = S20;   end
           
           S25: if ( nickel_in == 1 )           begin next_state = S30;   end
                else if ( dime_in == 1 )        begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                else if ( quarter_in == 1 )     begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1111; end
                else begin                            next_state = S25;   end
                
           S30: if ( nickel_in == 1 )           begin next_state = S0;   { collect, nickel_out, dime_out, dispense } = 4'b1001; end
                else if ( dime_in == 1 )        begin next_state = S0;  { collect, nickel_out, dime_out, dispense } = 4'b1101; end
                else if ( quarter_in == 1 )     begin next_state = S55;  { collect, nickel_out, dime_out, dispense } = 4'b1111; end
                else begin                            next_state = S30;   end
                
//           S35: next_state = S0;
//           S40: next_state = S0;
//           S45: next_state = S0;
//           S50: next_state = S0;  

            S55: begin next_state = S0; { collect, nickel_out, dime_out, dispense } = 4'b0010; end
            
            default: begin next_state = S0; { collect, nickel_out, dime_out, dispense } = 4'b0000; end 
            
            endcase
            
 end                   
                  
endmodule
