`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2020 10:53:59
// Design Name: 
// Module Name: slow_clk
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


module sp_clk(input CLOCK, output reg clk = 0 );

reg [22:0] COUNT = 23'b0; // not for frequency of 6Hz

always @ (posedge CLOCK) begin
  COUNT <= COUNT + 1;
  if(COUNT == 24'b0)
  begin
    clk <= ~clk;
  end
end

endmodule