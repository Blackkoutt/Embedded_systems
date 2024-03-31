module binary_BCD_4_bits(input [3:0] V, 
									output [0:6] d1, d0);
									
	wire z;
	comparator#(4) comp0(V[3:0], 4'd9, z);
	
	wire [3:0] A, mux_out;
	circuit_a#(4) circuit_A(V[3:0], 4'd10, A[3:0]);
	mux_2_1_4_bits mux0(V[3:0], A[3:0], z, mux_out[3:0]);
	
	decoder_hex_10 dec0(mux_out[3:0], d0[0:6]);
	decoder_hex_10 dec1({3'b000, z}, d1[0:6]);
	
endmodule

	