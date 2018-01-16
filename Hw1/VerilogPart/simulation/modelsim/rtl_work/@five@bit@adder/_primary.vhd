library verilog;
use verilog.vl_types.all;
entity FiveBitAdder is
    port(
        sum             : out    vl_logic_vector(4 downto 0);
        in1             : in     vl_logic_vector(4 downto 0);
        in2             : in     vl_logic_vector(4 downto 0);
        cIn             : in     vl_logic
    );
end FiveBitAdder;
