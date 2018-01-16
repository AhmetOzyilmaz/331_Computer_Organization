library verilog;
use verilog.vl_types.all;
entity mips_control is
    port(
        RegDest         : out    vl_logic_vector(1 downto 0);
        Branch          : out    vl_logic;
        Jump            : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic_vector(1 downto 0);
        ALUOp           : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        fcode           : in     vl_logic_vector(5 downto 0)
    );
end mips_control;
