module detector_with_shift_reg(input clk, aclr, w,
										output z);
										
	wire [3:0] shift_reg0_state, shift_reg1_state;
	shift_register #(4) shift_reg0(clk, aclr, w, 4'b1111, shift_reg0_state);
	shift_register #(4) shift_reg1(clk, aclr, w, 4'b0000, shift_reg1_state);
	
	// z = 1 gdy shift_reg1_state zawiera same 1 lub gdy shift_reg0_state zawiera same 0
	assign z = (~|shift_reg0_state) | (&shift_reg1_state);
	
endmodule
