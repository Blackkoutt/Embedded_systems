module counter_BCD_3_digits(input clk, aclr,
									 output [11:0] counters_out,
									 output max_value);
									 
	wire slow_clock;
	wire rollover_0, rollover_1, rollover_2;
	
	delay_1_sec fast_clock_delay(clk, slow_clock);
	//initial counters_out[11:0] = 0;
	counter_modulo_k#(10) counter0(slow_clock, aclr, 1'b1, counters_out[3:0], rollover_0);
	counter_modulo_k#(10) counter1(~rollover_0, aclr, 1'b1, counters_out[7:4], rollover_1);
	counter_modulo_k#(10) counter2(~rollover_1, aclr, 1'b1, counters_out[11:8], rollover_2);
	
	assign max_value = rollover_0 & rollover_1 & rollover_2;
	
endmodule