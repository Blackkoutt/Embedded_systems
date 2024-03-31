module FDD_negedge(input D, clk, 
							output reg Q);
							
	always @(negedge clk)
		Q <= D;
		
endmodule
