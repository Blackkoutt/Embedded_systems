module array_multiplier_4_bits(input [3:0] A, B, 
									    output [7:0] P);

	wire AB [3:0][3:0];
	generate 
		
			genvar i, j;
			
			for(i=0; i<=3; i=i+1) begin: first	
				for(j=0; j<=3; j=j+1) begin: second
				
					assign AB[i][j] = A[i] & B[j];
					
				end
			end
			
	endgenerate
	
	wire [11:0] cout, s;
	
	full_adder FA0(AB[1][0], AB[0][1], 1'b0, s[0], cout[0]);
	full_adder FA1(AB[2][0], AB[1][1], cout[0], s[1], cout[1]);
	full_adder FA2(AB[3][0], AB[2][1], cout[1], s[2], cout[2]);
	full_adder FA3(1'b0, AB[3][1], cout[2], s[3], cout[3]);
	
	full_adder FA4(s[1], AB[0][2], 1'b0, s[4], cout[4]);
	full_adder FA5(s[2], AB[1][2], cout[4], s[5], cout[5]);
	full_adder FA6(s[3], AB[2][2], cout[5], s[6], cout[6]);
	full_adder FA7(cout[3], AB[3][2], cout[6], s[7], cout[7]);
	
	full_adder FA8(s[5], AB[0][3], 1'b0, s[8], cout[8]);
	full_adder FA9(s[6], AB[1][3], cout[8], s[9], cout[9]);
	full_adder FA10(s[7], AB[2][3], cout[9], s[10], cout[10]);
	full_adder FA11(cout[7], AB[3][3], cout[10], s[11], cout[11]);

	assign P[0] = AB[0][0];
	assign P[1] = s[0];
	assign P[2] = s[4];
	assign P[3] = s[8];
	assign P[4] = s[9];
	assign P[5] = s[10];
	assign P[6] = s[11];
	assign P[7] = cout[11];
	
endmodule
