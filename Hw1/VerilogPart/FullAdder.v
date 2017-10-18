module FullAdder(
	input in1, 
	input in2, 
	input cIn, 
	output cOut, 
	output sum);
	
	wire halfSum, carry1, carry2;
	
	HalfAdder ha1(in1, in2, carry1, halfSum);
	HalfAdder ha2(halfSum, cIn, carry2, sum);
	
	//assign cOut = carry1 | carry2;
	or(cOut, carry1, carry2);


endmodule