module bcd_to_digit_on_board(input [7:0] SW,
										output [0:6] HEX1, HEX0,
										output [9:0] LEDR);
										
	bcd_to_digit dec_bcd(SW[7:4], SW[3:0], LEDR[9:8], LEDR[7:0], HEX1[0:6], HEX0[0:6]);
	
endmodule
