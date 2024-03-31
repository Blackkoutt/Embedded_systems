module adder_BCD_2_digits_decoder(input [3:0] X, Y,
												input cin,
												output [0:6] H5, H3, S0, S1,
												output [7:0] leds,
												output error);

	SW_to_LEDR#(8) sw_to_led({X,Y}, leds[7:0]);
	
	decoder_hex_10 dec0(X[3:0], H5[0:6]);
	decoder_hex_10 dec1(Y[3:0], H3[0:6]);
	
	wire [3:0] add_out0, add_out1;
	
	adder_BCD_2_digits(X[3:0], Y[3:0], cin, add_out0[3:0], add_out1[3:0], error);
	
	decoder_hex_10 dec2(add_out0[3:0], S0[0:6]);
	decoder_hex_10 dec3(add_out1[3:0], S1[0:6]);
	
endmodule
