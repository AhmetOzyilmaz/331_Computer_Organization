module Mux2to1(
	input in1,
	input in2,
	input sel, // select
	output out);
		
	wire w1, w2, w3;
	
	not(w1, sel);
	and(w2, w1, in1);
	and(w3, sel, in2);
	or(out, w2, w3);
	
endmodule

