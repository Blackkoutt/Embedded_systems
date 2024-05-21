module ram_1_sec_word_showing(input clk,
										input [4:0] write_addr,
										input [3:0] data,
										input write_ena, reset,
										output [4:0] read_addr,
										output [3:0] q);
										
	wire slow_clk_1_sec;
	
	delay_1_sec delay(clk, slow_clk_1_sec);
	
	// 5 bitowy licznik (modulo 32) do generowania kolejnych adresów odczytu
	counter_N_bits #(5) counter(.clk(slow_clk_1_sec), .aclr(reset), .enable(1'b1), .Q(read_addr));
	
	// 2 portowa pamięć z 5 bitową szyną adresową (32 adrest) i 4 bitową szyną danych	
	ram32x4_2_ports memory(clk, data, read_addr, write_addr, write_ena, q);
	
endmodule
