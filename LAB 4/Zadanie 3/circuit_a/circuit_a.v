module circuit_a #(parameter N=4)
						(input [N-1:0] V,
						input [N-1:0] val,
						output reg [N-1:0] A);
	
	always @(*) begin
		A = V - val;
	end

endmodule

	
