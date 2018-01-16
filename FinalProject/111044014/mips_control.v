module mips_control(RegDest, Branch, Jump, MemRead, MemtoReg, 
ALUOp, MemWrite, ALUSrc, RegWrite, opcode, fcode);

input [5:0] opcode, fcode;
output [1:0] RegDest, MemtoReg;
output Branch, Jump, MemRead, MemWrite, ALUSrc, RegWrite;
output [1:0] ALUOp;

assign RegDest  = opcode == 6'b000000 ? 2'b01 : opcode == 6'b000011 ? 2'b10 : 2'b00; 
//need check
assign Branch   = opcode == 6'b000100 ? 1'b1 : 1'b0;
assign Jump     = opcode == 6'b000010 || opcode == 6'b000011 ? 1'b1 : 1'b0;
assign MemRead  = opcode == 6'b100011    //lw
						|| opcode == 6'b100100 //lbu
						|| opcode == 6'b100101 //lhu
						? 1'b1 : 1'b0;
assign MemtoReg = opcode == 6'b100011    //lw
						|| opcode == 6'b100100 //lbu
						|| opcode == 6'b100101 //lhu
						? 2'b01 
						: opcode == 6'b000011 //jal 
						? 2'b10 
						: opcode == 6'b001111 //lui
						? 2'b11 
						: 2'b00; //others
assign MemWrite = opcode == 6'b101011 ? 1'b1 : 1'b0;
assign ALUSrc   = opcode == 6'b100011 //lw
						|| opcode == 6'b100100 //lbu
						|| opcode == 6'b100101 //lhu
						|| opcode == 6'b101011 //sw
						|| opcode == 6'b001000 //addi
						|| opcode == 6'b001001 //addiu
						|| opcode == 6'b001100 //andi
						|| opcode == 6'b001101 //ori
						|| opcode == 6'b001010 //slti
						|| opcode == 6'b001011 //sltiu
						? 1'b1 : 1'b0;
assign RegWrite = opcode == 6'b000000 
						|| opcode == 6'b100011 //lw
						|| opcode == 6'b100100 //lbu
						|| opcode == 6'b100101 //lhu
						|| opcode == 6'b001000 //addi
						|| opcode == 6'b001001 //addiu
						|| opcode == 6'b001100 //andi
						|| opcode == 6'b001101 //ori
						|| opcode == 6'b001111 //lui
						|| (opcode == 6'b000000 && fcode == 6'b000000) //sll
						|| (opcode == 6'b000000 && fcode == 6'b000010) //srl
						|| opcode == 6'b001010 //slti
						|| opcode == 6'b001011 //sltiu
						? 1'b1 : 1'b0;

assign ALUOp    = opcode == 6'b000000 //R-Type
						? 2'b10
						: opcode == 6'b100011 //LW
						  || opcode == 6'b100100 //LBU
						  || opcode == 6'b100101 //LHU
						? 2'b00
						: opcode == 6'b101011 //SW
						? 2'b00
						: opcode == 6'b000100 //BEQ
						  || opcode == 6'b000010 //J
						? 2'b01
						: 2'b10; //Possibly arithmetic ?

endmodule