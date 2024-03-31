module latch_FDDP_FDDN_on_board(input [1:0]SW,
											output [2:0] LEDR);
											
		latch_FDDP_FDDN latch_FDDP_FDDN0(SW[0], SW[1], LEDR[0], LEDR[1], LEDR[2]);
		
endmodule
