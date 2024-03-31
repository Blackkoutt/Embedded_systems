module FDD_posedge(input D, clk,
						output reg Q);
	
	always @(posedge clk)
		Q <= D;
		
endmodule
