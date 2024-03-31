module binary_to_hex_on_board (input [7:0] SW,
											output [0:6] HEX1, HEX0);
										
	binary_to_hex dec_binary(SW[7:4], SW[3:0], HEX1[0:6], HEX0[0:6]);
	
endmodule
