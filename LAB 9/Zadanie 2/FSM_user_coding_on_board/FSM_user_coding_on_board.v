module FSM_user_coding_on_board (input [0:0] KEY,
								input [1:0] SW,
								output [4:0] LEDR);
								
	FSM_user_coding FSM(.clk(~KEY[0]), .aclr(SW[0]), .w(SW[1]),
								.z(LEDR[4]), .y(LEDR[3:0]));
	
endmodule
