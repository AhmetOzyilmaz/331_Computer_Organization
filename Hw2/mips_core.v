module mips_core(instruction, result);

input [31:0] instruction;
output [31:0] result;

reg [31:0] write_data;
wire [4:0] read_rs, read_rt, write_rd,Shamt;
wire [5:0] Funct;
wire signal_reg_write, clk;
wire [31:0] A, B;
wire [31:0] Alu_Result;
wire CarryOut,Zero,OverFlow;

// Rtpe 6 op - 5rs -5rt-5rd- 5shamt 6function field 
//  
//
//
// control unit 
	assign clk = 0;
	assign overFlow = 0;
	assign Zero = 0;
	assign carryOut = 0;
	
	assign read_rs = instruction[25:21];
	assign read_rt = instruction[20:16];
	assign read_rd = instruction[15:11];
	assign Shamt   = instruction[10:6];
	assign Funct   = instruction[5:0];
	

	ALUModul(Funct,Shamt,A,B,Alu_Result,carryOut,Zero,overFlow);
	
	mips_registers( A, B, Alu_Result, read_rs, read_rt,  write_rd,  signal_reg_write,  clk );

	assign result = Alu_Result;
	
endmodule