module FSM_one_hot_on_board(input [1:0] SW, 
									 input [0:0] KEY, 
									 output [9:0] LEDR);
						 
	FSM_one_hot FSM(.clk(~KEY[0]), .aclr(SW[0]), .w(SW[1]),
								.z(LEDR[9]), .y(LEDR[8:0]));

endmodule
