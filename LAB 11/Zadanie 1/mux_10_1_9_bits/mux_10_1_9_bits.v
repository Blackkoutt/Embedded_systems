module mux_10_1_9_bits(input [8:0] R0, R1, R2, R3, R4, R5, R6, R7, G, DIN,
								input [9:0] s,
								output reg [8:0] BusWires);
	always @(*)
		case (s)
			default: BusWires = DIN;
			10'b0100000000: BusWires = R0;
			10'b0010000000: BusWires = R1;
			10'b0001000000: BusWires = R2;
			10'b0000100000: BusWires = R3;
			10'b0000010000: BusWires = R4;
			10'b0000001000: BusWires = R5;
			10'b0000000100: BusWires = R6;
			10'b0000000010: BusWires = R7;
			10'b0000000001: BusWires = G;
		endcase
		
endmodule
	