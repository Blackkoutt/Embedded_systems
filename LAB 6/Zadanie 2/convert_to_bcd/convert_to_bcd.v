module convert_to_bcd(
    input [15:0] in_binary_value,
    output reg [15:0] out_bcd_value
);

always @ (*) begin
    reg [3:0] temp; // 4-bitowa zmienna tymczasowa dla jednej cyfry BCD
    
    // Konwersja tysięcy
    out_bcd_value[15:12] = in_binary_value / 1000;
    
    // Konwersja setek
    temp = (in_binary_value % 1000) / 100;
    out_bcd_value[11:8] = temp;
    
    // Konwersja dziesiątek
    temp = (in_binary_value % 100) / 10;
    out_bcd_value[7:4] = temp;
    
    // Konwersja jedności
    temp = in_binary_value % 10;
    out_bcd_value[3:0] = temp;
end

endmodule
