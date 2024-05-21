module proc_on_board(input [9:0] SW,
							input [1:0] KEY,
							output [9:0] LEDR);
							
	proc processor(.DIN(SW[8:0]), .Resetn(~KEY[0]), .Clock(~KEY[1]),
						.Run(SW[9]), .Done(LEDR[9]), .BusWires(LEDR[8:0]));
	
endmodule
