module array_multiplier_4_bits_decoders(input [3:0] A, B,
													output [0:6] H0, H2, H4, H5);
	
	wire [7:0] P;
 	
	array_multiplier_4_bits multiplier(A, B, P);
	
	decoder_hex_10 dec_A(A, H2);
	decoder_hex_10 dec_B(B, H0);
	
	wire [11:0] bcd_P;
	
	bcd_converter_8_bits converter(P, bcd_P);
	
	decoder_hex_10 dec_P0(P[3:0], H4);
	decoder_hex_10 dec_P1(P[7:4], H5);
	
endmodule
