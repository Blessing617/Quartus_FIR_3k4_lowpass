module FIR(
	input	wire			clk,
	input	wire			rst_n,
    input   wire  	[7:0]   adc_value,
	output  reg		[7:0]	lpf_data
);

reg	[9:0] cnt;
reg		  fs_pulse;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 10'd0;
	else if(cnt == 10'd249)
		cnt <= 10'd0;
	else
		cnt <= cnt + 1'b1;
end

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		fs_pulse <= 1'b0;
	else if(cnt == 10'd249)
		fs_pulse <= 1'b1;
	else
		fs_pulse <= 1'b0;
end

wire	[28:0]	lpf_datar;
wire			lpf_valid;
wire	[1:0]	lpf_error;

fir_3k4 u_fir_3k4_0 (
		.clk(clk),
		.reset_n(rst_n),
		.ast_sink_data(adc_value),
		.ast_sink_valid(fs_pulse),
		.ast_sink_error(2'd0),
		.ast_source_data(lpf_datar),
		.ast_source_valid(lpf_valid),
		.ast_source_error(lpf_error)
	);

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		lpf_data <= 29'b0;
	else if(fs_pulse == 1'b1)
		lpf_data <= {lpf_datar[28],lpf_datar[19:13]}+8'b10000000;//在valid信号有效的时候才输出数据

end

endmodule
