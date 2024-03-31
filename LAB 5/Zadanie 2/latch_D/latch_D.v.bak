module latch_D(input D, clk,
					output Q);

	wire S, R, S_g, R_g, Qa, Qb;
	
	assign R=~D;
	assign S =D;
	assign S_g = ~(S & clk);
	assign R_g = ~(R & clk);
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(R_g & Qa);
	
	assign Q = Qa;
	
endmodule
