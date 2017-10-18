module Fivebitor(F,A,B);

	input [4:0] A,B;
	output[4:0] F;
	
	or or1(F[0],A[0],B[0]);
	or or2(F[1],A[1],B[1]);
	or or3(F[2],A[2],B[2]);
	or or4(F[3],A[3],B[3]);
	or or5(F[4],A[4],B[4]);
	
endmodule
