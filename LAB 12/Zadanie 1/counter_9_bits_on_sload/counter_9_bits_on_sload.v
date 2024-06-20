module counter_9_bits_on_sload(input areset, enable, sload, clk,
										input [8:0] data,
										output reg [8:0] Q);
									
	initial Q = {8{1'b0}};
	always @(posedge clk, negedge areset)
		if(~areset) Q = {8{1'b0}};
		else if (sload) Q <= data;
		else if (enable) Q <= Q + 1'b1;
		else Q <= Q;
	
endmodule
