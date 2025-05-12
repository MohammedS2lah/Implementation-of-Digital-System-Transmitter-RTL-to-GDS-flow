# RTL-to-GDSII Implementation of a Digital Transmitter

Welcome to the repository documenting the **complete RTL-to-GDSII implementation** of a digital transmitter using industry-standard EDA tools and methodologies.

---

## Project Overview

This project aims to **apply a full digital ASIC design flow**, from RTL design to GDSII tapeout-ready layout, utilizing:

*  **Synopsys Toolchain**
*  **SAED 14nm Technology Library**
*  **Modern nanoscale design practices**

The result is a fully synthesized, placed, routed, and signoff-ready digital transmitter design.

---

## Flow Summary

This project follows the standard **ASIC implementation flow**:

### 1. RTL Synthesis

* Tool: **Design Compiler (DC)**
* Converts RTL code into a gate-level netlist
* Targets SAED 14nm technology

### 2. Formal Verification

* Tool: **Formality**
* Ensures functional equivalence between RTL and synthesized netlist

### 3. Physical Design

* Tool: **IC Compiler II (ICC2)**
* Steps:

  * Floorplanning
  * Power planning
  * Placement
  * MCMM optimization
  * Clock Tree Synthesis (CTS)
  * Routing

### 4. Parasitic Extraction

* Tool: **StarRC**
* Extracts accurate RC values for detailed timing analysis

### 5. Static Timing Analysis & Signoff

* Tool: **PrimeTime**
* Verifies setup/hold timing, removes violations
* Final timing signoff

---

## Quality of Results (QoR)

At each step, the following key metrics are documented and analyzed:

* Area
* Timing (WNS/TNS)
* Power
* Congestion
* Utilization

This helps track progress and identify optimization opportunities across the flow.

---

## Project Goals

* Master modern RTL-to-GDSII methodologies
* Achieve timing closure across all corners and modes
* Optimize for **area**, **timing**, and **power**
* Ensure **functional correctness** from RTL to layout

---

