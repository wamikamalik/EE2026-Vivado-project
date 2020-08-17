`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input switch1,
    input PS2Data, 
    input PS2Clk,
    output reg [15:0] led,
    input btnC,
    input CLOCK,
    output rgb_cs, rgb_sdin, rgb_sclk, rgb_d_cn, rgb_resn, rgb_vccen, rgb_pmoden,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    input swbs,
    input swbb,
    input swstop,
    input swmode,
    input swinvert,
    input swinvert1,
    input swoff,
    output reg [7:0] seg, //added
    output reg [3:0] an
    );
    
   //audio
wire cs;
wire [7:0] segment, seg1, seg2;//added
wire [3:0] anode, an1, an2;
wire [15:0] mic_in, maxvalue;
reg [4:0] mode=0;
wire [4:0] mode1;
clk_voice clk20hz(CLOCK, cs); // cs is clock select, MISO is master input slave output 
Audio_Capture unit(CLOCK, cs, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in); //instantiate
slow_clock10Hz unit1(CLOCK, mic_in, maxvalue);
SevenSegment_LastTwo unit2(CLOCK, mode, segment, anode); //added

    always @ (posedge CLOCK)
    begin

    if(switch1==0) begin
        if(maxvalue>=2047 && maxvalue<2167)begin led<= 16'h0000; mode =0; end
        else if(maxvalue>=2167 && maxvalue<2287)begin led<= 16'h0001; mode =1; end
        else if(maxvalue>=2287 && maxvalue<2407)begin led<= 16'h0003; mode =2; end
        else if(maxvalue>=2407 && maxvalue<2527)begin led<= 16'h0007; mode =3; end
        else if(maxvalue>=2527 && maxvalue<2647)begin led<= 16'h000F; mode =4; end
        else if(maxvalue>=2647 && maxvalue<2767)begin led<= 16'h001F; mode =5; end
        else if(maxvalue>=2767 && maxvalue<2887)begin led<= 16'h003F; mode =6; end
        else if(maxvalue>=2887 && maxvalue<3007)begin led<= 16'h007F; mode =7; end
        else if(maxvalue>=3007 && maxvalue<3127)begin led<= 16'h00FF; mode =8; end
        else if(maxvalue>=3127 && maxvalue<3247)begin led<= 16'h01FF; mode =9; end
        else if(maxvalue>=3247 && maxvalue<3367)begin led<= 16'h03FF; mode =10; end
        else if(maxvalue>=3367 && maxvalue<3487)begin led<= 16'h07FF; mode =11; end
        else if(maxvalue>=3487 && maxvalue<3607)begin led<= 16'h0FFF; mode =12; end
        else if(maxvalue>=3607 && maxvalue<3727)begin led<= 16'h1FFF; mode =13; end
        else if(maxvalue>=3727 && maxvalue<3847)begin led<= 16'h3FFF; mode =14; end
        else if(maxvalue>=3847 && maxvalue<3967)begin led<= 16'h7FFF; mode =15; end
        else if(maxvalue>=3967 && maxvalue<=4094)begin led<= 16'hFFFF; mode =16; end
    end
    
    else begin
        led <= mic_in;
    end

    end
    
wire reset, clk6p25m;

wire frame_begin, sending_pixels, sample_pixel, teststate;
wire [12:0] pixel_index; 

wire flag, led2, led3, flagsecret, start1;
wire [1:0] start;
reg [15:0] oled_data;
wire [15:0] oled_data1, oled_data2, oled_data3, oled_data4, oled_data5, oled_data6,oled_data7,oled_data8,oled_data9,oled_data10;

clk_oled unit4(CLOCK, clk6p25m); 
single_pulse sp(btnC, CLOCK, reset);


reg [7:0] x, y;

always @(posedge CLOCK) 
begin
	x <= pixel_index%96;
	y <= pixel_index/96;
	

   
   if(swmode == 0) begin
        seg <= segment;
        an <= anode;
        oled_data = oled_data1;
        if(swoff == 1)
            oled_data <= 16'h0;
        if(swbs == 1) 
        begin
            if(x == 0 || x == 95 || y == 0 || y == 63) 
            begin
               oled_data <= 16'hffff;
            end
        end
        else if(swbb == 1)
        begin
            if(x <= 2 || x >= 93 || y <= 2 || y >= 61) 
            begin
               oled_data <= 16'hffff;
            end  
        end
        if(swinvert == 1) begin
            oled_data = oled_data3;
            if(swoff == 1)
                oled_data <= 16'hffff;
            if(swbs == 1) 
            begin
                if(x == 0 || x == 95 || y == 0 || y == 63) 
                begin
                   oled_data <= 16'h8000;
                end
            end
            else if(swbb == 1)
            begin
                if(x <= 2 || x >= 93 || y <= 2 || y >= 61) 
                begin
                   oled_data <= 16'h8000;
                end  
           end
        end
        else if(swinvert1 == 1) begin
            oled_data = oled_data10;
            if(swoff == 1)
                oled_data <= 16'h8f90;
            if(swbs == 1) 
            begin
                if(x == 0 || x == 95 || y == 0 || y == 63) 
                begin
                   oled_data <= 16'h0926;
                end
            end
            else if(swbb == 1)
            begin
                if(x <= 2 || x >= 93 || y <= 2 || y >= 61) 
                begin
                   oled_data <= 16'h0926;
                end  
           end
        end
   end
   else begin
        if(flag == 0) begin
            oled_data = oled_data8;
            an <= 4'b1111;
        end
        else begin 
            seg <= seg1;
            an <= an1;
            oled_data = oled_data2;
            if(start == 1) begin
                seg <= seg2;
                an <= an2;
                oled_data = oled_data5;
                if(led2 == 1 && led3 == 1) begin
                    if(flagsecret == 0) begin
                        oled_data = oled_data9;
                        an <= 4'b1111;
                    end
                    else begin
                        oled_data = oled_data7;   
                        seg <= segment;
                        an <= anode;
                    end 
                end
            end
            else if(start == 2 && start1 == 1) begin
                seg <= segment;
                an <= anode;   
                oled_data = oled_data6;
            end
        end
   end

end

Oled_Display unit5(clk6p25m, reset, frame_begin, sending_pixels, sample_pixel, pixel_index, oled_data, 
rgb_cs, rgb_sdin, rgb_sclk, rgb_d_cn, rgb_resn, rgb_vccen, rgb_pmoden, teststate);

basic_oled disp(swstop, CLOCK, x, y, mode, oled_data1);
improve_oled improvise(CLOCK, flag, x, y, mode, oled_data2);
basic_invert invert(swstop, CLOCK, x, y, mode, oled_data3);
basic_invert1 invert1(swstop, CLOCK, x, y, mode, oled_data10);
enlarging_man man(CLOCK, x, y, mode, oled_data5);
heart he(CLOCK, start, x, y, mode, oled_data6);
secret_mode secret(CLOCK, flagsecret, x, y, mode, oled_data7);
welcome message(swmode, start1, CLOCK, flag, x, y, mode, oled_data8);
to_secret message1(CLOCK, swmode, start1, led2, led3, x, y, mode, oled_data9,flagsecret);
Scroll_Seg scroll(CLOCK, flag, seg1, an1);
top keyboard(CLOCK, swmode, PS2Data, PS2Clk, led2, led3, seg2, an2, start, start1);


endmodule