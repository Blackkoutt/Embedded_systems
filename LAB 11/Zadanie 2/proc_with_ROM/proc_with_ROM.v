module proc_with_ROM(input MClock, PClock, Resetn, Run,
							output [8:0] Bus,
							output Done);
							
	wire [4:0] address;
	
	counter_N_bits #(5) counter(.clk(MClock), .aclr(Resetn), .enable(1'b1), .Q(address));
	
	wire [8:0] DIN;
	
	rom32x9 ROM(address, MClock, DIN);
	
	proc processor(.DIN(DIN), .Resetn(Resetn), .Clock(PClock), .Run(Run), .Done(Done), .BusWires(Bus));
	
endmodule
	