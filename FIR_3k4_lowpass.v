module FIR_3k4_lowpass (
    input clk_50M,
    input rst_n,
    input wire [7:0] adc_value,
    output     [7:0] dac_value,
    output wire adc_clk,
    output wire dac_clk
);

wire adc_clk_t;
wire [7:0]  dac_value_t;

assign adc_clk = adc_clk_t;
assign dac_clk=clk_50M;
assign dac_value=dac_value_t;


PLL_32M u_PLL_32M_0(
	.areset(~rst_n),
	.inclk0(clk_50M),
	.c0(adc_clk_t),
	.locked(locked)
);

FIR u_FIR_0(
    .clk(clk_50M),
    .rst_n(rst_n),
    .adc_value(adc_value),
    .lpf_data(dac_value_t)
);

endmodule
