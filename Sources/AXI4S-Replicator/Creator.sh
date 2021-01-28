#!/bin/bash

# 99 is our max, careful.
REPLICAS=99

header="library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AXI4S_Replicator is
    generic
    (
        DATA_WIDTH      : integer := 32
    );
    port
    (
        S00_AXIS_aclk     : in std_logic;
        S00_AXIS_areset   : in std_logic;
        S00_AXIS_tdata    : in std_logic_vector(DATA_WIDTH-1 downto 0);
        S00_AXIS_tkeep    : in std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        S00_AXIS_tlast    : in std_logic;
        S00_AXIS_tvalid   : in std_logic;
        S00_AXIS_tready   : out std_logic;
"

ports=""
assigns=""
ready="all_ready <= "
for i in $(seq -f "%02g" 0 $REPLICAS)
do
    ports+="
        M${i}_AXIS_aclk     : out std_logic;
        M${i}_AXIS_areset   : out std_logic;
        M${i}_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M${i}_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M${i}_AXIS_tlast    : out std_logic;
        M${i}_AXIS_tvalid   : out std_logic;
        M${i}_AXIS_tready   : in std_logic;
"
    ready+="M${i}_AXIS_tready and "
    assigns+="
        M${i}_AXIS_aclk     <= S00_AXIS_aclk;
        M${i}_AXIS_areset   <= S00_AXIS_areset;
        M${i}_AXIS_tdata    <= S00_AXIS_tdata;
        M${i}_AXIS_tkeep    <= S00_AXIS_tkeep;
        M${i}_AXIS_tlast    <= S00_AXIS_tlast;
        M${i}_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;
"
done

ready="${ready:0:$((${#ready}-5))}"
ready+=";"

header+="${ports:0:$((${#ports}-2))}"
header+="
    );
end entity;

architecture arch of AXI4S_Replicator is
    
    signal all_ready : std_logic;

begin
    
    ${ready}

    ${assigns}

    S00_AXIS_tready <= all_ready;

end architecture;
"

echo "${header}" > AXI4S_Replicator.vhd

#####################################################################################
header="# Project
create_project AXI4S_Replicator -in_memory -part xc7vx485tffg1157-1 -ip
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
set_property target_simulator XSim [current_project]
set_property ip_repo_paths [list ./IPs] [current_project]
add_files -norecurse {./Sources/AXI4S-Replicator/AXI4S_Replicator.vhd}
set_property top AXI4S_Replicator [current_fileset]

# Create IP
ipx::package_project -root_dir ./IPs/AXI4-Replicator -import_files {./Sources/AXI4S-Replicator/AXI4S_Replicator.vhd} -vendor mohammad.ewais.ca -library ME_IPs -taxonomy {/AXI_Infrastructure}
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property name AXI4S_Replicator [ipx::current_core]
set_property display_name {AXI4 Stream Replicator v1.0} [ipx::current_core]
set_property description {AXI4 Stream Replicator} [ipx::current_core]
set_property company_url {http://mohammad.ewais.ca} [ipx::current_core]
set_property vendor_display_name {Mohammad Ewais} [ipx::current_core]
set_property supported_families {virtex7 Production qvirtex7 Production kintex7 Production kintex7l Production qkintex7 Production qkintex7l Production artix7 Production artix7l Production aartix7 Production qartix7 Production zynq Production qzynq Production azynq Production spartan7 Production aspartan7 Production virtexu Production zynquplus Production virtexuplus Production virtexuplusHBM Production kintexuplus Production kintexu Production} [ipx::current_core]

set_property widget {comboBox} [ipgui::get_guiparamspec -name \"DATA_WIDTH\" -component [ipx::current_core] ]
set_property value 8 [ipx::get_user_parameters DATA_WIDTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_hdl_parameters DATA_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters DATA_WIDTH -of_objects [ipx::current_core]]
set_property value_validation_list {8 16 32 64 128 256 512} [ipx::get_user_parameters DATA_WIDTH -of_objects [ipx::current_core]]
ipx::add_user_parameter REPLICAS [ipx::current_core]
set_property value_resolve_type user [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
ipgui::add_param -name {REPLICAS} -component [ipx::current_core]
set_property display_name {Replicas} [ipgui::get_guiparamspec -name \"REPLICAS\" -component [ipx::current_core] ]
set_property tooltip {Number of replicas to create} [ipgui::get_guiparamspec -name \"REPLICAS\" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name \"REPLICAS\" -component [ipx::current_core] ]
set_property value 4 [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
set_property value_format long [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
set_property value_validation_type range_long [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 2 [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 99 [ipx::get_user_parameters REPLICAS -of_objects [ipx::current_core]]
ipgui::move_param -component [ipx::current_core] -order 0 [ipgui::get_guiparamspec -name \"REPLICAS\" -component [ipx::current_core]] -parent [ipgui::get_pagespec -name \"Page 0\" -component [ipx::current_core]]

"

for i in $(seq -f "%02g" 2 $REPLICAS)
do
    int=$(echo "$i + 0" | bc)
    header+="ipx::infer_bus_interface M${i}_AXIS_areset xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]
set_property enablement_dependency {\$REPLICAS > ${int}} [ipx::get_bus_interfaces M${i}_AXIS -of_objects [ipx::current_core]]
set_property enablement_dependency {\$REPLICAS > ${int}} [ipx::get_bus_interfaces M${i}_AXIS_aclk -of_objects [ipx::current_core]]
set_property enablement_dependency {\$REPLICAS > ${int}} [ipx::get_bus_interfaces M${i}_AXIS_areset -of_objects [ipx::current_core]]
"
done

header+="
ipx::check_integrity -quiet [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project"

echo "${header}" > AXI4S-Replicator.tcl
