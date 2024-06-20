module control_unit (clk, reset, read_ready, write_ready, noise_on, filter_on,
							read_ena, write_ena, noise_ena, filter_ena);

	input clk, reset, read_ready, write_ready, noise_on, filter_on;
	output reg read_ena, write_ena, noise_ena, filter_ena;

	parameter [2:0] START=3'd0, READDATA=3'd1, WAITFORWRITE=3'd2, WRITEDATA=3'd3, NOISEADD=3'd4, FILTERPROC=3'd5;

	reg [2:0] state;

	always@ (posedge clk) begin
		if (reset) state<=START;
		else 
			case (state)
				START: if (read_ready) state<=READDATA;
						 else state<=START;
						 
				READDATA: if (noise_on) state<=NOISEADD;
							 else if(filter_on) state <= FILTERPROC; 
							 else state<=WAITFORWRITE;
							 
				WAITFORWRITE: if (write_ready) state<=WRITEDATA;
								  else state<=WAITFORWRITE;
							 
				NOISEADD:	if (filter_on) state <= FILTERPROC; 
								else state <= WAITFORWRITE;
								
				FILTERPROC:	state <= WAITFORWRITE;
							 
				WRITEDATA:	state <= START;
							 
				default: state<=START;
			endcase
	end

	always@ (*) begin
		case (state)
			START: begin
				write_ena=1'b0;
				read_ena=1'b0;
				noise_ena=1'b0;
				filter_ena=1'b0;
			end
			READDATA: begin
				write_ena=1'b0;
				read_ena=1'b1;
				noise_ena=1'b0;
				filter_ena=1'b0;
			end
			WAITFORWRITE: begin
				write_ena=1'b0;
				read_ena=1'b0;
				noise_ena=1'b0;
				filter_ena=1'b0;
			end
			NOISEADD: begin
				write_ena=1'b0;
				read_ena=1'b0;
				noise_ena=1'b1;
				filter_ena=1'b0;
			end
			FILTERPROC: begin
				write_ena=1'b0;
				read_ena=1'b0;
				noise_ena=1'b0;
				filter_ena=1'b1;
			end
			WRITEDATA: begin
				write_ena=1'b1;
				read_ena=1'b0;
				noise_ena=1'b0;
				filter_ena=1'b0;
			end
		endcase
	end
	
endmodule