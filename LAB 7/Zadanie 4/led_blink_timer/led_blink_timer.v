module led_blink_timer #(parameter N=8)(input clk, output [N-1:0] led);
	
	wire slow_clk;
	
	timer #(90000000) timer_1_8s(clk, slow_clk); // 1.8s - mod 90 000 000	
	
	led_blink #(N) (slow_clk, led[N-1:0]);
	
endmodule
