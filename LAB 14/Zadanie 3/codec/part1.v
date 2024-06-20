module part1 (CLOCK_50, CLOCK2_50, KEY, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT, SW);

	input CLOCK_50, CLOCK2_50;
	input [0:0] KEY;
	
	// I2C Audio/Video config interface
	output FPGA_I2C_SCLK;
	inout FPGA_I2C_SDAT;
	
	// Audio CODEC
	output AUD_XCK;
	input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input AUD_ADCDAT;
	output AUD_DACDAT;
	input [1:0] SW;
	
	// Local wires.
	wire read_ready, noise_ena, filter_ena, write_ready, read, write;
	wire [23:0] readdata_left, readdata_right;
	wire [23:0] writedata_left, writedata_right;
	wire reset = ~KEY[0];
	
	wire noise_on = SW[0];
	wire filter_on = SW[1];
	wire signed [23:0] noise, signal_with_noise_left, signal_with_noise_right, data_left,
							data_right, before_filter_left, before_filter_right, 
							after_filter_left, after_filter_right;
	
	control_unit cu (CLOCK_50, reset, read_ready, write_ready, noise_on, filter_on, read, write, noise_ena, filter_ena);
	
	noise_generator ng1(CLOCK_50, noise_ena, noise);
	
	sum_noise sum_left(readdata_left, noise, signal_with_noise_left);
	sum_noise sum_right(readdata_right, noise, signal_with_noise_right);
	
	multiplekser mux0(readdata_left, readdata_right, signal_with_noise_left, signal_with_noise_right,
							noise_on, before_filter_left, before_filter_right);
							
	simple_fir sf_left(reset, CLOCK_50, filter_ena, before_filter_left, after_filter_left);
	simple_fir sf_right(reset, CLOCK_50, filter_ena, before_filter_right, after_filter_right);
	
	
	multiplekser mux1(before_filter_left, before_filter_right, after_filter_left, after_filter_right,
							filter_on, data_left, data_right);
	
	assign writedata_left = data_left;
	assign writedata_right = data_right;
	
/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);

endmodule


