library verilog;
use verilog.vl_types.all;
entity mips_alu_control is
    port(
        ALUControl      : out    vl_logic_vector(3 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0)
    );
end mips_alu_control;
