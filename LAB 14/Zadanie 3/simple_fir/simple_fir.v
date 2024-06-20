module simple_fir(reset, clk, enable, data_in, data_out);
    input reset, clk, enable;
    input signed [23:0] data_in;
    output signed [23:0] data_out;

    reg signed [23:0] filter [1:8];
    integer j;

    always@(posedge clk)
    begin
        if (reset)
            for (j = 1; j <= 8; j = j + 1) begin
                filter[j] <= 24'b0;
				end
        else if (enable) begin
            filter[8] <= data_in;
            for (j = 7; j >= 1; j = j - 1) begin
                filter[j + 1] <= filter[j];
				end
            filter[1] <= data_in;
        end
		  else for (j=1; j <= 8; j=j+1) begin
					filter[j] <= filter[j];
		  end
    end

    assign data_out = (filter[1] >>> 3) + (filter[2] >>> 3) + (filter[3] >>> 3) + 
                      (filter[4] >>> 3) + (filter[5] >>> 3) + (filter[6] >>> 3) + 
                      (filter[7] >>> 3) + (filter[8] >>> 3);

endmodule