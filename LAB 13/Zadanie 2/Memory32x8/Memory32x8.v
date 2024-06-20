module Memory32x8(input [4:0] Address,
						input [7:0] DataIn,
						input Write, Clock,
						output [7:0] DataOut);
						
	reg [4:0] regAddr;
	reg [7:0] regDataIn;
	reg regWrite;
	
	always @(posedge Clock) begin
		regAddr <= Address;
		regDataIn <= DataIn;
		regWrite <= Write;
	end
		
	RAM32x8(regAddr, Clock, regDataIn, regWrite, DataOut);
	
endmodule
