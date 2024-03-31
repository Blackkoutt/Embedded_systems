module adder_A_B_8_bits_decoders_on_board(input [7:0] SW, 
														input [1:0] KEY,
														output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
														output [0:0] LEDR);
														
	adder_A_B_8_bits_decoders add_with_dec(SW[7:0], KEY[1], KEY[0],
														HEX0[0:6], HEX1[0:6], HEX2[0:6],
														HEX3[0:6], HEX4[0:6], HEX5[0:6], LEDR[0]);
														
endmodule
