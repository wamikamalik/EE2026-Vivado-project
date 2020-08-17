`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 10:52:01
// Design Name: 
// Module Name: clk_voice
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


module clk_voice (input basys_clock, output reg clk20k = 0); //f desired = fclk/(2*(m+1)) //N  , same way as before

reg [11:0] count = 0;

always @(posedge basys_clock) begin

    count <= (count == 2499)?0:count + 1;
    clk20k <= (count==0)?~clk20k:clk20k;   

end

endmodule
