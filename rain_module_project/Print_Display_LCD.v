module Print_Display_LCD(
	input CLOCK_50,    //    50 MHz clock
	input reset,
	input [7:0] hex_1_00, hex_1_01, hex_1_02, hex_1_03, hex_1_04, hex_1_05, hex_1_06, hex_1_07, hex_1_08, hex_1_09, hex_1_10, hex_1_11, hex_1_12, hex_1_13, hex_1_14, hex_1_15,
	input [7:0] hex_2_00, hex_2_01, hex_2_02, hex_2_03, hex_2_04, hex_2_05, hex_2_06, hex_2_07, hex_2_08, hex_2_09, hex_2_10, hex_2_11, hex_2_12, hex_2_13, hex_2_14, hex_2_15,
	input [7:0] var,
  
//    LCD Module 16X2
  output LCD_ON,    // LCD Power ON/OFF
  output LCD_BLON,    // LCD Back Light ON/OFF
  output LCD_RW,    // LCD Read/Write Select, 0 = Write, 1 = Read
  output LCD_EN,    // LCD Enable
  output LCD_RS,    // LCD Command/Data Select, 0 = Command, 1 = Data
  inout [7:0] LCD_DATA    // LCD Data bus 8 bits
);


wire [6:0] myclock;
wire RST;
assign RST = reset;

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(    .iCLK(CLOCK_50),.oRESET(DLY_RST) );

// turn LCD ON
assign    LCD_ON        =    1'b1;
assign    LCD_BLON    =    1'b1;

//wire [7:0] hex_1_00, hex_1_01, hex_1_02, hex_1_03, hex_1_04, hex_1_05, hex_1_06, hex_1_07, hex_1_08, hex_1_09, hex_1_10, hex_1_11, hex_1_12, hex_1_13, hex_1_14, hex_1_15;
//wire [7:0] hex_2_00, hex_2_01, hex_2_02, hex_2_03, hex_2_04, hex_2_05, hex_2_06, hex_2_07, hex_2_08, hex_2_09, hex_2_10, hex_2_11, hex_2_12, hex_2_13, hex_2_14, hex_2_15;
//wire [7:0] pass_manual;

//wire [7:0] var;

//assign pass_manual = {6'h0, hex_text_1[1:0]}; //8'h00000047;


//assign pass_manual = {12'h0, hex_text_1[1:0]}; //8'h00000047; nao foi :(

//assign pass_manual = 8'h00000047; //8'h00000047; isso foi 


//assign pass_manual = {4'h0, 8'h47}; //8'h00000047; ESSE FOI AAAAAAAAAAAAA

//assign var = 8'h00000048;
/*
assign pass_manual = var;

assign hex_1_00 = hex_text_1[31:30];
assign hex_1_01 = hex_text_1[29:28];
assign hex_1_02 = hex_text_1[27:26];
assign hex_1_03 = hex_text_1[25:24];
assign hex_1_04 = hex_text_1[23:22];
assign hex_1_05 = hex_text_1[21:20];
assign hex_1_06 = hex_text_1[19:18];
assign hex_1_07 = hex_text_1[17:16];
assign hex_1_08 = hex_text_1[15:14];
assign hex_1_09 = hex_text_1[13:12];
assign hex_1_10 = hex_text_1[11:10];
assign hex_1_11 = hex_text_1[9:8];
assign hex_1_12 = hex_text_1[7:6];
assign hex_1_13 = hex_text_1[5:4];
assign hex_1_14 = hex_text_1[3:2];
assign hex_1_15 = hex_text_1[1:0];

assign hex_2_00 = hex_text_2[1:0];
assign hex_2_01 = hex_text_2[3:2];
assign hex_2_02 = hex_text_2[5:4];
assign hex_2_03 = hex_text_2[7:6];
assign hex_2_04 = hex_text_2[9:8];
assign hex_2_05 = hex_text_2[11:10];
assign hex_2_06 = hex_text_2[13:12];
assign hex_2_07 = hex_text_2[15:14];
assign hex_2_08 = hex_text_2[17:16];
assign hex_2_09 = hex_text_2[19:18];
assign hex_2_11 = hex_text_2[23:22];
assign hex_2_12 = hex_text_2[25:24];
assign hex_2_13 = hex_text_2[27:26];
assign hex_2_14 = hex_text_2[29:28];
assign hex_2_15 = hex_text_2[31:30];
*/




LCD_Display u1(
// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
   
	.hex_1_00 (hex_1_00),
	.hex_1_01 (hex_1_01),
	.hex_1_02 (hex_1_02),
	.hex_1_03 (hex_1_03),
	.hex_1_04 (hex_1_04),
	.hex_1_05 (hex_1_05),
	.hex_1_06 (hex_1_06),
	.hex_1_07 (hex_1_07),
	.hex_1_08 (hex_1_08),
	.hex_1_09 (hex_1_09),
	.hex_1_10 (hex_1_10),
	.hex_1_11 (hex_1_11),
	.hex_1_12 (hex_1_12),
	.hex_1_13 (hex_1_13),
	.hex_1_14 (hex_1_14),
	.hex_1_15 (hex_1_15),

	.hex_2_00 (hex_2_00),
	.hex_2_01 (hex_2_01),
	.hex_2_02 (hex_2_02),
	.hex_2_03 (hex_2_03),
	.hex_2_04 (hex_2_04),
	.hex_2_05 (hex_2_05),
	.hex_2_06 (hex_2_06),
	.hex_2_07 (hex_2_07),
	.hex_2_08 (hex_2_08),
	.hex_2_09 (hex_2_09),
	.hex_2_10 (hex_2_10),
	.hex_2_11 (hex_2_11),
	.hex_2_12 (hex_2_12),
	.hex_2_13 (hex_2_13),
	.hex_2_14 (hex_2_14),
	.hex_2_15 (hex_2_15),
	
	
// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);



endmodule