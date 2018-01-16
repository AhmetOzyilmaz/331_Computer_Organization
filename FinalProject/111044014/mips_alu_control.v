module mips_alu_control(ALUControl, opcode, ALUOp);
input [5:0] opcode;
input [1:0] ALUOp;
output [3:0] ALUControl;
wire   [3:0] tempAluControl;
assign tempAluControl = opcode == 6'b100000 //add
								|| opcode == 6'b100001 //addu
								|| opcode == 6'b001000 //addi
								|| opcode == 6'b001001 //addiu
								? 4'b0010
								: opcode == 6'b100010  //sub
								|| opcode == 6'b100011 //subu
								? 4'b0110
								: opcode == 6'b100100 //and
								? 4'b0000
								: opcode == 6'b100101 //or
								? 4'b0001
								: opcode == 6'b101010 //slt
								|| opcode == 6'b001010 //slti
								|| opcode == 6'b001011 //sltiu
								|| opcode == 6'b101011 //sltu
								? 4'b0111
								: opcode == 6'b000000 //sll
								? 4'b0100
								: opcode == 6'b000010 //srl
								? 4'b0101
								: opcode == 6'b100111 //nor
								? 4'b1100
								: opcode == 6'b001100 //andi
								? 4'b0000
								: opcode == 6'b001101 //ori
								? 4'b0001
								: 4'bxxxx;
								

assign ALUControl = ALUOp == 2'b00
						 ? 4'b0010
						 : ALUOp == 2'b01
						 ? 4'b0110
						 : ALUOp == 2'b10
						 ? tempAluControl
						 : 4'bxxxx;

endmodule