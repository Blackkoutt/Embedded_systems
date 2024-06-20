module Control(input [7:0] A, 
               input Clock, Start, aReset, Found, Less_Or_Greather,
               output reg [4:0] M,
			      output reg [7:0] A_out,
					output reg Done,
               output reg [1:0] state);

    reg [1:0] /*state, */next;
    reg [4:0] L, R;

    localparam [1:0] S1 = 2'b00, S2 = 2'b01, S3 = 2'b10;

    always @(posedge Clock, negedge aReset) begin
        if(~aReset) state <= S1;
        else state <= next;
    end

    always @(*) begin
        case(state)
            S1: begin
                if(Start) next = S2;
                else next = S1;
            end
            S2: begin
                if(Found) next = S3;
                else next = S2; 
            end
            S3: begin
                if(Start) next = S3;
                else next = S1;
            end
            default: next = S1;
        endcase
    end

   always @(posedge Clock) begin
		  case(state)
            S1: begin
					 A_out <= A;
                L <= 5'd0;
                R <= 5'd31; 
                M <= (L + R) / 2;
					 Done <= 1'b0;
            end
            S2: begin
                // A jest większe od wybranej liczby
                if(Less_Or_Greather) begin
                    L <= M + 1'b1;
                end
					 
                // A jest mniejsze od wybranej liczby
                else begin
                    // L takie same
                    R <= M - 1'b1; 
                end
					 M <= (L + R) / 2; 
            end
            S3: begin
                Done <= 1'b1;
            end  
				 default: begin
						A_out = 8'd0;
						L = 5'd0;
						R = 5'd31;
						M = (L + R) / 2; 
						Done = 1'b0;
				  end   
        endcase
    end

endmodule
