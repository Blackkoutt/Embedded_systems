module multiplier_N_bits_with_reg_decoders(input [7:0] data,
														 input clk, aclr, EA, EB,
														 output [7:0] reg_out_A_B_leds,
														 output [0:6] H0, H1, H2, H3);
	wire [15:0] P;													 
	multiplier_N_bits_with_reg #(8) multiplier(data, clk, aclr, EA, EB, P, reg_out_A_B_leds);
	
	wire [19:0] P_bcd;
	bcd_converter_16_bits bcd_converter(P, P_bcd);
	
	decoder_hex_10 dec0(P_bcd[3:0], H0[0:6]);
	decoder_hex_10 dec1(P_bcd[7:4], H1[0:6]);
	decoder_hex_10 dec2(P_bcd[11:8], H2[0:6]);
	decoder_hex_10 dec3(P_bcd[15:12], H3[0:6]);

endmodule
