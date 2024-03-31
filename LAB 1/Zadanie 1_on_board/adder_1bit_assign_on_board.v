module adder_1bit_assign_on_board(
	input [0:2] SW,
	output [0:1] LEDR);
	
	adder_1bit_assign ex(SW[0], SW[1], SW[2], LEDR[0], LEDR[1]);
	
endmodule
