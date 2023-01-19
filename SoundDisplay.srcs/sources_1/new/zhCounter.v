`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 04:45:23
// Design Name: 
// Module Name: zhCounter
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


module zhCounter(input btnU, //start/stop
input btnC, //reset 
input clk_1hz,  //input counter clock 
output reg [3:0] a0, //1st anode from right
output reg [3:0] a1, //2nd anode from right
output reg [3:0] a2, //3rd anode from right
output reg [3:0] a3  //4th anode from right
    );

reg btnU_ff; //btnU ff register
reg start; //
reg btnC_ff; //btnC ff register
reg reset; //reset signal

always @ (posedge clk_1hz) 
    begin
        btnU_ff <= btnU; 
        if (btnU_ff && !btnU) 
                start <= ~start; 
        btnC_ff <= btnC; 
        if (btnC_ff && !btnC) 
            reset <=1;
        else
            reset <=0; 
    end

always @(posedge clk_1hz) //counter logic
begin
     if (start == 1 && reset ==1) // when both start and reset is true, reset the anodes counter
        begin 
            a0 <= 0; 
            a1 <= 0; 
            a2 <= 0; 
            a3 <= 0; 
      end else if (start == 1)  // if only stop is true store prev value and resume count when press again        
        begin
            a0 <= a0; 
            a1 <= a1; 
            a2 <= a2; 
            a3 <= a3; 
        end else if (start != 1) //if no stop
        begin
          if(a0 == 9) 
          begin
             a0 <= 0; 
             if (a1 == 9) 
                 begin
                    a1 <= 0; 
                    if (a2 == 9) 
                        begin 
                            a2 <= 0; 
                            if(a3 == 9) 
                                a3 <= 0; 
                            else
                                a3 <= a3 + 1;
                        end else 
                            a2 <= a2 + 1;
                 end else 
                     a1 <= a1 + 1; 
          end else 
            a0 <= a0 + 1;
         end
end
    
endmodule

