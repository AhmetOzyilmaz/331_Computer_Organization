library verilog;
use verilog.vl_types.all;
entity Tmips_registers is
    port(
        A               : out    vl_logic_vector(31 downto 0)
    );
end Tmips_registers;
