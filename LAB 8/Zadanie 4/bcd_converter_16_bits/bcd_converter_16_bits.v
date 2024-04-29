module bcd_converter_16_bits(input [15:0] in_value, 
									  output reg [19:0] out_bcd_value);
		
	always @ (*) begin
		reg [3:0] temp;
		
		// Konwersja dziesiątek tysięcy
		temp = in_value / 10000;
		out_bcd_value[19:16] = temp;
		
		// Konwersja tysięcy
		temp = (in_value % 10000)/1000;
		out_bcd_value[15:12] = temp;
		
		// Konwersja setek
		temp = (in_value % 1000) / 100;
		out_bcd_value[11:8] = temp;
		 
		// Konwersja dziesiątek
		temp = (in_value % 100) / 10;
		out_bcd_value[7:4] = temp;
		
		// Konwersja jedności
		temp = in_value % 10;
		out_bcd_value[3:0] = temp;
	end

endmodule
