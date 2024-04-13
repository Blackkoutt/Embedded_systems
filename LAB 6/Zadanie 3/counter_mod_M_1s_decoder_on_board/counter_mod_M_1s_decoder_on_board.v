module counter_mod_M_1s_decoder_on_board(input CLOCK_50,
													  output [0:6] HEX0);

	counter_mod_M_1s_decoder counter_mod_M_1s_dec0(CLOCK_50, HEX0[0:6]);

endmodule
