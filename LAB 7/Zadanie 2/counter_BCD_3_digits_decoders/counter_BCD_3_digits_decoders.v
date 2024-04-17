module counter_BCD_3_digits_decoders(input clk, aclr,
												 output [0:6] H2, H1, H0,
												 output max_val_led);
	
		wire [11:0] counter_out;
		counter_BCD_3_digits counter(clk, aclr, counter_out[11:0], max_val_led);
		
		decoder_hex_10 dec0(counter_out[3:0], H0[0:6]);
		decoder_hex_10 dec1(counter_out[7:4], H1[0:6]);
		decoder_hex_10 dec2(counter_out[11:8], H2[0:6]);
	
endmodule
