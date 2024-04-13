module shift_word_every_1s_decoder_on_board(input CLOCK_50,
															input [0:0] SW,
															output [0:6] HEX3, HEX2, HEX1, HEX0);
															
		shift_word_every_1s_decoder shift_1s_dec(CLOCK_50, SW[0], HEX3[0:6], HEX2[0:6], HEX1[0:6], HEX0[0:6]);
	
endmodule