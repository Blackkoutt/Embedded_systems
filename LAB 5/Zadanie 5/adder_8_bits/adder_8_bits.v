module adder_8_bits(input [7:0] reg_val, A_or_B,
							output cout,
							output [7:0] S);
							
	assign {cout, S} = reg_val + A_or_B;
	
endmodule
