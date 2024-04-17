module led_blink #(parameter N=8)
						(input on, output [N-1:0] leds);

   assign leds [N-1:0] = {N{on}}; 
		
endmodule
