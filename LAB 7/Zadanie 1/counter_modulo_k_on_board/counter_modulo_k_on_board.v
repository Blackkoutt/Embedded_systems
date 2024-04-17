module counter_modulo_k_on_board (input [2:0] KEY,
											  output [9:0] LEDR);
											  
	counter_modulo_k#(20) count0(~KEY[0], ~KEY[1], ~KEY[2], LEDR[4:0], LEDR[9]);
	
endmodule
