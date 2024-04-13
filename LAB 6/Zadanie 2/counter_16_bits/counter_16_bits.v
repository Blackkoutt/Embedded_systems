module counter_16_bits(input clk, aclr, enable,
								output [15:0] Q);
								
	counter_N_bits#(16) counter_16bit(clk, aclr, enable, Q[15:0]);
	
endmodule
