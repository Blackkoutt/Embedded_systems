module adder_1bit_primitives(
	input a, b, cin,
	output s, cout);
	
	wire g1_out, g2_out, g3_out;	// wyjścia z bramek pośrednich
	
	// definicja bramek
	xor g1 (g1_out, a, b);
	and g2 (g2_out, a, b);
	and g3 (g3_out, g1_out, cin);
	or g4 (cout, g2_out, g3_out);
	xor g5 (s, g1_out, cin);
	
endmodule
