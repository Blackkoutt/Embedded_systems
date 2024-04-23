module array_multiplier_4_bits_decoders_on_board(input [7:0] SW, 
																 output [0:6] HEX0, HEX2, HEX4, HEX5);
																 
	array_multiplier_4_bits_decoders multiplier_dec(.A(SW[7:4]), .B(SW[3:0]),
																	.H0(HEX0[0:6]), .H2(HEX2[0:6]),
																	.H4(HEX4[0:6]), .H5(HEX5[0:6]));
																	
endmodule
