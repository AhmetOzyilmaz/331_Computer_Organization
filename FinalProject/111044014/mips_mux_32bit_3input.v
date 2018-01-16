module mips_mux_32bit_3input(out, selector, inputa, inputb, inputc);

output [31:0] out;

input [1:0]  selector;
input [31:0] inputa, inputb, inputc;

assign out = selector == 2'b01 ? inputa : selector == 2'b10 ? inputc : inputb;

endmodule