library verilog;
use verilog.vl_types.all;
entity mips_alu is
    port(
        Result          : out    vl_logic_vector(31 downto 0);
        Zero            : out    vl_logic;
        readData1       : in     vl_logic_vector(31 downto 0);
        readData2       : in     vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        ALUCtr          : in     vl_logic_vector(3 downto 0)
    );
end mips_alu;
