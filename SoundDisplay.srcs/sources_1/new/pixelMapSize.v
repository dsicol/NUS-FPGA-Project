`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2022 20:43:50
// Design Name: 
// Module Name: pixelMapSize
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


module pixelMapSize(input clock, input [31:0] x, y, input [3:0] state, input [1:0] screen, input [3:0] volume, output reg [3:0] anodesignal = 0, output reg [15:0] oled_data);
    
    parameter [15:0] white = 16'b1111111111111111;
    parameter [15:0] black = 16'b0000000000000000;
    parameter [15:0] red = 16'b1111100000000000;
    parameter [15:0] orange = 16'b1111111110000000;
    parameter [15:0] yellow = 16'b1111111111100000;
    parameter [15:0] green = 16'b00000111111000000; // correct area
    parameter [15:0] blue = 16'b0000000000011111;
    parameter [15:0] magenta = 16'b1111100000011111; 
    parameter [15:0] grey = 16'b0000000001100000;
    
//    North America 298pix green
//    South America 215pix green
//    Europe 127pix blue
//    Asia 537pix red
//    Africa 366pix yellow 
//    Antarctica 171pix black/grey bah
//    Oceania 107pix magenta

    
    //Pixel Map
    
    wire pixelmap;
    
    assign pixelmap = (y == 1 && x >= 33 && x <= 38) || (y == 2 && ((x >= 19 && x <= 40) || (x >= 58 && x <= 59) || x == 65)) || (y == 3 && ((x >= 19 && x <= 41) || (x >= 57 && x <= 62) || x == 66 || (x >= 69 && x <= 70))) ||
                      (y == 4 && ((x >= 18 && x <= 40) || (x >= 48 && x <= 52) || (x >= 58 && x <= 61) || (x == 65) | (x >= 69 && x <= 72))) || (y == 5 && ((x >= 15 && x <= 39) || (x >= 49 && x <= 51) || (x >= 71 && x <= 73))) || (y == 6 && ((x >= 12 && x <= 14) || (x >= 17 && x <= 24) || (x >= 26 && x <= 40) || x == 63 || (x >= 70 && x <= 74))) ||
                      (y == 7 && ((x >= 13 && x <= 15) || (x >= 17 && x <= 23) || (x >= 29 && x <= 40) || (x >= 60 && x <= 62) || (x >= 68 && x <= 75) || (x >= 81 && x <= 84))) || (y == 8 && ((x >= 12 && x <= 13) || (x >= 18 && x <= 23) || (x >= 29 && x <= 39) || (x == 60) || (x >= 67 && x <= 74) || (x >= 81 && x <= 82))) || (y == 9 && ((x >= 12 && x <= 16) || (x >= 18 && x <= 25) || (x >= 30 && x <= 38) || x == 59 || (x >= 63 && x <= 79) || (x >= 82 && x <= 84))) ||
                      (y == 10 && ((x >= 2 && x <= 5) || (x >= 12 && x <= 17) || (x >= 19 && x <= 26) || (x >= 31 && x <= 39) || (x >= 51 && x <= 52) || (x >= 59 && x <= 60) || (x >= 63 && x <= 87))) || (y == 11 && ((x >= 1 && x <= 17) || (x >= 19 && x <= 27) || (x >= 31 && x <= 38) || (x >= 50 && x <= 54) || (x >= 57 && x <= 58) || (x >= 61 && x <= 92))) || (y == 12 && ((x >= 1 && x <= 22) || (x >= 25 && x <= 27) || (x >= 31 && x <= 36) || (x >= 49 && x <= 55) || (x >= 57 && x <= 94))) ||
                      (y == 13 && ((x >= 0 && x <= 22) || (x >= 25 && x <= 28) || (x >= 31 && x <= 35) || (x >= 39 && x <= 41) || (x >= 48 && x <= 95))) || (y == 14 && ((x >= 1 && x <= 22) || (x >= 24 && x <= 27) || (x >= 31 && x <= 34) || (x >= 40 && x <= 41) || (x >= 47 && x <= 94))) || (y == 15 && ((x >= 2 && x <= 20) || (x >= 24 && x <= 27) || (x >= 31 && x <= 33) || x == 43 || (x >= 46 && x <= 49) || (x >= 51 && x <= 94))) ||
                      (y == 16 && ((x >= 1 && x <= 6) || (x >= 8 && x <= 19) || (x >= 24 && x <= 26) || (x >= 32 && x <= 33) || (x >= 46 && x <= 86) || (x >= 88 && x <= 90))) || (y == 17 && ((x >= 2 && x <= 4) || (x >= 8 && x <= 20) || (x >= 24 && x <= 28) || (x >= 43 && x <= 44) || (x >= 46 && x <= 82) || (x >= 86 && x <= 88))) || (y == 18 && ((x >= 2 && x <= 3) || (x >= 9 && x <= 21) || (x >= 24 && x <= 28) || x == 43 || (x >= 47 && x <= 82) || (x >= 86 && x <= 88))) ||
                      (y == 19 && ((x == 1) || (x >= 10 && x <= 22) || (x >= 24 && x <= 29) || (x >= 42 && x <= 44) || (x >= 47 && x <= 82) || (x >= 87 && x <= 88))) || (y == 20 && ((x >= 11 && x <= 29) || (x >= 42 && x <= 83) || (x == 87) || (x >= 92 && x <= 94))) || (y == 21 && ((x >= 11 && x <= 29) || (x >= 44 && x <= 83) || (x == 86))) ||
                      (y == 22 && ((x >= 12 && x <= 27) || (x >= 29 && x <= 30) || (x >= 44 && x <= 83))) || (y == 23 && ((x >= 12 && x <= 27) || (x >= 45 && x <= 52) || (x >= 54 && x <= 86))) || (y == 24 && ((x >= 12 && x <= 26) || (x >= 43 && x <= 52) || (x >= 54 && x <= 80) || (x >= 82 && x <= 83))) ||
                      (y == 25 && ((x >= 12 && x <= 25) || (x >= 43 && x <= 45) || x == 47 || (x >= 49 && x <= 79) || (x == 82))) || (y == 26 && ((x >= 13 && x <= 24) || (x >= 43 && x <= 44) || (x >= 47 && x <= 79) || x == 82)) || (y == 27 && ((x >= 13 && x <= 24) || (x >= 43 && x <= 47) || (x >= 51 && x <= 76) || (x >= 79 && x <= 82))) ||
                      (y == 28 && ((x >= 14 && x <= 23) || (x >= 43 && x <= 51) || (x >= 54 && x <= 77) || (x >= 79 && x <= 80))) || (y == 29 && ((x >= 15 && x <= 19) || (x >= 42 && x <= 53) || (x >= 55 && x <= 77))) || (y == 30 && ((x >= 16 && x <= 18) || (x >= 41 && x <= 53) || (x >= 55 && x <= 76))) || 
                      (y == 31 && ((x >= 17 && x <= 18) || (x >= 41 && x <= 53) || (x >= 55 && x <= 61) || (x >= 63 && x <= 76))) || (y == 32 && ((x >= 17 && x <= 18) || (x >= 40 && x <= 54) || (x >= 56 && x <= 60) || (x >= 63 && x <= 75))) || (y == 33 && ((x >= 18 && x <= 19) || (x >= 41 && x <= 54) || (x >= 56 && x <= 60) || (x >= 64 && x <= 67) || (x >= 70 && x <= 73))) ||
                      (y == 34 && ((x >= 20 && x <= 22) || (x >= 41 && x <= 55) || (x >= 57 && x <= 58) || (x >= 65 && x <= 66) || (x >= 70 && x <= 72))) || (y == 35 && ((x >= 21 && x <= 22) || (x >= 40 && x <= 57) || (x >= 65 && x <= 66) || (x >= 71 && x <= 74) || (x >= 77 && x <= 78))) || (y == 36 && ((x == 22) || (x >= 41 && x <= 58) || (x >= 65 && x <= 66) || (x >= 71 && x <= 73) || (x >= 77 && x <= 78) || (x >= 25 && x <= 28))) ||
                      (y == 37 && ((x >= 23 && x <= 29) || (x >= 42 && x <= 58) || (x == 66) || (x >= 71 && x <= 72) || (x >= 76 && x <= 78))) || (y == 38 && ((x >= 24 && x <= 31) || (x >= 43 && x <= 44) || (x >= 46 && x <= 58) || (x >= 70 && x <= 72) || (x >= 75 && x <= 76))) || (y == 39 && ((x >= 24 && x <= 31) || (x >= 47 && x <= 56) || (x >= 71 && x <= 72) || (x >= 75 && x <= 79))) || 
                      (y == 40 && ((x >= 23 && x <= 33) || (x >= 47 && x <= 56) || (x >= 71 && x <= 82) || (x == 84))) || (y == 41 && ((x >= 23 && x <= 35) || (x >= 48 && x <= 55) | (x >= 72 && x <= 73) || (x >= 75 && x <= 79) || (x >= 81 && x <= 85))) || (y == 42 && ((x >= 23 && x <= 35) || (x >= 48 && x <= 55) || x == 73 || (x >= 75 && x <= 78) || (x >= 82 && x <= 84) || (x >= 86 && x <= 87))) ||
                      (y == 43 && ((x >= 24 && x <= 35) || (x >= 48 && x <= 55) || (x >= 76 && x <= 78) || (x >= 83 && x <= 85) || (x >= 88 && x <= 89))) || (y == 44 && ((x >= 25 && x <= 34) || (x >= 48 && x <= 55) || x == 58 || (x >= 79 && x <= 80))) || (y == 45 && ((x >= 25 && x <= 34) || (x >= 48 && x <= 55) || (x >= 57 && x <= 58) || (x >= 78 && x <= 81) || x == 83)) ||
                      (y == 46 && ((x >= 26 && x <= 34) || (x >= 48 && x <= 54) || x == 57 || (x >= 77 && x <= 84))) || (y == 47 && ((x >= 26 && x <= 33) || (x >= 49 && x <= 54) || (x == 57) || (x >= 75 && x <= 84))) || (y == 48 && ((x >= 26 && x <= 32) || (x >= 49 && x <= 54) || x == 57 || (x >= 75 && x <= 85))) ||
                      (y == 49 && ((x >= 26 && x <= 32) || (x >= 49 && x <= 53) || (x >= 75 && x <= 85))) || (y == 50 && ((x >= 26 && x <= 31) || (x >= 50 && x <= 53) || (x >= 76 && x <= 85))) || (y == 51 && ((x >= 26 && x <= 30) || (x >= 50 && x <= 52) || (x >= 76 && x <= 78) || (x >= 81 && x <= 84))) ||
                      (y == 52 && ((x >= 26 && x <= 29) || (x >= 82 && x <= 84))) || (y == 53 && ((x >= 26 && x <= 29) || x == 83)) || (y == 54 && (x >= 26 && x <= 27)) ||
                      (y == 55 && (x >= 26 && x <= 27)) || (x == 26 && (y >= 56 && y <= 58));
                    
    always @(posedge clock) begin
    
    if (screen == 3) begin
    
        //oled_data <= (pixelmap) ? black:white;
    
         if (y >= 3 && y <= 60 && x >= 3 && x <= 92) begin
         
                if (state == 0) oled_data <= (pixelmap) ? green : blue;
            
                if (state == 1) begin // NORTH AMERICA        
                 
                   case (volume) 
                   
                      4'd1: begin
                            if ((x-26)*(x-26) + (y-17)*(y-17) <= 20) begin
                               oled_data <= red;
                            end
                            
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      4'd2: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 40) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                      
                         end
                      4'd3: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 60) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      4'd4: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 80) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                            
                         end
                      4'd5: begin // ANODE = AU
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= magenta; // magenta
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                  
                         end
                      4'd6: begin // ANODE = EU
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= blue; // blue
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 120) begin
                                oled_data <= blue; //blue
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                    
                         end
                      4'd7: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 140) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                  
                         end
                      4'd8: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 160) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                   
                         end
                      4'd9: begin // ANODE = AN
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= grey; // black/grey
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 180) begin
                               oled_data <= grey; // black/grey
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                 
                         end
                     4'd10: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                     4'd11: begin // ANODE = SA
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= green; //green
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= orange;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 200 && (x-26)*(x-26) + (y-17)*(y-17) <= 220) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                     4'd12: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= orange;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 200 && (x-26)*(x-26) + (y-17)*(y-17) <= 240) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                     4'd13: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= orange;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 200 && (x-26)*(x-26) + (y-17)*(y-17) <= 260) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                
                         end
                     4'd14: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 100) begin
                               oled_data <= red;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= orange;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 200 && (x-26)*(x-26) + (y-17)*(y-17) <= 280) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                  
                         end
                     4'd15: begin
                            if((x-26)*(x-26) + (y-17)*(y-17) <= 300) begin
                               oled_data <= green;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 100 && (x-26)*(x-26) + (y-17)*(y-17) <= 200) begin
                               oled_data <= green;
                            end else if((x-26)*(x-26) + (y-17)*(y-17) > 200 && (x-26)*(x-26) + (y-17)*(y-17) <= 300) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;     
                    end                   
                endcase
                
                anodesignal <= (volume == 15) ? 1 : anodesignal; // Hold area once reached for informative purposes
                
                end // if 1 end
                
                else if (state == 2) begin
                
                    case (volume) 
                                   
                          1: begin
                                if ((x-29)*(x-29) + (y-44)*(y-44) <= 14) begin
                                   oled_data <= red;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                                             
                             end
                          2: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 28) begin
                                   oled_data <= red;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                     
                             end
                          3: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 42) begin
                                   oled_data <= red;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;
                             end
                          4: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 56) begin
                                   oled_data <= red;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;
                             end
                          5: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= red;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                 
                             end
                          6: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= red;
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 84) begin
                                    oled_data <= orange;
                                 end
                                 else if (pixelmap) begin
                                     oled_data <= black;
                                 end 
                                 else oled_data <= white;                    
                             end
                          7: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= red;
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 98) begin
                                   oled_data <= orange;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                  
                             end
                          8: begin // AU
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= magenta; //magenta
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 112) begin
                                   oled_data <= magenta; //magenta
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                   
                             end
                          9: begin // EU
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= blue; //blue
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 126) begin
                                   oled_data <= blue; //blue
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                   
                             end
                         10: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= red;
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                   oled_data <= orange;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white; 
                             end
                         11: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                   oled_data <= red;
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                   oled_data <= orange;
                                end else if((x-29)*(x-29) + (y-44)*(y-44) > 140 && (x-29)*(x-29) + (y-44)*(y-44) <= 154) begin
                                   oled_data <= yellow;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;
                             end
                         12: begin // AN
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                    oled_data <= grey; // black/grey
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                    oled_data <= grey; // black/grey
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 140 && (x-29)*(x-29) + (y-44)*(y-44) <= 168) begin
                                    oled_data <= grey; // black/grey                                                         
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;
                            end
                         13: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                    oled_data <= red;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                    oled_data <= orange;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 200 && (x-29)*(x-29) + (y-44)*(y-44) <= 182) begin
                                    oled_data <= yellow;                                                         
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                 
                         end
                         14: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                    oled_data <= red;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                    oled_data <= orange;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 140 && (x-29)*(x-29) + (y-44)*(y-44) <= 196) begin
                                    oled_data <= yellow;                                              
                                 end
                                 else if (pixelmap) begin
                                     oled_data <= black;
                                 end 
                                 else oled_data <= white;
                         end
                         15: begin
                                if((x-29)*(x-29) + (y-44)*(y-44) <= 70) begin
                                    oled_data <= green;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 70 && (x-29)*(x-29) + (y-44)*(y-44) <= 140) begin
                                    oled_data <= green;
                                 end else if((x-29)*(x-29) + (y-44)*(y-44) > 140 && (x-29)*(x-29) + (y-44)*(y-44) <= 210) begin
                                    oled_data <= green;
                                end
                                else if (pixelmap) begin
                                    oled_data <= black;
                                end 
                                else oled_data <= white;                                                                 
                        end                   
                    endcase
                anodesignal <= (volume == 15) ? 2 : anodesignal;
                end // end if 2
                
                else if (state == 3) begin // EU
                   
                    case(volume) 
                                   
                      1: begin
                            if ((x-50)*(x-50) + (y-17)*(y-17) <= 9) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      2: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 18) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                     
                         end
                      3: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 27) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      4: begin 
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 36) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                            
                         end
                      5: begin 
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                  
                         end
                      6: begin 
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red; 
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 54) begin
                                oled_data <= orange;
                             end
                             else if (pixelmap) begin
                                 oled_data <= black;
                             end 
                             else oled_data <= white;                   
                         end
                      7: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin 
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 63) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                   
                         end
                      8: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 72) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                   
                         end
                      9: begin 
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 81) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                    
                         end
                     10: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                     11: begin 
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 90 && (x-50)*(x-50) + (y-17)*(y-17) <= 99) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                            
                         end
                     12: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin //AU
                               oled_data <= magenta; //magenta
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= magenta; //magenta
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 90 && (x-50)*(x-50) + (y-17)*(y-17) <= 108) begin
                               oled_data <= magenta; //magenta
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                     13: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin 
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 90 && (x-50)*(x-50) + (y-17)*(y-17) <= 117) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                 
                         end
                     14: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 90 && (x-50)*(x-50) + (y-17)*(y-17) <= 126) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                
                         end
                     15: begin
                            if((x-50)*(x-50) + (y-17)*(y-17) <= 45) begin
                               oled_data <= green;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 45 && (x-50)*(x-50) + (y-17)*(y-17) <= 90) begin
                               oled_data <= green;
                            end else if((x-50)*(x-50) + (y-17)*(y-17) > 90 && (x-50)*(x-50) + (y-17)*(y-17) <= 135) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;      
                    end                   
                endcase
                
                anodesignal <= (volume == 15) ? 3 : anodesignal;  
                
                end      
                
                else if (state == 4) begin // AFRICA        
                                 
                   case(volume) 
                   
                      1: begin
                            if ((x-50)*(x-50) + (y-36)*(y-36) <= 24) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      2: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 48) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                      
                         end
                      3: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 72) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      4: begin // ANODE AU
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 96) begin
                               oled_data <= magenta; // magenta
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;
                         end
                      5: begin // ANODE = EU
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= blue; //blue
                            end
                            else if (pixelmap) begin
                                oled_data <= black;
                            end 
                            else oled_data <= white;                   
                         end
                      6: begin 
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= red; 
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 144) begin
                                oled_data <= orange;
                             end
                             else if (pixelmap) begin
                                                             oled_data <= black;
                                                         end 
                                                         else oled_data <= white;                   
                         end
                      7: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin // AN
                               oled_data <= grey; //black/grey
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 168) begin
                               oled_data <= grey; //black/grey
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      8: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 192) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      9: begin // ANODE = SA
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= green; //green
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 216) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                     10: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white; 
                         end
                     11: begin 
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 240 && (x-50)*(x-50) + (y-36)*(y-36) <= 264) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     12: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin // NA
                               oled_data <= green; // green
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= orange; //green
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 240 && (x-50)*(x-50) + (y-36)*(y-36) <= 288) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     13: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin 
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 240 && (x-50)*(x-50) + (y-36)*(y-36) <= 312) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                 
                         end
                     14: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= red;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= orange;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 240 && (x-50)*(x-50) + (y-36)*(y-36) <= 336) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                     15: begin
                            if((x-50)*(x-50) + (y-36)*(y-36) <= 120) begin
                               oled_data <= green;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 120 && (x-50)*(x-50) + (y-36)*(y-36) <= 240) begin
                               oled_data <= green;
                            end else if((x-50)*(x-50) + (y-36)*(y-36) > 240 && (x-50)*(x-50) + (y-36)*(y-36) <= 360) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;      
                    end                   
                endcase
                
                anodesignal <= (volume == 15) ? 4 : anodesignal;
                
                end // end if 4
                
                else if (state == 5) begin // asia 537
                
                    case(volume) 
                                   
                      1: begin
                            if ((x-71)*(x-71) + (y-21)*(y-21) <= 36) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      2: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 72) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                      
                         end
                      3: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 108) begin // AU
                               oled_data <= magenta; //magenta
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      4: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 144) begin // EU
                               oled_data <= blue; //blue
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      5: begin 
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin //AN
                               oled_data <= grey; //black/grey
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                 
                         end
                      6: begin 
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin //SA
                               oled_data <= green; //green
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 216) begin
                                oled_data <= orange;
                             end
                             else if (pixelmap) begin
                                                             oled_data <= black;
                                                         end 
                                                         else oled_data <= white;                    
                         end
                      7: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin 
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 252) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      8: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin // NA
                               oled_data <= green; // green
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 288) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                      9: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 324) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                     10: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin // AF
                               oled_data <= yellow; // yellow
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= yellow; // yellow
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white; 
                         end
                     11: begin 
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= orange;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 360 && (x-71)*(x-71) + (y-21)*(y-21) <= 396) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     12: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= orange;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 360 && (x-71)*(x-71) + (y-21)*(y-21) <= 432) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     13: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= orange;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 360 && (x-71)*(x-71) + (y-21)*(y-21) <= 468) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                     14: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= red;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= orange;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 360 && (x-71)*(x-71) + (y-21)*(y-21) <= 504) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                     15: begin
                            if((x-71)*(x-71) + (y-21)*(y-21) <= 180) begin
                               oled_data <= green;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 180 && (x-71)*(x-71) + (y-21)*(y-21) <= 360) begin
                               oled_data <= green;
                            end else if((x-71)*(x-71) + (y-21)*(y-21) > 360 && (x-71)*(x-71) + (y-21)*(y-21) <= 540) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;       
                        end                   
                endcase
                
                anodesignal <= (volume == 15) ? 5 : anodesignal;
                
                end // end if 5
                
                else if (state == 7) begin 
                
                case(volume) 
                                                   
                      1: begin
                            if ((x-48)*(x-48) + (y-62)*(y-62) <= 12) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      2: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 24) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                      
                         end
                      3: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 36) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      4: begin  
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 48) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      5: begin  
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                      6: begin 
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red; 
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 72) begin
                                oled_data <= orange;
                             end
                             else if (pixelmap) begin
                                                             oled_data <= black;
                                                         end 
                                                         else oled_data <= white;                    
                         end
                      7: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin 
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 84) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      8: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 96) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                      9: begin // 
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin //AU
                               oled_data <= magenta; //magenta
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 108) begin
                               oled_data <= magenta; //magenta
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                     10: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white; 
                         end
                     11: begin 
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin //EU
                               oled_data <= blue; //blue
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= blue; //blue
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 120 && (x-48)*(x-48) + (y-62)*(y-62) <= 132) begin
                               oled_data <= blue; //blue
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     12: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= orange;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 120 && (x-48)*(x-48) + (y-62)*(y-62) <= 144) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     13: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin 
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= orange;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 120 && (x-48)*(x-48) + (y-62)*(y-62) <= 156) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                     14: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= red;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= orange;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 120 && (x-48)*(x-480) + (y-62)*(y-62) <= 168) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                     15: begin
                            if((x-48)*(x-48) + (y-62)*(y-62) <= 60) begin
                               oled_data <= green;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 60 && (x-48)*(x-48) + (y-62)*(y-62) <= 120) begin
                               oled_data <= green;
                            end else if((x-48)*(x-48) + (y-62)*(y-62) > 120 && (x-48)*(x-48) + (y-62)*(y-62) <= 180) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;       
                        end                   
                endcase
                anodesignal <= (volume == 15) ? 7 : anodesignal;
                end // end if 6
                
                else if (state == 6) begin 
                
                case(volume) 
                                                                   
                      1: begin
                            if ((x-80)*(x-80) + (y-48)*(y-48) <= 7) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      2: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 14) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                      
                         end
                      3: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 21) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      4: begin 
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 28) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                      5: begin 
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                      6: begin 
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red; 
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 42) begin
                                oled_data <= orange;
                             end
                             else if (pixelmap) begin
                                                             oled_data <= black;
                                                         end 
                                                         else oled_data <= white;                    
                         end
                      7: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin 
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 49) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      8: begin
                            if((x-80)*(x-800) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 56) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                      9: begin // ANODE = SA
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 63) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                    
                         end
                     10: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= orange;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     11: begin 
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= orange;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 70 && (x-80)*(x-80) + (y-48)*(y-48) <= 77) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     12: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= orange;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 70 && (x-80)*(x-80) + (y-48)*(y-48) <= 84) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;
                         end
                     13: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin // ANODE NA
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= orange;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 70 && (x-80)*(x-80) + (y-48)*(y-48) <= 91) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                  
                         end
                     14: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= red;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= orange;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 70 && (x-80)*(x-80) + (y-48)*(y-48) <= 98) begin
                               oled_data <= yellow;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;                   
                         end
                     15: begin
                            if((x-80)*(x-80) + (y-48)*(y-48) <= 35) begin
                               oled_data <= green;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 35 && (x-80)*(x-80) + (y-48)*(y-48) <= 70) begin
                               oled_data <= green;
                            end else if((x-80)*(x-80) + (y-48)*(y-48) > 70 && (x-80)*(x-80) + (y-48)*(y-48) <= 105) begin
                               oled_data <= green;
                            end
                            else if (pixelmap) begin
                                                            oled_data <= black;
                                                        end 
                                                        else oled_data <= white;       
                        end                   
                endcase
                
                anodesignal <= (volume == 15) ? 6 : anodesignal;
                
                end
            end
        end
    end
endmodule
