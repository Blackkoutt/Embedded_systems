module FSM_user_coding (input clk, aclr, w, 
								output reg z, 
								output [3:0] y);
	
	// Automat Moore'a
	reg [3:0] state, next;
	
	// deklaracja stanów wewnętrznych
	localparam [3:0] 
		A = 4'b0000, // 0
		B = 4'b0001, // 1
		C = 4'b0010, // 2
		D = 4'b0011, // 3
		E = 4'b0100, // 4
		F = 4'b0101, // 5
		G = 4'b0110, // 6
		H = 4'b0111, // 7
		I = 4'b1000; // 8
		
	// opis pamięci (rejestru)
	always @(posedge clk, negedge aclr)
		if(~aclr) state <= A;
		else state <= next;
		
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
		