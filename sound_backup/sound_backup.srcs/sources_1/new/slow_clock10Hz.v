`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 15:04:02
// Design Name: 
// Module Name: slow_clock10Hz
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


module slow_clock10Hz(
    input CLOCK,
    input [15:0] mic_in,
    output reg [15:0] maxvalue
    );
    reg [15:0]MAX=0;
    reg [22:0] count=0;
    
    always @ (posedge CLOCK) 
    begin
        count <= (count==4999999)? 0: count+1;
        if(mic_in >MAX) begin MAX <= mic_in; end
        if(count==0) begin maxvalue<= MAX; MAX<=0; end 
    end
endmodule
