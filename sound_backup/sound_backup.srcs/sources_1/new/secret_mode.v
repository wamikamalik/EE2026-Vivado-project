`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2020 21:33:10
// Design Name: 
// Module Name: secret_mode
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


module secret_mode(
    input CLOCK,
    input flag,
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data
    );
    wire clk;
    wire [25:0] m;
    reg [15:0] data;
    reg [1:0] count = 0;
    reg [2:0] count1 = 0;
    
    always @(posedge CLOCK) begin
    
        if(mode>=0 && mode <=2) 
            count1 = 0;
        else
            count1 = (mode-1)/2;      
        case(count1)
            0:data = 16'hdfe5;
            1:data = 16'ha693;
            2:data = 16'hfebf;
            3:data = 16'h1f56;
            4:data = 16'h58dd;
            5:data = 16'he932;
            6:data = 16'hd204;  
            7:data = 16'hf800;                              
        endcase
    end
    
    always @(posedge clk) begin 
    if(flag == 1)
        count = (count==2)?0:count+1;
    
    end
    always @(posedge CLOCK) begin
        
        if(count == 0) begin
        
            if(53*x + 48*y >=48*53 && 63*x+38*y<=48*63)
                oled_data <= 16'hfc00;
            else 
                oled_data <= 16'h0;   
  
        end
        else if(count == 1) begin
        
            if(63*x + 5*y >=48*63 && 63*x-5*y<=48*63)
                oled_data <= 16'hfc00;
            else 
                oled_data <= 16'h0;   
  
        end        
        else if(count == 2) begin
        
            if(53*x - 47*y <=48*53 && 63*x-37*y>=48*63)
                oled_data <= 16'hfc00;
            else 
                oled_data <= 16'h0;   
  
        end 
        if((x-47)*(x-47) + (y-31)*(y-31) <= 900)
            oled_data <= data;
        if(count1 == 0) begin
            if((x>=25 && x<=40 || x>=55 && x<=70) && y==22 || x>=32 && x<=62 && y==42)
                oled_data <= 16'h0;
            //meh
            if((x==81 || x==87) && (y>=12 && y<=19 || y>=44 && y<=51) || x>=82 && x<=84 && y==x-70 || x>=85 && x<=86 && y==98-x || x==81 && (y>=28 && y<=35) || x>=81 && x<=87 && (y==28 || y==31 || y==35 || y==47))
                oled_data <= 16'hffff;
        end   
        else if(count1 == 1) begin
            if((x>=25 && x<=40 || x>=55 && x<=70) && y==22 || x>=32 && x<=62 && y==42 || (y==x-18)&& x>=25 && x<=40 || (y==62-x)&& x>=25 && x<=40 || (x+y==77)&& x>=55 && x<=70 || (x==y+33) && x>=55 && x<=70)
                       oled_data <= 16'h0;
            //ugh
            if((x==81 || x==87) && (y>=12 && y<=19 || y>=44 && y<=51) || x==81 && y>=28 && y<=35 || x>=81 && x<=87 && (y==19 || y==28 || y==47) || x>=81 && x<=84 && y==35 || x>=83 && x<=87 && y==32 || x==87 && y>=32 && y<=35)
                oled_data <= 16'hffff;
        end
        else if(count1 == 2) begin
            if(((y>=33)&&((x-47)*(x-47) +4*y <= 184)&&((x-47)*(x-47) +4*y >= 176))|| ((x-63)*(x-63) + (y-22)*(y-22) <= 4) || ((x-31)*(x-31)+(y-22)*(y-22) <=4))
                               oled_data <= 16'h0;
            //wow
            if((x==81 || x==87) && (y>=12 && y<=19 || y>=28 && y<=35 || y>=44 && y<=51) || x>=81 && x<=87 && (y==28 || y==35) || x>=82 && x<=84 && (y==101-x || y==132-x) || x>=85 && x<=86 && (y==x-67 || y==x-35)) 
                oled_data <= 16'hffff;
        end
        else if(count1 == 3) begin
            if(((x-63)*(x-63) + (y-22)*(y-22) <= 4) || ((x-31)*(x-31)+(y-22)*(y-22) <=4))
                              oled_data <= 16'h0;
            if((x-47)*(x-47) + (y-31)*(y-31) <= 225 && y>=31)
                oled_data <= 16'hf800;
            //nice
            if((x==81 || x==87) && y>=4 && y<=11 || x==81 && (y>=36 && y<=43 || y>=52 && y<=59) || x==84 && y>=20 && y<=27 || x>=81 && x<=87 && (y==x-76 || y==20 || y==27 || y==36 || y==44 || y==52 || y==55 || y==59))
                oled_data <= 16'hffff;
        end  
        else if(count1 == 4) begin
        if(((x-63)*(x-63) + (y-22)*(y-22) <= 4) || ((x-31)*(x-31)+(y-22)*(y-22) <=4))
                        oled_data <= 16'h0;
        if(x>=32 && x<=62 && y>=42 && y<=46)
                        oled_data <= 16'hf800;
            //umm
            if((x==81 || x==87) && (y>=12 && y<=19 || y>=28 && y<=35 || y>=44 && y<=51) || x>=81 && x<=87 && y == 19 || x>=82 && x<=84 &&(y==x-54||y==x-38)|| x>=85 && x<=86 && (y==114-x || y==130-x))
                oled_data <= 16'hffff;
        end 
        else if(count1 == 5) begin
        if(((x-63)*(x-63) + (y-22)*(y-22) <= 4) || ((x-31)*(x-31)+(y-22)*(y-22) <=4) || x>=32 && x<=62 && y==42 || (x+y==44)&& x>=24 && x<=31 || (x==y+18)&& x>=31 && x<=38 || (x+y==76)&&x>=56&& x<=63 ||(x==50+y)&&x>=63&&x<=70 )
            oled_data <= 16'h0;
            //...
            if(x==84 && (y==16 || y==32 || y==48))
                oled_data <= 16'hffff;
        end
        else if(count1 == 6) begin
            if((x==y+18)&&x>=31&&x<=38 || (x+y==76)&&x>=56&&x<=70 || ((x-63)*(x-63) + (y-22)*(y-22) <= 4) || ((x-31)*(x-31)+(y-22)*(y-22) <=4))
                oled_data <= 16'h0;
            if((x-47)*(x-47) + (y-46)*(y-46) <= 49)
                oled_data <= 16'h0;
            //no!
            if((x==81 || x==87) && (y>=12 && y<=19 || y>=28 && y<=35) || x>=81 && x<=87 && (y==x-69 || y==28 || y==35) || x==84 && (y>=44 && y<=49 || y==51))
                oled_data <= 16'hffff;
        end  
        else if(count1 == 7) begin
            if((x-47)*(x-47) +184 >= 4*y && (x-47)*(x-47)+176 <=4*y || (x>=y+18)&&x>=31&&x<=38&&(x<=23+y) || (x+y <=76)&&x>=56&&x<=63&&(x+y>=71))
                oled_data <= 16'h0;
            if((x<=y+18)&&x>=33&&x<=36 || (x+y>=76)&&x>=58&&x<=61)
                oled_data <= 16'h00ff;
            //rip
            if(x==81 && (y>=12 && y<=19 || y>=44 && y<=51) || x>=81 && x<=87 && (y==12 || y==15 || y==28 || y==35 || y==44 || y==47) || x==87 && (y>=12 && y<=15 || y>=44 && y<=47) || x>=82 && x<=86 && y==x-67 || x==84 && y>=28 && y<=35) 
                oled_data <= 16'hffff;
        end                                                  
    end   
    
    sun_move unit1(CLOCK, mode, m);
    sun_clk unit2(CLOCK, m, clk);
 
endmodule

