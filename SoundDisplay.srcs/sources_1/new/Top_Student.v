`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input clock, sw0, sw1, sw2, sw3, btnU, btnD, btnC, btnL, btnR,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output reg [4:0] led = 5'b0,
    output reg LD14 = 0,
    output reg [3:0] an = 4'b1111, 
    output reg [7:0] seg = 8'b11111111, 
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden
    );
    
    wire clk_1000Hz;
    wire clk_20kHz;
    wire clk_200Hz;
    wire clk_100Hz;
    wire clk_10Hz;
    wire clk_6P25MHz;
    wire clk_12P5MHz;
    
    clock_divider c100 (clock, 499999, clk_100Hz);
    clock_divider c200 (clock, 249999, clk_200Hz);
    clock_divider c1k (clock, 49999, clk_1000Hz);
    clock_divider c10k (clock, 4999999, clk_10Hz);
    clock_divider c20k (clock, 2499, clk_20kHz);
    clock_divider c6P25M (clock, 7, clk_6P25MHz);
    clock_divider c12P5M (clock, 3, clk_12P5MHz);
    
    wire [11:0] mic_in;

    Audio_Capture mic(
    .CLK(clock),                  // 100MHz clock
    .cs(clk_20kHz),               // sampling clock, 20kHz
    .MISO(J_MIC3_Pin3),           // J_MIC3_Pin3, serial mic input
    .clk_samp(J_MIC3_Pin1),       // J_MIC3_Pin1
    .sclk(J_MIC3_Pin4),           // J_MIC3_Pin4, MIC3 serial clock
    .sample(mic_in)     // 12-bit audio sample data
    );
    
    wire frame, sendpix, samplepix;
    wire [12:0] pindex;
    reg [15:0] oled_data = 0;
    
    Oled_Display oled (
    .clk(clk_6P25MHz), .reset(0),
    .frame_begin(frame), .sending_pixels(sendpix), .sample_pixel(samplepix),
    .pixel_index(pindex),
    .pixel_data(oled_data),
    .cs(cs), .sdin(sdin), .sclk(sclk), .d_cn(d_cn), .resn(resn), .vccen(vccen), .pmoden(pmoden),
    .teststate(0));
   
    wire [6:0] x;
    wire [6:0] y;
    reg [2:0] btncnt = 0;
    reg [31:0] threescnt = 0;
    
    assign x = pindex % 96;
    assign y = pindex / 96; 
    
    wire border, audiofilter, menus, zh, rect;
    assign audiofilter = (sw0 == 1 && sw1 == 0 && sw2 == 0 && sw3 == 0);
    assign border = (sw0 == 0 && sw1 == 0 && sw2 == 0 && sw3 == 0);
    assign menus = (sw0 == 0 && sw1 == 1 && sw2 == 0 && sw3 == 0);
    assign zh = (sw0 == 0 && sw1 == 0 && sw2 == 1 && sw3 == 0);
    assign rect = (sw0 == 0 && sw1 == 0 && sw2 == 0 && sw3 == 1);
    
    wire btnUdeb, btnDdeb, btnCdeb, btnLdeb, btnRdeb;
    SPC sppU (btnU, clk_100Hz, btnUdeb); // Debounce btnU
    SPC sppD (btnD, clk_100Hz, btnDdeb); // Debounce btnD
    SPC sppC (btnC, clk_100Hz, btnCdeb); // Debounce btnC
    SPC sppL (btnL, clk_100Hz, btnLdeb); // Debounce btnL
    SPC sppR (btnR, clk_100Hz, btnRdeb); // Debounce btnR
    
    wire [2:0] lvl;
    soundFilter levels (clk_20kHz, mic_in, lvl);
    
    wire [3:0] volume;
    volumeControl vol (clk_20kHz, mic_in, volume);
    
    wire [1:0] screen;
    screenControl sC (clk_100Hz, btnCdeb, btnLdeb, btnRdeb, menus, screen);
    
    wire [15:0] oled_data_borders;
    wire LD14out;
    borders A (clock, btnUdeb, sw0, lvl, pindex, oled_data_borders, LD14out);
    
    wire [15:0] rects;
    wire LD14out2;
    rectangles r (clock, pindex, btnDdeb, rects, LD14out2);
   
    wire [15:0] oled_menu;
    wire [3:0] stateout;
    menu men (btnUdeb, btnDdeb, x, y, clk_100Hz, screen, oled_menu, stateout);
    
    wire [3:0] anodesignal;
    wire [15:0] circlemap;
    pixelMapSize pMS (clk_6P25MHz, x, y, stateout, screen, volume, anodesignal, circlemap);
    
    wire [15:0] oled_map;
    worldmap wm (clk_6P25MHz, clock, pindex, screen, stateout, oled_map);    
    
    wire [3:0] anC;
    wire [7:0] segC;
    anodeControl aC (clk_200Hz, clock, menus, screen, stateout, anodesignal, anC, segC);
    
    wire an1, an2, an3, an4;
    wire [7:0] segzh;
    zhTop zhtop (clock, btnU, btnC, segzh, an1, an2, an3, an4);
   

    always @(posedge clock) begin 
    
        an <= anC;
        seg <= segC;
    
        if (audiofilter) begin
        
            oled_data <= oled_data_borders;
            LD14 <= 0;
            
            case (lvl)
            
            3'd0: begin
                led <= 5'b00000;
            end
            
            3'd1: begin
                led <= 5'b00001;
            end
            
            3'd2: begin
                led <= 5'b00011;
            end
            
            3'd3: begin
                led <= 5'b00111;
            end
            
            3'd4: begin
                led <= 5'b01111;
            end
            
            3'd5: begin
                led <= 5'b11111;
            end
            
            endcase   
            
            end
            
        else if (border) begin
            
            oled_data <= oled_data_borders;
            led <= 0;
            LD14 <= LD14out; 
            
        end                     
        
        else if (menus) begin
        
            case (screen) 
            
                3'd0: begin
                    oled_data <= oled_menu;
                end   
                
                3'd1: begin
                    oled_data <= oled_map;
                end
                
                3'd2: begin
                    oled_data <= oled_map;
                end
                
                3'd3: begin
                    oled_data <= circlemap;
                end
                
            endcase
            
        end
        
        else if (zh) begin
            an <= {an4, an3, an2, an1};
            seg <= segzh;
        end
        
        else if (rect) begin
            oled_data <= rects;
            led <= 0;
            LD14 <= LD14out2; 
        end
        
        else begin
            oled_data <= oled_data_borders; 
        end
        
    end

endmodule