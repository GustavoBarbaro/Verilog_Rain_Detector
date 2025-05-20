module rain_module_project (
	input clk_50MHz,
	input entrada, //dado lido do sensor
	input ch_1,
	input data_valid,
	output [6:0] saida,
	output Tx,
	
	input ch_reset,
	
	input [2:0] sinais_da_entrada,
	/*
	output flag_ler,
	output buffer_saida,
	output [2:0] flag_mensagem,
	*/
	
	
	//Display LCD
	output LCD_ON,    // LCD Power ON/OFF
	output LCD_BLON,    // LCD Back Light ON/OFF
	output LCD_RW,    // LCD Read/Write Select, 0 = Write, 1 = Read
	output LCD_EN,    // LCD Enable
	output LCD_RS,    // LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] LCD_DATA    // LCD Data bus 8 bits
	
	);
	
	
	wire [7:0] hex_1_00, hex_1_01, hex_1_02, hex_1_03, hex_1_04, hex_1_05, hex_1_06, hex_1_07, hex_1_08, hex_1_09, hex_1_10, hex_1_11, hex_1_12, hex_1_13, hex_1_14, hex_1_15;
	wire [7:0] hex_2_00, hex_2_01, hex_2_02, hex_2_03, hex_2_04, hex_2_05, hex_2_06, hex_2_07, hex_2_08, hex_2_09, hex_2_10, hex_2_11, hex_2_12, hex_2_13, hex_2_14, hex_2_15;
	
	
	wire flag_ler;
	wire buffer_saida;
	wire [2:0] flag_mensagem;
	wire enable_blue;
	wire reset_blue;
	
	wire [7:0] letra;
	
	
	
	reg [3:0] to_7seg;
	
	
	always @ (entrada)
	begin
	
		if (entrada == 0) begin
			to_7seg = 0001; //esta recebendo sinal baixo - Chovendo
			//letra = 8'h0000006d;
		end
		else begin
			to_7seg = 0000; //esta recebendo sinal alto - Sem chuva
			//letra = 8'h00000068;
		end
		
	
	end
	
	Buffer_Sensor BS (.entrada(entrada), .flag_ler(flag_ler), .saida(buffer_saida));
	
	
	Unidade_de_Controle UC (.sinais_entrada(sinais_da_entrada), .saida_buffer(buffer_saida), .flag_ler(flag_ler),
	
									.flag_mensagem(flag_mensagem), .enable_blue(enable_blue), .reset_blue(reset_blue), .letra(letra));
	
	
	Memoria_Mensagem (.flag_mensagem(flag_mensagem), 
	
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
								.hex_2_15 (hex_2_15)
	
	);
	
	
	Print_Display_LCD P1 (.CLOCK_50(clk_50MHz), .reset(ch_reset), 
								.LCD_ON(LCD_ON),
								
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
								
								.LCD_BLON(LCD_BLON), .LCD_RW(LCD_RW), .LCD_EN(LCD_EN),
								.LCD_RS(LCD_RS), .LCD_DATA(LCD_DATA));
	
	
	
	
	
	
	//assign letra = 8'h00000068; //letra h
	//assign letra = 8'h0000006d; //letra m
	
	//Modulo_Bluetooth B1 (.TxData(letra), .Clk(clk_50MHz), .Rst_n(ch_1), .Tx(Tx));
	
	uart_tx B22 (.clk(clk_50MHz), .rst(reset_blue), .tx_data(letra), .tx_data_valid(enable_blue), .txd(Tx));
	
	
	
	
	
	display_7_seg (.inp(to_7seg), .saida_7s(saida));
	
	
	
	
	/*
	always @ (clk_50MHz)
	begin
	
		
	
	end
	*/
	
	
	
	




endmodule