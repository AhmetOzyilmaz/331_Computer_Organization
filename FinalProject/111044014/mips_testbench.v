module mips_testbench;

reg clock;
reg [31:0] pcIn;
wire [31:0] pcOut;
wire [31:0] result;
mips_core mipsCore(result, pcOut, pcIn, clock);

initial begin
	pcIn = {32{1'b0}};
end

initial begin
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
		clock = 1'b0;
		pcIn = pcOut;
		$display("Result: %d\n", result);
	#100
	$finish;
end
endmodule