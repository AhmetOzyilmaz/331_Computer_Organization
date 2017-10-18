module FivebitAnd(F,A,B);

	input [4:0] A,B;
	output[4:0] F;
	
	and and1(F[0],A[0],B[0]);
	and and2(F[1],A[1],B[1]);
	and and3(F[2],A[2],B[2]);
	and and4(F[3],A[3],B[3]);
	and and5(F[4],A[4],B[4]);
	
endmodule
