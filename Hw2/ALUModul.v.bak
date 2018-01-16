module ALUModul(
	input [5:0] Funct,
	input [4:0] Shamt,
	input [31:0] Rs,Rt,
	output [31:0] Result,
	output carryOut,Zero,overFlow);
	
	wire notOverFlow;
	wire [31:0] Add,Sub,And,Or,Sra,Srl,Sll,Sllv;
	wire tempAnd;
	wire overFlowAdd,overFlowSub,Slt;
	//	assign {carryOut,Add} = Rs + Rt;
	Adder_32Bit(Add,carryOut,Rs,Rt,0);
	//assign Sub = Rs - Rt;
	Substract_32Bit(Sub,Rs,Rt);
	assign overFlowAdd = ((Rs[31] == Rt[31]) && (Add[31] != Rs[31])) ? 1 : 0;
	assign overFlowSub = ((Rs[31] == Rt[31]) && (Sub[31] != Rs[31])) ? 1 : 0;
	
	assign overFlow = (Funct == 6'b100000) ? overFlowAdd : overFlowSub;
	//assign And = Rs & Rt;
	and and1(And,Rs,Rt);
	//assign Or  = Rs | Rt;
	or or1(Or,Rs,Rt);
	
	assign Srl = Rt >> Shamt;
	assign Sll = Rt << Shamt;
	assign Sllv= Rt << Rs;
		
	assign Slt = overFlowSub ? ~(Rs[31]) : Rs[31];
	//sra negatif sayilardada soldan 0 koyuyor bunu duzeltmek icin
	shiftRA SRA(Rt,Shamt,Sra);
	
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