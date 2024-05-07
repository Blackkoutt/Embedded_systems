module FSM_user_coding_2_processes(input clk, aclr, w, 
											  output reg z, 
											  output [3:0] y);
	
	// Automat Moore'a klasy C	
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
		
	// opis funkcji przejścia i wyjścia
	always @(*)
		case (state)
		
			A: begin
					z = 1'b0;
					if(w) next = F;
					else next = B;
				end
				
			B: begin
					z = 1'b0;
					if(w) next = F;
					else next = C;
				end
				
			C: begin
					z = 1'b0;
					if(w) next = F;
					else next = D;
				end
				
			D: begin
					z = 1'b0;
					if(w) next = F;
					else next = E;
				end
				
			E: begin
					z = 1'b1;
					if(w) next = F;
					else next = E;
				end
				
			F: begin
					z = 1'b0;
					if(w) next = G;
					else next = B;
				end
			
			G: begin
					z = 1'b0;
					if(w) next = H;
					else next = B;
				end
				
			H: begin
					z = 1'b0;
					if(w) next = I;
					else next = B;
				end
			
			I: begin
					z = 1'b1;
					if(w) next = I;
					else next = B;
				end
				
			default: begin
							z = 1'b0;
							next = A;
						end
		endcase
	
	assign y = state;
	
endmodule
