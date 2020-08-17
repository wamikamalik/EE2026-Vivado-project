`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 18:26:32
// Design Name: 
// Module Name: improve_oled
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

module improve_oled(
    input CLOCK,
    input flag, 
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data
    );
    
    wire clk;
    reg [4:0] count = 0;
    wire [25:0] m;
    reg [15:0] data;
    reg day = 0, count1 = 0;
    
    always @ (posedge clk) begin 
        if(flag == 1) begin
            count = (count == 8)? 0:count + 1;
            day = (count == 0)?~day:day;
            if(day == 0) begin
                case(count)
                  5: data = 16'h229b;
                  6: data = 16'h229f;
                  7: data = 16'h001f;
                  8: data = 16'h0008;
                  default: data = 16'h07ff;
                endcase
            end
            else begin
                case(count)
                  8: data = 16'h229b;
                  7: data = 16'h229f;
                  6: data = 16'h001f;
                  5: data = 16'h0008;
                  default: data = 16'h0;
                endcase            
            end
        end
    end
    
    always @ (posedge CLOCK) begin
    if(day == 0) begin
        if(count <= 4) begin
          if((x - (88 - 10*count))*(x - (88 - 10*count)) + (y - (58 - 12*count))*(y - (58 - 12*count)) <= 25) begin
              oled_data <= 16'hffe0;    
          end
          
          //clouds
          else if( (x - 88)*(x-88) + (y - 15)*(y-15) <=16 || (x - 84)*(x-84) + (y - 11)*(y-11) <=16 || (x - 80)*(x-80) 
          + (y - 15)*(y-15) <=16 || (x - 84)*(x-84) + (y - 19)*(y-19) <=16 ||(x - 64)*(x-64) 
          + (y - 22)*(y-22) <=16 ||(x - 60)*(x-60) + (y - 18)*(y-18) <=16 ||(x - 56)*(x-56) + (y - 22)*(y- 22) 
          <=16 ||(x - 60)*(x-60) + (y - 26)*(y-26) <=16 ||(x - 20)*(x-20) + (y - 18)*(y-18) <=16 
          ||(x - 16)*(x-16) + (y - 14)*(y-14) <=16 ||(x - 12)*(x-12) + (y - 18)*(y-18) <=16 ||(x - 16)*(x-16) 
          + (y - 22)*(y-22) <=16) begin
              oled_data <= 16'hffff;
          end 
          //tree
          else if((x - 18)*(x-18) + (y - 48)*(y-48) <=16 || (x - 22)*(x-22) + (y - 48)*(y-48) <=16 || 
                    (x - 14)*(x-14) + (y - 48)*(y-48) <=16 || (x - 18)*(x-18) + (y - 44)*(y-44) <=16 )
             oled_data <= 16'h0fe0;            
          else if(((y - 43)*(y-43) <= 4*(x - 20) && (y - 43)*(y-43) <= 4*(15 - x))&& y <= 60 && y >= 50) begin
            oled_data <= 16'ha96b;
          end
        
          else
              oled_data = data;
        end
        
        
        else begin
          if((x - (48 - 10*(count-4)))*(x - (48 - 10*(count-4))) + (y - (10 + 12*(count-4)))*(y - (10 + 12*(count-4))) <= 25) begin
              oled_data <= 16'hffe0;
          end
          //clouds
          else if( (x - 88)*(x-88) + (y - 15)*(y-15) <=16 || (x - 84)*(x-84) + (y - 11)*(y-11) <=16 || 
          (x - 80)*(x-80) + (y - 15)*(y-15) <=16 || (x - 84)*(x-84) + (y - 19)*(y-19) <=16 ||(x - 64)*(x-64) 
          + (y - 22)*(y-22) <=16 ||(x - 60)*(x-60) + (y - 18)*(y-18) <=16 ||(x - 56)*(x-56) + (y - 22)*(y- 22) 
          <=16 ||(x - 60)*(x-60) + (y - 26)*(y-26) <=16 ||(x - 20)*(x-20) + (y - 18)*(y-18) <=16 
          ||(x - 16)*(x-16) + (y - 14)*(y-14) <=16 ||(x - 12)*(x-12) + (y - 18)*(y-18) <=16 ||(x - 16)*(x-16) 
          + (y - 22)*(y-22) <=16) begin
              oled_data <= 16'hffff;
          end 
          //tree
          else if((x - 18)*(x-18) + (y - 48)*(y-48) <=16 || (x - 22)*(x-22) + (y - 48)*(y-48) <=16 || 
                    (x - 14)*(x-14) + (y - 48)*(y-48) <=16 || (x - 18)*(x-18) + (y - 44)*(y-44) <=16 )
             oled_data <= 16'h0fe0;            
          else if(((y - 43)*(y-43) <= 4*(x - 20) && (y - 43)*(y-43) <= 4*(15 - x))&& y <= 60 && y >= 50) begin
            oled_data <= 16'ha96b;
          end         
          else
          oled_data = data;
        end      
    end
    
    else begin
        if(count<=4) begin
            if((x - (88 - 10*count))*(x - (88 - 10*count)) + (y - (58 - 12*count))*(y - (58 - 12*count)) <= 16 
            && ( x - (86 - 10*count))*(x - (86 - 10*count)) + (y - (56 - 12*count))*(y - (56 - 12*count)) >= 16)
                oled_data <= 16'hffff;
            else 
                oled_data <= data;   
             //stars           
            if(count%2 ==0 && (x == 10 && y == 20 || x == 15 && y == 10 || x == 25 && y == 16 || x == 36 && y == 30 || 
            x == 48 && y == 10 || x == 65 && y == 15 || x == 78 && y == 20 || x == 85 && y == 16))
                oled_data <= 16'hffff;
             //man   
            else if( x>=13 && x<=20 && y>=31 && y<= 33 || x>=14 && x<=19 && y == 30 || x>=15 && x<=18 && y == 29
                  || x>=16 && x<=17 && y == 28)
                      oled_data <= 16'h6a24;                      
            if(x>=14 && x<=19 && y>=33 && y<=35 || x>=16 && x<=19 && y==32 || x>=17 && x<=18 && y == 31 ||
            x>=15 && x <=18 && y == 36 || x>=16 && x<=17 && y == 37 || (x>=14 && x<=15 || x>=19 && x<=20) 
            && y == 46 || (x==14 || x==20) && y == 47) 
                oled_data <= 16'he56d;
                //eyes
            if((x == 15 || x == 18) && y == 34 || x>=16 && x<=17 && y == 36)
                    oled_data <= 16'h6a24;                  
            else if((x>=14 && x<=15 || x>=18 && x<=19) && y == 38 || x>=13 && x<=20 && y == 39 
            || x>=12 && x<=21 && y>=40 && y<=45 || (x>=13 && x<=14 || x>=19 && x<=20) && y == 46)
                oled_data <= 16'h07ff;
            if(count%2 == 0) begin
                if(x>=15 && x<=18 && y>=46 && y<=47 || x>=14 && x<=19 && y>=48 && y<=49 ||  x == 13 && y>=48 && y<=49
                || x>=11 && x<=12 && y>=48 && y<=51 || x>=18 && x<=19 && y>=50 && y<=54)
                    oled_data <= 16'hf81f;
                if(x>=11 && x<=12 && y == 52|| x>=18 && x<=19 && y==55 || x>=10 && x<=12 && y >=53 && y<=54
                || x>=18 && x<=20 && y>=56 && y<=57) 
                    oled_data <= 16'ha96b;     
            end
            else if(count%2!=0) begin
                if(x>=15 && x<=18 && y>=46 && y<=47 || x>=14 && x<=19 && y>=48 && y<=49 ||  
                    (x>=14 && x<=15 || x>=18 && x<=19) && y>=50 && y<=54)
                        oled_data <= 16'hf81f;
                if((x>=14 && x<=15 || x>=18 && x<=19) && y==55 || (x>=13 && x<=15 || x>=18 && x<=20) 
                    && y>=56 && y<=57) 
                        oled_data <= 16'ha96b;        
              end             
//            else 
//                oled_data <= data;          
        end      
          
        else begin
            if((x - (48 - 10*(count-4)))*(x - (48 - 10*(count-4))) + (y - (10 + 12*(count-4)))*(y - (10 + 12*(count-4))) <= 16
            && (x - (46 - 10*(count-4)))*(x - (46 - 10*(count-4))) + (y - (8 + 12*(count-4)))*(y - (8 + 12*(count-4))) >= 16)
                  oled_data <= 16'hffff; 
            else
                  oled_data = data;                      
            //stars
            if(count%2 == 0 && (x == 10 && y == 20 || x == 15 && y == 10 || x == 25 && y == 16 || x == 36 && y == 30 || 
                  x == 48 && y == 10 || x == 65 && y == 15 || x == 78 && y == 20 || x == 85 && y == 16))
                      oled_data <= 16'hffff; 
            //man         
            else if( x>=13 && x<=20 && y>=31 && y<= 33 || x>=14 && x<=19 && y == 30 || x>=15 && x<=18 && y == 29
                  || x>=16 && x<=17 && y == 28)
                      oled_data <= 16'h6a24;                      
            if(x>=14 && x<=19 && y>=33 && y<=35 || x>=16 && x<=19 && y==32 || x>=17 && x<=18 && y == 31 ||
            x>=15 && x <=18 && y == 36 || x>=16 && x<=17 && y == 37 || (x>=14 && x<=15 || x>=19 && x<=20) 
            && y == 46 || (x==14 || x==20) && y == 47) 
                oled_data <= 16'he56d;
            //eyes
            if((x == 15 || x == 18) && y == 34 || x>=16 && x<=17 && y == 36)
                oled_data <= 16'h6a24;     
            else if((x>=14 && x<=15 || x>=18 && x<=19) && y == 38 || x>=13 && x<=20 && y == 39 
            || x>=12 && x<=21 && y>=40 && y<=45 || (x>=13 && x<=14 || x>=19 && x<=20) && y == 46)
                oled_data <= 16'h07ff;
            if(count%2 == 0) begin
                if(x>=15 && x<=18 && y>=46 && y<=47 || x>=14 && x<=19 && y>=48 && y<=49 ||  x == 13 && y>=48 && y<=49
                || x>=11 && x<=12 && y>=48 && y<=51 || x>=18 && x<=19 && y>=50 && y<=54)
                    oled_data <= 16'hf81f;
                if(x>=11 && x<=12 && y == 52|| x>=18 && x<=19 && y==55 || x>=10 && x<=12 && y >=53 && y<=54
                || x>=18 && x<=20 && y>=56 && y<=57) 
                    oled_data <= 16'ha96b;     
            end
            else if(count%2!=0) begin
                if(x>=15 && x<=18 && y>=46 && y<=47 || x>=14 && x<=19 && y>=48 && y<=49 ||  
                    (x>=14 && x<=15 || x>=18 && x<=19) && y>=50 && y<=54)
                        oled_data <= 16'hf81f;
                if((x>=14 && x<=15 || x>=18 && x<=19) && y==55 || (x>=13 && x<=15 || x>=18 && x<=20) 
                    && y>=56 && y<=57) 
                        oled_data <= 16'ha96b;        
              end 
        end
    end
    
    end
    
    sun_move unit1(CLOCK, mode, m);
    sun_clk unit2(CLOCK, m, clk);
        
endmodule
