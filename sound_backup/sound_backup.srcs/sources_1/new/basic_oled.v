`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 17:37:12
// Design Name: 
// Module Name: basic_oled
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


module basic_oled(
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
                       oled_data <= 16'h0;
                   end
                   else if(y <= 26 && y > 59 - 3*mode1)
                        oled_data <= 16'hf800;
                   else if(y <= 44 && y > 59 - 3*mode1)
                        oled_data <= 16'hffe0;
                   else if(y > 59 - 3*mode1)
                         oled_data <= 16'h07e0; 
               end
            end
            if( x < 36 || x >= 56)
                oled_data <= 16'h0;
        end
        else if(mode == 0) begin
           oled_data <= 16'h0;
           mode1 <= mode;
        end 
        else if( x >= 36 && x < 56) begin
            if(y <= 60 && y >= 12) begin
               if(y % 3 == 0) begin
                   oled_data <= 16'h0;
               end
               else if(y <= 26 && y > 59 - 3*mode)
                    oled_data <= 16'hf800;
               else if(y <= 44 && y > 59 - 3*mode)
                    oled_data <= 16'hffe0;
               else if(y > 59 - 3*mode)
                     oled_data <= 16'h07e0; 
           end
           mode1 <= mode;
        end
        else if( x < 36 || x >= 56) begin
           oled_data <= 16'h0;
           mode1 <= mode;
        end
        
    end
    
endmodule
