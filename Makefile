all: AXI4-RAM WC-FIFO

tests: AXI4-RAM-test

AXI4-RAM: Sources/AXI4-RAM/*
	rm -rf IPs/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM.tcl

WC-FIFO: Sources/WC-FIFO/*
	rm -rf IPs/WC-FIFO/
	vivado -nolog -nojournal -mode batch -source Sources/WC-FIFO/WC-FIFO.tcl

AXI4-RAM-test: Sources/AXI4-RAM/*
	rm -rf Tests/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM-test.tcl
	@if [ $$(grep -v "XILINX_RESET_PULSE_WIDTH" Tests/AXI4-RAM/AXI4_RAM_test.sim/sim_1/behav/xsim/*.log | grep -ci "INCORRECT\|ERROR") -gt 0 ]; then \
		echo "AXI4-RAM Test Failed"; \
	else \
		echo "AXI4-RAM Test Passed"; \
	fi
	@if [ $$(grep -v "XILINX_RESET_PULSE_WIDTH" Tests/AXI4-RAM/AXI4_RAM_test.sim/sim_2/behav/xsim/*.log | grep -ci "INCORRECT\|ERROR") -gt 0 ]; then \
		echo "AXI4-ROM Test Failed"; \
	else \
		echo "AXI4-ROM Test Passed"; \
	fi

clean:
	rm -rf IPs/
	rm -rf Tests/
