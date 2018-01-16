library verilog;
use verilog.vl_types.all;
entity mips_program_counter is
    port(
        newPC           : out    vl_logic_vector(31 downto 0);
        oldPC           : in     vl_logic_vector(31 downto 0);
        branchAddress   : in     vl_logic_vector(31 downto 0)
    );
end mips_program_counter;
