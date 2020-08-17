`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 11:51:05
// Design Name: 
// Module Name: single_pulse
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


module single_pulse(input pb, sp_clock, output sp_out);

    wire dff1_out, dff2_out, slowclk;
    sp_clk slow(sp_clock, slowclk);
    dff dff1(slowclk, pb, dff1_out);
    dff dff2(slowclk, dff1_out, dff2_out);
    assign sp_out = dff1_out & ~dff2_out;
    
endmodule

