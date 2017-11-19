module Substract_32Bit(
	output [31:0] out,
	input [31:0] in1,
	input [31:0] in2
	);
	
	wire [31:0]tmp, pure;
	wire cOut, PG, GG;
	wire cIn;
	
	or or1 ( pure[0],1);
	or or2 ( pure[1],1);
	or or3 ( pure[2],1);
	or or4 ( pure[3],1);
	or or5 ( pure[4],1);
	or or6 ( pure[5],1);
	or or7 ( pure[6],1);
	or or8 ( pure[7],1);
	or or9 ( pure[8],1);
	or or10 ( pure[9],1);
	or or11 ( pure[10],1);
	or or12 ( pure[11],1);
	or or13 ( pure[12],1);
	or or14 ( pure[13],1);
	or or15 ( pure[14],1);
	or or16 ( pure[15],1);
	or or17 ( pure[16],1);
	or or18 ( pure[17],1);
	or or19 ( pure[18],1);
	or or20 ( pure[19],1);
	or or21 ( pure[20],1);
	or or22 ( pure[21],1);
	or or23 ( pure[22],1);
	or or24 ( pure[23],1);
	or or25 ( pure[24],1);
	or or26 ( pure[25],1);
	or or27 ( pure[26],1);
	or or28 ( pure[27],1);
	or or29 ( pure[28],1);
	or or30 ( pure[29],1);
	or or31 ( pure[30],1);
	or or32 ( pure[31],1);
	
	Xor32 xor1(in2, pure, tmp);
	
	CarryLookAheadAdder32 cla(in1, tmp, 1, cOut, PG, GG, out);

endmodule
