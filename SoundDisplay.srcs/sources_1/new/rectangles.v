`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 06:27:31
// Design Name: 
// Module Name: rectangles
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


module rectangles(input clock, input [12:0] pindex, input btnD, output reg [15:0] oled_data, output led);
    localparam red = 16'hF800;
    localparam orange = 16'hFE00;
    localparam bright_green = 16'h7CA8;
    localparam green = 16'hC6B4;
    localparam dim_green = 16'hEF9B;
    localparam black = 16'h0000;
    
    
    
    wire clk_10;  
    wire down5sec;  
  
    
    fivesecs fs (clock, btnD, down5sec, led);
    
    reg [2:0] btncnt = 0;
    wire [7:0] x;
    wire [6:0] y;
    
   
    assign x = pindex % 96;
    assign y = 63 - (pindex / 96);
    
    
    always @(posedge clock) begin
       if((x >= 43 && x <= 52) && (y >=14  && y <=18 ))
         oled_data <= red;                        
       else if((x >= 43 && x <= 52) && (y >=22  && y <=26))  
         oled_data <= orange;
       else if((x >= 43 && x <= 52) && (y >=30  && y <=34 )&&(btncnt>=1))
         oled_data <= bright_green;
       else if ((x >= 43 && x <= 52) && (y >=38  && y <=42 )&&(btncnt>=2))
         oled_data <= green;
       else if ((x >= 43 && x <= 52) && (y >=46  && y <=50 )&&(btncnt>=3))
         oled_data <= dim_green;
       else 
         oled_data <= black;  
    end
    
    
   always @(posedge down5sec)begin    
    if (btncnt <= 2)
     btncnt <= btncnt + 1;
    else
     btncnt <= 0;
    end
  endmodule
