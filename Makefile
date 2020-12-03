all: AXI4-RAM

AXI4-RAM: Sources/AXI4-RAM/*
	rm -rf AXI4-IPs/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source AXI4-RAM.tcl
	cp Sources/AXI4-RAM/xgui.tcl AXI4-IPs/AXI4-RAM/xgui/AXI4_RAM_v1_0.tcl

clean:
	rm -rf AXI4-IPs/
