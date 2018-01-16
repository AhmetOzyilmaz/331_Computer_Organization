module mips_registers( 
 read_data_1,
 read_data_2,
 write_data,
 read_reg_1, 
 read_reg_2, 
 write_reg, 
 signal_reg_write, 
 clk );

	output reg [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [0:31];
	
	initial begin
		$readmemh("reg.txt", registers);
	end
	
	always @ (posedge clk)
	begin
		read_data_1= registers[read_reg_1];
		read_data_2= registers[read_reg_2];
	end
	
	always @ (negedge clk)
	begin
		if(signal_reg_write) begin
			$display("write_reg:%d write_data:%b ",write_reg, write_data);	
			registers[write_reg] = write_data;
		end
	end
	
	
endmodule