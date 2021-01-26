# Project
create_project AXI4_RAM -in_memory -part xc7vx485tffg1157-1 -ip
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
set_property target_simulator XSim [current_project]
set_property ip_repo_paths [list ./AXI4-IPs] [current_project]
add_files -norecurse {./Sources/Utils/Calc.vhd ./Sources/AXI4-RAM/AXI4_RAM_S_AXI.vhd ./Sources/AXI4-RAM/AXI4_RAM.vhd}
set_property top AXI4_RAM [current_fileset]

# Create IP
ipx::package_project -root_dir ./AXI4-IPs/AXI4-RAM -import_files {./Sources/Utils/Calc.vhd ./Sources/AXI4-RAM/AXI4_RAM_S_AXI.vhd ./Sources/AXI4-RAM/AXI4_RAM.vhd} -vendor mohammad.ewais.ca -library AXI4 -taxonomy {/AXI_Infrastructure /Memories_&_Storage_Elements/RAMs_&_ROMs}
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property name AXI4_RAM [ipx::current_core]
set_property display_name {AXI4 RAM v1.0} [ipx::current_core]
set_property description {AXI4 interfaced RAM/ROM} [ipx::current_core]
set_property company_url {http://mohammad.ewais.ca} [ipx::current_core]
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property supported_families {virtex7 Production qvirtex7 Production kintex7 Production kintex7l Production qkintex7 Production qkintex7l Production artix7 Production artix7l Production aartix7 Production qartix7 Production zynq Production qzynq Production azynq Production spartan7 Production aspartan7 Production virtexu Production zynquplus Production virtexuplus Production virtexuplusHBM Production kintexuplus Production kintexu Production} [ipx::current_core]

# Params
set_property display_name {AXI ID Width} [ipgui::get_guiparamspec -name "C_S00_AXI_ID_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of ID for for write address, write data, read address and read data} [ipgui::get_guiparamspec -name "C_S00_AXI_ID_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_ID_WIDTH" -component [ipx::current_core] ]
set_property value 8 [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_hdl_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 1 [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_ID_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI AW User Width} [ipgui::get_guiparamspec -name "C_S00_AXI_AWUSER_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of optional user defined signal in write address channel} [ipgui::get_guiparamspec -name "C_S00_AXI_AWUSER_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_AWUSER_WIDTH" -component [ipx::current_core] ]
set_property value 0 [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value 0 [ipx::get_hdl_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_AWUSER_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI AR User Width} [ipgui::get_guiparamspec -name "C_S00_AXI_ARUSER_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of optional user defined signal in read address channel} [ipgui::get_guiparamspec -name "C_S00_AXI_ARUSER_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_ARUSER_WIDTH" -component [ipx::current_core] ]
set_property value 0 [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value 0 [ipx::get_hdl_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_ARUSER_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI W User Width} [ipgui::get_guiparamspec -name "C_S00_AXI_WUSER_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of optional user defined signal in write channel} [ipgui::get_guiparamspec -name "C_S00_AXI_WUSER_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_WUSER_WIDTH" -component [ipx::current_core] ]
set_property value 0 [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value 0 [ipx::get_hdl_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_WUSER_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI R User Width} [ipgui::get_guiparamspec -name "C_S00_AXI_RUSER_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of optional user defined signal in read channel} [ipgui::get_guiparamspec -name "C_S00_AXI_RUSER_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_RUSER_WIDTH" -component [ipx::current_core] ]
set_property value 0 [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value 0 [ipx::get_hdl_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_RUSER_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI B User Width} [ipgui::get_guiparamspec -name "C_S00_AXI_BUSER_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of optional user defined signal in write response channel} [ipgui::get_guiparamspec -name "C_S00_AXI_BUSER_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_BUSER_WIDTH" -component [ipx::current_core] ]
set_property value 0 [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value 0 [ipx::get_hdl_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 16 [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]
ipx::update_dependency [ipx::get_user_parameters C_S00_AXI_BUSER_WIDTH -of_objects [ipx::current_core]]

set_property display_name {Width} [ipgui::get_guiparamspec -name "RAM_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of your RAM, in bits} [ipgui::get_guiparamspec -name "RAM_WIDTH" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "RAM_WIDTH" -component [ipx::current_core] ]
set_property value 32 [ipx::get_user_parameters RAM_WIDTH -of_objects [ipx::current_core]]
set_property value 32 [ipx::get_hdl_parameters RAM_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters RAM_WIDTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters RAM_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters RAM_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_list {8 16 32 64 128 256 512} [ipx::get_user_parameters RAM_WIDTH -of_objects [ipx::current_core]]

set_property display_name {Depth} [ipgui::get_guiparamspec -name "RAM_DEPTH" -component [ipx::current_core] ]
set_property tooltip {Depth of your RAM, in words} [ipgui::get_guiparamspec -name "RAM_DEPTH" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "RAM_DEPTH" -component [ipx::current_core] ]
set_property value 64 [ipx::get_user_parameters RAM_DEPTH -of_objects [ipx::current_core]]
set_property value 64 [ipx::get_hdl_parameters RAM_DEPTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters RAM_DEPTH -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_hdl_parameters RAM_DEPTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters RAM_DEPTH -of_objects [ipx::current_core]]
set_property value_validation_list {2 4 8 16 32 64 128 256 512 1024 2048 4096} [ipx::get_user_parameters RAM_DEPTH -of_objects [ipx::current_core]]

set_property display_name {Read Only} [ipgui::get_guiparamspec -name "READ_ONLY" -component [ipx::current_core] ]
set_property tooltip {Make this a ROM} [ipgui::get_guiparamspec -name "READ_ONLY" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "READ_ONLY" -component [ipx::current_core] ]
set_property value false [ipx::get_user_parameters READ_ONLY -of_objects [ipx::current_core]]
set_property value false [ipx::get_hdl_parameters READ_ONLY -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters READ_ONLY -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters READ_ONLY -of_objects [ipx::current_core]]

set_property display_name {Memory File} [ipgui::get_guiparamspec -name "MEMORY_FILE" -component [ipx::current_core] ]
set_property tooltip {The memory initialization file} [ipgui::get_guiparamspec -name "MEMORY_FILE" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "MEMORY_FILE" -component [ipx::current_core] ]
set_property value AXI4_RAM.mif [ipx::get_user_parameters MEMORY_FILE -of_objects [ipx::current_core]]
set_property value AXI4_RAM.mif [ipx::get_hdl_parameters MEMORY_FILE -of_objects [ipx::current_core]]

ipgui::add_param -name {C_S00_AXI_DATA_WIDTH} -component [ipx::current_core]
set_property display_name {AXI Data Width} [ipgui::get_guiparamspec -name "C_S00_AXI_DATA_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of AXI Data word} [ipgui::get_guiparamspec -name "C_S00_AXI_DATA_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_DATA_WIDTH" -component [ipx::current_core] ]
set_property enablement_value false [ipx::get_user_parameters C_S00_AXI_DATA_WIDTH -of_objects [ipx::current_core]]
set_property value_tcl_expr {$RAM_WIDTH} [ipx::get_user_parameters C_S00_AXI_DATA_WIDTH -of_objects [ipx::current_core]]
set_property value 32 [ipx::get_user_parameters C_S00_AXI_DATA_WIDTH -of_objects [ipx::current_core]]

set_property display_name {AXI Addr Width} [ipgui::get_guiparamspec -name "C_S00_AXI_ADDR_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Width of AXI address} [ipgui::get_guiparamspec -name "C_S00_AXI_ADDR_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "C_S00_AXI_ADDR_WIDTH" -component [ipx::current_core] ]
set_property enablement_value false [ipx::get_user_parameters C_S00_AXI_ADDR_WIDTH -of_objects [ipx::current_core]]
set_property value_tcl_expr {(log($RAM_WIDTH/8)/log(2))+(log($RAM_DEPTH)/log(2))} [ipx::get_user_parameters C_S00_AXI_ADDR_WIDTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_user_parameters C_S00_AXI_ADDR_WIDTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_hdl_parameters C_S00_AXI_ADDR_WIDTH -of_objects [ipx::current_core]]

# GUI
ipgui::add_group -name {Memory} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core] ] -display_name {Memory}
ipgui::add_group -name {AXI interface} -component [ipx::current_core] -parent [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core] ] -display_name {AXI interface}
ipgui::move_param -component [ipx::current_core] -order 0 [ipgui::get_guiparamspec -name "READ_ONLY" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 1 [ipgui::get_guiparamspec -name "RAM_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 2 [ipgui::get_guiparamspec -name "RAM_DEPTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 3 [ipgui::get_guiparamspec -name "MEMORY_FILE" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "Memory" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 0 [ipgui::get_guiparamspec -name "C_S00_AXI_ID_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 1 [ipgui::get_guiparamspec -name "C_S00_AXI_ADDR_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 2 [ipgui::get_guiparamspec -name "C_S00_AXI_DATA_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 3 [ipgui::get_guiparamspec -name "C_S00_AXI_AWUSER_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 4 [ipgui::get_guiparamspec -name "C_S00_AXI_ARUSER_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 5 [ipgui::get_guiparamspec -name "C_S00_AXI_WUSER_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 6 [ipgui::get_guiparamspec -name "C_S00_AXI_RUSER_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 7 [ipgui::get_guiparamspec -name "C_S00_AXI_BUSER_WIDTH" -component [ipx::current_core]] -parent [ipgui::get_groupspec -name "AXI interface" -component [ipx::current_core]]

ipx::check_integrity -quiet [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project
