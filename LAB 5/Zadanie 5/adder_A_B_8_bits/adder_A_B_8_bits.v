module adder_A_B_8_bits(input [7:0] A_or_B,
								input  areset, clk,
								output [7:0] reg_out, sum,
								output cout);
								
	reg_N_bits_with_areset#(8) reg0(clk, areset, A_or_B[7:0], reg_out[7:0]);
	
	adder_8_bits add0(reg_out[7:0], A_or_B[7:0], cout, sum[7:0]);
	
endmodule
	
	