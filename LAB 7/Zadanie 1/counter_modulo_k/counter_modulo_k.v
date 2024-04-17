module counter_modulo_k #(parameter k=20)
								 (input clk, aclr, enable,
								  output reg [N-1:0] Q,
								  output rollover);
	
	localparam N = clogb2(k-1);
	
	function integer clogb2(input [31:0] v);
		for(clogb2 = 0; v > 0; clogb2 = clogb2+1)
			v = v >> 1;
	endfunction
	
	always @(posedge clk, negedge aclr)
		if(!aclr) Q<={N{1'b0}};
		else begin
			if(enable) begin
				if(Q == k-1)  Q<={N{1'b0}};
				else          Q<= Q + 1'b1;
			end
			else Q<=Q;
		end
		
	assign rollover = (Q == k-1);
	
endmodule

