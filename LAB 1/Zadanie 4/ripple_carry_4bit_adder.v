module ripple_carry_4bit_adder(
	input cin,
	input wire [3:0] A,B,
	output wire[3:0] S, 
	output cout);
	
	wire [2:0] temp_cout;
	
	adder_1bit_assign ex0(A[0], B[0], cin, S[0], temp_cout[0]);
	adder_1bit_assign ex1(A[1], B[1], temp_cout[0], S[1], temp_cout[1]);
	adder_1bit_assign ex2(A[2], B[2], temp_cout[1], S[2], temp_cout[2]);
	adder_1bit_assign ex3(A[3], B[3], temp_cout[2], S[3], cout);
	
endmodule
