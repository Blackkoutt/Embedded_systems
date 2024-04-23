module accum_N_bits_add_sub #(parameter N=8)
										(input [N-1:0] A,
										 input clk, aclr, add_sub,
										 output [N-1:0] A_reg_out, S, 
										 output reg carry,
										 output reg overflow);
				
	wire [N-1:0] A_reg_out_wire;
	reg_N_bits_with_areset #(N) reg_A(clk, aclr, A, A_reg_out_wire);
	
	assign A_reg_out = A_reg_out_wire;
	
	wire cout;
	wire [N-1:0] sum_sub_A_S;
	
	ripple_carry_adder_subtractor #(N) RCAS(S, A_reg_out_wire, add_sub, sum_sub_A_S, cout);
	reg_N_bits_with_areset #(N) reg_S(clk, aclr, sum_sub_A_S, S);
	
	wire of_flag;
   logic_circuit_add_sub check_overflow(A_reg_out_wire[N-1], S[N-1], sum_sub_A_S[N-1], add_sub, of_flag);
	
	always @(posedge clk, posedge aclr)
		if(aclr) begin
			carry <= 0;
			overflow <= 0;
		end
		else begin
			carry <= add_sub ^ cout;
			overflow <= of_flag;
		end

endmodule

	