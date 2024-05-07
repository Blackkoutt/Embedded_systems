module FSM_one_hot(input clk, aclr, w,
                   output reg z,
                   output [8:0] y);

    // Automat Moore'a
    
    reg [8:0] state, next; // stan aktualny i przejścia
    
    // stany wewnętrzne automatu
    localparam [8:0]
                    A = 9'b000000001, // 1
                    B = 9'b000000010, // 2
                    C = 9'b000000100, // 4
                    D = 9'b000001000, // 8
                    E = 9'b000010000, // 16
                    F = 9'b000100000, // 32
                    G = 9'b001000000, // 64
                    H = 9'b010000000, // 128
                    I = 9'b100000000; // 256
                    
    // opis pamięci (rejestru)                
    always @(posedge clk, negedge aclr)
        if(~aclr)   		state <= A;
        else            state <= next;
    
    // opis funkcji przejścia
    always @(*)
        case (state)
			A: if(w) next = F;
				else next = B;
				
			B: if(w) next = F;
				else next = C;
				
			C: if(w) next = F;
				else next = D;
				
			D: if(w) next = F;
				else next = E;
				
			E: if(w) next = F;
				else next = E;
				
			F: if(w) next = G;
				else next = B;
			
			G: if(w) next = H;
				else next = B;
				
			H: if(w) next = I;
				else next = B;
			
			I: if(w) next = I;
				else next = B;
				
			default: next = A;
			
		endcase
                
    // opis funkcji wyjścia
    always @(*)
        case (state)
				E: z = 1'b1;
				I: z = 1'b1;
			default: z = 1'b0;
		endcase
    
    assign y = state;
        
endmodule
