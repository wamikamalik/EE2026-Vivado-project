`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2020 14:45:34
// Design Name: 
// Module Name: welcome
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


module welcome(
    input swmode,
    input start,
    input CLOCK,
    output reg flag = 0,
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data
    );
    
    wire clk;
    reg [4:0] count = 0;
    
    always @(posedge clk) begin
        if(swmode == 0 && start == 0) begin
            flag  = 0;
            count = 0;
        end
        if(swmode == 1) begin
            if(flag == 0) begin
                count = (count==26)?0:count+1;            
                if(count == 0)
                    flag = 1;
            end
        end
    end
    
    always @(posedge CLOCK) begin   
    
    if(count>=0) begin
    //h
    if((x==13 || x==19) && y>=7 && y<=11 || x>14 && x<=18 && y==9)
        oled_data <= 16'hffff;
    else if(count>=1) begin
    //e
        if(x==23 && y>=7 && y<=11 || x>=23 && x<=29 && (y==7 || y==9 || y==11))
            oled_data <= 16'hffff;
        else if(count>=2) begin
        //l
            if(x==33 && y>=7 && y<=11 || x>=34 && x<=39 && y==11)
                oled_data <= 16'hffff;
            else if(count>=3) begin
            //p
                if(x==43 && y>=7 && y<=11 || x>=44 && x<=49 && (y==7||y==9) || x==49 && y==8)
                    oled_data <= 16'hffff;
                else if(count>=4) begin
                //b
                    if(x==57 && y>=7 && y<=11 || x>=58 && x<=62 && (y==7 || y==9 || y==11) || x==63 && (y==8||y==10))
                        oled_data <= 16'hffff;  
                    else if(count>=5) begin
                    //e
                        if(x==67 && y>=7 && y<=11 || x>=67 && x<=73 && (y==7 || y==9 || y==11))
                            oled_data <= 16'hffff;  
                        else if(count>=6) begin
                        //n
                            if((x==77 || x==83) && y>=7 && y<=11 || x>=78 && x<=82 && y==x-71)
                                oled_data <= 16'hffff;
                            else if(count>=7) begin
                            //d
                                if((x==9 || x==15) && y>=22 && y<=26 || x>=10 && x<=14 && (y==22 || y==26))
                                    oled_data <= 16'hffff;
                                else if(count>=8) begin
                                //i
                                    if(x>=20 && x<=24 && y == 22 || x==22 && y>=22 && y<=26 || x>=19 && x<=25 &&y==26)
                                        oled_data <= 16'hffff;
                                    else if(count>=9) begin
                                    //s
                                        if(x>=29 && x<=35 && (y==22 || y==24 || y==26) || x==29 && y==23 || x==35 && y==25)
                                            oled_data <= 16'hffff;
                                        else if(count>=10) begin
                                        //c
                                            if(x>=39 && x<=45 && (y==22 || y==26) || x==39 && y>=22 && y<=26)
                                                oled_data <= 16'hffff;
                                            else if(count>=11) begin
                                            //o
                                                if(x>=49 && x<=55 && (y==22 || y==26) || (x==49 || x==55) && y>=22 && y<=26)
                                                    oled_data <= 16'hffff;
                                                else if(count>=12) begin
                                                //v
                                                    if((x==59 || x==65) && y==22 || x>=59 && x<=62 && y == x-36 || x==63 && y==25 || x==64 && y==24 || x==65 && y==23)
                                                        oled_data <= 16'hffff;
                                                    else if(count>=13) begin
                                                    //e
                                                        if(x==69 && y>=22 && y<=26 || x>=69 && x<=75 && (y==22 || y==24 || y==26))
                                                            oled_data <= 16'hffff;
                                                        else if(count>=14) begin
                                                        //r
                                                            if(x==79 && y>=22 && y<=26 || x>=79 && x<=85 &&(y==22 || y==24) || x==85 && y>=22 && y<=24 || x==80 && y==25 || x==81 && y==26)
                                                                oled_data <= 16'hffff;
                                                            else if(count>=15) begin
                                                            //s
                                                                if(x>=5 && x<=11 && (y==37 || y==39 || y==41) || x==5 && y==38 || x==11 && y==40)
                                                                    oled_data <= 16'hffff;
                                                                else if(count>=16) begin
                                                                //o
                                                                    if((x==15 || x==21) && y>=37 && y<=41 || x>=15 && x<=21 &&(y==37 || y==41))
                                                                        oled_data <= 16'hffff;
                                                                    else if(count>=17) begin
                                                                    //m
                                                                        if((x==25 || x==31) && y>=37 && y<=41 || x>=26 && x<=28 && y==x+12 || x==29 && y==39 || x==30 && y==38)
                                                                            oled_data <= 16'hffff; 
                                                                        else if(count>=18) begin
                                                                        //e
                                                                            if(x==35 && y>=37 && y<=41 || x>=35 && x<=41 && (y==37 || y==39 || y==41))
                                                                                oled_data <= 16'hffff;
                                                                            else if(count>=19) begin
                                                                            //t
                                                                                if(x>=45 && x<=51 && y==37 || x==48 && y>=37 && y<=41)
                                                                                    oled_data <= 16'hffff;
                                                                                else if(count>=20) begin
                                                                                //h
                                                                                    if((x==55 || x==61) && y>=37 && y<=41 || x>=55 && x<=61 && y==39)
                                                                                        oled_data = 16'hffff;
                                                                                    else if(count>=21) begin
                                                                                    //i
                                                                                        if(x>=66 && x<=70 && y==37 || x == 68 && y>=37 && y<=41 || x>=65 && x<=71 && y==41)
                                                                                            oled_data <= 16'hffff;
                                                                                        else if(count>=22) begin
                                                                                        //n
                                                                                            if((x==75||x==81) && y>=37 && y<=41 || x>=76 && x<=80 && y==x-39)
                                                                                                oled_data <= 16'hffff; 
                                                                                            else if(count>=23) begin
                                                                                            //g
                                                                                                if(x==85 && y>=37 && y<=41 || x>=86 && x<=91 && y==37 || x>=86 && x<=88 && y==41|| x>=87 && x<=91 && 
                                                                                                 y == 39 || x==91 && y>=39 && y<=41)
                                                                                                    oled_data <= 16'hffff;  
                                                                                                else if(count>=24) begin
                                                                                                //n
                                                                                                     if((x==35||x==41) && y>=52 && y<=56 || x>=36 && x<=40 && y==x+16)
                                                                                                        oled_data <= 16'hffff; 
                                                                                                    else if(count>=25) begin
                                                                                                    //e
                                                                                                         if(x==45 && y>=52 && y<=56 || x>=45 && x<=51 && (y==52 || y == 54 || y==56))
                                                                                                             oled_data <= 16'hffff;  
                                                                                                         else if(count>=26) begin
                                                                                                         //w
                                                                                                             if((x==55||x==61) && y>=52 && y<=56 || x==56 && y==55 || x==57 && y==54 || x==58 && y==53 || x>=59 && x<=60 && y==x-5)
                                                                                                                oled_data <= 16'hffff;   
                                                                                                             else 
                                                                                                                oled_data <= 0;
                                                                                                         end   
                                                                                                         else 
                                                                                                            oled_data <= 0;
                                                                                                        end  
                                                                                                        else
                                                                                                            oled_data <= 0;
                                                                                                    end
                                                                                                    else
                                                                                                        oled_data <= 0; 
                                                                                                end
                                                                                                else
                                                                                                    oled_data <= 0;
                                                                                             end 
                                                                                             else
                                                                                                oled_data <= 0;      
                                                                                        end
                                                                                        else
                                                                                            oled_data <= 0;
                                                                                    end
                                                                                    else
                                                                                        oled_data <= 0;
                                                                                end
                                                                                else
                                                                                    oled_data <= 0;
                                                                            end
                                                                            else
                                                                                oled_data <= 0;
                                                                        end
                                                                        else 
                                                                            oled_data <= 0;
                                                                    end
                                                                    else
                                                                        oled_data <= 0;
                                                                end
                                                                else
                                                                    oled_data <= 0;
                                                            end
                                                            else
                                                                oled_data <= 0;
                                                        end
                                                        else    
                                                            oled_data <= 0;
                                                    end
                                                    else
                                                        oled_data <= 0;
                                                end
                                                else
                                                    oled_data <= 0;
                                            end
                                            else 
                                                oled_data <= 0;
                                        end
                                        else
                                            oled_data <= 0;
                                    end
                                    else 
                                        oled_data <= 0;
                                end
                                else
                                    oled_data <= 0;
                            end
                            else
                                oled_data <= 0;
                        end
                        else
                            oled_data <= 0;
                    end
                    else
                        oled_data <= 0;
                end
                else
                    oled_data <= 0;
            end
            else
                oled_data <= 0;
        end
        else 
            oled_data <= 0;
    end
    else 
        oled_data <= 0;
    end
    
    sun_clk unit2(CLOCK,10000000, clk);
    
endmodule
