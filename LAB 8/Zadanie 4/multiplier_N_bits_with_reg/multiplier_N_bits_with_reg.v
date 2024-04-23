module multiplier_N_bits_with_reg #(parameter N=8)
												(input [N-1:0] Data,
												input clk, aclr, EA, EB,
												output [2*N-1:0] P,
												output reg [N-1:0] A_or_B);
												
	wire [N-1:0] A, B;
	register_N_bits_ena_aclr #(N) reg_A(clk, aclr, EA, Data, A);
	register_N_bits_ena_aclr #(N) reg_B(clk, aclr, EB, Data, B);
	
	always @(EA, EB)
		if(EA) A_or_B <= Data;
		else if (EB) A_or_B <= Data;
		else A_or_B <= 0;
		
	//mux_2_1_N_bits #(N) led_mux(A, B, {EB, EA}, A_or_B);
	
	wire [2*N-1:0] p_out;
	multiplier_N_bits #(N) multiplier(A, B, p_out);
	register_N_bits_ena_aclr #(2*N) reg_P(clk, aclr, 1'b1, p_out, P);
	
endmodule
