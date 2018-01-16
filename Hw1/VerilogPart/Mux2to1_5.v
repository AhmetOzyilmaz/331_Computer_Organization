module Mux2to1_5(
	input [4:0]in1,
	input [4:0]in2,
	input sel,
	output [4:0]out);
	
	Mux2to1 m00(in1[0], in2[0], sel, out[0]);
	Mux2to1 m01(in1[1], in2[1], sel, out[1]);
	Mux2to1 m02(in1[2], in2[2], sel, out[2]);
	Mux2to1 m03(in1[3], in2[3], sel, out[3]);
	Mux2to1 m04(in1[4], in2[4], sel, out[4]);
	
endmodule