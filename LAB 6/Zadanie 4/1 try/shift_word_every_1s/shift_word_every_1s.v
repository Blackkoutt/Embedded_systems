module shift_word_every_1s(input clk, direction, 
									output [7:0] char_out);
									
	function integer clogb2(input [31:0] v);
		for(clogb2 = 0; v>0; clogb2 = clogb2 + 1)
			v = v >> 1;
	endfunction
	
	localparam fast_counter_M = 50000000; //50 000 000
	localparam FC_bits = clogb2(fast_counter_M - 1);
	
	wire [FC_bits-1:0] A;
   wire clk_1_sec;
	
	counter_mod_M#(fast_counter_M) fast_counter(clk, 1'b1, 1'b1, A);
	
	assign clk_1_sec = ~|A;
	
	shift_word shift(clk_1_sec, direction, char_out [7:0]);
	
	
endmodule