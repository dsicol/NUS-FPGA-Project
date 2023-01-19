`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 14:27:46
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(input clock, input [31:0] m_value, output reg myClk = 0);

reg [31:0] count = 0;

always @ (posedge clock) begin

count <= (count == m_value) ? 0 : count + 1;
myClk <= (count == 0) ? ~myClk : myClk; 

end

endmodule
