module latch_FDDP_FDDN(input D, clk, 
								output Qa, Qb, Qc);
								
								
	D_latch latchD(D, clk, Qa);
	FDD_posedge FDDP(D, clk, Qb);
	FDD_negedge FDDN(D, clk, Qc);
	
endmodule
