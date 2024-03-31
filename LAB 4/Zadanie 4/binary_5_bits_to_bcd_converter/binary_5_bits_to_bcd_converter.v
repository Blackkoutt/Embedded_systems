module binary_5_bits_to_bcd_converter(input [4:0] binary_val,
													output [3:0] bcd_val_1, bcd_val_0);
			
	wire z;
	comparator#(5) comp0(binary_val[4:0], 5'd9, z);
	
	wire [3:0] binary_val_minus_10;
	circuit_a#(5) circuit_A(binary_val[4:0], 5'd10, binary_val_minus_10);

	mux_2_1_4_bits mux0(binary_val[4:0], binary_val_minus_10[3:0], z, bcd_val_0[3:0]);
	
	assign bcd_val_1 = {3'b000, z};
	
endmodule
	