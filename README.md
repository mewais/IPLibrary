# IPLibrary

A library of IPs I use frequently during course work, teaching, or research.

The IPs are written in VHD (mostly) and can theoretically be useful for anyone. However, I use them for making Vivado IPs, so the makefile and the provided tcl scripts are made solely for that purpose.

## IPs
The following IPs are available:
- AXI4 GPIO: AXI4 interfaced GPIO. Supporting both input and output GPIO.
- AXI4 RAM: AXI4 interfaced RAM with configurable width and size.
- AXI4 Stream Replicator: Replicating one master to multiple slaves. Credit to [Juan Camilo Vega](https://github.com/juancamilovega)
- Width Changing FIFO: Your normal FIFO, but allowing different read and write data widths. Heavily based on the great guide: http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf
