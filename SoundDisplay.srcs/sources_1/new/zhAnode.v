`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 04:48:53
// Design Name: 
// Module Name: zhAnode
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


module zhAnode(input rstclk, 
output        an1, 
output        an2, 
output        an3, 
output        an4  
    );


reg [3:0] order = 4'b0111; 

assign an1 = order[3]; 
assign an2 = order[2]; 
assign an3 = order[1]; 
assign an4 = order[0]; 

always @(posedge rstclk) begin
  order <= {order[0],order[3:1]}; 
end

endmodule
