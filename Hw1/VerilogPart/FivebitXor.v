module FivebitXor(F,A,B);

	input [4:0] A,B;
	output[4:0] F;
	
	xor xor1(F[0],A[0],B[0]);
	xor xor2(F[1],A[1],B[1]);
	xor xor3(F[2],A[2],B[2]);
	xor xor4(F[3],A[3],B[3]);
	xor xor5(F[4],A[4],B[4]);
	
endmodule
