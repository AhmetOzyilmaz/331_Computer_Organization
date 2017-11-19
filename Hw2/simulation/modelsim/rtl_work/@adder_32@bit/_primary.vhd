library verilog;
use verilog.vl_types.all;
entity Adder_32Bit is
    port(
        sum             : out    vl_logic_vector(31 downto 0);
        cOut            : out    vl_logic;
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        cIn             : in     vl_logic
    );
end Adder_32Bit;
