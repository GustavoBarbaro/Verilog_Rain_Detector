/*Imagine that the baud rate you want to work with is 9600. The clock of my
FPGA is 50MHz. If we want the "TICKS" to ahev 16 times the frequency of the UART signal
we need a frequency 16 times the 9600Hz. 
The width of the UART signal is 1/9600 equal to 104us. The width of the main clock is 1/50Mhz equal to 20ns
How many 20ns pulses we need to cont to get to 104us/16??? Well (104000ns/16)/ 20ns = 325 pulses (
That's why in the top we set baud rate to 325)
*/
module UART_BaudRate_generator(
    Clk                   ,
    Rst_n                 ,
    Tick                  ,
    BaudRate
    );

input           Clk                 ; // Clock input
input           Rst_n               ; // Reset input
input [15:0]    BaudRate            ; // Value to divide the generator by
output          Tick                ; // Each "BaudRate" pulses we create a tick pulse
reg [15:0]      baudRateReg         ; // Register used to count


always @(posedge Clk or negedge Rst_n)
    if (!Rst_n) baudRateReg <= 16'b1;
    else if (Tick) baudRateReg <= 16'b1;
         else baudRateReg <= baudRateReg + 1'b1;
assign Tick = (baudRateReg == BaudRate);
endmodule
