module mux_4_1_2_bits(input [1:0] U, V, W, X,
							input [1:0] S,
							output [1:0] M);
								
		mux_4_1_1_bit mux0(U[0], V[0], W[0], X[0], S[1:0], M[0]);
		mux_4_1_1_bit mux1(U[1], V[1], W[1], X[1], S[1:0], M[1]);
		
endmodule
