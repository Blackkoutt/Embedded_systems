module adder_BCD_2_digits(input [3:0] X, Y,
								  input cin,
								  output [0:6] H5, H3, S0, S1,
								  output [7:0] leds,
								  output error);
	
	
	SW_to_LEDR#(8) sw_to_led({X,Y}, leds[7:0]);
	
	input_error_check check0(X[3:0], Y[3:0], error);
	
	wire [4:0] sum_binary;
	adder_4bit add0(X[3:0], Y[3:0], cin, sum_binary[4:0]);
	
	wire z;
	comparator#(5) comp0(sum_binary[4:0], 5'd9, z);
	
	wire [3:0] sum_bcd_0 = sum_binary[3:0];
	
	wire [3:0] sum_bcd_1;
	binary_to_bcd_converter conv0(sum_binary[4:0], sum_bcd_1[3:0]);
	
	wire [3:0] mux_out;
	mux_2_1_4_bits mux0(sum_bcd_0[3:0],  sum_bcd_1[3:0], z, mux_out[3:0]);
	
	decoder_hex_10 dec0(mux_out[3:0], S0[0:6]);
	decoder_hex_10 dec1({3'b000, z}, S1[0:6]);
	decoder_hex_10 dec2(X[3:0], H5[0:6]);
	decoder_hex_10 dec3(Y[3:0], H3[0:6]);
	
	
endmodule

	
	
	
	
	
	

	
	
	
	
	
	