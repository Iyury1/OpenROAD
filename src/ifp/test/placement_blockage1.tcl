# placement blockage
source "helpers.tcl"
read_lef Nangate45/Nangate45.lef
read_liberty Nangate45/Nangate45_typ.lib
read_verilog reg1.v
link_design top

odb::dbBlockage_create [ord::get_db_block] 0 0 1000000 208400
odb::dbBlockage_create [ord::get_db_block] 0 508400 1000000 708400
initialize_floorplan -die_area "0 0 1000 1000" \
  -core_area "100 100 900 900" 

set def_file [make_result_file placement_blockage1.def]
write_def $def_file
diff_files placement_blockage1.defok $def_file
