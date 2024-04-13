module shift_word_every_1s_decoder(input clk,
												input direction,
												output [0:6] H3, H2, H1, H0);
												
	wire [7:0] word;
	shift_word_every_1s shift_1s(clk, direction, word[7:0]);
	
	decoder_7_seg dec0(word[1:0], H0[0:6]);
	decoder_7_seg dec1(word[3:2], H1[0:6]);
	decoder_7_seg dec2(word[5:4], H2[0:6]);
	decoder_7_seg dec3(word[7:6], H3[0:6]);
	
endmodule