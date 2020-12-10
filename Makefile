all: AXI4-RAM

AXI4-RAM: Sources/AXI4-RAM/*
	rm -rf AXI4-IPs/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM.tcl

clean:
	rm -rf AXI4-IPs/
