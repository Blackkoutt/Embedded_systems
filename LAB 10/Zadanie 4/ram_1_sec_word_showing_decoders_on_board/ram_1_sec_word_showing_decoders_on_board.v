module ram_1_sec_word_showing_decoders_on_board(input CLOCK_50,
																input [9:0] SW,
																input [0:0] KEY,
																output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	
	ram_1_sec_word_showing_decoders ram_dec(.clk(CLOCK_50), .write_addr(SW[8:4]), .data(SW[3:0]),
														 .write_ena(SW[9]), .reset(KEY[0]), .H0_q_out(HEX0[0:6]),
														 .H1_data_in(HEX1[0:6]), .H2_read_addr_0(HEX2[0:6]), 
														 .H3_read_addr_1(HEX3[0:6]), .H4_write_addr_0(HEX4[0:6]),
														 .H5_write_addr_1(HEX5[0:6]));
														
endmodule
