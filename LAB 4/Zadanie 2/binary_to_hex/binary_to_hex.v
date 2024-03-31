module binary_to_hex(input [3:0] b1, b0,
			            output [0:6] H1, H0);
					
	decoder_hex_16 dec0(b0[3:0], H0[0:6]);
	decoder_hex_16 dec1(b1[3:0], H1[0:6]);
		
endmodule
