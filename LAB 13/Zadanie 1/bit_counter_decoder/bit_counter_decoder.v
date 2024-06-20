module bit_counter_decoder (input [7:0] in,
									 input clk, sclr, Run,
									 output [0:6] H0,
									 output Done);
	wire [3:0] result;								 
	bit_counter bit_cnt(in, clk, sclr, Run, result, Done);
	decoder_hex_10 dec0(result, H0[0:6]);
	
endmodule
