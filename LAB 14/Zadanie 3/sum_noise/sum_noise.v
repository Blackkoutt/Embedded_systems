module sum_noise(input [23:0] signal_in, noise,
						output [23:0] signal_noise_out);
						
	assign signal_noise_out = signal_in + noise;
	
endmodule
