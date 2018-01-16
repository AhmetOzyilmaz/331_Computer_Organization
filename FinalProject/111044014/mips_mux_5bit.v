module mips_mux_5bit(out, selector, inputa, inputb);

output [4:0] out;

input selector;
input [4:0] inputa, inputb;

assign out = selector == 1'b1 ? inputa : inputb;

endmodule