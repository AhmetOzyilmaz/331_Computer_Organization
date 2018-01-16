module mips_registers( 
 A,
 B,
 D,
 rs, 
 rt, 
 rd, 
 write_enable, 
 clk );

	output reg [31:0] A, B;
	input [31:0] D;
	input [4:0] rs, rt, rd;
	input write_enable, clk;
	
	reg [31:0] registers [0:31];
	
	initial begin
		$readmemh("reg.txt", registers);
	end
	
	always @ (posedge clk)
	begin
		A= registers[rs];
		B= registers[rt];
	end
	
	always @ (negedge clk)
	begin
		if(write_enable) begin
			registers[rd] = D;
		end
	end
	
	
endmodule