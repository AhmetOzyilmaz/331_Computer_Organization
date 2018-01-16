library verilog;
use verilog.vl_types.all;
entity Mux2to1_5 is
    port(
        in1             : in     vl_logic_vector(4 downto 0);
        in2             : in     vl_logic_vector(4 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end Mux2to1_5;
