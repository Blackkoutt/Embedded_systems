module real_time_clock_decoders(input clk, timer_enable, load_csec, load_sec, load_min,
											input [7:0] data, 
											output [0:6] H5, H4, H3, H2, H1, H0);
							
	
	wire [7:0] csec, sec, min;
	
	real_time_clock rtc(clk, timer_enable, load_csec, load_sec, load_min,
								  data[7:0], csec[7:0], sec[7:0], min[7:0]);
								  
	// centiseconds
	decoder_hex_10 dec_enable_csec0(csec[3:0], H0[0:6]);
	decoder_hex_10 dec_enable_csec1(csec[7:4], H1[0:6]);
	
	// seconds
	decoder_hex_10 dec_enable_sec0(sec[3:0], H2[0:6]);
	decoder_hex_10 dec_enable_sec1(sec[7:4], H3[0:6]);
	
	// minutes
	decoder_hex_10 dec_enable_min0(min[3:0], H4[0:6]);
	decoder_hex_10 dec_enable_min1(min[7:4], H5[0:6]);
	
endmodule
