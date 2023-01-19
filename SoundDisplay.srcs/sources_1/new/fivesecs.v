`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 06:33:27
// Design Name: 
// Module Name: fivesecs
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


module fivesecs(input clock, input down_sp, output reg down5sec,output reg led);
reg state = 0;
reg [31:0] counter = 0;


always @ (posedge clock)
begin
case (state)
0: begin
led<=0;
if (down_sp) begin
down5sec <= 1;
state <= 1; end
end
1: begin
led<=1;
down5sec <= 0;
counter <= counter +1;
if (counter == 500000000 - 1) begin
 state  <= 0;
 counter <= 0; end
 end
endcase  
end  
endmodule
