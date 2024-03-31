module input_error_check(input [3:0] x, y,
								  output error);
								  
	wire x_greater, y_greater;
	
	comparator#(4) comp0(x[3:0], 4'd9, x_greater);
	comparator#(4) comp1(y[3:0], 4'd9, y_greater);
	
	assign error = x_greater | y_greater;
	
endmodule
