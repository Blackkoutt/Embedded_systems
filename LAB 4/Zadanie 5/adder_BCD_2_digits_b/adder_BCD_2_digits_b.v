module adder_BCD_2_digits_b(input [3:0] A, B,
									 input c0,
									 output [3:0] S0, S1);	
	reg [4:0] Z0;
	reg c1;
	reg [4:0] T0; // wynik może być 5 bitowy - max 19
 	
	always @(*) begin
		T0 = A + B + c0;
			if(T0 > 5'd9) begin
				Z0 = 5'd10;
				c1 = 4'd1;
			end
			else begin
				Z0 = 5'd0;
				c1 = 4'd0;
			end
	end
	
	assign S0[3:0] = T0 - Z0; // w każdym przypadku zostaną 4 bity
	assign S1[3:0] = c1;
	
endmodule
