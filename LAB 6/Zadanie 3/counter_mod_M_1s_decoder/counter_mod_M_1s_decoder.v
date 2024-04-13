module counter_mod_M_1s_decoder(input clk, output [0:6] H0);

	wire [3:0] Q;
	counter_mod_M_1s#(10) counter_1s_mod_10(clk, Q[3:0]);
	decoder_hex_10 dec0(Q[3:0], H0[0:6]);
	
endmodule
