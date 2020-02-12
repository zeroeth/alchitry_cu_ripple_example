Ripple Counter Hello World
--------------------------

Built using https://github.com/fpgawars/apio which wraps around the icestorm toolchain.

- install apio
- apio board list
- apio init --board 'your board'
- apio build
- apio upload

Tada!

Portions of this are from the Alchitry CU base project source:
- https://github.com/alchitry/Cu-Base-Project

This include the 'pcf' file for pin definitions used in their many tutorials at:
- https://alchitry.com/pages/verilog-fpga-tutorials

How it works
------------

cu_top.v is the entry point. It runs a slow blinker.v, which is then fed into the clock_ripple.v
