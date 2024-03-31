module master_slave_D(input D, clk, 
			output Q);

	wire Qm, Qs /*synthesis keep*/;
	
	latch_D master(D, ~clk, Qm);
	latch_D slave(Qm, clk, Qs);
	
	assign Q = Qs;
	
endmodule
