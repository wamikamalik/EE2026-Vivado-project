`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 18:51:03
// Design Name: 
// Module Name: enlarging_man
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


module enlarging_man(
        input CLOCK,
        input [7:0] x,
        input [7:0] y,
        input [4:0] mode,
        output reg [15:0] oled_data
    );
    
    wire clk, clk1, clk2;
    wire [25:0] m;
    reg [5:0] count = 6'd0;
    reg [5:0] count1 = 6'd0;
    reg [5:0] count2 = 6'd0;
    reg [5:0] upper = 28;
    
    reg [5:0] count3 = 30;
    reg [5:0] count4 = 30;
    
    always @ (posedge clk) begin 
        count <= (count == 21)? 0:count + 7;
        count1 <= (count1 == 24)? 0:count1 +8;
        count2 <= (count2 == 3)? 0:count2 + 1;
        upper <= (count == 21)?28:upper - count;
    end
    
    always @(posedge CLOCK) begin
    
    if(x>=88 && x<=94 && y == 10 || (x == 91 || x == 78 || x == 69) && y>=10 && y<=15 || ((x>=79 && x<=85)||(x>=69 && x<=73)) && (y == 10 
    || y == 15) || x>=79 && x<=83 && y>=12 && y<=13 || x>=72 && x<=75 && y == 13 || (x == 73 || x == 75) && y>=13 && y<=15)   
        oled_data <= 16'hf800;  
    else if((x == 75 || x == 79 || x == 83) && y>=17 && y<=22 || (x==76 || x==78)&& y==18 || x==77 && y==19 
    || x>=84 && x<=89 && (y==17 || y==22) || x>=84 && x<=87 && y>=19 && y<=20)
        oled_data <= 16'hf800; 
    else if(((x>=88 && x<=94) || (x>=70 && x<=76)) && y == 24 || (x==91 || x==85 || x==79 || x==70 || x==76) && y >=24 && y<=29 
    || ((x>=79 && x<=85)||(x>=70 && x<=76)) && y == 29)
        oled_data <= 16'hf800;
    else if(x%20 == 0 && ((y+count3)%11 == 0 || (y+count3)%11 == 1))
        oled_data <= 16'hb63a; 
    else if(x%20 == 5 && ((y+count4)%11 == 3 || (y+count4)%11 == 4))
        oled_data <= 16'hb63a;
    else if(x%20 == 10 && ((y+count3)%11 == 6 || (y+count3)%11 == 7))
        oled_data <= 16'hb63a;
    else if(x%20 == 15 && ((y+count4)%11 == 9 || (y+count4)%11 == 10))
        oled_data <= 16'hb63a;     
    else 
        oled_data <= 16'h0;  

    if( x>=13+count && x<=20+count1 && y>=upper+2*count2+3 && y<= upper+2*count2+5 || x>=14+count && x<=19+count1 && y>=upper+2*count2+2 && y <= upper+2*count2+2 || x>=15+count && x<=18+count1 && 
    y>=upper+count2+1 && y<=upper+2*count2+1 || x>=16+count && x<=17+count1 && y>=upper && y<=upper+count2)
          oled_data <= 16'h6a24;   
                   
    if(x>=14+count && x<=19+count1 && y>=upper+2*count2+5 && y<=upper+2*count2+7 || x>=16+count && x<=19+count1 && y<=upper+2*count2+4 && y>=upper+2*count2+4 || x>=17+count && x<=18+count1 && 
    y>=upper+2*count2+3 && y<=upper+2*count2+3 || x>=15+count && x <=18+count1 && y>=upper+2*count2+8 && y<=upper+3*count2+8 || x>=16+count && x<=17+count1 && y>=upper+3*count2+9 && y<=upper+3*count2+9 || (x>=14+count 
    && x<=15+count1 || x>=19+count && x<=20+count1) && y>=upper+5*count2+18 && y<=upper+6*count2+18 || (x==14+count || x==20+count1) && y>=upper+6*count2+19 && y<=upper+7*count2+19) 
          oled_data <= 16'he56d;
    if((x == 15+count || x == 18+count1) && y>=upper+2*count2+6 && y<=upper+2*count2+6 || x>=16+count && x<=17+count1 && y>=upper+3*count2+8 && y<=upper+3*count2+8)
      oled_data <= 16'h6a24;  
    if((x>=14+count && x<=15+count1 || x>=18+count && x<=19+count1) && y>=upper+3*count2+10 && y<=upper+4*count2+10 || x>=13+count && x<=20+count1 && y>=upper+4*count2+11 && y<=upper+5*count2+11 
    || x>=12+count && x<=21+count1 && y>=upper+5*count2+12 && y<=upper+5*count2+17 || (x>=13+count && x<=14+count1 || x>=19+count && x<=20+count1) && y>=upper+5*count2+18 && y<=upper+6*count2+18)
        oled_data <= 16'h07ff;

    if(x>=15+count && x<=18+count1 && y>=upper+6*count2+18 && y<=upper+7*count2+19 || x>=14+count && x<=19+count1 && y>=upper+7*count2+20 && y<=upper+8*count2+21 ||  
        (x>=14+count && x<=15+count1-1 || x>=18+count+1 && x<=19+count1) && y>=upper+8*count2+22 && y<=upper+9*count2+26)
            oled_data <= 16'hf81f; 
  
    end
    
    always @(posedge clk1) begin
        count3 = (count3 == 0)?30:count3-1;
    end
    always @(posedge clk2) begin
        count4 = (count4 == 0)?30:count4-1;
    end
    
    sun_move unit1(CLOCK, mode, m);
    sun_clk unit2(CLOCK, m, clk);
    sun_clk unit3(CLOCK, 7142857, clk1);
    sun_clk unit4(CLOCK, 5000000, clk2);
    
endmodule
