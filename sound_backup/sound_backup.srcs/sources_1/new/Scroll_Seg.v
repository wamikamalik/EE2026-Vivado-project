`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 18:43:43
// Design Name: 
// Module Name: Scroll_Seg
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


module Scroll_Seg(
    input CLOCK,
    input flag,
    output reg [7:0] seg,
    output reg [3:0] an
);

parameter[7:0] E=8'b10000110, N=8'b10101011, T=8'b10000111, four=8'b10011001, L= 8'b11000111, P= 8'b10001100, A= 8'b10001000;
parameter[7:0] S=8'b10010010, W= 8'b11010101, O=8'b11000000, D= 8'b10100001, G= 8'b10010000, M= 8'b10101010, I= 8'b11001111;
parameter[7:0] C= 8'b11000110, B= 8'b10000011, U= 8'b11000001, blank = 8'b11111111, dash = 8'b10111111, R= 8'b10101111; 
reg [7:0] seg0, seg1, seg2, seg3;
wire [7:0] segment;
wire [3:0] AN;
reg [24:0] count =0;
integer count1=0;

SevenSegDisplay display1(CLOCK, seg0, seg1, seg2, seg3, segment, AN);

always @ (posedge CLOCK) begin
if(flag == 1) begin
    count <= count +1;
    count1 <= (count==0)? count1+1 : count1;
    case(count1)
    0: begin seg3<=E; seg2<= N; seg1<= T; seg0<= E; end
    1: begin seg3<=N; seg2<= T; seg1<= E; seg0<= R; end
    2: begin seg3<=T; seg2<= E; seg1<= R; seg0<= blank; end
    3: begin seg3<=E; seg2<= R; seg1<= blank; seg0<= four; end
    4: begin seg3<=R; seg2<= blank; seg1<= four; seg0<= blank; end
    5: begin seg3<=blank; seg2<= four; seg1<= blank; seg0<= L; end
    6: begin seg3<=four; seg2<= blank; seg1<= L; seg0<= E; end
    7: begin seg3<=blank; seg2<= L; seg1<= E; seg0<= T; end
    8: begin seg3<=L; seg2<= E; seg1<= T; seg0<= T; end
    9: begin seg3<=E; seg2<= T; seg1<= T; seg0<= E; end
    10: begin seg3<=T; seg2<= T; seg1<= E; seg0<= R; end
    11: begin seg3<=T; seg2<= E; seg1<= R; seg0<= blank; end
    12: begin seg3<=E; seg2<= R; seg1<= blank; seg0<= P; end
    13: begin seg3<=R; seg2<= blank; seg1<= P; seg0<= A; end
    14: begin seg3<=blank; seg2<= P; seg1<= A; seg0<= S; end
    15: begin seg3<=P; seg2<= A; seg1<= S; seg0<= S; end
    16: begin seg3<=A; seg2<= S; seg1<= S; seg0<= W; end
    17: begin seg3<=S; seg2<= S; seg1<= W; seg0<= O; end
    18: begin seg3<=S; seg2<= W; seg1<= O; seg0<= R; end
    19: begin seg3<=W; seg2<= O; seg1<= R; seg0<= D; end
    20: begin seg3<=O; seg2<= R; seg1<= D; seg0<= blank; end
    21: begin seg3<=R; seg2<= D; seg1<= blank; seg0<= T; end
    22: begin seg3<=D; seg2<= blank; seg1<= T; seg0<= O; end
    23: begin seg3<=blank; seg2<= T; seg1<= O; seg0<= blank; end
    24: begin seg3<=T; seg2<= O; seg1<= blank; seg0<= G; end
    25: begin seg3<=O; seg2<= blank; seg1<= G; seg0<= O; end
    26: begin seg3<=blank; seg2<= G; seg1<= O; seg0<= blank; end
    27: begin seg3<=G; seg2<= O; seg1<= blank; seg0<= T; end
    28: begin seg3<=O; seg2<= blank; seg1<= T; seg0<= O; end
    29: begin seg3<=blank; seg2<= T; seg1<= O; seg0<= blank; end
    30: begin seg3<=T; seg2<= O; seg1<= blank; seg0<= E; end
    31: begin seg3<=O; seg2<= blank; seg1<= E; seg0<= dash; end 
    32: begin seg3<=blank; seg2<= E; seg1<= dash; seg0<= M; end
    33: begin seg3<=E; seg2<= dash; seg1<= M; seg0<= O; end
    34: begin seg3<=dash; seg2<= M; seg1<= O; seg0<= T; end
    35: begin seg3<=M; seg2<= O; seg1<= T; seg0<= I; end
    36: begin seg3<=O; seg2<= T; seg1<= I; seg0<= O; end
    37: begin seg3<=T; seg2<= I; seg1<= O; seg0<= N; end
    38: begin seg3<=I; seg2<= O; seg1<= N; seg0<= blank; end
    39: begin seg3<=O; seg2<= N; seg1<= blank; seg0<= M; end
    40: begin seg3<=N; seg2<= blank; seg1<= M; seg0<= O; end
    41: begin seg3<=blank; seg2<= M; seg1<= O; seg0<= D; end
    42: begin seg3<=M; seg2<= O; seg1<= D; seg0<= E; end
    43: begin seg3<=O; seg2<= D; seg1<= E; seg0<= blank; end
    44: begin seg3<=D; seg2<= E; seg1<= blank; seg0<= P; end
    45: begin seg3<=E; seg2<= blank; seg1<= P; seg0<= R; end
    46: begin seg3<=blank; seg2<= P; seg1<= R; seg0<= E; end
    47: begin seg3<=P; seg2<= R; seg1<= E; seg0<= S; end
    48: begin seg3<=R; seg2<= E; seg1<= S; seg0<= S; end
    49: begin seg3<=E; seg2<= S; seg1<= S; seg0<= blank; end
    50: begin seg3<=S; seg2<= S; seg1<= blank; seg0<= S; end
    51: begin seg3<=S; seg2<= blank; seg1<= S; seg0<= P; end
    52: begin seg3<=blank; seg2<= S; seg1<= P; seg0<= A; end
    53: begin seg3<=S; seg2<= P; seg1<= A; seg0<= C; end
    54: begin seg3<=P; seg2<= A; seg1<= C; seg0<= E; end
    55: begin seg3<=A; seg2<= C; seg1<= E; seg0<= B; end
    56: begin seg3<=C; seg2<= E; seg1<= B; seg0<= A; end
    57: begin seg3<=E; seg2<= B; seg1<= A; seg0<= R; end
    58: begin seg3<=B; seg2<= A; seg1<= R; seg0<= blank; end
    59: begin seg3<=A; seg2<= R; seg1<= blank; seg0<= T; end
    60: begin seg3<=R; seg2<= blank; seg1<= T; seg0<= O; end
    61: begin seg3<=blank; seg2<= T; seg1<= O; seg0<= blank; end
    62: begin seg3<=T; seg2<= O; seg1<= blank; seg0<= C; end
    63: begin seg3<=O; seg2<= blank; seg1<= C; seg0<= O; end
    64: begin seg3<=blank; seg2<= C; seg1<= O; seg0<= N; end
    65: begin seg3<=C; seg2<= O; seg1<= N; seg0<= T; end
    66: begin seg3<=O; seg2<= N; seg1<= T; seg0<= I; end
    67: begin seg3<=N; seg2<= T; seg1<= I; seg0<= N; end
    68: begin seg3<=T; seg2<= I; seg1<= N; seg0<= U; end
    69: begin seg3<=I; seg2<= N; seg1<= U; seg0<= E; end
    70: begin seg3<=N; seg2<= U; seg1<= E; seg0<= blank; end
    71: begin seg3<=U; seg2<= E; seg1<= blank; seg0<= E; end
    72: begin seg3<=E; seg2<= blank; seg1<= E; seg0<= N; end
    73: begin seg3<=blank; seg2<= E; seg1<= N; seg0<= T; end
    74: begin count1<=0; end 
    endcase
    
    seg<=segment;
    an<=AN;
 end
end

endmodule
