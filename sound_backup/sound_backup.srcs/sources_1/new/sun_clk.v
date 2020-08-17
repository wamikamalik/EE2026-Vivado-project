`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2020 21:13:05
// Design Name: 
// Module Name: sun_clk
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


module sun_clk(
    input CLOCK,
    input [25:0] m,
    output reg clk = 0
    );
    
    reg [25:0] count = 0;
    
    always @(posedge CLOCK) begin
        count <= (count == m)?0:count + 1;
        clk <= (count == 0)?~clk:clk;
    end
endmodule
