// Ege Turan
// 8/10/23, Stanford, CA
// 6, 8, 12, 17 commented out to turn into just the Transmitter code

module top (
	input MAX10_CLK1_50, rst, load,
	//input R0, R1, R2, R3, R4, R5, R6, R7, R8, R9,
	output demodulated, new_word //neg_demodulated,
	//output [6:0] HEX0, HEX1, HEX2, HEX3
	);
	
wire result_out, xor_result, clk;
// 10 bits given from deserializer must be routed to LEDs
//wire [15:0] decoded_word = {{6{1'b0}}, R9, R8, R7, R6, R5, R4, R3, R2, R1, R0};

fastpll pll_inst(.inclk0(MAX10_CLK1_50), .c0(clk));
modulator mod(clk, rst, load, result_out, new_word, xor_result);
assign demodulated = xor_result;
//x7segbAc disp(.x(decoded_word), .HX3(HEX3), .HX2(HEX2), .HX1(HEX1), .HX0(HEX0));

// LVDS requires negated output
//assign demodulated = ~neg_demodulated;

endmodule