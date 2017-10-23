module FiveBitAdder(
	output [4:0] sum,
	input [4:0]in1,
	input [4:0]in2, 
	input cIn
	);
	
	wire [4:0]tmpCarry; //inside carry
	
	FullAdder a1( in1[0], in2[0], cIn, tmpCarry[0],sum[0]);
	FullAdder a2( in1[1], in2[1], tmpCarry[0], tmpCarry[1],sum[1]);
	FullAdder a3( in1[2], in2[2], tmpCarry[1], tmpCarry[2],sum[2]);
	FullAdder a4( in1[3], in2[3], tmpCarry[2], tmpCarry[3],sum[3]);
	FullAdder a5( in1[4], in2[4], tmpCarry[3], tmpCarry[4],sum[4]);


endmodule
