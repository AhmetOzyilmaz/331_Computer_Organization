library verilog;
use verilog.vl_types.all;
entity FivebitAnd is
    port(
        F               : out    vl_logic_vector(4 downto 0);
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0)
    );
end FivebitAnd;
