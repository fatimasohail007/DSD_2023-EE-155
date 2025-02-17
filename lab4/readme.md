# Combinational Circuit Design - RGB LED using K-Maps

## Introduction

This project involves designing a driver circuit for tri-color LEDs on the Nexys A7 FPGA board. The circuit uses combinational logic to control the RGB LED based on two 2-bit inputs, a and b. The output color is determined as follows:

* Purple when a > b

* Yellow when a = b

* Cyan when a < b

The design is implemented using SystemVerilog, and the logic is minimized using Karnaugh Maps (K-Maps).

**Components**

Nexys A7 FPGA Board

Tri-color LEDs (Built-in)

Switches (for input selection)

**Steps Involved**

Truth Table Construction:

Define inputs: a[1], a[0], b[1], b[0]

Define outputs: r, g, b

Construct a truth table based on the color output logic

K-Map Minimization:

Generate K-Maps for r, g, and b

Identify prime and essential prime implicants

Derive minimized Boolean expressions



