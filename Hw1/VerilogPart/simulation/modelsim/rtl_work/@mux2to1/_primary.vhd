library verilog;
use verilog.vl_types.all;
entity Mux2to1 is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        sel             : in     vl_logic;
        \out\           : out    vl_logic
    );
end Mux2to1;
