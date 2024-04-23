module multiplier_N_bits #(parameter N=8)
									(input [N-1:0] A, B,
									 output [N*2-1:0] P);
									 
	wire [N-1:0] PP[N-1:0]; // cząstkowe iloczyny
	wire [N-1:0] s[N-1:1]; // czątkowe sumy
	wire cout[N-1:0];	// przeniesienia
	
	genvar i;
	
	// tworzenie cząstkowych iloczynów
	generate 
	
		for(i=0; i<N; i= i+1) begin: bl1
		
			assign PP[i] = A & {N{B[i]}};
			
		end
		
	endgenerate
	
	// tworzenie cząstkowych iloczynów
	ripple_carry_adder #(N) adder_0({1'b0, PP[0][N-1:1]}, PP[1], 1'b0, cout[1], s[1]);
	generate 
	
		for(i=2; i<N; i= i+1) begin: bl2
		
			ripple_carry_adder #(N) adder_i({cout[i-1], s[i-1][N-1:1]}, PP[i], 1'b0, cout[i], s[i]);
			
		end
		
	endgenerate
	
	// tworzenie rezultatu
	assign P[0] = PP[0][0];
	generate 
	
		for(i=1; i<N-1; i=i+1) begin: bl3
		
			assign P[i] = s[i][0];
			
		end
		
	endgenerate
	
	assign P[2*N-2:N-1] = s[N-1];
	assign P[2*N-1] = cout[N-1];
	
endmodule