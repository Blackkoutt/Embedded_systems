module processor_2_with_RAM_on_board (input [9:9] SW,
												  input [0:0] KEY,
												  input CLOCK_50,
												  output [8:0] LEDR);
												  
	processor_2_with_RAM proc(KEY[0], CLOCK_50, SW[9], LEDR);
	
endmodule
