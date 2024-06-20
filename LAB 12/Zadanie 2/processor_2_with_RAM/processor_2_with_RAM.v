module processor_2_with_RAM (input Resetn, Clock, Run,
										output [8:0] LEDs,
										output Done);

	wire [8:0] RAM_out, ADDR, DOUT /* synthesis keep */;
	wire W, wr_en, E /* synthesis keep */;
	
	assign wr_en = ( ( ~(ADDR[7] | ADDR[8] ) ) & W );
	assign E = ( ( ~(~ADDR[7] | ADDR[8] ) ) & W );
	
	regn #(9) reg_LED(.R(DOUT), .ena(E), .clk(Clock), .Q(LEDs));
	RAM128x9 ram(ADDR[6:0], Clock, DOUT, wr_en, RAM_out);
	
	// Opóźnienie uruchomienia procesora o 1 takt zegarowy 
	reg Run_delay1, Run_delay2 /* synthesis keep */;
	always @ (posedge Clock)
	begin
		Run_delay2 <= Run_delay1;
		Run_delay1 <= Run;
	end
	
	wire Run_proc = Run_delay2 /* synthesis keep */;
	
	processor_2 proc(.DIN(RAM_out), .Resetn(Resetn), .Clock(Clock), .Run(Run_proc), .ADDR(ADDR), .DOUT(DOUT), .W(W), .Done(Done));
	
endmodule
