module ALUModul(
	input [5:0] Funct,
	input [4:0] Shamt,
	input [31:0] A,B,
	output [31:0] Result,
	output carryOut,Zero,overFlow);
	
	wire notOverFlow;
	wire [31:0] Add,Sub,And,Or,Sra,Srl,Sll,Sllv;
	wire tempAnd;
	wire overFlowAdd,overFlowSub,Slt;
	
	assign {carryOut,Add} = A + B;

	assign Sub = A - B;
	
	assign overFlowAdd = ((A[31] == B[31]) && (Add[31] != A[31])) ? 1 : 0;
	assign overFlowSub = ((A[31] == B[31]) && (Sub[31] != A[31])) ? 1 : 0;
	
	assign overFlow = (Funct == 6'b100000) ? overFlowAdd : overFlowSub;
	
	assign And = A & B;
	assign Or  = A | B;
	
	assign Srl = B >> Shamt;
	assign Sll = B << Shamt;
	assign Sllv= B << A;
		
	assign Slt = overFlowSub ? ~(A[31]) : A[31];
	assign Sra = A >> Shamt;
	assign Result = (Funct == 6'b000000) ? Sll ://sll
	(Funct == 6'b000010) ? Srl ://srl
	(Funct == 6'b000011) ? Sra ://sra
	(Funct == 6'b000100) ? Sllv ://sllv
	(Funct == 6'b100000) ? Add ://add
	(Funct == 6'b100010) ? Sub ://sub
	(Funct == 6'b100100) ? And ://and
	(Funct == 6'b100101) ? Or ://or
	(Funct == 6'b101010) ? {{31{1'b0}}, Slt} : 32'hx;	
	
	assign Zero = (Result == 0);
	
endmodule