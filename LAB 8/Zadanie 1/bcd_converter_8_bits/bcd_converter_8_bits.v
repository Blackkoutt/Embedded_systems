module bcd_converter_8_bits(input [7:0] in_value, 
									  output reg [11:0] out_bcd_value);
		
	always @ (*) begin
		reg [3:0] temp;
		
		// Konwersja setek
		temp = in_value / 100;
		out_bcd_value[11:8] = temp;
		 
		// Konwersja dziesiątek
		temp = (in_value % 100) / 10;
		out_bcd_value[7:4] = temp;
		
		// Konwersja jedności
		temp = in_value % 10;
		out_bcd_value[3:0] = temp;
	end

endmodule
