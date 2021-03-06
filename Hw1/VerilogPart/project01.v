module  project01 (R, A, B,S);
output [4:0]R;
input [4:0]A;
input [4:0]B;
input [1:0]S;

wire [4:0]andResult;
wire [4:0]orResult;
wire [4:0]xorResult;
wire [4:0]addResult;

FiveBitAdder adder(addResult,A,B,0);
FivebitXor xorer(xorResult,A,B);
FivebitAnd andorer(andResult,A,B);
Fivebitor  orar(orResult,A,B);

Mux4to1_5 mf(andResult,addResult,orResult,xorResult,S,R);

endmodule