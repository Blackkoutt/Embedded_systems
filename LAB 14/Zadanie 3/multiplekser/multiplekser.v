module multiplekser(input [23:0] signal_left, signal_right, signal_noise_left, signal_noise_right,
							input noise_on,
							output reg [23:0] signal_out_left, signal_out_right);
	always @(*) begin
       if (noise_on) begin
            signal_out_left <= signal_noise_left;
            signal_out_right <= signal_noise_right;
       end else begin
            signal_out_left <= signal_left;
            signal_out_right <= signal_right;
       end
    end
	 
endmodule
