module SW_to_LEDR #(parameter N=9)(SW, LEDR);
	input [N-1:0] SW;
	output [N-1:0] LEDR;
	
	assign LEDR = SW;
	
endmodule
