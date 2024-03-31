module latch_D_on_board(input [1:0] SW, 
								output [0:0] LEDR);
								
	latch_D latch0(SW[0], SW[1], LEDR[0]);
	
endmodule
