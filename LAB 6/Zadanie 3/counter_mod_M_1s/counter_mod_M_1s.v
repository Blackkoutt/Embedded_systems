module counter_mod_M_1s #(parameter slow_counter_M=10)
								(input clk,
								output [SC_bits-1:0] Q);
	
   // szerokośc bitowa licznika na podstawie modułu	
	function integer clogb2(input [31:0] v);
		for(clogb2 = 0; v>0;clogb2=clogb2+1)
			v=v>>1;
	endfunction
	
	localparam fast_counter_M = 50000000; // 50_000_000
	localparam FC_bits = clogb2(fast_counter_M-1);
	localparam SC_bits = clogb2(slow_counter_M-1);
	
	wire [FC_bits-1:0] A;
	wire e;
	
	counter_mod_M#(fast_counter_M) fast_counter(clk, 1'b1, 1'b1, A);
	
	assign e = ~|A;
	
	counter_mod_M#(slow_counter_M) slow_counter(clk, 1'b1, e, Q);
	
endmodule