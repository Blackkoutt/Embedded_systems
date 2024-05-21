module shift_register #(parameter N = 4) 
								(input clk, aclr, w,
								input [N-1:0] init_state,
								output reg [N-1:0] state);
								
	initial state = init_state;
	always @(posedge clk, negedge aclr)
		if(~aclr) state <= init_state;
		else state <= {state[N-2:0], w}; // nowy stan = przesunięcie i "w" do najmłodszego bitu
	
endmodule
