`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2022 23:04:23
// Design Name: 
// Module Name: anodeControl
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


module anodeControl(input clock200, clock, menus, input [1:0] screen, input [3:0] state, input [3:0] anodesignal, output reg [3:0] an, output reg [7:0] seg);
    
    parameter [7:0] zero = 8'b11000000;
    parameter [7:0] one = 8'b11111001; //1 2
    parameter [7:0] two = 8'b10100100; //01346
    parameter [7:0] three = 8'b10110000; //01236
    parameter [7:0] four = 8'b10011001; //1256
    parameter [7:0] five = 8'b10010010; 
    parameter [7:0] six = 8'b10000010; //023456
    parameter [7:0] seven = 8'b11111000; //012
    parameter [7:0] eight = 8'b10000000;
    parameter [7:0] nine = 8'b10010000;
    
    parameter [7:0] M = 8'b11101010;
    parameter [7:0] K = 8'b10001010;
    
    reg [2:0] twocounter = 0;
    reg [2:0] threecounter = 0;
    reg [2:0] fourcounter = 0;
    
    always @(posedge clock200) begin
    
        twocounter <= (twocounter == 1) ? 0 : twocounter + 1;
        threecounter <= (threecounter == 2) ? 0 : threecounter + 1;
        fourcounter <= (fourcounter == 3) ? 0 : fourcounter + 1;
    
    end
    
    always @(posedge clock) begin
    
        if (screen == 0 && menus) begin
    
            case (twocounter)
            
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b11111001;
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001001;
                end
            
            endcase
        
        end
        
        else if (screen >= 1 && state == 0 && menus) begin
            
            case (threecounter)
           
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10001100; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001000;
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= 8'b11101010; 
                end
                
            endcase    

        end
        
        else if (screen == 1 && state == 1 && menus) begin
    
            case (twocounter)
                //NA        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10001000;
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b11001000;
                end
                
            endcase    

        end
        
        else if (screen >= 1 && screen <= 2 && state == 2 && menus) begin
            
            case (twocounter)
                //SA        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10001000;
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10010010;
                end
                
            endcase    

        end
        
        else if (screen >= 1 && screen <= 2 && state == 3 && menus) begin
            
            case (twocounter)
                //EU        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b11000001;
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10000110; 
                end
                
            endcase    
        
        end
        
        else if (screen == 1 && state == 4 && menus) begin
                    
            case (twocounter)
                //AF        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10001110; //0456
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001000; 
                end
                
            endcase    
        
        end
        
        else if (screen == 1 && state == 5 && menus) begin
                            
            case (twocounter)
                //AS        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10010010; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001000;
                end
                
            endcase
            
        end
        
        else if (screen >= 1 && screen <= 2 && state == 6 && menus) begin
                                    
            case (twocounter)
                //AU        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b11000001; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001000;
                end
                
            endcase
            
        end
        
        else if (screen >= 1 && screen <= 2 && state == 7 && menus) begin
                                            
            case (twocounter)
                //AN        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b11001000; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10001000;
                end
                
            endcase
            
        end
        
        else if (screen == 2 && state == 1 && menus) begin
        
            case (twocounter) //US
                
                2'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10010010; 
                end
                
                2'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b11000001;
                end
                
            endcase
        
        end
        
        else if (screen == 2 && state == 4 && menus) begin
                
            case (threecounter) //EGY
                
                2'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10010001; 
                end
                
                2'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b10010000;
                end
                
                2'd2: begin
                    an <= 4'b1011;
                    seg <= 8'b10000110; 
                end
                
            endcase
        
        end
        
        else if (screen == 2 && state == 5 && menus) begin
                        
            case (fourcounter) //ANKW
                
                3'd0: begin
                    an <= 4'b1110;
                    seg <= 8'b10000011; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= 8'b11101010;  
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= 8'b10001000;
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= 8'b11000110; 
                end
                
            endcase
        
        end
        
        else if (screen == 3 && state == 1 && menus && anodesignal == 1) begin//25 MK
        
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= five; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= two;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 2 && menus && anodesignal == 2) begin//25 MK
                
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= eight; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= one;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 3 && menus && anodesignal == 3) begin//25 MK
                
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= one; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= one;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 4 && menus && anodesignal == 4) begin//25 MK
                
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= zero; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= three;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 5 && menus && anodesignal == 5) begin//25 MK
                        
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= five; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= four;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 6 && menus && anodesignal == 6) begin//25 MK
                        
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= eight; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= zero;
                end
            
            endcase
        
        end
        
        else if (screen == 3 && state == 7 && menus && anodesignal == 7) begin//25 MK
                        
            case (fourcounter) 
                        
                3'd0: begin
                    an <= 4'b1110;
                    seg <= K; 
                end
                
                3'd1: begin
                    an <= 4'b1101;
                    seg <= M; 
                end
                
                3'd2: begin
                    an <= 4'b1011;
                    seg <= four; 
                end
                
                3'd3: begin
                    an <= 4'b0111;
                    seg <= one;
                end
            
            endcase
        
        end
        
        
            
        
        else begin
            an <= 4'b1111;
            seg <= 8'b11111111;
        end
    
    end

endmodule
