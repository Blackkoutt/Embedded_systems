module adder_A_B_8_bits_decoders(input [7:0] A_or_B,
											input clk, areset,
											output [0:6] H0, H1, H2, H3, H4, H5,
											output cout);
	
	wire [7:0] reg_out, sum /*synthesis keep*/;
   adder_A_B_8_bits add_with_reg(A_or_B[7:0], areset, clk, reg_out[7:0], sum[7:0], cout);
		
	decoder_hex_16 dec_A_or_B1(A_or_B[7:4], H1[0:6]);
	decoder_hex_16 dec_A_or_B0(A_or_B[3:0], H0[0:6]);
	
	decoder_hex_16 dec_REG1(reg_out[7:4], H3[0:6]);
	decoder_hex_16 dec_REG0(reg_out[3:0], H2[0:6]);
	
	decoder_hex_16 dec_sum1(sum[7:4], H5[0:6]);
	decoder_hex_16 dec_sum0(sum[3:0], H4[0:6]);

endmodule
	
											