module mips_core(instruction, result);

input [31:0] instruction;
output [31:0] result;

wire [4:0] read_reg1, read_reg2, write_data,Shamt;
wire [5:0] Funct;
wire signal_reg_write;
wire [31:0] A, B;
wire [31:0] Alu_Result;
wire CarryOut,Zero,OverFlow;
reg clk;
// Rtpe 6 op - 5rs -5rt-5rd- 5shamt 6function field 
//  
//
//
// control unit 
	
	assign read_reg1 = instruction[25:21];
	assign read_reg2 = instruction[20:16];
	assign write_data = instruction[15:11];
	assign Shamt   = instruction[10:6];
	assign Funct   = instruction[5:0];
	

	ALUModul alu(Funct,Shamt,A,B,Alu_Result,carryOut,Zero,overFlow);
	
	mips_registers Mreg( A, B, Alu_Result, read_reg1, read_reg2,  write_data,  signal_reg_write,  clk );

	assign result = Alu_Result;
	
endmodule