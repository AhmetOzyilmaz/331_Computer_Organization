module mips_alu(Result, Zero, readData1, readData2, shamt, ALUCtr);

output [31:0] Result;
output        Zero;

input  [31:0] readData1;
input  [31:0] readData2; //after mux selection
input  [3:0]  ALUCtr;
input  [4:0]  shamt;

wire          overflowAdd;
wire          overflowSub;
wire          setLessThan;

wire   [31:0] readDataSum;
wire   [31:0] readDataSub;


assign readDataSum = readData1 + readData2;
assign readDataSub = readData1 - readData2;

assign overflowAdd = (readData1[31] == readData2[31] && readDataSum[31] != readData1[31]) ? 1'b1 : 1'b0;
assign overflowSub = (readData1[31] == readData2[31] && readDataSub[31] != readData1[31]) ? 1'b1 : 1'b0;

assign setLessThan = overflowSub ? ~(readData1[31]) : readData1[31];

assign Result   = ALUCtr == 4'b0010
					 ? readDataSum
					 : ALUCtr == 4'b0000
					 ? readData1 & readData2
					 : ALUCtr == 4'b0001
					 ? readData1 | readData2
					 : ALUCtr == 4'b1100
					 ? ~(readData1 | readData2)
					 : ALUCtr == 4'b0110
					 ? readDataSub
					 : ALUCtr == 4'b0111
					 ? {{31{1'b0}}, setLessThan}
					 : ALUCtr == 4'b0100
					 ? readData2 << shamt
					 : ALUCtr == 4'b0101
					 ? readData2 >> shamt
					 : 0;
					 
assign Zero = (Result == 0); 


endmodule