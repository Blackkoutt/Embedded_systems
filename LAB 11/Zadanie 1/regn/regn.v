module regn #(parameter N = 9)
				(input [N-1:0] R,
				input ena, clk,
				output reg [N-1:0] Q);

	always @(posedge clk)
		if (ena) Q <= R;
		else Q <= Q;
			
endmodule
