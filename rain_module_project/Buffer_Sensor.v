module Buffer_Sensor (input entrada, input flag_ler, output saida);

	reg buffer;
	
	
	always @ (flag_ler) begin
	
		if (flag_ler == 1) begin
			buffer = entrada;
		end
	
	end
	
	
	
	assign saida = buffer;

endmodule