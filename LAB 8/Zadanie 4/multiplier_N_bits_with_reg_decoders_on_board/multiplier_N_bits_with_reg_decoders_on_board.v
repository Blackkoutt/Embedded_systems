	module multiplier_N_bits_with_reg_decoders_on_board(input [9:0] SW, 
																	 input [1:0] KEY,
																	 output [7:0] LEDR,
																	 output [0:6] HEX0, HEX1, HEX2, HEX3);
																	 
	multiplier_N_bits_with_reg_decoders multiplier_decoders(.data(SW[7:0]), .clk(~KEY[1]), .aclr(~KEY[0]), 
																				.EA(SW[9]), .EB(SW[8]), .reg_out_A_B_leds(LEDR[7:0]),
																				.H0(HEX0[0:6]), .H1(HEX1[0:6]), .H2(HEX2[0:6]), .H3(HEX3[0:6]));
																				
endmodule