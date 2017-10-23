module Mux4to1_5(
   input [4:0]in0,
   input [4:0]in1,
   input [4:0]in2,
   input [4:0]in3,
	input [1:0]sel, // select
	output [4:0]out);
	
	wire [4:0]w0, w1;
	
	Mux2to1_5 m1(in0, in1, sel[0], w0);
	Mux2to1_5 m2(in2, in3, sel[0], w1);
	Mux2to1_5 m3(w0, w1, sel[1], out);


endmodule
