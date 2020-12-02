create_project AXI4_RAM -in_memory -part xc7vx485tffg1157-1 -ip
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
set_property target_simulator XSim [current_project]
set_property ip_repo_paths [list ./AXI4-IPs] [current_project]
add_files -norecurse {./Sources/AXI4-RAM/AXI4_RAM_S_AXI.vhd ./Sources/AXI4-RAM/AXI4_RAM.vhd}
ipx::package_project -root_dir ./AXI4-IPs/AXI4-RAM -import_files {./Sources/AXI4-RAM/AXI4_RAM_S_AXI.vhd ./Sources/AXI4-RAM/AXI4_RAM.vhd} -vendor mohammad.ewais.ca -library AXI4 -taxonomy {/AXI_Infrastructure /Memories_&_Storage_Elements/RAMs_&_ROMs}
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property name AXI4_RAM [ipx::current_core]
set_property display_name "AXI4 RAM v1.0" [ipx::current_core]
set_property description "AXI4 interfaced RAM/ROM" [ipx::current_core]
set_property supported_families {virtex7 Production qvirtex7 Production kintex7 Production kintex7l Production qkintex7 Production qkintex7l Production artix7 Production artix7l Production aartix7 Production qartix7 Production zynq Production qzynq Production azynq Production spartan7 Production aspartan7 Production virtexu Production zynquplus Production virtexuplus Production virtexuplusHBM Production kintexuplus Production kintexu Production artix7 Production artix7l Production qartix7 Production qkintex7 Production qkintex7l Production kintexu Production qvirtex7 Production virtexuplus Production qzynq Production zynquplus Production kintex7 Production kintex7l Production kintexuplus Production spartan7 Production virtex7 Production virtexu Production virtexuplusHBM Production aartix7 Production aspartan7 Production azynq Production zynq Production} [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
ipx::check_integrity -quiet [ipx::current_core]
close_project
