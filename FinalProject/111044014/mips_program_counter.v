module mips_program_counter(newPC, oldPC, branchAddress);

input  [31:0]  oldPC;
input  [31:0] branchAddress;

output [31:0]  newPC;

assign newPC = branchAddress == 0 ? oldPC + 1 : branchAddress;

endmodule