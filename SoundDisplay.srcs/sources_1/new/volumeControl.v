`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 22:09:31
// Design Name: 
// Module Name: volumeControl
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


module volumeControl(input clk20, input [11:0] mic_in, output reg [3:0] level = 0);

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
        
        if (max_mic >= 0 && max_mic < 256) begin
            level <= 0;
        end
        
        else if (max_mic >= 256 && max_mic < 512) begin //2048, 2500
            level <= 1;
        end
        
        else if (max_mic >= 512 && max_mic < 768) begin //2500,3000
            level <= 2;
        end
        
        else if (max_mic >= 768 && max_mic < 1024) begin //3000, 3500
            level <= 3;
        end
        
        else if (max_mic >= 1024 && max_mic < 1280) begin //3500,4000
            level <= 4;
        end
        
        else if (max_mic >= 1280 && max_mic < 1536) begin //4000
            level <= 5;
        end
        
        else if (max_mic >= 1536 && max_mic < 1792) begin //4000
            level <= 6;
        end
                
        else if (max_mic >= 1792 && max_mic < 2048) begin //4000
            level <= 7;
        end
                
        else if (max_mic >= 2048 && max_mic < 2304) begin //4000
            level <= 8;
        end
                
        else if (max_mic >= 2304 && max_mic < 2560) begin //4000
            level <= 9;
        end
                                        
        else if (max_mic >= 2560 && max_mic < 2816) begin //4000
            level <= 10;
        end
                                                
        else if (max_mic >= 2816 && max_mic < 3072) begin //4000
            level <= 11;
        end
                                                        
        else if (max_mic >= 3072 && max_mic < 3328) begin //4000
            level <= 12;
        end
                                                                
        else if (max_mic >= 3328 && max_mic < 3584) begin //4000
            level <= 13;
        end
                                                                        
        else if (max_mic >= 3584 && max_mic < 3840) begin //4000
            level <= 14;
        end
                                                                                
        else if (max_mic >= 3840) begin //4000
            level <= 15;
        end
        
        else level <= level;
        
    end
    
    else begin
    
        counter <= counter + 1;
        
    end
    
end

endmodule



