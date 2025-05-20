module uart_tx (clk,rst,tx_data,tx_data_valid,tx_data_ack,txd);
  
output txd;
input clk, rst;
input [7:0] tx_data;
input tx_data_valid;
output tx_data_ack;

parameter BAUD_DIVISOR = 50000000/9600;

reg [15:0] sample_cntr;
reg [10:0] tx_shift;
reg sample_now;
reg tx_data_ack;

assign txd = tx_shift[0];

always @(posedge clk) begin
	if (rst) begin
		sample_cntr <= 0;
		sample_now <= 1'b0;
	end
	else if (sample_cntr == (BAUD_DIVISOR-1)) begin
		sample_cntr <= 0;
		sample_now <= 1'b1;
   	end
	else begin
		sample_now <= 1'b0;
		sample_cntr <= sample_cntr + 1'b1;
	end
end

reg ready;
always @(posedge clk) begin
	if (rst) begin
		tx_shift <= {11'b00000000001};
		ready <= 1'b1;
	end
	else begin		
		if (!ready & sample_now) begin
			tx_shift <= {1'b0,tx_shift[10:1]};
			tx_data_ack <= 1'b0;
			ready <= ~|tx_shift[10:1];
		end		
		else if (ready & tx_data_valid) begin
			tx_shift[10:1] <= {1'b1,tx_data,1'b0};
			tx_data_ack <= 1'b1;
			ready <= 1'b0;		
		end
		else begin
			tx_data_ack <= 1'b0;
			ready <= ~|tx_shift[10:1];
		end
	end		
end

endmodule