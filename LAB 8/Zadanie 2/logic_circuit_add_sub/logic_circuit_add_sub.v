module logic_circuit_add_sub (input A, S, sum_sub_A_S, add_or_sub,
						    output overflow);
							 
	assign overflow = (A & S & ~sum_sub_A_S & ~add_or_sub) |
							(~A & S & ~sum_sub_A_S & add_or_sub) | 	
							(~A & ~S & sum_sub_A_S & ~add_or_sub) | 
							(A & ~S & sum_sub_A_S & add_or_sub);

endmodule
