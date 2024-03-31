module decoder_error_check(input [0:6] dec_out, 
									output reg err_state);
									
	always @(dec_out) begin
		if(dec_out == 7'b1111111)
			err_state = 1'b1;
		else 
			err_state = 1'b0;
	end
	
endmodule
