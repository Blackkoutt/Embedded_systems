module proc(input [8:0]DIN,
				input Resetn, Clock, Run,
				output reg Done,
				output [8:0] BusWires);
	
	// Stany wewnętrzne automatu
	localparam [1:0] T0=2'b00, T1=2'b01, T2=2'b10, T3=2'b11;
	
	// Kody instrukcji
	localparam [1:0] mv=2'b00, mvi=2'b01, add=2'b10, sub=2'b11;
	
	// Sieci połączeń
	wire [9:1] IR;	// rejestr instrukcji
	wire [8:0] A, G, R0, R1, R2, R3, R4, R5, R6, R7;
	wire [8:0] Sum;	
	wire [0:7] Xreg, Yreg;	// rejestr X oraz Y zawarty w instrukcji
	wire [2:0] I;	// kod rozkazu
	
	// Zmienne 
	reg G_in, G_out, DIN_out, add_sub, IR_in, A_in;
	reg [1:0] Tstep_D;
	reg [1:0] Tstep_Q /* synthesis keep */;
	reg [0:7] R_in, R_out;
	
	// Kod rozkazu
	assign I = IR[9:7];
	
	// Dekodowanie do systemu ósemkowego kodu rejestrów (8 rejestrów R)
	dec3to8 decX(IR[6:4], 1'b1, Xreg);
	dec3to8 decY(IR[3:1], 1'b1, Yreg);
	
	// Przejścia między stanami automatu
	always @(Tstep_Q, Run, Done)
		case(Tstep_Q)
			T0: 
				if(~Run) Tstep_D = T0;
				else Tstep_D = T1;
			T1:
				if(Done) Tstep_D = T0;
				else Tstep_D = T2;
			T2:
				Tstep_D = T3;
			T3:
				Tstep_D = T0;
		endcase
			
	// Wyjścia automatu
	always @(Tstep_Q, I, Xreg, Yreg)
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
			case(Tstep_Q)
				T0:
					IR_in = 1'b1; // inicjacja ładowania kodu kolejnego rozkazu
				T1:
					case(I)
						mv:
							begin
								R_out = Yreg; // kod rejestru wyjściowego (stąd odczyt)
								R_in = Xreg; // kod rejestru wejściowego (tu zapis)
								Done = 1'b1; // koniec operacji
							end
						mvi:
							begin
								DIN_out = 1'b1; // inicjacja ładowania zmiennej na szynę danych
								R_in = Xreg; // kod rejestru wejściowego (tu zapis)
								Done = 1'b1; // koniec operacji
							end
						add, sub:
							begin
								R_out = Xreg; // kod rejestru wyjściowego (tu odczyt)
								A_in = 1'b1; // inicjacja ładowania danych z Xreg do rejestru A
							end
					endcase
				T2:
					case(I)
						add:
							begin
								R_out = Yreg; // kod rejestru wyjściowego (tu odczyt)
								G_in = 1'b1; // inicjacja ładowania danych do rejestru G
							end
						sub:
							begin
								R_out = Yreg; // kod rejestru wyjściowego (tu odczyt)
								G_in = 1'b1; // inicjacja ładowania danych do rejestru G
								add_sub = 1'b1; // ustawienie odejmowania w alu
							end			
					endcase
				T3:
					case(I)
						add, sub:
								begin
									G_out = 1'b1; // sygnalizacja wyjścia z rejestru G (zakończenie dodawania)
									R_in = Xreg;	// kod rejestru wejściowego (tu zapis)
									Done = 1'b1;  // koniec operacji
								end
					endcase
			endcase
		end
	
	// Sterowanie przerzutnikami automatu
	always @(posedge Clock, negedge Resetn)
		if(!Resetn) Tstep_Q <= T0; // Powrót do stanu początkowego
		else Tstep_Q <= Tstep_D;	// Rzeczywista zmiana stanu wraz z narastającym zboczem zegara
	
	// Rejestry
	regn #(9) reg_0(.R(BusWires), .ena(R_in[0]), .clk(Clock), .Q(R0));
	regn #(9) reg_1(.R(BusWires), .ena(R_in[1]), .clk(Clock), .Q(R1));
	regn #(9) reg_2(.R(BusWires), .ena(R_in[2]), .clk(Clock), .Q(R2));
	regn #(9) reg_3(.R(BusWires), .ena(R_in[3]), .clk(Clock), .Q(R3));
	regn #(9) reg_4(.R(BusWires), .ena(R_in[4]), .clk(Clock), .Q(R4));
	regn #(9) reg_5(.R(BusWires), .ena(R_in[5]), .clk(Clock), .Q(R5));
	regn #(9) reg_6(.R(BusWires), .ena(R_in[6]), .clk(Clock), .Q(R6));
	regn #(9) reg_7(.R(BusWires), .ena(R_in[7]), .clk(Clock), .Q(R7));
	regn #(9) reg_A(.R(BusWires), .ena(A_in), .clk(Clock), .Q(A));
	regn #(9) reg_G(.R(Sum), .ena(G_in), .clk(Clock), .Q(G));
	regn #(9) reg_IR(.R(DIN[8:0]), .ena(IR_in), .clk(Clock), .Q(IR));
	
	// ALU
	ripple_carry_adder_subtractor #(9) ALU(A, BusWires, add_sub, Sum);
	
	// Multiplekser
	mux_10_1_9_bits mux(R0, R1, R2, R3, R4, R5, R6, R7, G, DIN,
							 {DIN_out, R_out, G_out}, BusWires);							 
							 
endmodule
