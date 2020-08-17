`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 11:00:26
// Design Name: 
// Module Name: basic_invert1
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


module basic_invert1(
    input swstop,
    input CLOCK,
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data
    );
    reg [4:0] mode1 =0;
    always @(posedge CLOCK) begin
    if(swstop == 1) begin
      if( x >= 36 && x < 56) begin
            if(y <= 60 && y >= 12) begin
               if(y % 3 == 0) begin
                   oled_data <= 16'h8f90;
               end
               else if(y <= 26 && y > 59 - 3*mode1) begin
                    oled_data <= 16'h0;
               end
               else if(y <= 44 && y > 59 - 3*mode1) begin
                    oled_data <= 16'ha945;
               end
               else if(y > 59 - 3*mode1) begin
                     oled_data <= 16'hd587; 
               end
           end
        end
        if( x < 36 || x >= 56)
            oled_data <= 16'h8f90;
    end
    else if(mode == 0) begin
       oled_data <= 16'h8f90;
       mode1 <= mode;
    end 
    else if( x >= 36 && x < 56) begin
        if(y <= 60 && y >= 12) begin
           if(y % 3 == 0) begin
               oled_data <= 16'h8f90;
           end
           else if(y <= 26 && y > 59 - 3*mode) begin
                oled_data <= 16'h0;
           end
           else if(y <= 44 && y > 59 - 3*mode) begin
                oled_data <= 16'ha945;
           end
           else if(y > 59 - 3*mode) begin
                 oled_data <= 16'hd587;  
           end
       end
       mode1 <= mode;
    end
    else if( x < 36 || x >= 56) begin
       oled_data <= 16'h8f90;
       mode1 <= mode;
    end
    
    end
endmodule
