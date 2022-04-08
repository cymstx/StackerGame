set projDir "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/vivado"
set projName "manual"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/au_top_0.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/reset_conditioner_1.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/multi_seven_seg_2.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/game_beta_3.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/edge_detector_4.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/button_conditioner_5.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/counter_6.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/seven_seg_7.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/decoder_8.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/alu_9.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/game_CU_10.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/game_miniRegfiles_11.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/counter_12.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/pipeline_13.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/adder_14.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/boolean_15.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/shifter_16.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/compare_17.v" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/verilog/sixteen_bit_multiplier_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/constraint/alchitry.xdc" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/work/constraint/io.xdc" "C:/Users/KM/Documents/Alchitry/stacker/StackerGame/alusubmission-main/manual/constraint/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
