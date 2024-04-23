module accum_N_bits #(parameter N=8)
							(input [N-1:0] A,
							 input clk, aclr,
							 output [N-1:0] A_reg_out, S, 
							 output reg carry,
							 output reg overflow);
	
	wire [N-1:0] A_reg_out_wire;
	reg_N_bits_with_areset #(N) reg_A(clk, aclr, A, A_reg_out_wire);
	
	assign A_reg_out = A_reg_out_wire;
	
	wire cout;
	wire [N-1:0] sum_A_S;
	
	//assign {cout, sum_A_S} = A_reg_out_wire + S;
	
	ripple_carry_adder #(N) RCA(S, A_reg_out_wire, 1'b0, cout, sum_A_S);
	reg_N_bits_with_areset #(N) reg_S(clk, aclr, sum_A_S, S);
	
	wire of_flag;
   logic_circuit check_overflow(A_reg_out_wire[N-1], S[N-1], sum_A_S[N-1], of_flag);
	
	always @(posedge clk, posedge aclr)
		if(aclr) begin
			carry <= 0;
			overflow <= 0;
		end
		else begin
			carry <= cout;
			overflow <= of_flag;
		end

endmodule

	