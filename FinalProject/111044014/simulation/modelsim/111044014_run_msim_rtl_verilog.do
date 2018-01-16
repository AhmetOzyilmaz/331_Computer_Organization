transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_sign_extender.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_program_counter.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_mux_5bit_3input.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_mux_32bit_4input.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_mux_32bit.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_load_word_halfword_byte_selector.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_core.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_control.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_alu_control.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_alu.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_registers.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_instr_mem.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/FinalProject/Upload/111044014/mips_data_mem.v}

