module Tmips_registers (A);

	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	
	reg [31:0] D;	
	
	reg write_enable;
	reg clk;
	
	output [31:0] A;
	wire [31:0] B;
	
	mips_registers registers(A, B, D, rs, rt, rd, write_enable, clk);
	

	
	initial begin
		rs= 5'b00000;
		rt= 5'b00000;
		rd= 5'b00000;
		
		D=32'b00000000000000000000000000000000;
		
		write_enable= 0;
		clk= 0;
	end
	
	initial begin
		#10
		
		rs= 5'b00000;
		rt= 5'b00001;
		#10
		$display("A:%b,B:%b; rs:%b, rt:%b, rd:%b" ,A, B, rs, rt, rd);
		
		
		rs= 5'b00001;
		rt= 5'b00000;
		#10
		$display("A:%b,B:%b; rs:%b, rt:%b, rd:%b" ,A, B, rs, rt, rd);
		
		
		rs= 5'b00001;
		rt= 5'b00001;
		#10
		$display("A:%b,B:%b; rs:%b, rt:%b, rd:%b" ,A, B, rs, rt, rd);
		
		
		// write test
		rd= 5'b00000;
		write_enable= 1;
		D=32'b11000000000000000000000001010101;
		#10
		$display("D:%b, rd:%b, write_enable:%b" , D, rd, write_enable);
		
		// readback
		rs= 5'b00000;
		write_enable= 0;
		#10
		$display("A:%b, rs:%b" ,A, rs);
	end
	
	always
		#5 clk = !clk;
	
endmodule
