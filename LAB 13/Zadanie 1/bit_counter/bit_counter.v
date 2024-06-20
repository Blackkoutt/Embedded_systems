module bit_counter (
    input [7:0] in,
    input clk, sclr, Run,
    output reg [3:0] result,
    output reg Done
);

    reg [2:0] state; // Stan aktualny i następny
    reg [7:0] A /* synthesis keep */; // Rejestr przesuwny
    
    // Stany wewnętrzne automatu
    localparam [1:0] S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	 
	 // Opis automatu skończonego
	 always @(posedge clk)
		if(~sclr) state <= S1;
		else 
			case (state)
				S1: begin
						 result <= 4'd0;
						 Done <= 1'b0;				
						 if(Run) state = S2; 
						 else begin		
							 A <= in;
							 state = S1;
						 end
					 end			
                 
            S2: begin
						 if (A == 8'd0) state = S3;
						 else begin
							 if (A[0] == 1'b1) result <= result + 1'b1;
							 state = S2;
						 end
						 A <= A >> 1;
					 end
                 
            S3: begin
						Done <= 1'b1;
						if(Run) state = S3;
						else state = S1;
					 end
                 
            default: state = S1;
			endcase								  
endmodule
