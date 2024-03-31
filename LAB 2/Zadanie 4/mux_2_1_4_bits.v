module mux_2_1_4_bits(
	input [3:0] X, Y,
	input s,
	output [3:0] M);
	
	mux_2_1_1_bit mux1(X[0], Y[0], s, M[0]);
	mux_2_1_1_bit mux2(X[1], Y[1], s, M[1]);
	mux_2_1_1_bit mux3(X[2], Y[2], s, M[2]);
	mux_2_1_1_bit mux4(X[3], Y[3], s, M[3]);
	
endmodule
	