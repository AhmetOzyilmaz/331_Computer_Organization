transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/project01.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/Mux4to1_5.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/Mux2to1_5.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/Mux2to1.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/HalfAdder.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/FullAdder.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/FivebitXor.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/FivebitOr.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/FivebitAnd.v}
vlog -vlog01compat -work work +incdir+D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit {D:/2017-2018/Organizasyon/Codes/331_Computer_organization/Hw1/homework1/edit/FiveBitAdder.v}

