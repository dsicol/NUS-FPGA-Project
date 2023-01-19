`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 20:00:55
// Design Name: 
// Module Name: borders
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


module borders(input clock, spout, sw, input [2:0] lvl, input [12:0] pindex, output reg [15:0] oled_data, output reg LD14);
    
    wire [6:0] x;
    wire [6:0] y;
    
    assign x = pindex % 96;
    assign y = pindex / 96;
    
    reg [2:0] btncnt = 0;   
    reg [31:0] threescnt = 0;
    
    always @(posedge clock) begin
    
    if (sw == 0) begin
        
        if (btncnt > 0 && threescnt > 0 && threescnt < 300000000) begin
            threescnt <= threescnt + 1;
            LD14 <= 1;
        end
        
        else if (threescnt == 300000000) begin
            threescnt <= 0;
            LD14 <= 0;
        end
        
        else if (spout == 1 && threescnt == 0) begin
            btncnt <= btncnt + 1;
            threescnt <= 1;
        end
        
        else if (btncnt == 5) begin
            btncnt <= 0;
        end
        
        else begin
            btncnt <= btncnt;
            threescnt <= threescnt;
        end
        
        case (btncnt) 
        
        3'b000: begin
        if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                oled_data <= 16'b1111100000000000; //Red
        end
        else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                oled_data <= 16'b1111111111000000; // Orange
        end
        else
                oled_data <= 16'b0000000000000000; 
        end
        
        3'b001: begin
            if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                    oled_data <= 16'b1111100000000000; //Red
            end
            else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                    oled_data <= 16'b1111111111000000; // Orange
            end
            else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else oled_data <= 16'b0000000000000000; 
        end
        
        3'b010: begin
            if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                    oled_data <= 16'b1111100000000000; //Red
            end
            else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                    oled_data <= 16'b1111111111000000; // Orange
            end
            else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 10 || x == 85) && (y >= 10 && y <= 53)) || (((y == 10 || y == 53) && (x >= 10 && x <= 85)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else oled_data <= 16'b0000000000000000;
        end
        3'b011: begin
            if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                    oled_data <= 16'b1111100000000000; //Red
            end
            else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                    oled_data <= 16'b1111111111000000; // Orange
            end
            else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 10 || x == 85) && (y >= 10 && y <= 53)) || (((y == 10 || y == 53) && (x >= 10 && x <= 85)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 12 || x == 83) && (y >= 12 && y <= 51)) || (((y == 12 || y == 51) && (x >= 12 && x <= 83)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else oled_data <= 16'b0000000000000000;
            end
        3'b100: begin
            if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                oled_data <= 16'b1111100000000000; //Red
            end
            else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                oled_data <= 16'b1111111111000000; // Orange
            end
            else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 10 || x == 85) && (y >= 10 && y <= 53)) || (((y == 10 || y == 53) && (x >= 10 && x <= 85)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 12 || x == 83) && (y >= 12 && y <= 51)) || (((y == 12 || y == 51) && (x >= 12 && x <= 83)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else if (((x == 14 || x == 81) && (y >= 14 && y <= 49)) || (((y == 14 || y == 49) && (x >= 14 && x <= 81)))) begin
                oled_data <= 16'b0000011111100000; //Green
            end
            else oled_data <= 16'b0000000000000000;
            
            end
         default: begin
            if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                    oled_data <= 16'b1111100000000000; //Red
            end
            else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                    oled_data <= 16'b1111111111000000; // Orange
            end
            else oled_data <= 16'b0000000000000000; 
            end            
            endcase
            
        end
        
        else begin
        
            case (lvl)
                    
                3'd0: begin
                   oled_data <= 16'b0000000000000000;  
                end
                
                3'd1: begin
                    if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                        oled_data <= 16'b1111100000000000; //Red border
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 49 && y >= 45)) begin
                        oled_data <= 16'b1111100000000000; //Red rectangle
                    end
                    
                    else oled_data <= 16'b0000000000000000; 
                end
                
                3'd2: begin
                    if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                        oled_data <= 16'b1111100000000000; //Red border
                    end
                    
                    else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                        oled_data <= 16'b1111111111000000; // Orange border
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 49 && y >= 45)) begin
                        oled_data <= 16'b1111100000000000; //Red rectangle
                    end 
                    
                    else if ((x >= 43 && x <= 52) && (y <= 41 && y >= 37)) begin
                        oled_data <= 16'b1111111111000000; // Orange rectangle
                    end
                    
                    else oled_data <= 16'b0000000000000000; 
                end
                
                3'd3: begin
                    if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                        oled_data <= 16'b1111100000000000; //Red border
                    end
                    
                    else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                        oled_data <= 16'b1111111111000000; // Orange border
                    end
                    
                    else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border1
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 49 && y >= 45)) begin
                        oled_data <= 16'b1111100000000000; //Red rectangle
                    end 
                    
                    else if ((x >= 43 && x <= 52) && (y <= 41 && y >= 37)) begin
                        oled_data <= 16'b1111111111000000; // Orange rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 33 && y >= 29)) begin
                        oled_data <= 16'h7CA8; //Bright Green rectangle
                    end
                    
                    else oled_data <= 16'b0000000000000000; 
                end
                
                3'd4: begin
                    if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                        oled_data <= 16'b1111100000000000; //Red border
                    end
                    
                    else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                        oled_data <= 16'b1111111111000000; // Orange border
                    end
                    
                    else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border1
                    end
                    
                    else if (((x == 10 || x == 85) && (y >= 10 && y <= 53)) || (((y == 10 || y == 53) && (x >= 10 && x <= 85)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border2
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 49 && y >= 45)) begin
                        oled_data <= 16'b1111100000000000; //Red rectangle
                    end 
                    
                    else if ((x >= 43 && x <= 52) && (y <= 41 && y >= 37)) begin
                        oled_data <= 16'b1111111111000000; // Orange rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 33 && y >= 29)) begin
                        oled_data <= 16'h7CA8; //Bright Green rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 25 && y >= 21)) begin
                        oled_data <= 16'hC6B4; // Green rectangle
                    end
                    
                    else oled_data <= 16'b0000000000000000; 
                end
                
                3'd5: begin
                    if (((x == 2 || x == 93) && (y >= 2 && y <= 61)) || (((y == 2 || y == 61) && (x >= 2 && x <= 93)))) begin
                        oled_data <= 16'b1111100000000000; //Red border
                    end
                    
                    else if (((x >= 4 && x <= 6|| x >= 89 && x <= 91) && (y >= 4 && y <= 59)) || (((y >= 4 && y <= 6 || y >= 57 && y <= 59) && (x >= 4 && x <= 91)))) begin
                        oled_data <= 16'b1111111111000000; // Orange border
                    end
                    
                    else if (((x == 8 || x == 87) && (y >= 8 && y <= 55)) || (((y == 8 || y == 55) && (x >= 8 && x <= 87)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border1
                    end
                    
                    else if (((x == 10 || x == 85) && (y >= 10 && y <= 53)) || (((y == 10 || y == 53) && (x >= 10 && x <= 85)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border2
                    end
                    
                    else if (((x == 12 || x == 83) && (y >= 12 && y <= 51)) || (((y == 12 || y == 51) && (x >= 12 && x <= 83)))) begin
                        oled_data <= 16'b0000011111100000; //Green Border3
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 49 && y >= 45)) begin
                        oled_data <= 16'b1111100000000000; //Red rectangle
                    end 
                    
                    else if ((x >= 43 && x <= 52) && (y <= 41 && y >= 37)) begin
                        oled_data <= 16'b1111111111000000; // Orange rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 33 && y >= 29)) begin
                        oled_data <= 16'h7CA8; //Bright Green rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 25 && y >= 21)) begin
                        oled_data <= 16'hC6B4; // Green rectangle
                    end
                    
                    else if ((x >= 43 && x <= 52) && (y <= 17 && y >= 13)) begin
                        oled_data <= 16'hEF9B; // Dim Green rectangle
                    end
                    else oled_data <= 16'b0000000000000000; 
                end
                
                endcase  
        end
        
    end
    
endmodule
