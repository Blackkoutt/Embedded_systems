module bcd_to_digit(input [3:0] a1, a0,
							output [1:0] error,
							output [7:0] leds,
							output [0:6] a1_out, a0_out);
	
	SW_to_LEDR#(8) SW_to_led({a1,a0}, leds[7:0]);
	
	decoder_hex_10 dec0(a0[3:0], a0_out[0:6]);	
	decoder_error_check check0(a0_out[0:6], error[0]);
	
	decoder_hex_10 dec1(a1[3:0], a1_out[0:6]);
	decoder_error_check check1(a1_out[0:6], error[1]);
		
endmodule 