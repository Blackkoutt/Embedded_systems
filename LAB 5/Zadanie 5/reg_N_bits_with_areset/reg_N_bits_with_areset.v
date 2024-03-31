module reg_N_bits_with_areset
#(parameter N =8)(input clk, reset,
						input wire[N-1:0] data,
						output reg [N-1:0] out);
						
	always @(posedge clk, posedge reset)
		if(reset) out <=0;
		else out <= data;
	
endmodule 