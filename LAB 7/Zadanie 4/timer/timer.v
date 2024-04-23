module timer #(parameter M=90000000) // 1sec
				(input clk, output reg slow_clk);
				
	function integer clogb2(input [31:0] v);
		for(clogb2 = 0; v > 0; clogb2 = clogb2 + 1)
			v = v >> 1;
	endfunction
	
	localparam N = clogb2(M-1);
	
	initial slow_clk = 1'b1;
	
	reg [N-1:0] cnt = M - 1;
	
	always @ (posedge clk)
		if(cnt==0) begin
			cnt <= M-1;
			slow_clk <= ~slow_clk;
		end
		else
			cnt <= cnt - 1;
	
	//assign slow_clk = (cnt==0);

endmodule


		