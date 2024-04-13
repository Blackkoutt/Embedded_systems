module counter_16_bits_decoders_on_board(input [0:0] KEY, 
													  input [1:0] SW,
													  output [0:6] HEX0, HEX1, HEX2, HEX3);
	
	counter_16_bits_decoders counter_16b_dec(KEY[0], SW[0], SW[1], HEX0[0:6], HEX1[0:6], HEX2[0:6], HEX3[0:6]);

endmodule

											