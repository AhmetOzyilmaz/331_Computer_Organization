module mips_mux_32bit_4input(out, selector, inputa, inputb, inputc, inputd);

output [31:0] out;

input [1:0]  selector;
input [31:0] inputa, inputb, inputc, inputd;

assign out = selector == 2'b01 ? inputa : selector == 2'b10 ? inputc : selector == 2'b11 ? inputd : inputb;

endmodule