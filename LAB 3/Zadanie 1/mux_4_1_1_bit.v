module mux_4_1_1_bit (input u, v, w, x,
							input [1:0]s,
							output m);
								
		wire out_uv, out_wx;
		
		mux_2_1_1_bit mux_uv(u, v, s[0], out_uv);
		mux_2_1_1_bit mux_wx(w, x, s[0], out_wx);
		mux_2_1_1_bit mux_uvwx(out_uv, out_wx, s[1], m);
		
endmodule

		