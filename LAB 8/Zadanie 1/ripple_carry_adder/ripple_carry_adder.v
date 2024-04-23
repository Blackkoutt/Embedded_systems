module ripple_carry_adder #(parameter N=4)
									(input [N-1:0] A, B,
									 input cin,
									 output carry,
									 output [N-1:0] S);
	
	wire [N-2:0] c;
	generate
	
		genvar i;
		
		for(i=0;i<N;i=i+1) begin: add
			case(i)
			
				0: 		full_adder FA(A[i], B[i], cin, S[i], c[i]); // opis pierwszego bloku
				N-1: 		full_adder FA(A[i], B[i], c[i-1], S[i], carry);	// opis n-tego bloku
				default: full_adder FA(A[i], B[i], c[i-1], S[i], c[i]);	// opis i-tego bloku
			
			endcase			
		end
		
	endgenerate
	
endmodule

			