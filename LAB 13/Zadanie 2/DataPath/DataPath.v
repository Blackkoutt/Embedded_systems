module DataPath(input clk,
					 input [7:0] mem_out, A, 
					 input [4:0] search_ADDR,
					 output [4:0] Address, 
					 output reg [4:0] L,
					 output reg Found, Less_Or_Greather);

		assign Address = search_ADDR;

		always @(posedge clk) begin
			if(A > mem_out) begin
				Found <= 1'b0;
				Less_Or_Greather <= 1'b1;
			end
			else if (A < mem_out) begin
				Found <= 1'b0;
				Less_Or_Greather <= 1'b0;
			end
			else begin
				Found <= 1'b1;
				L <= search_ADDR;
			end
		end
	
endmodule
