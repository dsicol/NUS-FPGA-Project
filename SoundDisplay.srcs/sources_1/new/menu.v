`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 03:12:52
// Design Name: 
// Module Name: menu
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


module menu(input pbu, pbd, input [31:0] x, y, input clk100, input [1:0] screen, output reg [15:0] oled_data, output reg [3:0] state = 0);

// AKA STATE CONTROL MODULE

    reg [31:0] aleft = 2;
    reg [31:0] aright = 94;
    reg [31:0] counter = 0;
    reg [1:0] arrowstate = 0;
    parameter [31:0]h1 = 12;
    parameter [31:0]h2 = 19;
    parameter [31:0]h3 = 26;
    parameter [31:0]h4 = 33;
    parameter [31:0]h5 = 40;
    parameter [31:0]h6 = 47; 
    parameter [31:0]h7 = 54;
    
    
    wire [15:0] menudisp [8:0];
    wire geolocator, southamerica, northamerica, europe, africa, asia, australia, antartica;
    wire arr1, arr2, arr3, arr4, arr5, arr6, arr7;
    wire boxwidth, box1, box2, box3, box4, box5, box6, box7;
    
    assign geolocator = (y == 2 && (x == 20 || x == 21)) || (x == 19 && y >= 3 && y <= 7) || (y == 8 && x >= 20 && x <= 21) || (x == 22 && y >= 6 && y <= 7) || (x == 21 && y == 6) || //G
                        (y == 2 && x >= 24 && x <= 26) || (x == 24 && y >= 3 && y <= 8) || ((y == 5 || y == 8) && x >= 25 && x <= 26) || //E
                        ((y == 2 || y == 8) && x >= 29 && x <= 30) || ((x == 28 || x == 31) && y >= 3 && y <= 7) || //O
                        (y == 5 && x >= 33 && x <= 35) || //-
                        (x == 37 && y >= 2 && y <= 8) || (y == 8 && x >= 38 && x <= 40) || //L  
                        ((y == 2 || y == 8) && x >= 43 && x <= 44) || ((x == 42 || x == 45) && y >= 3 && y <= 7) || //O
                        ((y == 2 || y == 8) && x >= 48 && x <= 50) || (x == 47 && y >= 3 && y <= 7) || //C
                        ((y == 2 || y == 5) && x >= 53 && x <= 54) || ((x == 52 || x == 55) && y >= 3 && y <= 7) || //A
                        (y == 2 && x >= 57 && x <= 61) || (x == 59 && y >= 3 && y <= 8) || //T
                        ((y == 2|| y == 8) && x >= 64 && x <= 65) || ((x == 63 || x == 66) && y >= 3 && y <= 7) || //O
                        (x == 68 && y >= 2 && y <= 8) || ((y == 2 || y == 5) && x >= 69 && x <= 70) || (x == 71 && ((y >= 3 && y <= 4) || (y >= 6 && y <= 8))) || //R
                        (y == 2 && x >= 74 && x <= 76) || (y == 3 && x >= 73 && x <= 77) || (y == 4 && (x == 73 || x == 74 || x == 76 || x == 77)) || (y == 5 && x >= 73 && x <= 77) || (y == 6 && x >= 74 && x <= 76) || (y == 7 && x >= 74 && x <= 76) || (x == 75 && y == 8);//Pointer
    //state = 0
    assign northamerica = ((x == 18 || x == 22) && y >= 12 && y <= 16) || (x == 19 && y == 13) || (x == 20 && y == 14) || (x == 21 && y == 15) || //N
                        ((y == 12 || y == 16) && x >= 25 && x <= 26) || ((x == 24 || x == 27) && y >= 13 && y <= 14) || //O
                        (x == 29 && y >= 12 && y <= 16) || ((y == 12 || y == 14) && x >= 30 && x <= 31) || (x == 32 && (y == 13 || y == 15 || y == 16)) || //R
                        (y == 12 && x >= 34 && x <= 38) || (x == 36 && y >= 13 && y <= 16) || //T
                        ((x == 40 || x == 43) && y >= 12 && y <= 16) || (y == 14 && (x == 41 || x == 42)) || //H
                        ((x == 47 || x == 50) && y >= 13 && y <= 16) || ((y == 12 || y == 14) && x >= 48 && x <= 49) || //A
                        ((x == 52 || x == 54 || x == 56) && y >= 13 && y <= 16) || (y == 12 && x >= 53 && x <= 55) || //M
                        (x == 58 && y >= 12 && y <= 16) || ((y == 12 || y == 14 || y == 16) && x >= 59 && x <= 60) || //E
                        (x == 62 && y >= 12 && y <= 16) || ((y == 12 || y == 14) && x >= 63 && x <= 64) || (x == 65 && (y == 13 || y == 15 || y == 16)) || //R
                        (x == 67 && y >= 12 && y <= 16) || //I
                        (x == 69 && y >= 12 && y <= 16) || ((y == 12 || y == 16) && x >= 70 && x <= 72) || //C
                        (x == 74 && y >= 13 && y <= 16) || ((y == 12 || y == 14) && x >= 75 && x <= 76) || ((x == 74 || x == 77) && y >= 13 && y <= 16); //A
    //                     
    assign southamerica = (y == 19 && x >= 20 && x <= 22) || (x == 19 && y == 20) || ((x == 20 || x == 21) && y == 21) || (x == 22 && y == 22) || (y == 23 && x >= 19 && x <= 21) || //S
                          ((y == 19 || y == 23) && (x == 25 || x == 26)) || ((x == 24 || x == 27) && y >= 20 && y <= 22) || //O
                          ((x == 29 || x == 32) && y >= 19 && y <= 22) || (y == 23 && (x == 30 || x == 31)) || //U
                          ((y == 19) && x >= 34 && x <= 38) || (x == 36 && y >= 20 && y <= 23) || //T
                          ((x == 40 || x == 43) && y >= 19 && y <= 23) || (y == 21 && x >= 41 && x <= 42) || //H
                          ((x == 47 || x == 50) && y >= 20 && y <= 23) || ((y == 19 || y == 21) && x >= 48 && x <= 49) || // A
                          ((x == 52 || x == 54 || x == 56) && y >= 20 && y <= 23) || (y == 19 && (x == 53 || x == 55)) || //M
                          (x == 58 && y >= 19 && y <= 23) || ((y == 19 || y == 21 || y == 23) && x >= 59 && x <= 60) || //E
                          (x == 62 && y >= 19 && y <= 23) || ((y == 19 || y == 21) && x >= 63 && x <= 64) || (x == 65 && (y == 20 || (y >= 22 && y <= 23))) || //R
                          (x == 67 && y >= 19 && y <= 23) || //I
                          (x == 69 && y >= 20 && y <= 22) || ((y == 19 || y == 23) && x >= 70 && x <= 72) || //C
                          ((x == 74 || x == 77) && y >= 20 && y <= 23) || ((y == 19 || y == 21) && x >= 75 && x <= 76); //A
                          
    assign europe = (x == 33 && y >= 26 && y <= 30) || ((y == 26 || y == 28 || y == 30) && x >= 34 && x <= 35) || //E
                    ((x == 37 || x == 40) && y >= 26 && y <= 29) || (y == 30 && x >= 38 && x <= 39) || //U
                    (x == 42 && y >= 26 && y <= 30) || ((y == 26 || y == 28) && x >= 43 && x <= 44) || (x == 45 && y == 27) || (x == 45 && (y == 29 || y == 30)) || //R
                    ((x == 47 || x == 50) && y >= 27 && y <= 29) || ((y == 26 || y == 30) && x >= 48 && x <= 49) || //O
                    (x == 52 && y >= 26  && y <= 30) || ((y == 26 || y == 28) && x >= 53 && x <= 54) || (x == 55 && y == 27) || //R
                    (x == 57 && y >= 26 && y <= 30) || ((y == 26 || y == 28 || y == 30) && x >= 58 && x <= 59); //E
                    
    assign africa = ((x == 35 || x == 38) && y >= 34 && y <= 37) || ((y == 33 || y == 35) && x >= 36 && x <= 37) || //A
                    (x == 40 && y >= 33 && y <= 37) || ((y == 33 || y == 35) && x >= 41 && x <= 42) || //F
                    (x == 44 && y >= 33 && y <= 37) || ((y == 33 || y == 35) && x >= 45 && x <= 46) || (x == 47 && (y == 34 || (y >= 36 && y <= 37))) || //R
                    (x == 49 && y >= 33 && y <= 37) || //I
                    (x == 51 && y >= 34 && y <= 36) || ((y == 33 || y == 37) && x >= 52 && x <= 53) || //C
                    ((x == 55 || x == 58) && y >= 34 && y <= 37) || ((y == 33 || y == 35) && x >= 56 && x <= 57); //A
                                                        
    assign asia = ((x == 39 || x == 42) && y >= 41 && y <= 44) || ((y == 40 || y == 42) && x >= 40 && x <= 41) || //A
                  ((y == 40) && x >= 45 && x <= 47) || (x == 44 && y == 41) || (y == 42 && x >= 45 && x <= 46) || (x == 47 && y == 43) || (y == 44 && x >= 44 && x <= 46) || //S 
                  (x == 49 && y >= 40 && y <= 44) || //I
                  ((x == 51 || x == 54) && y >= 41 && y <= 44) || ((y == 40 || y == 42) && x >= 52 && x <= 53); //A
                  
    assign australia = ((x == 27 || x == 30) && y >= 48 && y <= 51) || ((y == 47 || y == 49) && x >= 28 && x <= 29) || //A
                       ((x == 32 || x == 35) && y >= 47 && y <= 50) || (y == 51 && x >= 33 && x <= 34) || //U
                       (y == 47 && x >= 38 && x <= 40) || (x == 37 && y == 48) || (y == 49 && x >= 38 && x <= 39) || (x == 40 && y == 50) || (y == 51 && x >= 37 && x <= 39) || //S
                       (y == 47 && x >= 42 && x <= 46) || (x == 44 && y >= 48 && y <= 51) || //T
                       (x == 48 && y >= 47 && y <= 51) || ((y == 47 || y == 49) && x >= 49 && x <= 50) || (x == 51 && (y == 48 || (y >= 50 && y <= 51))) || //R
                       ((x == 53 || x == 56) && y >= 48 && y <= 51) || ((y == 47 || y == 49) && x >= 54 && x <= 55) || //A
                       (x == 58 && y >= 47 && y <= 51) || (y == 51 && x >= 59 && x <= 60) || //L
                       (x == 62 && y >= 47 && y <= 51) || //I
                       ((x == 64 || x == 67) && y >= 48 && y <= 51) || ((y == 47 || y == 49) && x >= 65 && x <= 66); //A
    
    assign antartica = ((x == 26 || x == 29) && y >= 55 && y <= 58) || ((y == 54 || y == 56) && x >= 27 && x <= 28) || //A
                       ((x == 31 || x == 35) && y >= 54 && y <= 58) || (x == 32 && y == 55) || (x == 33 && y == 56) || (x == 34 && y == 57) || //N
                       (y == 54 && x >= 37 && x <= 41) || (x == 39 && y >= 55 && y <= 58) || //T
                       ((x == 43 || x == 46) && y >= 55 && y <= 58) || ((y == 54 || y == 56) && x >= 44 && x <= 45) || //A
                       (x == 48 && y >= 54 && y <= 58) || ((y == 54 || y == 56) && x >= 49 && x <= 50) || (x == 51 && ((y == 55) || (y >= 57 && y <= 58))) || //R
                       (y == 54 && x >= 53 && x <= 57) || (x == 55 && y >= 55 && y <= 58) || //T
                       (x == 59 && y >= 54 && y <= 58) || //I
                       (x == 61 && y >= 55 && y <= 57) || ((y == 54 || y == 58) && x >= 62 && x <= 63) || //C
                       ((x == 65 || x == 68) && y >= 55 && y <= 58) || ((y == 54 || y == 56) && x >= 66 && x <= 67); //A


    assign boxwidth = (x >= 0 && x <= 95);
    
    assign arr1 = (x == aleft && y >= h1 && y <= h1 + 4) || (x == aleft + 1 && y >= h1 + 1 && y <= h1 + 3) || (x == aleft + 2 && y == h1 + 2) ||
                  (x == aright && y >= h1 && y <= h1 + 4) || (x == aright - 1 && y >= h1 + 1 && y <= h1 + 3) || (x == aright - 2 && y == h1 + 2);
                  
    assign arr2 = (x == aleft && y >= h2 && y <= h2 + 4) || (x == aleft + 1 && y >= h2 + 1 && y <= h2 + 3) || (x == aleft + 2 && y == h2 + 2) ||
                  (x == aright && y >= h2 && y <= h2 + 4) || (x == aright - 1 && y >= h2 + 1 && y <= h2 + 3) || (x == aright - 2 && y == h2 + 2);
                  
    assign arr3 = (x == aleft && y >= h3 && y <= h3 + 4) || (x == aleft + 1 && y >= h3 + 1 && y <= h3 + 3) || (x == aleft + 2 && y == h3 + 2) ||
                  (x == aright && y >= h3 && y <= h3 + 4) || (x == aright - 1 && y >= h3 + 1 && y <= h3 + 3) || (x == aright - 2 && y == h3 + 2);
                  
    assign arr4 = (x == aleft && y >= h4 && y <= h4 + 4) || (x == aleft + 1 && y >= h4 + 1 && y <= h4 + 3) || (x == aleft + 2 && y == h4 + 2) ||
                  (x == aright && y >= h4 && y <= h4 + 4) || (x == aright - 1 && y >= h4 + 1 && y <= h4 + 3) || (x == aright - 2 && y == h4 + 2);
                  
    assign arr5 = (x == aleft && y >= h5 && y <= h5 + 4) || (x == aleft + 1 && y >= h5 + 1 && y <= h5 + 3) || (x == aleft + 2 && y == h5 + 2) ||
                  (x == aright && y >= h5 && y <= h5 + 4) || (x == aright - 1 && y >= h5 + 1 && y <= h5 + 3) || (x == aright - 2 && y == h5 + 2);
                  
    assign arr6 = (x == aleft && y >= h6 && y <= h6 + 4) || (x == aleft + 1 && y >= h6 + 1 && y <= h6 + 3) || (x == aleft + 2 && y == h6 + 2) ||
                  (x == aright && y >= h6 && y <= h6 + 4) || (x == aright - 1 && y >= h6 + 1 && y <= h6 + 3) || (x == aright - 2 && y == h6 + 2);
                  
    assign arr7 = (x == aleft && y >= h7 && y <= h7 + 4) || (x == aleft + 1 && y >= h7 + 1 && y <= h7 + 3) || (x == aleft + 2 && y == h7 + 2) ||
                  (x == aright && y >= h7 && y <= h7 + 4) || (x == aright - 1 && y >= h7 + 1 && y <= h7 + 3) || (x == aright - 2 && y == h7 + 2);

    
    assign box1 = ((y >= h1 - 1 && y <= h1 + 5) && boxwidth && ~northamerica && ~arr1);
    assign box2 = ((y >= h2 - 1 && y <= h2 + 5) && boxwidth && ~southamerica && ~arr2);
    assign box3 = ((y >= h3 - 1 && y <= h3 + 5) && boxwidth && ~europe && ~arr3);
    assign box4 = ((y >= h4 - 1 && y <= h4 + 5) && boxwidth && ~africa && ~arr4);
    assign box5 = ((y >= h5 - 1 && y <= h5 + 5) && boxwidth && ~asia && ~arr5);
    assign box6 = ((y >= h6 - 1 && y <= h6 + 5) && boxwidth && ~australia && ~arr6);
    assign box7 = ((y >= h7 - 1 && y <= h7 + 5) && boxwidth && ~antartica && ~arr7);

    
    assign menudisp[0] = (geolocator || northamerica || southamerica || europe|| africa || asia || australia || antartica);
    assign menudisp[1] = (geolocator || box1 || southamerica || europe|| africa || asia || australia || antartica);
    assign menudisp[2] = (geolocator || northamerica || box2 || europe|| africa || asia || australia || antartica);
    assign menudisp[3] = (geolocator || northamerica || southamerica || box3|| africa || asia || australia || antartica);
    assign menudisp[4] = (geolocator || northamerica || southamerica || europe|| box4 || asia || australia || antartica);
    assign menudisp[5] = (geolocator || northamerica || southamerica || europe|| africa || box5 || australia || antartica);
    assign menudisp[6] = (geolocator || northamerica || southamerica || europe|| africa || asia || box6 || antartica);
    assign menudisp[7] = (geolocator || northamerica || southamerica || europe|| africa || asia || australia || box7);
    
    always @ (posedge clk100) begin
        state <= (pbu && screen == 0 && state > 0) ? state - 1 : (pbd && screen == 0 && state < 7) ? state + 1 : state;
    end
    
    always @ (posedge clk100) begin
    
       counter <= (counter == 25) ? 0 : counter + 1;
       arrowstate <= (counter == 0) ? arrowstate + 1 : arrowstate; 
       
    end
    
    always @ (*) begin
      
        oled_data = menudisp[state] ? 16'b0000000000000000 : 16'b0111111111111111;
        
        case (arrowstate)
        
        3'd0: begin
            aleft <= 2;
            aright <= 94;
        end 
        
        2'd1: begin
            aleft <= 3;
            aright <= 93;
        end 
        
        2'd2: begin
            aleft <= 4;
            aright <= 92;
        end 
        
        2'd3: begin
            aleft <= 5;
            aright <= 91;
        end 
    
        endcase
        
    end  
     
endmodule