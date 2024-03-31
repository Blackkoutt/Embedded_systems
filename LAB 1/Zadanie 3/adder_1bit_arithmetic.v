module adder_1bit_arithmetic(
	input a, b, cin, 
	output cout, s);
	
	assign {cout, s} = a + b + cin;
	
endmodule
