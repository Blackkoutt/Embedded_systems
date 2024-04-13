module counter_T_4_bits_decoder(input clk, areset, enable,
										  output [0:6] Q);
										  
	wire [3:0] counter_out;
	counter_T_4_bits counter0(enable, clk, areset, counter_out[3:0]);
	decoder_hex_16 dec_hex_16(counter_out[3:0], Q[0:6]);
	
endmodule
