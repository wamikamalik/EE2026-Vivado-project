`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2020 15:33:29
// Design Name: 
// Module Name: to_secret
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


module to_secret(
    input CLOCK,
    input swmode,
    input start,
    input led,
    input led1,
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data,
    output reg flag = 0
    );
    
    wire clk;
    reg [2:0] count = 0;
    
    always @(posedge clk) begin
    if(swmode == 0 && start == 0) begin
        flag = 0;
        count = 0;
    end    
    else if(led == 1 && led1 == 1) 
        if(flag == 0) begin
            count = (count==7)?0:count+1;    
            if(count == 0)
                flag = 1; 
        end

    end
    
    always @(posedge CLOCK)begin
    if(count>=0) begin
    //h
    if((x==6 || x==12) && y>=30 && y<=34 || x>=7 && x<=11 && y==32)
        oled_data <= 16'hffff;
    else if(count>=1) begin
    //e
        if(x==16 && y>=30 && y<=34 || x>=16 && x<=22 && (y==30 || y==32 || y==34))
            oled_data <= 16'hffff;
        else if(count>=2) begin
        //r
            if(x==26 && y>=30 && y<=34 || x>=26 && x<=32 && (y==30 || y==32) || x==32 && y>=30 && y<=32 || x==27 && y==33 || x == 28 && y==34)
                oled_data <= 16'hffff;
            else if(count>=3) begin
            //e
                if(x==36 && y>=30 && y<=34 || x>=36 && x<=42 && (y==30 || y==32 || y==34))
                    oled_data <= 16'hffff;
                else if(count>=4) begin
                //w
                    if((x==50||x==56) && y>=30 && y<=34 || x==51 && y==33 || x==52 && y==32 || x==53 && y==31 || x>=54 && x<=55 && y==x-22)
                        oled_data <= 16'hffff;  
                    else if(count>=5) begin
                    //e
                        if(x==60 && y>=30 && y<=34 || x>=60 && x<=66 && (y==30 || y==32 || y==34))
                            oled_data <= 16'hffff;  
                        else if(count>=6) begin
                        //g
                            if(x==74 && y>=30 && y<=34 || x>=74 && x<=80 && y==30 || x>=74 && x<=78 && y==34|| x>=77 && x<=80 && y == 32 || x==80 && y>=32 && y<=34)
                                oled_data <= 16'hffff;
                            else if(count>=7) begin
                            //o
                                if(x>=84 && x<=90 && (y==30 || y==34) || (x==84 || x==90) && y>=30 && y<=34)
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
    
    sun_clk unit2(CLOCK,10000000, clk);
    
endmodule
