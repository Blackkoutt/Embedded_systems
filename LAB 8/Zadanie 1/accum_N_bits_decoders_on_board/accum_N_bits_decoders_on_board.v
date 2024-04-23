module accum_N_bits_decoders_on_board(input [7:0] SW,
												  input [1:0] KEY,
												  output [9:0] LEDR,
												  output [0:6] HEX0, HEX1, HEX2, HEX3);
												  
	accum_N_bits_decoders accum_dec(.A(SW[7:0]), .clk(~KEY[1]), .aclr(~KEY[0]),
											  .S(LEDR[7:0]), .carry(LEDR[8]), .overflow(LEDR[9]),
											  .H0(HEX0[0:6]), .H1(HEX1[0:6]), .H2(HEX2[0:6]),
											  .H3(HEX3[0:6]));
											  
endmodule
