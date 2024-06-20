module binary_search(input [7:0] A, 
							input Start, Reset, Clock,
							output [4:0] L, ADDR,
							output Found, Less_Or_Greather, Write, 
							output [1:0] Done,
							output [7:0] memory_out);
							
	wire Done1/*, Write*/;
	wire [4:0] M;
	wire [7:0] A_out, DataIn; 
	
	Control control(.A(A), .Clock(Clock), .Start(Start),
						 .aReset(Reset), .Found(Found),
						 .Less_Or_Greather(Less_Or_Greather),
						 .M(M), .A_out(A_out), .Done(Done1), .state(Done));
						 
	DataPath data_path(.clk(Clock), .mem_out(memory_out), .A(A_out), 
				.search_ADDR(M), .Address(ADDR), .L(L),
				.Found(Found), .Less_Or_Greather(Less_Or_Greather));
				
	Memory32x8 memory(.Address(ADDR), .DataIn(DataIn), .Write(Write), .Clock(Clock),
						.DataOut(memory_out));
						
endmodule
