module adder_4bit(input [3:0] X, Y,
							input cin,
							output [4:0] S);
						
	assign S = X + Y + cin;
	
endmodule
