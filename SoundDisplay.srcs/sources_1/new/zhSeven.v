`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 04:47:11
// Design Name: 
// Module Name: zhSeven
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


module zhSeven(input [3:0] num, 
output reg [7:0] seg 
    );
    
    parameter [7:0] zero = 8'b11000000;
        parameter [7:0] one = 8'b11111001; //1 2
        parameter [7:0] two = 8'b10100100; //01346
        parameter [7:0] three = 8'b10110000; //01236
        parameter [7:0] four = 8'b10011001; //1256
        parameter [7:0] five = 8'b10010010; 
        parameter [7:0] six = 8'b10000010; //023456
        parameter [7:0] seven = 8'b11111000; //012
        parameter [7:0] eight = 8'b10000000;
        parameter [7:0] nine = 8'b10010000;

//active low logic 
always @ (*)
   case (num) 
		0: seg = zero;
		1: seg = one;
		2: seg = two;
		3: seg = three;
		4: seg = four;
		5: seg = five;
		6: seg = six;
		7: seg = seven;
		8: seg = eight;
		9: seg = nine;
      default: seg = 8'b10000001; 
   endcase	
    
endmodule


