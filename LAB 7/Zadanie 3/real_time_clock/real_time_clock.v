module real_time_clock(input clk, timer_enable, load_csec, load_sec, load_min,
								input [7:0] data,
								output [7:0] csec, sec, min);
	reg enable = 1'b0;
	
	always @(posedge timer_enable)
		enable <= ~enable;
		
	wire slow_clock;
	delay_10_ms fast_clock_delay(clk, slow_clock);
	
	// rollovers
	wire r_csec_0, r_csec_1,
		  r_sec_0, r_sec_1,
		  r_min_0, r_min_1;
	
	// centiseconds counter
	counter_modulo_k_with_data_load#(10) counter_centisec0_mod_10(slow_clock, 1'b1, enable, load_csec, data[3:0],
																			 csec[3:0], r_csec_0);
																			
	counter_modulo_k_with_data_load#(10) counter_centisec1_mod_10(~r_csec_0, 1'b1, 1'b1, load_csec, data[7:4],
																			 csec[7:4], r_csec_1);
																			
	// seconds counter
	counter_modulo_k_with_data_load#(10) counter_sec0_mod_10(~r_csec_1, 1'b1, 1'b1, load_sec, data[3:0],
																	  sec[3:0], r_sec_0);
																			
	counter_modulo_k_with_data_load#(6) counter_sec1_mod_6(~r_sec_0, 1'b1, 1'b1, load_sec, data[7:4],
																	 sec[7:4], r_sec_1);
		
	// minutes counter
	counter_modulo_k_with_data_load#(10) counter_min0_mod_10(~r_sec_1, 1'b1, 1'b1, load_min, data[3:0],
																	  min[3:0], r_min_0);
																			
	counter_modulo_k_with_data_load#(6) counter_min1_mod_6(~r_min_0, 1'b1, 1'b1, load_min, data[7:4],
																	  min[7:4], r_min_1);
																	  
endmodule
