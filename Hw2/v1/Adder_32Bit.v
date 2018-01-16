module Adder_32Bit(
	output [31:0] sum,
	output cOut,
	input [31:0]in1,
	input [31:0]in2, 
	input cIn
	);
	
	wire [31:0]tmpCarry; //inside carry
	
	FullAdder a1( in1[0], in2[0], cIn, tmpCarry[0],sum[0]);
	FullAdder a2( in1[1], in2[1], tmpCarry[0], tmpCarry[1],sum[1]);
	FullAdder a3( in1[2], in2[2], tmpCarry[1], tmpCarry[2],sum[2]);
	FullAdder a4( in1[3], in2[3], tmpCarry[2], tmpCarry[3],sum[3]);
	FullAdder a5( in1[4], in2[4], tmpCarry[3], tmpCarry[4],sum[4]);
	FullAdder a6( in1[5], in2[5], tmpCarry[4], tmpCarry[5],sum[5]);
	FullAdder a7( in1[6], in2[6], tmpCarry[5], tmpCarry[6],sum[6]);
	FullAdder a8( in1[7], in2[7], tmpCarry[6], tmpCarry[7],sum[7]);
	FullAdder a9( in1[8], in2[8], tmpCarry[7], tmpCarry[8],sum[8]);
	FullAdder a10( in1[9], in2[9], tmpCarry[8], tmpCarry[9],sum[9]);
	FullAdder a11( in1[10], in2[10], tmpCarry[9], tmpCarry[10],sum[10]);
	FullAdder a12( in1[11], in2[11], tmpCarry[10], tmpCarry[11],sum[11]);
	FullAdder a13( in1[12], in2[12], tmpCarry[11], tmpCarry[12],sum[12]);
	FullAdder a14( in1[13], in2[13], tmpCarry[12], tmpCarry[13],sum[13]);
	FullAdder a15( in1[14], in2[14], tmpCarry[13], tmpCarry[14],sum[14]);
	FullAdder a16( in1[15], in2[15], tmpCarry[14], tmpCarry[15],sum[15]);
	FullAdder a17( in1[16], in2[16], tmpCarry[15], tmpCarry[16],sum[16]);
	FullAdder a18( in1[17], in2[17], tmpCarry[16], tmpCarry[17],sum[17]);
	FullAdder a19( in1[18], in2[18], tmpCarry[17], tmpCarry[18],sum[18]);
	FullAdder a20( in1[19], in2[19], tmpCarry[18], tmpCarry[19],sum[19]);
	FullAdder a21( in1[20], in2[20], tmpCarry[19], tmpCarry[20],sum[20]);
	FullAdder a22( in1[21], in2[21], tmpCarry[20], tmpCarry[21],sum[21]);
	FullAdder a23( in1[22], in2[22], tmpCarry[21], tmpCarry[22],sum[22]);
	FullAdder a24( in1[23], in2[23], tmpCarry[22], tmpCarry[23],sum[23]);
	FullAdder a25( in1[24], in2[24], tmpCarry[23], tmpCarry[24],sum[24]);
	FullAdder a26( in1[25], in2[25], tmpCarry[24], tmpCarry[25],sum[25]);
	FullAdder a27( in1[26], in2[26], tmpCarry[25], tmpCarry[26],sum[26]);
	FullAdder a28( in1[27], in2[27], tmpCarry[26], tmpCarry[27],sum[27]);
	FullAdder a29( in1[28], in2[28], tmpCarry[27], tmpCarry[28],sum[28]);
	FullAdder a30( in1[29], in2[29], tmpCarry[28], tmpCarry[29],sum[29]);
	FullAdder a31( in1[30], in2[30], tmpCarry[29], tmpCarry[30],sum[30]);
	FullAdder a32( in1[31], in2[31], tmpCarry[30], cOut,sum[31]);
		
endmodule
