all: AXI4-RAM WC-FIFO

tests: AXI4-RAM-test

AXI4-RAM: Sources/AXI4-RAM/*
	rm -rf IPs/AXI4-RAM/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-RAM/AXI4-RAM.tcl

AXI4-GPIO: Sources/AXI4-GPIO/*
	rm -rf IPs/AXI4-GPIO/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4-GPIO/AXI4-GPIO.tcl

WC-FIFO: Sources/WC-FIFO/*
	rm -rf IPs/WC-FIFO/
	vivado -nolog -nojournal -mode batch -source Sources/WC-FIFO/WC-FIFO.tcl

AXI4S-Replicator: Sources/AXI4S-Replicator/*
	rm -rf IPs/AXI4S-Replicator/
	vivado -nolog -nojournal -mode batch -source Sources/AXI4S-Replicator/AXI4S-Replicator.tcl

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
