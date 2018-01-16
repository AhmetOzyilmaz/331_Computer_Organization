transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/mips_core.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/ALUModul.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/FullAdder.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/HalfAdder.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/Adder_32Bit.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2 {D:/2017-2018/Organizasyon/Projects/331_Computer_Organization/Hw2/mips_registers.v}

