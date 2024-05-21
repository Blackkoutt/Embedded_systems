module proc_with_ROM_on_board(input [9:0] SW,
										input [1:0] KEY,
										output [9:0] LEDR);
										
	proc_with_ROM processor_ROM(.MClock(~KEY[0]), .PClock(~KEY[1]), .Resetn(SW[0]), .Run(SW[9]),
										 .Bus(LEDR[8:0]), .Done(LEDR[9]));
										 
endmodule

