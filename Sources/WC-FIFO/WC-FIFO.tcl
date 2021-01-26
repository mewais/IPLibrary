# Project
create_project WC_FIFO -in_memory -part xc7vx485tffg1157-1 -ip
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
set_property target_simulator XSim [current_project]
set_property ip_repo_paths [list ./IPs] [current_project]
add_files -norecurse {./Sources/Utils/Calc.vhd ./Sources/WC-FIFO/Synchronizer.vhd ./Sources/WC-FIFO/WC_FIFO.vhd}
set_property top WC_FIFO [current_fileset]

# Create IP
ipx::package_project -root_dir ./IPs/WC-FIFO -import_files {./Sources/Utils/Calc.vhd ./Sources/WC-FIFO/Synchronizer.vhd ./Sources/WC-FIFO/SynFIFO.vhd ./Sources/WC-FIFO/WC_FIFO.vhd} -vendor mohammad.ewais.ca -library ME_IPs -taxonomy {/Memories_&_Storage_Elements/FIFOs}
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property name WC_FIFO [ipx::current_core]
set_property display_name {Width Converter FIFO v1.0} [ipx::current_core]
set_property description {Data Width Converter FIFO} [ipx::current_core]
set_property company_url {http://mohammad.ewais.ca} [ipx::current_core]
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property supported_families {virtex7 Production qvirtex7 Production kintex7 Production kintex7l Production qkintex7 Production qkintex7l Production artix7 Production artix7l Production aartix7 Production qartix7 Production zynq Production qzynq Production azynq Production spartan7 Production aspartan7 Production virtexu Production zynquplus Production virtexuplus Production virtexuplusHBM Production kintexuplus Production kintexu Production} [ipx::current_core]

# Create Interfaces
ipx::create_abstraction_definition mohammad.ewais.ca ME_IPs fifo_write_rtl 1.0
ipx::create_bus_definition mohammad.ewais.ca ME_IPs fifo_write 1.0
set_property xml_file_name ./IPs/fifo_write_rtl.xml [ipx::current_busabs]
set_property xml_file_name ./IPs/fifo_write.xml [ipx::current_busdef]
set_property bus_type_vlnv mohammad.ewais.ca:ME_IPs:fifo_write:1.0 [ipx::current_busabs]
ipx::save_abstraction_definition [ipx::current_busabs]
ipx::save_bus_definition [ipx::current_busdef]
ipx::add_bus_abstraction_port write_enable [ipx::current_busabs]
ipx::add_bus_abstraction_port write_data [ipx::current_busabs]
ipx::add_bus_abstraction_port write_full [ipx::current_busabs]
ipx::save_bus_definition [ipx::current_busdef]
ipx::save_abstraction_definition [ipx::current_busabs]
update_ip_catalog -rebuild
ipx::infer_bus_interface {write_enable write_data write_full} mohammad.ewais.ca:ME_IPs:fifo_write:1.0 [ipx::current_core]

ipx::create_abstraction_definition mohammad.ewais.ca ME_IPs fifo_read_rtl 1.0
ipx::create_bus_definition mohammad.ewais.ca ME_IPs fifo_read 1.0
set_property xml_file_name ./IPs/fifo_read_rtl.xml [ipx::current_busabs]
set_property xml_file_name ./IPs/fifo_read.xml [ipx::current_busdef]
set_property bus_type_vlnv mohammad.ewais.ca:ME_IPs:fifo_read:1.0 [ipx::current_busabs]
ipx::save_abstraction_definition [ipx::current_busabs]
ipx::save_bus_definition [ipx::current_busdef]
ipx::add_bus_abstraction_port read_enable [ipx::current_busabs]
ipx::add_bus_abstraction_port read_data [ipx::current_busabs]
ipx::add_bus_abstraction_port read_empty [ipx::current_busabs]
ipx::save_bus_definition [ipx::current_busdef]
ipx::save_abstraction_definition [ipx::current_busabs]
update_ip_catalog -rebuild
ipx::infer_bus_interface {read_enable read_data read_empty} mohammad.ewais.ca:ME_IPs:fifo_read:1.0 [ipx::current_core]
set_property interface_mode master [ipx::get_bus_interfaces fifo_read_1 -of_objects [ipx::current_core]]

set_property enablement_dependency {$ASYNCHRONOUS = true} [ipx::get_bus_interfaces read_reset -of_objects [ipx::current_core]]
set_property enablement_dependency {$ASYNCHRONOUS = true} [ipx::get_bus_interfaces read_clk -of_objects [ipx::current_core]]

# Parameters
set_property tooltip {Read width of FIFO, in bits} [ipgui::get_guiparamspec -name "READ_WIDTH" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "READ_WIDTH" -component [ipx::current_core] ]
set_property value 32 [ipx::get_user_parameters READ_WIDTH -of_objects [ipx::current_core]]
set_property value 32 [ipx::get_hdl_parameters READ_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters READ_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_list {8 16 32 64 128 256 512} [ipx::get_user_parameters READ_WIDTH -of_objects [ipx::current_core]]

set_property tooltip {Write width of FIFO, in bits} [ipgui::get_guiparamspec -name "WRITE_WIDTH" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "WRITE_WIDTH" -component [ipx::current_core] ]
set_property value 32 [ipx::get_user_parameters WRITE_WIDTH -of_objects [ipx::current_core]]
set_property value 32 [ipx::get_hdl_parameters WRITE_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters WRITE_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_list {8 16 32 64 128 256 512} [ipx::get_user_parameters WRITE_WIDTH -of_objects [ipx::current_core]]

set_property tooltip {Depth of FIFO, in words of size max(READ_WIDTH, WRITE_WIDTH)} [ipgui::get_guiparamspec -name "DEPTH" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "DEPTH" -component [ipx::current_core] ]
set_property value 8 [ipx::get_user_parameters DEPTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_hdl_parameters DEPTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters DEPTH -of_objects [ipx::current_core]]
set_property value_validation_list {8 16 32 64 128 256 512 1024 2048 4096 8192} [ipx::get_user_parameters DEPTH -of_objects [ipx::current_core]]

set_property tooltip {Enable clock domain crossing} [ipgui::get_guiparamspec -name "ASYNCHRONOUS" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "ASYNCHRONOUS" -component [ipx::current_core] ]

ipx::check_integrity -quiet [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project
