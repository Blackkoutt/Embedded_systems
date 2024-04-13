module shift_word(input clk, 
						input direction,
						output reg [7:0] char_out);
						
	initial char_out = 8'b00011011;
	
	always @(negedge clk) begin
		reg [5:0] temp;
		
		// Shift right
		if(direction) begin
			char_out[1:0] <= char_out[7:6];
			char_out[3:2] <= char_out[1:0];
			char_out[5:4] <= char_out[3:2];
			char_out[7:6] <= char_out[5:4];
		end
		
		// Shift left
		else begin
			char_out[7:6] <= char_out[1:0];
			char_out[1:0] <= char_out[3:2];
			char_out[3:2] <= char_out[5:4];
			char_out[5:4] <= char_out[7:6];
		end
	end
	
endmodule
