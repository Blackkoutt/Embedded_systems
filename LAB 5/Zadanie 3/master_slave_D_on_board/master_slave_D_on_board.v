module master_slave_D_on_board(input [1:0] SW, 
				output [0:0] LEDR);
				
		master_slave_D M_S_D(SW[0], SW[1], LEDR[0]);
		
endmodule
