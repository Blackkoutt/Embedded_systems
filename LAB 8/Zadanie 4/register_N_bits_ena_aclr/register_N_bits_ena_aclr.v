module register_N_bits_ena_aclr #(parameter N =8)
											(input clk, aclr, ena,
											input wire[N-1:0] data,
											output reg [N-1:0] out);
						
	always @(posedge clk, posedge aclr)
		if(aclr) out <= 0;
		else if (ena) out <= data;
		else out <= out;
	
endmodule 