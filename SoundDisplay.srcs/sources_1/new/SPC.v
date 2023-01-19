`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2022 02:38:20
// Design Name: 
// Module Name: SPC
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


module SPC(input pb, clk_100Hz, output spout);

wire Q0;
wire Q1;

dflipflop unit0 (clk_100Hz, pb, Q0);
dflipflop unit1 (clk_100Hz, Q0, Q1);

assign spout = (Q0 & ~Q1);

endmodule
