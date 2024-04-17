module real_time_clock_decoders_on_board(input CLOCK_50, 
														input [3:0] KEY, 
														input [7:0] SW, 
														output [0:6] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
														
	real_time_clock_decoders rtc_dec(CLOCK_50, KEY[0], ~KEY[1], ~KEY[2], ~KEY[3], SW[7:0],
												HEX5[0:6], HEX4[0:6], HEX3[0:6], HEX2[0:6], HEX1[0:6], HEX0[0:6]);
											
endmodule
