library verilog;
use verilog.vl_types.all;
entity mips_mux_32bit_3input is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        selector        : in     vl_logic_vector(1 downto 0);
        inputa          : in     vl_logic_vector(31 downto 0);
        inputb          : in     vl_logic_vector(31 downto 0);
        inputc          : in     vl_logic_vector(31 downto 0)
    );
end mips_mux_32bit_3input;
