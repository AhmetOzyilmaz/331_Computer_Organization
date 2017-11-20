module mips_core(input [31:0]instruction, output[31:0] result);
reg [5:0] opcode,funct;
reg [4:0] rs,rt,rd,shamt;
wire carryOut,zero,overFlow;
reg signal_reg_write = 0;
wire [31:0] RSvalue,RTvalue;
reg clk;
// Rtpe 6 op - 5rs -5rt-5rd- 5shamt 6function field 
//  
//
//
// control unit 
		
	mips_registers Mreg( RSvalue, RTvalue, result, rs, rt,  rd,  signal_reg_write,  clk );

	ALUModul alu(funct,shamt,RSvalue,RTvalue,result,carryOut,zero,overFlow);

	initial begin
		clk= 0;
	end

	always @ (instruction)
	begin	
		$display("instruction:%b",instruction);
		{opcode,rs,rt,rd,shamt,funct} = instruction;	
		signal_reg_write = 1;
		#10;
		$display("opcode:%b,rs:%b,rt:%b,rd:%b,shamt:%b,funct:%b",opcode,rs,rt,rd,shamt,funct);		
		$display("result:%b",result);	
	end
		
	always
	begin	
		clk = !clk;
		#2;
	end
		
endmodule