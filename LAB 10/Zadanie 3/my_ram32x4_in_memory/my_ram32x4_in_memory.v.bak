module my_ram32x4_in_memory(input [4:0] address, 
									 input clk,
									 input [3:0] data,
									 input wren,
									 output [3:0] q);
									 
	reg [3:0] memory_array[31:0];
	reg [4:0] reg_address;
	reg [3:0] reg_data;
	reg reg_wren;
	
	always @(posedge clk) begin 
		reg_address <= address;
		reg_data <= data;
		reg_wren <= wren;
	end
		
	always @(*)
		if (reg_wren) memory_array[reg_address] = reg_data;
			
	assign q = memory_array[reg_address];
		
endmodule
