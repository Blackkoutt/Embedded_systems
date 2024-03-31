module RS_boolean_on_board(input [3:0] SW,
									output [0:0] LEDR);
									
	RS_boolean rs_latch(SW[2], SW[1], SW[0], LEDR[0]);
	
endmodule
