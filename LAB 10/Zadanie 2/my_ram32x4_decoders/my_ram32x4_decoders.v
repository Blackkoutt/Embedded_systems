module my_ram32x4_decoders(input [4:0] address,
									input clk,	
									input [3:0] data,
									input wren,
									output [0:6] H5_addr_1, H4_addr_0,
													 H2_data_in, H0_q_out);
									
	wire [3:0] q;
	
	my_ram32x4 ram(address, clk, data, wren, q);
	
	decoder_hex_16 dec_addr1({3'b000, address[4]}, H5_addr_1[0:6]);
	decoder_hex_16 dec_addr0(address[3:0], H4_addr_0[0:6]);
	decoder_hex_16 dec_data_in(data[3:0], H2_data_in[0:6]);
	decoder_hex_16 dec_out(q[3:0], H0_q_out[0:6]);
	
endmodule
