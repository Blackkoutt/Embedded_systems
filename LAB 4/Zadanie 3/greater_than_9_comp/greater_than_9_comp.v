module comparator #(parameter N=4)
					(input [N-1:0] V,
					input [N-1:0] val,
					output reg z);
									
	always @(*) begin
		if(V > val)
			z = 1'b1;
		else
			z = 1'b0;
	end
	
endmodule
