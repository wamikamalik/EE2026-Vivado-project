`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 18:57:20
// Design Name: 
// Module Name: sun_move
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


module sun_move(
    input CLOCK,
    input [4:0] mode,
    output reg [25:0] m
    );
    
    reg [25:0] count = 0;
    
    always @(posedge CLOCK) begin
        if(mode>=0 && mode<=2)
            m <= 25000000;
        else if(mode>=3 && mode<=5)
            m <= 16666666;
        else if(mode>=6 && mode<=8)
            m <= 10000000;
        else if(mode>=9 && mode<=11)
            m <= 7142857;
        else if(mode>=12 && mode<=14)
            m <= 5555555;
        else 
            m <= 4545454; 
    end
    
endmodule
