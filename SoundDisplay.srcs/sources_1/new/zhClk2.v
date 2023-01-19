`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 04:49:55
// Design Name: 
// Module Name: zhClk2
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


module zhClk2(input clk,  
output    rstclk,  
output    clk_1hz 

);

reg [26:0] 	count = 0;  
reg [16:0] 	reset = 0; 


reg      	temp_clk = 0; 
reg 		rclk = 0;


assign clk_1hz = temp_clk;// 0.5Hz clock
assign rstclk = rclk; //reset clock

always @(posedge clk) begin 
  if (count < 10000000) begin 
    count <= count + 1; 
  end
  else begin
    temp_clk <= ~temp_clk; 
    count <= 0; 
  end
end

always @(posedge clk) begin 
	if (reset < 100000) begin 
		reset <= reset + 1; 
	end else begin
		reset <= 0; 
		rclk <= ~rclk; 
	end
end


endmodule
