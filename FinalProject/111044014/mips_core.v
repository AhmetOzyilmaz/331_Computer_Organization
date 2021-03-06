module mips_core(ResultOut, pcOut, pcIn, clock);

input clock;
output [31:0] pcOut;
input  [31:0] pcIn;
wire   [31:0] pc;
output [31:0] ResultOut;

assign pc = pcIn;

// Read next instruction
wire [31:0] instruction;
mips_instr_mem instructionMemory(instruction, pc);


// Split instruction
wire [5:0]  opcode;
wire [4:0]  rs;
wire [4:0]  rt;
wire [4:0]  rd;
wire [4:0]  shamt;
wire [5:0]  fcode;
wire [15:0] imm;
wire [25:0] jump;

assign opcode = instruction[31:26];
assign rs     = instruction[25:21];
assign rt     = instruction[20:16];
assign rd     = instruction[15:11];
assign shamt  = instruction[10:6];
assign fcode  = instruction[5:0];
assign imm    = instruction[15:0];
assign jump   = instruction[25:0];


wire [1:0] RegDest;
wire       Branch;
wire       Jump;
wire       MemRead;
wire [1:0] MemtoReg;
wire       MemWrite;
wire       ALUSrc;
wire       RegWrite;
wire [1:0] ALUOp;


// Set Control Bits
mips_control controlUnit(RegDest, Branch, Jump, MemRead, 
MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, opcode, fcode);

// Select Write Register
wire [4:0] instructionMuxOutput;
//mips_mux_5bit instructionMux(instructionMuxOutput, RegDest, rd, rt);
mips_mux_5bit_3input instructionMux(instructionMuxOutput, RegDest, rd, rt, 5'b11111); //31 for jal


// Read Register Data
wire [31:0] readData1;
wire [31:0] readData2;
mips_registers registerUnit(readData1, readData2, 0, rs, rt, instructionMuxOutput, 1'b0, 1'b1);


// Sign Extend
wire [31:0] signExtImm;
mips_sign_extender signExtender(signExtImm, imm);

// Shift Left 2
wire [31:0] shiftedSignExtImm;
assign shiftedSignExtImm = signExtImm << 2;


// ALU Control
wire [3:0] ALUControl;
wire [5:0] aluCtrOpCode;
assign aluCtrOpCode = opcode == 6'b000000 ? instruction[5:0] : opcode;
mips_alu_control ALUCtr(ALUControl, aluCtrOpCode, ALUOp);

// Select between readData2 and immediate
wire [31:0] readDataOrImmMuxOutput; 
mips_mux_32bit readDataOrImmMux(readDataOrImmMuxOutput, ALUSrc, signExtImm, readData2);

// Program Counter
wire [31:0] newPC; //new Program Counter
mips_program_counter programCounter1(newPC, pc, 0); //first pc -> newPC

// Add program counter with left shifted immediate part
wire [31:0] leftShiftedImmPlusPC;
assign leftShiftedImmPlusPC = newPC + shiftedSignExtImm; //programCounter -> newPC

// Get ALU results
wire        Zero;
wire [31:0] Result;

mips_alu ALU(Result, Zero, readData1, readDataOrImmMuxOutput, shamt, ALUControl);

// Perfom and operation on Branch and Zero
wire branchZeroAndResult;
and branchZeroAnd(branchZeroAndResult, Branch, Zero);

// Memory
wire [31:0] readMemoryData;
mips_data_mem dataMemory(readMemoryData, Result, readData2, MemRead, MemWrite);

// Mux After Memory
wire [31:0] readMemoryDataMuxResult;
//mips_mux_32bit readMemoryDataMux(readMemoryDataMuxResult, MemtoReg, readMemoryData, Result);
wire [31:0] leftShiftedImmBy16Bit;
assign leftShiftedImmBy16Bit = imm << 16; //for lui
mips_mux_32bit_4input readMemoryDataMux(readMemoryDataMuxResult, MemtoReg, readMemoryData, Result, newPC, leftShiftedImmBy16Bit);

// Control for lw, lbu, lhu
wire [31:0] loadInstructionResult;
mips_load_word_halfword_byte_selector loadInstructionSelector(loadInstructionResult, opcode, readMemoryDataMuxResult);

// Send memory data mux result to register unit for writing
wire [31:0] temp1, temp2;
mips_registers registerUnitForWriting(temp1, temp2, loadInstructionResult, {5{1'b0}}, {5{1'b0}}, instructionMuxOutput, RegWrite, 1'b1);

//Jump
wire [27:0] leftShiftedJump;
assign leftShiftedJump = jump << 0;

wire [31:0] jumpAddress;
assign jumpAddress[31:28] = newPC[31:28];
assign jumpAddress[27:0]  = leftShiftedJump;

// Branch and-mux
wire [31:0] branchAndMuxResult;
mips_mux_32bit branchAndMux(branchAndMuxResult, branchZeroAndResult, leftShiftedImmPlusPC, newPC);

//Branch or Jump or PC+4
wire [31:0] finalPCAddress;
mips_mux_32bit branchOrJumpOrPCMux(finalPCAddress, Jump, jumpAddress, branchAndMuxResult);

assign ResultOut = readMemoryDataMuxResult;
assign pcOut = finalPCAddress;

endmodule