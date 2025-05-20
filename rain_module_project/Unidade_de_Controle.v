module Unidade_de_Controle (
				input [2:0] sinais_entrada, 
				input saida_buffer,
				
				output reg flag_ler,
				output reg enable_blue,
				output reg reset_blue,
				output reg [7:0] letra,
				output reg [2:0] flag_mensagem);


	always @ (sinais_entrada or saida_buffer) begin
	
		case (sinais_entrada)
		
			3'b000: begin
				flag_ler = 0;
				flag_mensagem = 3'b101; // Sensor desligado //Bluetooth: Off
				enable_blue = 0;
				reset_blue = 0;
				letra = 8'h00000020;
			end
			
			
			3'b001: begin //Consulta Valor do Sensor e printa no display
				flag_ler = 1;
				enable_blue = 0;
				reset_blue = 0;
				letra = 8'h00000020;
				
				if (saida_buffer == 0) begin //esta Chovendo !
				
					flag_mensagem = 3'b001; //Chovendo!
				
				end
				
				else begin
					flag_mensagem = 3'b010; //Tempo seco !
				end
				
			end
			
			3'b010: begin
				flag_mensagem = 3'b011; // Bluetooth on
				flag_ler = 1;
				enable_blue = 1;
				reset_blue = 0;
				
				if (saida_buffer == 0) begin //esta Chovendo 
					letra = 8'h00000043; //Chovendo - C
				end
				
				else begin
					letra = 8'h00000053; //Tempo seco ! - S
				end
				
			end
			
			3'b011: begin //Reset Bluetooth
				
				reset_blue = 1;
				enable_blue = 0;
				
				letra = 8'h00000020;
				flag_mensagem = 3'b110; // Bluetooth Reset
			end
			
			
			default: begin
			
				flag_ler = 0;
				enable_blue = 0;
				reset_blue = 0;
				letra = 8'h00000020;
				flag_mensagem = 3'b000; //display em branco
			
			end
			
		endcase
	
	end



endmodule