module my_ram32x4(input [4:0] address,
						input clk,	
						input [3:0] data,
						input wren,
						output [3:0] q);
						
	// 1 portowa pamięć ram, 32 adresy, 4 bitowe dane
	// 5 bitowa szyna danych, 4 bitowa szyna adresowa
	ram32x4 ram(address, clk, data, wren, q);
	
endmodule
