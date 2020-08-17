`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 
// Engineer: Arthur Brown
// The following file has been modified by us.
// Create Date: 07/27/2016 02:04:01 PM
// Design Name: Basys3 Keyboard Demo
// Module Name: top
// Project Name: Keyboard
// Target Devices: Basys3
// Tool Versions: 2016.X
// Description: 
//     Receives input from USB-HID in the form of a PS/2, displays keyboard key presses and releases over USB-UART.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//     Known issue, when multiple buttons are pressed and one is released, the scan code of the one still held down is ometimes re-sent.
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input swmode,
    input PS2Data,
    input PS2Clk,
    output reg led =0, led1 = 0,
    output reg [7:0] seg,
    output reg [3:0] an,
    output reg [1:0] start = 0,
    output reg start1 = 0

);

    reg         CLK50MHZ=0;

    reg  [15:0] keycodev=0;
    wire [15:0] keycode;

    wire        flag;
    
    reg [7:0] seg0, seg1, seg2, seg3;
    reg [3:0] type_an0=0, type_an1=0, type_an2=0, type_an3=0;
    reg  check3=0, check2=0, check1=0, check0=0;
    reg [3:0] blinkyan;
    reg [7:0] letter3=0, letter2=0, letter1=0, letter0=0, letter=0;
    reg [17:0] count_pwd=0;
    integer cnt_pwd=0;
    reg [23:0] an_blinkcnt=0;
    integer position=3;
    reg wrong1=0,wrong2=0;

    always @(posedge(clk))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    
    PS2Receiver uut (
        .clk(CLK50MHZ),
        .kclk(PS2Clk),
        .kdata(PS2Data),
        .keycode(keycode),
        .oflag(flag)     
    );
    
   always @(posedge clk) begin
      if(swmode == 0 && start == 2) begin
        start1 = 0;
        led = 0;
      end
      else if(start == 1) begin
        start1 = 1;
      end
      if(letter == 8'h5A) begin
                led = 1;
      end
   end
   always @(posedge flag) begin
   if(keycode[7:0] == 8'h29   && (keycode[7:0]!= 8'hF0))
        start = 1;
    else if(keycode[7:0] == 8'h76 && (keycode[7:0]!= 8'hF0))
      start = 2;
    end

    always @(posedge flag) begin
       letter= keycode[7:0];

    end
    always @(posedge flag) begin
   if(start == 1) begin
       //check password
            if(letter == 8'h5A   && (letter!= 8'hF0) && position == 0) begin
                if(check3 == 1 && check2 == 1 && check1 == 1 && check0 == 1)begin
                led1<=1;
                //wrong1=0;
                type_an0 =0; type_an1=0; type_an2=0; type_an3=0;
                check3 = 0; check2 = 0; check1 = 0; check0 = 0;
                wrong1=1;
                letter3=0; letter2=0; letter1=0; letter0=0;
                end
                else begin
                type_an0 =0; type_an1=0; type_an2=0; type_an3=0;
                check3 = 0; check2 = 0; check1 = 0; check0 = 0;
                wrong1=1;
                led1<=0;
                letter3=0; letter2=0; letter1=0; letter0=0;

                end
            end
            else begin
                wrong1=wrong2;
           end
  if(letter==8'hF0 || letter == 8'h5A || (letter==letter3 && position!=3)||(letter==letter2 && position!=2)||(letter==letter1 && position!=1)|| (letter==letter0 && position!=0)) begin
       //ignore
   end
   else begin
   if(letter==8'h2A && position==3 && letter!=8'hF0 && letter != 8'h29)begin
   letter3=letter;
    check3=1;
    type_an3=1;
   end
   else if(letter==8'h43 && position==2 && letter!=letter3&& letter!=8'hF0 && letter != 8'h29)begin
   letter2=letter;
    check2=1;
    type_an2=1;
   end
   else if(letter==8'h1B && position==1 && letter!=letter2&& letter!=8'hF0 && letter != 8'h29)begin
   letter1=letter;
    check1=1;
    type_an1=1;
   end
   else if(letter==8'h33 && position==0&& letter!=letter1&& letter!=8'hF0 && letter != 8'h29)begin
   letter0=letter;
    check0=1;
    type_an0=1;
   end
   
   else begin
    if(position==3 && letter!=8'hF0 && letter != 8'h29) begin
        type_an3=1;
        check3 = 0;
        letter3=letter;
    end
    else if(position==2&& letter!=letter3 && letter!=8'hF0 && letter != 8'h29)begin
       type_an2=1;
       check2 = 0;
       letter2=letter;
    end
    else if(position==1&& letter!=letter2 && letter!=8'hF0 && letter != 8'h29)begin
        type_an1=1;
        check1 = 0;
        letter1=letter;
    end
    else if(position==0&& letter!=letter1&& letter!=8'hF0 && letter != 8'h29)begin
        type_an0=1;
        check0 = 0;
        letter0=letter;
    end
    end
end

end
end
    always @ (posedge clk) begin
        count_pwd <= count_pwd +1;
        cnt_pwd <= (count_pwd ==0)? cnt_pwd+1: cnt_pwd;
        an_blinkcnt <= an_blinkcnt +1;
        blinkyan <= 4'b0000;
        blinkyan[position] <= (an_blinkcnt==0)? ~blinkyan[position] : blinkyan[position];
        an<= blinkyan;
        wrong2<=wrong1;
        if(wrong2==1)begin 
        position<=3; wrong2 <=0; 
        seg0 <= 8'b10111111;
        seg1 <= 8'b10111111;
        seg2 <= 8'b10111111;
        seg3 <= 8'b10111111;
        end
        
        if(type_an0==0 && type_an1==0 && type_an2==0 && type_an3==0)begin
             seg0 <= 8'b10111111;
             seg1 <= 8'b10111111;
             seg2 <= 8'b10111111;
             seg3 <= 8'b10111111;
         end
        case(position)
            0: case(type_an0)
                0: begin seg0 <= 8'b10111111; end
                1: begin seg0 <= 8'b10110110; end
               endcase
            1: case(type_an1)
                0: seg1 <= 8'b10111111;
                1: begin seg1 <= 8'b10110110; position <=0; end
               endcase
            2: case(type_an2)
                0: seg2 <= 8'b10111111;
                1: begin seg2 <= 8'b10110110; position<=1; end
               endcase
            3: case(type_an3)
                0: seg3 <= 8'b10111111;
                1: begin seg3 <= 8'b10110110; position<=2; end
               endcase 
        endcase        

         
         case(cnt_pwd)
                           0: begin
                           an <= (blinkyan[0] ==1)? 4'b1111 : 4'b1110; 
                           seg <=seg0; end
                           1: begin
                           an <= (blinkyan[1]==1)? 4'b1111 : 4'b1101;
                           seg <= seg1; end
                           2: begin
                           an <= (blinkyan[2] ==1) ? 4'b1111 : 4'b1011;
                           seg <= seg2; end
                           3: begin
                           an <= (blinkyan[3] ==1) ? 4'b1111 : 4'b0111;
                           seg <= seg3; end
                           4: cnt_pwd <=0;
           endcase
         
    end
    
    
endmodule
