module my_ram32x4_in_memory_decoders(input [4:0] address, 
									 input clk,
									 input [3:0] data,
									 input wren,
									 output [0:6] H5_addr_1, H4_addr_0, H2_data, H0_q_out);
									 
	wire [3:0] q;
	
	my_ram32x4_in_memory ram_in_mem(address, clk, data, wren, q);
	
	decoder_hex_16 dec_addr_1({3'b000, address[4]}, H5_addr_1[0:6]);
	decoder_hex_16 dec_addr_0(address[3:0], H4_addr_0[0:6]);
	decoder_hex_16 dec_data(data, H2_data[0:6]);
	decoder_hex_16 dec_q_out(q, H0_q_out[0:6]);
	
endmodule

	
	