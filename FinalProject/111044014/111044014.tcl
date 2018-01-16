# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: 111044014.tcl
# Generated on: Wed Jan 03 16:29:01 2018

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "111044014"]} {
		puts "Project 111044014 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists 111044014]} {
		project_open -revision 111044014 111044014
	} else {
		project_new -revision 111044014 111044014
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone III"
	set_global_assignment -name DEVICE EP3C55F484C6
	set_global_assignment -name TOP_LEVEL_ENTITY mips_core
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 13.1
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "15:15:54  DECEMBER 23, 2017"
	set_global_assignment -name LAST_QUARTUS_VERSION 13.1
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (Verilog)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name VERILOG_FILE mips_testbench.v
	set_global_assignment -name VERILOG_FILE mips_sign_extender.v
	set_global_assignment -name VERILOG_FILE mips_registers.v
	set_global_assignment -name VERILOG_FILE mips_program_counter.v
	set_global_assignment -name VERILOG_FILE mips_mux_5bit_3input.v
	set_global_assignment -name VERILOG_FILE mips_mux_5bit.v
	set_global_assignment -name VERILOG_FILE mips_mux_32bit_4input.v
	set_global_assignment -name VERILOG_FILE mips_mux_32bit_3input.v
	set_global_assignment -name VERILOG_FILE mips_mux_32bit.v
	set_global_assignment -name VERILOG_FILE mips_load_word_halfword_byte_selector.v
	set_global_assignment -name VERILOG_FILE mips_instr_mem.v
	set_global_assignment -name VERILOG_FILE mips_data_mem.v
	set_global_assignment -name VERILOG_FILE mips_core.v
	set_global_assignment -name VERILOG_FILE mips_control.v
	set_global_assignment -name VERILOG_FILE mips_alu_control.v
	set_global_assignment -name VERILOG_FILE mips_alu.v
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
