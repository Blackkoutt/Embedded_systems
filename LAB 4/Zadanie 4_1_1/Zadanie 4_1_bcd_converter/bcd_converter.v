module binary_to_bcd_converter(input [4:0] binary,
										output [3:0] bcd);
		
	 reg [4:0] binary_temp;
    
    always @(*) begin
        binary_temp = binary[4:0] + 4'd6;
    end
    
    assign bcd = binary_temp [3:0];

endmodule
	