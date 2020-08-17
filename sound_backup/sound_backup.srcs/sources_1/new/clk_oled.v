`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2020 11:37:42
// Design Name: 
// Module Name: clk_oled
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


module clk_oled (input basys_clock, output reg clk6p25m = 0);

reg [2:0] count = 0; // this N gives you the minimum frequency

always @(posedge basys_clock) begin

    count <= (count == 7)?0:count + 1;
    clk6p25m <= (count==0)?~clk6p25m:clk6p25m;   

end

endmodule
