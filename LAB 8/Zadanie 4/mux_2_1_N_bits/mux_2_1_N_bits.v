module mux_2_1_N_bits #(parameter N=8)
							(input [N-1:0] A, B,
							input [1:0] s,
							output reg [N-1:0] out);
							
	always @(*)
		case (s)
			2'd1: out = A;
			2'd2: out = B;
			default: out = {N{1'b0}};
		endcase
		
endmodule
