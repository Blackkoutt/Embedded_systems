module adder_BCD_2_digits_on_board(input [8:0] SW,
											  output [0:6] HEX0, HEX1, HEX3, HEX5,
											  output [9:0] LEDR);
											 
	adder_BCD_2_digits add0(SW[7:4], SW[3:0], SW[8], HEX5[0:6], HEX3[0:6], HEX0[0:6], HEX1[0:6], LEDR[7:0], LEDR[9]);
	
endmodule
	