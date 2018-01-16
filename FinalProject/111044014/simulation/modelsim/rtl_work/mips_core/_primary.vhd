library verilog;
use verilog.vl_types.all;
entity mips_core is
    port(
        ResultOut       : out    vl_logic_vector(31 downto 0);
        pcOut           : out    vl_logic_vector(31 downto 0);
        pcIn            : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end mips_core;
