`timescale 1ns / 1ps



module SevenSegment_LastTwo(
    input CLOCK,
    input [4:0] mode,
    output reg [7:0] seg,
    output reg [3:0] an
    );
reg [7:0] seg0, seg1, seg2, seg3;
wire [7:0] segment;
wire [3:0] anode;
SevenSegDisplay display(CLOCK, seg0, seg1,seg2, seg3, segment, anode);
always @ (posedge CLOCK)
begin
    case(mode)
        0:begin seg0<= 8'b11000000; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        1:begin seg0<= 8'b11111001; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        2:begin seg0<= 8'b10100100; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        3:begin seg0<= 8'b10110000; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        4:begin seg0<= 8'b10011001; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        5:begin seg0<= 8'b10010010; seg1<= 8'b11000000; seg2<= 8'b01000000; seg3<= 8'b11000111; end
        6:begin seg0<= 8'b10000010; seg1<= 8'b11000000; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        7:begin seg0<= 8'b11111000; seg1<= 8'b11000000; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        8:begin seg0<= 8'b10000000; seg1<= 8'b11000000; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        9:begin seg0<= 8'b10010000; seg1<= 8'b11000000; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        10:begin seg0<= 8'b11000000; seg1<= 8'b11111001; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        11:begin seg0<= 8'b11111001; seg1<= 8'b11111001; seg2<= 8'b00000110; seg3<= 8'b10101010; end
        12:begin seg0<= 8'b10100100; seg1<= 8'b11111001; seg2<= 8'b01001111; seg3<= 8'b10001001; end
        13:begin seg0<= 8'b10110000; seg1<= 8'b11111001; seg2<= 8'b01001111; seg3<= 8'b10001001; end
        14:begin seg0<= 8'b10011001; seg1<= 8'b11111001; seg2<= 8'b01001111; seg3<= 8'b10001001; end
        15:begin seg0<= 8'b10010010; seg1<= 8'b11111001; seg2<= 8'b01001111; seg3<= 8'b10001001; end
        16:begin seg0<= 8'b10000010; seg1<= 8'b11111001; seg2<= 8'b01001111; seg3<= 8'b10001001; end
    endcase
    seg <= segment;
    an<= anode;
end
endmodule
