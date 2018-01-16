module mips_testbench ();

reg [31:0] instruction_set;
wire[31:0] result;

mips_core topModul( instruction_set, result);

initial begin
		$readmemh("reg.txt", topModul.Mreg.registers);
		#0;
		
		instruction_set=32'b00000000000000111101000011100000;//add
		#10;
		
		instruction_set=32'b00000000001000111011100011000010;//sub
		#10;
		
		instruction_set=32'b00000000101001111110000011100000;//add
		#10;
		
		instruction_set=32'b00000000110001111110100011000010;//sub
		#10;
		
		instruction_set=32'b00000000011001111111000011100101;//or
		#10;
		
		instruction_set=32'b00000001100000000111100011100100;//and
		#10;
		
		instruction_set=32'b00000000101001001111100011101010;//slt
		#10;
		
		instruction_set=32'b00000000111010001111100011000011;//sra
		#10;
		
		instruction_set=32'b00000001000010011111100011000010;//srl
		#10;
		
		instruction_set=32'b00000001001100101111100011000000;//sll
		#10;
		
		instruction_set=32'b00000001011000110111100011000100;//sllv
		#10;
		
		instruction_set=32'b00000001011110110111100011101010;//slt
		#10;
		
		$writememh("memory_hex.txt", topModul.Mreg.registers);
		#10;		
		
end

endmodule