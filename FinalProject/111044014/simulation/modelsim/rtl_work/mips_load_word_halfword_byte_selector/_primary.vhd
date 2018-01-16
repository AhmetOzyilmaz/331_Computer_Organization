library verilog;
use verilog.vl_types.all;
entity mips_load_word_halfword_byte_selector is
    port(
        selected        : out    vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        data            : in     vl_logic_vector(31 downto 0)
    );
end mips_load_word_halfword_byte_selector;
