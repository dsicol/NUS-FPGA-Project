`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 04:50:35
// Design Name: 
// Module Name: zhTop
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


module zhTop(input clk,
input btnU, //stop button
input btnC, //reset button
output [7:0] seg, 
output an1, an2, an3, an4//left most digit

    );

wire clk_1hz; 
wire rstclk; ////refresh the display
reg [3:0] num; //number
wire [3:0] a0; //count for right most digit
wire [3:0] a1; //count for second right most digit
wire [3:0] a2; //count for second left most digit
wire [3:0] a3; //count for left most digit


zhClk2 clk2(
.clk(clk),
.rstclk(rstclk),
.clk_1hz(clk_1hz)
);


zhAnode anode(
.rstclk(rstclk),
.an1(an1),
.an2(an2),
.an3(an3),
.an4(an4)
);

//instantiate counter
zhCounter counter(
.btnU(btnU),
.btnC(btnC),
.clk_1hz(clk_1hz),
.a0(a0),
.a1(a1),
.a2(a2),
.a3(a3)
);


zhSeven seven(
.num(num),
.seg(seg)

);



always @ (*)
    case ({an1,an2,an3,an4})
        4'b0111: num = a0;
        4'b1011: num = a1;
        4'b1101: num = a2;
        4'b1110: num = a3;
        default: num = 0; 
    endcase 

endmodule
