module my_ram32x4_decoders_on_board(input [9:0] SW,
												input [0:0] KEY,
												output [0:6] HEX0, HEX2, HEX4, HEX5);

	my_ram32x4_decoders ram_dec(.address(SW[8:4]), .clk(~KEY[0]), .data(SW[3:0]), .wren(SW[9]),
										.H5_addr_1(HEX5[0:6]), .H4_addr_0(HEX4[0:6]), .H2_data_in(HEX2[0:6]), .H0_q_out(HEX0[0:6]));
										
endmodule
