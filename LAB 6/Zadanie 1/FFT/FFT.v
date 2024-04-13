module FFT(input T, clk, aclr, 
				output reg Q);
		
	always @(posedge clk, negedge aclr)
		if(!aclr)  Q<=1'b0;
		else if(T) Q<=~Q;
		else 		  Q<=Q;
		
endmodule
