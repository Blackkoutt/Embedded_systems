module detector_with_shift_reg_on_board(input [1:0] SW,
													 input [0:0] KEY,
													 output [0:0] LEDR);
													 
	detector_with_shift_reg detector_reg(.clk(~KEY[0]), .aclr(SW[1]), .w(SW[0]), .z(LEDR[0]));
	
endmodule
