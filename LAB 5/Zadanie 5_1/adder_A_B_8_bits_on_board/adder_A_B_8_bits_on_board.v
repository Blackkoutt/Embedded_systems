module adder_A_B_8_bits_on_board(input [8:0] SW,
											input [1:0] KEY,
											output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
											output [0:0] LEDR);
											
	wire [7:0] reg_out, sum /* synthesis keep */;
   adder_A_B_8_bits add_with_reg(SW[7:0], KEY[1], KEY[0], reg_out[7:0], sum[7:0], LEDR[0]);
		
	decoder_hex_16 dec_A_or_B1(SW[7:4], HEX1[0:6]);
	decoder_hex_16 dec_A_or_B0(SW[3:0], HEX0[0:6]);
	
	decoder_hex_16 dec_REG1(reg_out[7:4], HEX3[0:6]);
	decoder_hex_16 dec_REG0(reg_out[3:0], HEX2[0:6]);
	
	decoder_hex_16 dec_sum1(sum[7:4], HEX5[0:6]);
	decoder_hex_16 dec_sum0(sum[3:0], HEX4[0:6]);
	
endmodule