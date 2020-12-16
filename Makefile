all: AXI4-RAM

tests: AXI4-RAM-test

AXI4-RAM: Sources/AXI4-RAM/*
	rm -rf AXI4-IPs/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM.tcl

AXI4-RAM-test: Sources/AXI4-RAM/*
	rm -rf Tests/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM-test.tcl

clean:
	rm -rf AXI4-IPs/
	rm -rf Tests/
