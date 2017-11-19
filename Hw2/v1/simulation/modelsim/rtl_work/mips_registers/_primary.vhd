library verilog;
use verilog.vl_types.all;
entity mips_registers is
    port(
        A               : out    vl_logic_vector(31 downto 0);
        B               : out    vl_logic_vector(31 downto 0);
        D               : in     vl_logic_vector(31 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        write_enable    : in     vl_logic;
        clk             : in     vl_logic
    );
end mips_registers;
