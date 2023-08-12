module modulator (
	input clk, rst, load,
	output result_out,
	output new_word,
	output xor_result);

	
wire passed_bit;
wire [11:0] word;

lfsr l1 (.outbit(passed_bit), .clk(clk), .rst(rst), .load(load));
// to be updated with a shift register strcuture (case 0 and case 11).
word_generator wg1(.inbit(passed_bit), .clk(clk), .new_word(new_word), .finished_word(word));	
xor_word x1(.word(word), .receive_word(new_word), .clk(clk), .result_out(result_out), .xor_result(xor_result));

endmodule