module adder_BCD_2_digits(input [3:0] x, y,
									input cin,
									output [3:0] s0, s1,
									output error);
								
	wire x_greater, y_greater;
	comparator#(4) comp0(x[3:0], 4'd9, x_greater);
	comparator#(4) comp1(y[3:0], 4'd9, y_greater);
	assign error = x_greater | y_greater;
	
	wire [4:0] sum_5_bits = {1'b0, x} + {1'b0, y} + {3'b000, cin};

	binary_5_bits_to_bcd_converter conv0(sum_5_bits[4:0], s1[3:0], s0[3:0]);
	
endmodule
