module accum_N_bits_add_sub_decoders(input [7:0] A, 
												input clk, aclr, add_sub,
												output [7:0] S,
												output carry,
												output overflow, 
												output [0:6] H0, H1, H2, H3);
	
	 wire [7:0] A_reg_out, acc_s;
	 accum_N_bits_add_sub #(8) accumulator(A, clk, aclr, add_sub, A_reg_out, acc_s, carry, overflow);
	 
	 assign S = acc_s;
	 
	 wire [11:0] A_reg_out_BCD, S_BCD;
	 
	 bcd_converter_8_bits conv_A(A_reg_out, A_reg_out_BCD);
	 bcd_converter_8_bits conv_S(acc_s, S_BCD);
	 
	 decoder_hex_10 dec_A_0(A_reg_out_BCD[3:0], H2[0:6]);
	 decoder_hex_10 dec_A_1(A_reg_out_BCD[7:4], H3[0:6]);
	 
	 decoder_hex_10 dec_S_0(S_BCD[3:0], H0[0:6]);
	 decoder_hex_10 dec_S_1(S_BCD[7:4], H1[0:6]);
	 
endmodule
