module FSM_user_coding_1_process_on_board(input [1:0] SW, 
									 input [0:0] KEY, 
									 output [4:0] LEDR);
						 
	FSM_user_coding_1_process FSM(.clk(~KEY[0]), .aclr(SW[0]), .w(SW[1]),
								.z(LEDR[4]), .y(LEDR[3:0]));

endmodule
