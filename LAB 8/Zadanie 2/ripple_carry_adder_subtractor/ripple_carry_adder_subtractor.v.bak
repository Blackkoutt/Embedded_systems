module ripple_carry_adder_subtractor #(parameter N=4)
													(input [N-1:0] A, B,
													input sub,													
													output [N-1:0] S,
													output cout);
													
	wire [N-1:0] c;
	generate
	
		genvar i;
		
		for(i=0; i<N; i=i+1) begin:add_or_sub
		
			case(i)
				0: 		full_adder FA(A[i], sub ^ B[i], sub, S[i], c[i]); // opis pierwszego bloku
				N-1: 		full_adder FA(A[i], sub ^ B[i], c[i-1], S[i], cout);	// opis n-tego bloku
				default: full_adder FA(A[i], sub ^ B[i], c[i-1], S[i], c[i]);	// opis i-tego bloku
			endcase
			
		end
		
	endgenerate
	
endmodule
