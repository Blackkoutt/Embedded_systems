module counter_T_4_bits_decoder_on_board(input [0:0] KEY,
													  input [1:0] SW, 
													  output [0:6] HEX0);
													  
	counter_T_4_bits_decoder counter_T_4bits_dec0(KEY[0], SW[0], SW[1], HEX0[0:6]);

endmodule
