library verilog;
use verilog.vl_types.all;
entity Mux4to1_5 is
    port(
        in0             : in     vl_logic_vector(4 downto 0);
        in1             : in     vl_logic_vector(4 downto 0);
        in2             : in     vl_logic_vector(4 downto 0);
        in3             : in     vl_logic_vector(4 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end Mux4to1_5;
