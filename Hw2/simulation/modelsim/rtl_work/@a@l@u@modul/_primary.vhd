library verilog;
use verilog.vl_types.all;
entity ALUModul is
    port(
        Funct           : in     vl_logic_vector(5 downto 0);
        Shamt           : in     vl_logic_vector(4 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Result          : out    vl_logic_vector(31 downto 0);
        carryOut        : out    vl_logic;
        Zero            : out    vl_logic;
        overFlow        : out    vl_logic
    );
end ALUModul;
