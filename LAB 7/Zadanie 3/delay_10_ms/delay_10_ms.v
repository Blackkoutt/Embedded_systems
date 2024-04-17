module delay_10_ms(input clk,
						 output clk_10_ms);
						 
	wire rollover_out, counter_out;
	
	// 500 000
	counter_modulo_k_with_data_load#(500000) fast_counter(clk, 1'b1, 1'b1, 1'b0, 1'b0, counter_out, rollover_out);

	assign clk_10_ms = ~rollover_out;
	
endmodule
