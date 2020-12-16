# Project
create_project AXI4_RAM_test Tests/AXI4-RAM/ -part xczu19eg-ffvc1760-2-i
set_property target_language Verilog [current_project]
create_bd_design AXI4_RAM_test
set_property ip_repo_paths [list AXI4-IPs/] [current_project]
update_ip_catalog -rebuild
set cwd [pwd]

# Cells
create_bd_cell -type ip -vlnv mohammad.ewais.ca:AXI4:AXI4_RAM:1.0 AXI4_RAM_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_0
set_property -dict [list CONFIG.RAM_WIDTH {64} CONFIG.RAM_DEPTH {128} CONFIG.MEMORY_FILE $cwd/Sources/AXI4-RAM/AXI4-RAM-tb.mif] [get_bd_cells AXI4_RAM_0]
set_property -dict [list CONFIG.C_S00_AXI_AWUSER_WIDTH {1} CONFIG.C_S00_AXI_ARUSER_WIDTH {1} CONFIG.C_S00_AXI_WUSER_WIDTH {1} CONFIG.C_S00_AXI_RUSER_WIDTH {1} CONFIG.C_S00_AXI_BUSER_WIDTH {1}] [get_bd_cells AXI4_RAM_0]
set_property -dict [list CONFIG.INTERFACE_MODE {MASTER}] [get_bd_cells axi_vip_0]
set_property -dict [list CONFIG.ADDR_WIDTH {10} CONFIG.DATA_WIDTH {64}] [get_bd_cells axi_vip_0]
set_property -dict [list CONFIG.AWUSER_WIDTH {1} CONFIG.ARUSER_WIDTH {1} CONFIG.RUSER_WIDTH {1} CONFIG.WUSER_WIDTH {1} CONFIG.BUSER_WIDTH {1}] [get_bd_cells axi_vip_0]

# Connections
make_bd_pins_external  [get_bd_pins axi_vip_0/aclk]
make_bd_pins_external  [get_bd_pins axi_vip_0/aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_vip_0/M_AXI] [get_bd_intf_pins AXI4_RAM_0/s00_axi]
connect_bd_net [get_bd_ports aclk_0] [get_bd_pins AXI4_RAM_0/s00_axi_aclk]
connect_bd_net [get_bd_ports aresetn_0] [get_bd_pins AXI4_RAM_0/s00_axi_aresetn]

assign_bd_address -target_address_space /axi_vip_0/Master_AXI [get_bd_addr_segs AXI4_RAM_0/s00_axi/reg0] -force
make_wrapper -files [get_files AXI4_RAM_test.bd] -top
add_files -norecurse Tests/AXI4-RAM/AXI4_RAM_test.gen/sources_1/bd/AXI4_RAM_test/hdl/AXI4_RAM_test_wrapper.v
add_files -fileset sim_1 -norecurse Sources/AXI4-RAM/AXI4-RAM-tb.sv

validate_bd_design
save_bd_design

# Simulate
set_property top AXI4_RAM_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
generate_target Simulation [get_files Tests/AXI4-RAM/AXI4_RAM_test.srcs/sources_1/bd/AXI4_RAM_test/AXI4_RAM_test.bd]
export_ip_user_files -of_objects [get_files Tests/AXI4-RAM/AXI4_RAM_test.srcs/sources_1/bd/AXI4_RAM_test/AXI4_RAM_test.bd] -no_script -sync -force -quiet
export_simulation -of_objects [get_files Tests/AXI4-RAM/AXI4_RAM_test.srcs/sources_1/bd/AXI4_RAM_test/AXI4_RAM_test.bd] -directory Tests/AXI4-RAM/AXI4_RAM_test.ip_user_files/sim_scripts -ip_user_files_dir Tests/AXI4-RAM/AXI4_RAM_test.ip_user_files -ipstatic_source_dir Tests/AXI4-RAM/AXI4_RAM_test.ip_user_files/ipstatic -lib_map_path [list {modelsim=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/modelsim} {questa=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/questa} {ies=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/ies} {xcelium=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/xcelium} {vcs=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/vcs} {riviera=Tests/AXI4-RAM/AXI4_RAM_test.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
launch_simulation
