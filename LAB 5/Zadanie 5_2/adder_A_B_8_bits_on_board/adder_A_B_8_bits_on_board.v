module adder_A_B_8_bits_on_board(
	input [7:0] SW, 
	input [1:0] KEY,
	output [0:6] HEX3, HEX2, HEX1, HEX0, HEX4, HEX5,
	output [0:0] LEDR);
	
	wire [7:0] A, S;
	wire cout;
	
	adder_A_B_8_bits adder(SW, ~KEY[0], ~KEY[1], A, cout, S);
	
	decoder_hex_16 A1(A[7:4], HEX3[0:6]);
	decoder_hex_16 A0(A[3:0], HEX2[0:6]);
	
	decoder_hex_16 B1(SW[7:4], HEX1[0:6]);
	decoder_hex_16 B0(SW[3:0], HEX0[0:6]);
	
	assign LEDR[0] = cout;
	
	decoder_hex_16 S1(S[7:4], HEX5[0:6]);
	decoder_hex_16 S0(S[3:0], HEX4[0:6]);
	
	
	
endmodule