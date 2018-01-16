library verilog;
use verilog.vl_types.all;
entity mips_sign_extender is
    port(
        extended        : out    vl_logic_vector(31 downto 0);
        \in\            : in     vl_logic_vector(15 downto 0)
    );
end mips_sign_extender;
