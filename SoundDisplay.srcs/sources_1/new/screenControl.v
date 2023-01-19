`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2022 21:29:53
// Design Name: 
// Module Name: screenControl
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


module screenControl(input clock100, btnC, btnL, btnR, menus, output reg [2:0] screen = 0);

    always @(posedge clock100) begin
    
        if (btnC == 1 && menus && screen >= 0 && screen < 3) screen <= screen + 1;
        else if (btnL == 1 && menus && screen > 0) screen <= screen - 1;
        else screen <= screen;        
    
    end

endmodule
