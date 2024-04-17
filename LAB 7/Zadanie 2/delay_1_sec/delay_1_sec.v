module delay_1_sec(input clk,
						 output clk_1_sec);
						 
	wire rollover_out, counter_out;
	// 50 000 000
	counter_modulo_k#(10) fast_counter(clk, 1'b1, 1'b1, counter_out, rollover_out);

	assign clk_1_sec = ~rollover_out;
	
endmodule

						 