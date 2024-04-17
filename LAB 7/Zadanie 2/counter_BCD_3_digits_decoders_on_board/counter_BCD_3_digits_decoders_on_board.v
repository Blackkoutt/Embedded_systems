module counter_BCD_3_digits_decoders_on_board(input CLOCK_50,
															 input [0:0] KEY, 
															 output [0:6] HEX2, HEX1, HEX0,
														    output [0:0] LEDR);
															 
	counter_BCD_3_digits_decoders counter_dec(CLOCK_50, KEY[0], HEX2[0:6], HEX1[0:6], HEX0[0:6], LEDR[0]);
	
endmodule
