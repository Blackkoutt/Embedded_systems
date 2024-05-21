module my_ram32x4_in_memory(input [4:0] address, 
									 input clk,
									 input [3:0] data,
									 input wren,
									 output [3:0] q);
									 
	// 32 zmienne o szerokości 4 bitów
	// 32 adresy, 4 bitowe dane
	// 5 bitowa szyna adresowa i 4 bitowa szyna danych
	reg [3:0] memory_array [31:0]; 
	
	reg [4:0] reg_address;
	reg [3:0] reg_data;
	reg reg_wren;
	
	// zmiana wartości wszytskich sygnałów następuje tylko przy narastającym zboczu zegara
	always @(posedge clk) begin 
		reg_address <= address;
		reg_data <= data;
		reg_wren <= wren;
	end
  
   // zapisanie danych pod wskazany adres jeśli reg_wren w stanie wysokim
	always @(*)	
		if (reg_wren) memory_array[reg_address] = reg_data;
	
	//	wyjście pamięci RAM
	assign q = memory_array[reg_address];
		
endmodule
