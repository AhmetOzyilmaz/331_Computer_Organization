module mips_sign_extender(extended, in);

input [15:0] in;
output [31:0] extended;

assign extended[15:0] = in;
assign extended[31:16] = {16{in[15]}};

endmodule