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
