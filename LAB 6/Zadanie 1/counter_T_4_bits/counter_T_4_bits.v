module counter_T_4_bits(input enable, clk, areset, 
								output [3:0] Q);
								
	wire [3:1] c;
	
	assign c[1] = Q[0] & enable;
	assign c[2] = Q[1] & c[1];
	assign c[3] = Q[2] & c[2];
	
	FFT ex0(enable, clk, areset, Q[0]);
	FFT ex1(c[1], clk, areset, Q[1]);
	FFT ex2(c[2], clk, areset, Q[2]);
	FFT ex3(c[3], clk, areset, Q[3]);
	
endmodule
