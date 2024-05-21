module proc_with_ROM(input MClock, PClock, Resetn, Run,
							output [8:0] Bus,
							output Done);
							
	wire [4:0] address;
	wire [8:0] DIN /* synthesis keep */;
	
	counter_N_bits #(5) counter(.clk(MClock), .aclr(Resetn), .enable(1'b1), .Q(address));
	
	rom32x9 ROM(address, MClock, DIN);
	
	proc processor(.DIN(DIN), .Resetn(Resetn), .Clock(PClock), .Run(Run), .Done(Done), .BusWires(Bus));
	
endmodule
	