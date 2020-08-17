`timescale 1ns / 1ps



module SevenSegDisplay(
 input CLOCK,
 input [7:0] seg0,
 input [7:0] seg1,
 input [7:0] seg2,
 input [7:0] seg3,
 output reg [7:0] seg,
 output reg [3:0] an
    );
    reg [3:0] AN;
    
    reg [17:0] count =0;
    integer count1=0;
    always @ (posedge CLOCK)
    begin
    count <= count +1;
    count1 <= (count==0)? count1+1 : count1;
    case(count1)
    0: begin seg<=seg0; AN<= 4'b1110; end
    1: begin seg<=seg1; AN<= 4'b1101; end
    2: begin seg<=seg2; AN<= 4'b1011; end
    3: begin seg<=seg3; AN<= 4'b0111; end
    4: begin count1 <=0; end
    endcase
    an<=AN;
    end
endmodule
