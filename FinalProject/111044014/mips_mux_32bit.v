module mips_mux_32bit(out, selector, inputa, inputb);

output [31:0] out;

input selector;
input [31:0] inputa, inputb;

assign out = selector == 1'b1 ? inputa : inputb;

endmodule