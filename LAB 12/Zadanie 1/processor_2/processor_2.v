module processor_2 (input [8:0] DIN,
						  input Resetn, Clock, Run,
						  output [8:0] ADDR, DOUT,
						  output W,
						  output reg Done);

	 // Stany wewnętrzne automatu
	localparam[2:0] T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011, T4 = 3'b100, T5 = 3'b101;
	
	// Kody instrukcji
	localparam [2:0] mv = 3'b000, mvi = 3'b001, add = 3'b010, sub = 3'b011, ld = 3'b100, st = 3'b101, mvnz = 3'b110;
	
	// Sieci połączeń
	wire [9:1] IR; // rejestr instrukcji
	wire [8:0] A, G, R0, R1, R2, R3, R4, R5, R6, PC; // Pozostałe rejestry i licznik rozkazów
	wire [8:0] BusWires /* synthesis keep */; 
	wire [8:0] Sum; // wyjście z ALU
	wire [0:7] Xreg, Yreg; // rejestr X oraz Y zawarty w instrukcji
	wire [2:0] I; // kod rozkazu
	wire G_not_zero /* synthesis keep */; 
	
	// Zmienne sterujące
   reg G_in, G_out, DIN_out, add_sub, IR_in, A_in;
	reg incr_PC;
	reg ADDR_in, DOUT_in;
	reg W_D;
	reg [2:0] Tstep_Q /* synthesis keep */;
	reg [2:0] Tstep_D;
	reg [0:7] R_in, R_out; // wartość wejściowa i wyjściowa rejstru
	
	assign I = IR[9:7]; // Kod rozkazu
	assign G_not_zero = |G; // Sprawdzenie czy wartość w rejestrze G nie jest 0
	
	// Dekodowanie kodu rejestrów (3 bity) do kodu one-hot (8 bitów)
	dec3to8 decX(.W(IR[6:4]), .En(1'b1), .Y(Xreg));
	dec3to8 decY(.W(IR[3:1]), .En(1'b1), .Y(Yreg));
		
	// Przejścia między stanami automatu
	always @ (Tstep_Q, Run, Done)
		case (Tstep_Q)
			T0:
				if (~Run) Tstep_D = T0;
				else Tstep_D = T1;
			T1:
				Tstep_D = T2;
			T2:
				Tstep_D = T3;
			T3:
				if (Done) Tstep_D = T0;
				else Tstep_D = T4;
			T4:
				if (Done) Tstep_D = T0;
				else Tstep_D = T5;
			T5:
				Tstep_D = T0;
		endcase
		
	// Wyjścia automatu	
	always @ (Tstep_Q, I, Xreg, Yreg) 
		begin
			Done = 1'b0;
			G_in = 1'b0;
		   G_out = 1'b0;
		   A_in = 1'b0;
		   add_sub = 1'b0;
		   DIN_out = 1'b0;
		   R_in = 8'b00000000;
		   R_out = 8'b00000000;
		   IR_in = 1'b0;
		   incr_PC = 1'b0;
		   ADDR_in = 1'b0;
		   DOUT_in = 1'b0;
		   W_D = 1'b0;
			case (Tstep_Q)
				T0: begin 
					R_out[7] = 1'b1;  // pobranie adresu kolejnej instrukcji z licznika rozkazów
					ADDR_in = 1'b1;	// wstawienie adresu kolejnej instruckji do rejestru ADDR
				end
				T1: begin 
					incr_PC = 1'b1;	// zwiększenie licznika rozkazów
				end
				T2: begin 
					IR_in = 1'b1;		// wstawienie instrukcji do rejestru IR
				end
				T3: 
					case (I)
						mv: begin
							R_out = Yreg;	// rejestr odczytu
							R_in = Xreg;	// rejestr zapisu
							Done = 1'b1;
						end
						mvi: begin
							R_out[7] = 1'b1;	// pobranie adresu kolejnej instrukcji z licznika rozkazów - wartość 
							ADDR_in = 1'b1;  // wstawienie adresu kolejnej instruckji do rejestru ADDR
							incr_PC = 1'b1; // zwiększenie licznika rozkazów
						end
						add, sub: begin
							R_out = Xreg; // rejestr odczytu
							A_in = 1'b1; // zapis do rejestru A
						end
						ld, st: begin
							R_out = Yreg;	// rejestr odczytu
							ADDR_in = 1'b1; // wstawienie adresu kolejnej instruckji do rejestru ADDR
						end
						mvnz: begin
							Done = 1'b1;
							if (G_not_zero) begin
								R_out = Yreg; // rejestr odczytu
								R_in = Xreg;  // rejestr zapisu
							end
						end
					endcase
				T4: 
				case (I)
					add: begin
						R_out = Yreg; // rejestr odczytu
						G_in = 1'b1; // zapis do rejestru G
					end
					sub: begin
						R_out = Yreg; // rejestr odczytu
						G_in = 1'b1; // zapis do rejestru G
						add_sub = 1'b1; // odejmowanie
					end
					st: begin
						R_out = Xreg; // rejestr odczytu
						DOUT_in = 1'b1; // zapis danych z szyny do rejestru DOUT
						W_D = 1'b1;	// sygnał zapisu pamięci
						Done = 1'b1;
					end
				endcase
				T5: 
					case (I)
					mvi, ld: begin
						DIN_out = 1'b1; // odczyt danych z DIN - wstawienie danych z DIN na szynę
						//incr_PC = 1'b1;
						R_in = Xreg; // rejestr zapisu
						Done = 1'b1;
					end
					add, sub: begin
						G_out = 1'b1;	// odczyt z rejestru G
						R_in = Xreg; // rejestr zapisu
						Done = 1'b1;
					end
				endcase
			endcase
		end
	
	// Rejestr jednostki sterującej
	always @ (posedge Clock, negedge Resetn)
		if (~Resetn) Tstep_Q <= T0;
		else Tstep_Q <= Tstep_D;
		
	// Rejestry
	regn #(9) reg_0(BusWires, R_in[0], Clock, R0);
	regn #(9) reg_1(BusWires, R_in[1], Clock, R1);
	regn #(9) reg_2(BusWires, R_in[2], Clock, R2);
	regn #(9) reg_3(BusWires, R_in[3], Clock, R3);
	regn #(9) reg_4(BusWires, R_in[4], Clock, R4);
	regn #(9) reg_5(BusWires, R_in[5], Clock, R5);
	regn #(9) reg_6(BusWires, R_in[6], Clock, R6);
	counter_9_bits_on_sload counter(Resetn, incr_PC, R_in[7], Clock, BusWires, PC);
	regn #(9) reg_A(BusWires, A_in, Clock, A);
	regn #(9) reg_G(Sum, G_in, Clock, G);
	regn #(9) reg_IR(DIN, IR_in, Clock, IR);
	regn #(9) reg_ADDR(BusWires, ADDR_in, Clock, ADDR);
	regn #(9) reg_DOUT(BusWires, DOUT_in, Clock, DOUT);
	regn #(1) reg_W(W_D, 1'b1, Clock, W);
	
	// ALU
	ripple_carry_adder_subtractor #(9) alu(A, BusWires, add_sub, Sum);
	
	// Multiplekser
	mux_10_1_9_bits mux(R0, R1, R2, R3, R4, R5, R6, PC, G, DIN,
							 {DIN_out, R_out, G_out}, BusWires);	
							 
endmodule