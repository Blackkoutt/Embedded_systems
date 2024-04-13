module counter_16_bits_decoders(input clk, aclr, enable,
											output [0:6] H0, H1, H2, H3);
											
	wire [15:0] counter_out, Q;
	counter_16_bits counter0(clk, aclr, enable, counter_out[15:0]);
	convert_to_bcd conv0(counter_out[15:0], Q[15:0]);
	
	decoder_hex_10 dec3(Q[15:12], H3[0:6]);
	decoder_hex_10 dec2(Q[11:8], H2[0:6]);
	decoder_hex_10 dec1(Q[7:4], H1[0:6]);
	decoder_hex_10 dec0(Q[3:0], H0[0:6]);
	
endmodule
