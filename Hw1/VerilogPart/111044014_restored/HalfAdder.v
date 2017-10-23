module HalfAdder(
input in1,
input in2, 
output cOut, 
output sum);
	
and(cOut, in1, in2);
xor(sum, in1, in2);
endmodule

