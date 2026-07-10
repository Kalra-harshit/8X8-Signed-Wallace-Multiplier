# 8x8 Signed Wallace Tree Multiplier

## Overview
This repository contains the RTL design and verification of an **8x8-bit signed (2's complement) Wallace Tree Multiplier**, written in Verilog. The design focuses on high-speed hardware multiplication by reducing partial products using a Wallace Tree architecture and has been successfully synthesized and implemented on the Real Digital Boolean FPGA board.

## Features
* **Signed Multiplication:** Handles 8-bit signed numbers (2's complement) to produce a 16-bit signed product.
* **Wallace Tree Architecture:** Minimizes the critical path delay during partial product reduction using three stages of Carry Save Adders (CSAs).
* **Modular RTL Design:** Separated into logical sub-modules including Partial Product Generation, Wallace Tree, CSAs, and a final Carry Propagate Adder.
* **Hardware Verified:** Mapped directly to FPGA slide switches (inputs) and LEDs (outputs).

## Repository Structure
Based on the standard Vivado project structure:
* `sources_1/new/`: Verilog RTL source files.
  * `wallace_multiplier_top.v` (Top-level module)
  * `partial_product_generator.v` (Generates sign-extended partial products)
  * `wallace_tree_new.v` (Wallace tree reduction logic)
  * `carry_save_adder.v` (CSA block)
  * `final_carry_propagate_adder.v` (Final CPA for sum and carry)
* `sim_1/new/`: Testbench files.
  * `tb_wallace_multiplier_top.v` (Simulation testbench with various signed edge cases)
* `constrs_1/new/`: Hardware constraints.
  * `const.xdc` (Xilinx Design Constraints for the Boolean FPGA Board)

## Architecture
1. **Partial Product Generator:** Generates 8 partial products (`PP0` to `PP7`). Since this is a signed multiplier, the MSB (`PP7`) relies on 2's complement subtraction/negation.
2. **Wallace Tree Reduction:** Uses 7 Carry Save Adders (CSAs) distributed across 3 stages to compress the 8 partial products down to just 2 vectors: `SUM` and `CARRY`.
3. **Final Carry Propagate Adder:** A standard adder that adds the final `SUM` and `CARRY` vectors from the Wallace Tree to yield the 16-bit `PRODUCT`.

## Hardware Implementation
This design was synthesized and implemented on the **Boolean Board (FPGA)**. 
* **Inputs (A & B):** Mapped to the 16 on-board slide switches.
* **Output (PRODUCT):** Mapped to the 16 on-board LEDs.

### FPGA Action Shot
<img width="1170" height="860" alt="WhatsApp Image 2026-07-10 at 12 24 50 PM" src="https://github.com/user-attachments/assets/c80152ee-775a-4693-a2cf-74fc06dd4403" />



## Simulation
A behavioral testbench (`tb_wallace_multiplier_top.v`) is provided to verify correctness. It tests various scenarios including:
* Positive × Positive ($5 \times 3 = 15$)
* Positive × Negative ($10 \times -1 = -275$ bitwise representation)
* Negative × Positive ($-8 \times 6 = -48$)
* Negative × Negative ($-10 \times 10 = -100$ wait, $-10 \times -10$ equivalent)
* Edge cases (e.g., $-128 \times 1 = -128$)
<img width="1155" height="315" alt="WhatsApp Image 2026-07-10 at 12 24 50 PM (1)" src="https://github.com/user-attachments/assets/440f6614-e1a3-4d14-92a2-44d39e1a32f6" />

## Tools Used
* **HDL:** Verilog
* **EDA Tool:** Xilinx Vivado
* **Target Hardware:** Real Digital Boolean FPGA Board

## Author
**Harshit Kalra**
