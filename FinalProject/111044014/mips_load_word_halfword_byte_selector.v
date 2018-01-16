module mips_load_word_halfword_byte_selector(selected, opcode, data);

output [31:0] selected;
input  [31:0] data;
input  [5:0]  opcode;

wire [31:0] lw, lhu, lbu;

wire [15:0] lbuDataTemp;

assign lbuDataTemp[15:8] = {8{data[7]}};
assign lbuDataTemp[7:0]  = data[7:0];

assign lw  = data;
mips_sign_extender lhuExtender(lhu, data[15:0]);
mips_sign_extender lbuExtender(lbu, lbuDataTemp);

assign selected = opcode == 6'b100011
						? lw
						: opcode == 6'b100101
						? lhu
						: opcode == 6'b100100
						? lbu
						: data;

endmodule