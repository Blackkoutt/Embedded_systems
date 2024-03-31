module binary_BCD_4_bits_on_board(
											input [3:0] SW,
											output [0:6] HEX1, HEX0);
		 
		 binary_BCD_4_bits BCD_4_bit(SW[3:0], HEX1[0:6], HEX0[0:6]);
		 
endmodule
