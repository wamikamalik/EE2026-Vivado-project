`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 16:19:34
// Design Name: 
// Module Name: heart
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


module heart(
    input CLOCK,
    input [1:0] start,
    input [7:0] x,
    input [7:0] y,
    input [4:0] mode,
    output reg [15:0] oled_data
);

wire clk;
wire [25:0] m;

reg counth = 0;
reg [2:0] count = 0;

always @(posedge clk) begin 
if(start == 2) begin
    counth = ~counth;
    count = (count == 6)?0:count+1;
end
else begin
    count = 0;
    counth = 0;
end

end

always @(posedge CLOCK) begin

if(counth == 0) begin
    case(count) 
    0: if(y<=9) oled_data = 16'hf800; else oled_data <= 16'h0;
    1: if(y>=10 && y<=18) oled_data = 16'hfc00; else oled_data <= 16'h0;
    2: if(y>=19 && y<=27) oled_data = 16'hffe0; else oled_data <= 16'h0;
    3: if(y>=28 && y<=36) oled_data = 16'h07e0; else oled_data <= 16'h0;
    4: if(y>=37 && y<=45) oled_data = 16'h001f; else oled_data <= 16'h0;
    5: if(y>=46 && y<=54) oled_data = 16'h4810; else oled_data <= 16'h0;
    6: if(y>=55 && y<=63) oled_data = 16'h901f; else oled_data <= 16'h0;
    endcase
    if(((x - 41)*(x - 41) + (y-30)*(y-30) <=81 || (x-57)*(x-57) + (y-30)*(y-30)<=81) || 2*x - y>=32 && 2*x+y<=164
    && x>=33 && x<=65 && y>=34)
        oled_data <= 16'hf800; 
end
else begin
    case(count) 
    0: if(y<=9) oled_data = 16'hf800; else oled_data <= 16'h0;
    1: if(y>=10 && y<=18) oled_data = 16'hfc00; else oled_data <= 16'h0;
    2: if(y>=19 && y<=27) oled_data = 16'hffe0; else oled_data <= 16'h0;
    3: if(y>=28 && y<=36) oled_data = 16'h07e0; else oled_data <= 16'h0;
    4: if(y>=37 && y<=45) oled_data = 16'h001f; else oled_data <= 16'h0;
    5: if(y>=46 && y<=54) oled_data = 16'h4810; else oled_data <= 16'h0;
    6: if(y>=55 && y<=63) oled_data = 16'h901f; else oled_data <= 16'h0;
    endcase
    if(((x - 35)*(x - 35) + (y-20)*(y-20) <= 196|| (x-59)*(x-59) + (y-20)*(y-20)<=196) || (3*x-2*y>=16 &&3*x-2*y<=134&& 3*x-2*y>=14 && 3*x+2*y<=266
     && y>=25))
        oled_data <= 16'hf800;
end

end


sun_move unit1(CLOCK, mode, m);
sun_clk unit2(CLOCK, m, clk);

endmodule
