# 2 - Logical Synthesis – Digital Transmitter ASIC Flow

This section documents the **logical synthesis phase** of the RTL-to-GDSII flow, focusing on transforming a high-level RTL design into an optimized gate-level netlist, 
ready for physical implementation.

---

## 📌 2.1 Overview and Purpose

The **Logical Synthesis** stage is the **first major milestone** in the ASIC digital implementation flow. Its purpose is to convert 
the behavioral-level **RTL code** into a **technology-mapped gate-level netlist**, using a specific **standard cell library** (SAED 14nm in this project).

🔍 This step ensures the design is:

* Optimized for **Power, Performance, and Area (PPA)**
* Ready for **physical implementation**, including placement and routing
* Aligned with key design constraints: timing, area, and power

Logical synthesis plays a crucial role in determining downstream success in achieving **timing closure**, **power efficiency**, and **area optimization**.

---

## 🎯 2.2 Synthesis Goals

During synthesis, the following critical objectives are targeted:

*  **Functional Equivalence**
  Ensure the gate-level netlist maintains the intended RTL functionality.

*  **Timing Closure**
  Meet **setup** constraints across all operating conditions.

*  **Area Efficiency**
  Minimize logic depth and gate count to reduce silicon usage.

*  **Power Optimization**
  Lower both **dynamic** and **static** power consumption.

*  **Clock Definition**
  Define clock domains, periods, and propagation for later stages.

---

## 🛠️ 2.3 EDA Tool: Synopsys Design Compiler

Synthesis is conducted using **Synopsys Design Compiler (DC)** — a widely adopted tool for logic synthesis. Its features used in this project include:

* Constraint-driven **logic optimization**
* Support for **multi-clock** and **multi-voltage** domains
* Incremental synthesis for design updates
* Integration with **DesignWare** IP and **SAED 14nm** standard cell libraries

---

## 📥 2.4 Inputs to Synthesis

The following inputs are provided to Design Compiler to perform synthesis:

| Input Type             | Description                                                          |
| ---------------------- | -------------------------------------------------------------------- |
| **RTL Design**         | Verilog/SystemVerilog description of the digital transmitter         |
| **Technology Library** | SAED 14nm `.db` files containing cell timing, power, and area models |
| **Design Constraints** | `.sdc`/TCL defining clocks, I/O delays, multicycle/false paths       |
| **DesignWare IP**      | Parameterized IP blocks used in RTL                                  |
| **Synthesis Scripts**  | TCL scripts to configure and execute the synthesis flow              |

---

## 📤 2.5 Outputs from Synthesis

After synthesis, the following key outputs are generated for use in **verification** and **physical design**:

| Output Type                 | Description                                                           |
| --------------------------- | --------------------------------------------------------------------- |
| **Gate-Level Netlist (.v)** | Structural Verilog mapped to SAED 14nm standard cells                 |
| **Timing Reports**          | Slack, critical paths, worst/best case paths                          |
| **Area & Power Reports**    | Breakdown of logic usage and power estimates                          |
| **Mapped Schematic**        | Visual representation of the synthesized netlist                      |
| **Equivalence Files**       | `.svf` or reference files for Formality checks                        |
| **Constraint Dump (.sdc)**  | Updated constraints for placement and optimization in physical design |


---

## Inputs and outputs of the Synthesis Stage


![image](https://github.com/user-attachments/assets/71304f34-0a7e-4702-ae9a-2dd3d8af9703)

---

## Synthesis Area Report

![image](https://github.com/user-attachments/assets/7ebdca18-af4a-4653-9f49-4844a43eaab0)

---

## Synthesis QoR Report

![image](https://github.com/user-attachments/assets/c43023d9-6952-4c28-9240-04d840e9765a)

---

## Synthesis Timing Report

![image](https://github.com/user-attachments/assets/f5a25a28-4ec9-408a-bc8d-bbad3f1ea12c)

---

## Synthesis optimization using: compile -retime -incremental_mapping 

![image](https://github.com/user-attachments/assets/ef5ca3e3-5135-440c-8e96-b15ed1d5f6dc)

---

## Synthesis timing optimization using: compile -area_effort low -power_effort low -auto_ungroup delay -incremental_mapping

![image](https://github.com/user-attachments/assets/60210e57-6f31-4846-87e4-3117e682bcaf)

---
---

## DC GUI – Logical Hierarrchy 

![image](https://github.com/user-attachments/assets/fbf929e9-3fd9-40d0-ae31-fc0aed448808)

---

## DC GUI – Gate level netlist Schematic

![image](https://github.com/user-attachments/assets/9f593c52-7479-48de-8ee3-df33c8ade75d)

---

## DC GUI – Gate level netlist Schematic in details

![image](https://github.com/user-attachments/assets/42a18240-b0ff-4266-b3cc-a0c2cae81f02)

---

## DC GUI – Histogram of 10 worst negative slacks

![image](https://github.com/user-attachments/assets/5982b1ea-cd08-4f02-a1dd-a45547e0b494)

---

## DC GUI – Schematic view of Critical path (WNS)

![image](https://github.com/user-attachments/assets/bbe8433b-d861-4a7c-abd2-a91971da6e67)

---
---

## 📌 Summary

Logical synthesis bridges the gap between high-level design and physical implementation by producing a **functionally correct**, **technology-aware**, 
and **performance-optimized** gate-level representation. It is a cornerstone of digital ASIC design that directly impacts the success of all subsequent stages 
in the RTL-to-GDSII flow.

