module ripple_carry_4bit_adder_on_board( 
	input [9:0] SW,
	output [9:0] LEDR);
	
	ripple_carry_4bit_adder ex(SW[9], SW[3:0], SW[7:4], LEDR[3:0], LEDR[9]);

endmodule
