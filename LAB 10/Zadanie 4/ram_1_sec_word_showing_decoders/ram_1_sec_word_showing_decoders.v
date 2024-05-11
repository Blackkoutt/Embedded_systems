module ram_1_sec_word_showing_decoders(input clk,
													input [4:0] write_addr,
													input [3:0] data,
													input write_ena, reset,
													output [0:6] H0_q_out, H1_data_in, H2_read_addr_0, H3_read_addr_1,
																	H4_write_addr_0, H5_write_addr_1);
													
	wire [4:0] read_addr;
	wire [3:0] q;
	
	ram_1_sec_word_showing ram(clk, write_addr, data, write_ena, reset, read_addr, q);
	
	decoder_hex_16 dec_q(q, H0_q_out[0:6]);
	decoder_hex_16 dec_data(data, H1_data_in[0:6]);
	decoder_hex_16 dec_read_addr1({3'b000, read_addr[4]}, H3_read_addr_1[0:6]);
	decoder_hex_16 dec_read_addr0(read_addr[3:0], H2_read_addr_0[0:6]);
	decoder_hex_16 dec_write_addr1({3'b000, write_addr[4]}, H5_write_addr_1[0:6]);
	decoder_hex_16 dec_write_addr0(write_addr[3:0], H4_write_addr_0[0:6]);

endmodule
