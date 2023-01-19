`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 23:22:45
// Design Name: 
// Module Name: worldmap
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


module worldmap(input clk6p25, clock, input [12:0] pindex, input [1:0] screen, input [3:0] state, output reg [15:0] oled_data);
    
    reg [31:0] counter = 0;
    reg [1:0] slide = 0;
    
    reg [15:0] MLE [0:6143];
    
    reg [15:0] NA [0:6143];
    reg [15:0] SA [0:6143];
    reg [15:0] EU [0:6143];
    reg [15:0] AF [0:6143];
    reg [15:0] AS [0:6143];
    reg [15:0] AU [0:6143];
    reg [15:0] AN [0:6143];
    
    reg [15:0] NA_SOL [0:6143];
    reg [15:0] AF_EGY [0:6143];
    reg [15:0] AS_ANKW [0:6143];
    
    initial begin $readmemh("worldmap.mem", MLE); end
    initial begin $readmemh("NA.mem", NA); end
    initial begin $readmemh("SA.mem", SA); end
    initial begin $readmemh("EU.mem", EU); end
    initial begin $readmemh("AF.mem", AF); end
    initial begin $readmemh("AS.mem", AS); end
    initial begin $readmemh("AU.mem", AU); end
    initial begin $readmemh("AN.mem", AN); end
    initial begin $readmemh("NA_SOL.mem", NA_SOL); end
    initial begin $readmemh("AF_EGY.mem", AF_EGY); end
    initial begin $readmemh("AS_ANKW.mem", AS_ANKW); end

    always @(posedge clock) begin
    
        counter <= (counter != 900000000) ? counter + 1 : 0; 
        
        if (counter == 0)  slide <= 0;
        else if (counter == 300000000) slide <= 1;
        else if (counter == 600000000) slide <= 2;
        else slide <= slide;
    
    end
    
    always @(posedge clk6p25) begin
    
        if (state == 0 && screen >= 1 && screen <= 2) begin
            case (slide)
                                
                2'd0: begin
                   oled_data <= NA_SOL[pindex]; 
                end
               
                2'd1: begin
                    oled_data <= AF_EGY[pindex];
                end
                
                2'd2: begin
                    oled_data <= AS_ANKW[pindex];
                end
               
           endcase
           
        end
    
        else if (state == 1 && screen == 1) begin
            oled_data <= NA[pindex]; 
        end
        else if (state == 2 && screen == 1) begin 
            oled_data <= SA[pindex];
        end
        else if (state == 3 && screen == 1) begin 
            oled_data <= EU[pindex];
        end
        else if (state == 4 && screen == 1) begin
            oled_data <= AF[pindex];
        end
        else if (state == 5 && screen == 1) begin
            oled_data <= AS[pindex];
        end
        else if (state == 6 && screen == 1) begin
            oled_data <= AU[pindex];
        end
        else if (state == 7 && screen == 1) begin 
            oled_data <= AN[pindex];
        end
        
        else if (screen == 2) begin 
        
            case (state)
            
                4'd0: begin
                    
                    case (slide)
                        
                        2'd0: begin
                           oled_data <= NA_SOL[pindex];
                        end
                       
                        2'd1: begin
                            oled_data <= AF_EGY[pindex];
                        end
                        
                        2'd2: begin
                            oled_data <= AS_ANKW[pindex];
                        end
                       
                   endcase
                    
                end
            
                4'd1: begin
                   oled_data <= NA_SOL[pindex]; 
                end 
                
                4'd4: begin
                    oled_data <= AF_EGY[pindex];
                end
                
                4'd5: begin
                    oled_data <= AS_ANKW[pindex];
                end
                
                default: begin
                   oled_data <= MLE[pindex]; 
                end
            
            endcase
   
        end
        
        else if (screen == 3) begin
            oled_data <= oled_data;
        end

        else begin
            oled_data <= MLE[pindex];
        end
        
    end
        
    endmodule
