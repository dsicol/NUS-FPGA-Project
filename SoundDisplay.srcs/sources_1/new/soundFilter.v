`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 19:53:48
// Design Name: 
// Module Name: soundFilter
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


module soundFilter(input clk20, input [11:0] mic_in, output reg [2:0] level = 0);

reg state = 0;
reg [11:0] max_mic = 0;
reg [31:0] counter = 0;

always @(posedge clk20) begin
    
    if (max_mic < mic_in) begin
        max_mic <= mic_in;
    end
    
    else max_mic <= max_mic;
    
    if (counter == 2000) begin
    
        counter <= 0;
        max_mic <= 0;
        
        if (max_mic >= 0 && max_mic < 2048) begin
            level <= 0;
        end
        
        else if (max_mic >= 2048 && max_mic < 2500) begin //2048, 2500
            level <= 1;
        end
        
        else if (max_mic >= 2500 && max_mic < 3000) begin //2500,3000
            level <= 2;
        end
        
        else if (max_mic >= 3000 && max_mic < 3500) begin //3000, 3500
            level <= 3;
        end
        
        else if (max_mic >= 3500 && max_mic < 4000) begin //3500,4000
            level <= 4;
        end
        
        else if (max_mic >= 4000) begin //4000
            level <= 5;
        end
        
        else level <= level;
    end
    
    else begin
    
        counter <= counter + 1;
        
    end
    
end

endmodule
