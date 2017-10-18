library verilog;
use verilog.vl_types.all;
entity HalfAdder is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        cOut            : out    vl_logic;
        sum             : out    vl_logic
    );
end HalfAdder;
