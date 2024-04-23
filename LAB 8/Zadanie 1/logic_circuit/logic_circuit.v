module logic_circuit (input A, S, sum_A_S,
						    output overflow);
							 
	assign overflow = ((~A) & (~S) & sum_A_S) | (A & S & (~sum_A_S));

endmodule
