module led_blink_timer_on_board (input CLOCK_50, output [7:0] LEDR);
	
	led_blink_timer#(8) timer0(CLOCK_50, LEDR[7:0]);
	
endmodule
