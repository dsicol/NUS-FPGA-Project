`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 19:13:02
// Design Name: 
// Module Name: Calculator
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

module Calculator(
    input [15:6] sw,
    output [13:6] led1   
    );
    
    wire [7:0] add;
    wire [7:0] sub;
    wire [7:0] div;
    wire [7:0] mut;
   
    //inputs are from switchs 15-12 and switchs 11-8
    assign add = sw[15:12]+sw[11:8];
    assign sub = sw[15:12]-sw[11:8];
    assign mut = sw[15:12]*sw[11:8];
    assign div = sw[15:12]/sw[11:8];
    //add is sw6,7 off|subtract is sw7 off,sw6 on|mutiply is sw7 on sw6 off|divide is sw7 on,sw6 on
    assign led1 =({8{~sw[7]}} & {8{~sw[6]}} & add)|({8{~sw[7]}} & {8{sw[6]}}& sub)|({8{sw[7]}} & {8{~sw[6]}} & mut)| ({8{sw[7]}} & {8{sw[6]}} & div);
    
     
   
  
endmodule
