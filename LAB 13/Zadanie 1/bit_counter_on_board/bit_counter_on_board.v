module bit_counter_on_board (input [9:0] SW,
									 input CLOCK_50,
									 input [0:0] KEY,
									 output [0:6] HEX0,
									 output [9:0] LEDR);

	bit_counter_decoder bit_cnt_dec(.in(SW[7:0]), .clk(CLOCK_50), .sclr(~KEY[0]), .Run(SW[9]), .H0(HEX0[0:6]), .Done(LEDR[9]));

endmodule
