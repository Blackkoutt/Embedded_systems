module choose_from_4_symbols (input [9:0] SW,
										output [0:6] HEX0,
										output [9:0] LEDR);
										
		SW_to_LEDR sw_to_led(SW[9:0], LEDR[9:0]);
		wire [1:0] mux_out;
		mux_4_1_2_bits mux0(SW[7:6], SW[5:4], SW[3:2], SW[1:0], SW[9:8], mux_out[1:0]);
		decoder_7_seg dec0(mux_out[1:0], HEX0[0:6]);
		
endmodule
