module D_latch (input D, Clk, 
					 output reg Q);
					
	always @ (D, Clk)
	if (Clk)
		Q = D;
	
endmodule
