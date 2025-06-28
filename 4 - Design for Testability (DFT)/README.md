# Design for Testability (DFT)

Design for Test (DFT) is a critical step in the digital ASIC design flow that ensures the final chip can be thoroughly and efficiently tested after fabrication. As the complexity of modern SoCs continues to rise, embedding robust testability features into the design becomes essential for maintaining high yield and product reliability.

---

## 📌 Overview and Purpose

DFT focuses on integrating test structures into the functional design that enable effective detection and diagnosis of manufacturing defects—such as stuck-at, transition, and bridging faults—using structured and automated testing techniques. These techniques reduce the dependence on expensive exhaustive simulations and allow scalable production testing using Automatic Test Equipment (ATE).

The ultimate goal is to ensure **high fault coverage**, **short test time**, and **low test cost**, all while preserving the design’s functionality and performance.

---

## 🎯 Objectives

The main objectives of the DFT stage include:

-  **Scan Insertion:** Embed scan chains into flip-flops to make internal logic observable and controllable during test mode.
-  **High Fault Coverage:** Maximize detection of potential manufacturing defects using structural testing techniques.
-  **DFT Rule Compliance:** Ensure adherence to scan design guidelines, naming conventions, and clock domain constraints.
-  **Minimal Design Impact:** Insert test logic with minimal overhead on area, timing, and power.

---

## ⚙️ EDA Tool Used

This project uses **Synopsys DFT Compiler** to perform:

- Automatic scan chain insertion  
- DFT rule checking and compliance  
- Generation of scan-inserted gate-level netlists and testability reports  

DFT Compiler works seamlessly with Design Compiler to preserve timing constraints and maintain logical integrity while embedding the required test structures.

---

## 📥 Inputs to DFT Compiler

| Input                               | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| `RTL with DFT Interface`           | RTL code with scan-related ports (e.g., `scan_en`, `scan_in`, `scan_out`)  |
| `Design Constraints (SDC)`         | Defines clocking relationships and constraints during scan insertion         |
| `Standard Cell Libraries (.db)`    | Technology libraries used for mapping scan logic                            |
| `DFT Guidelines`                   | Scan architecture preferences, naming conventions, and test methodology     |

---

## 📤 Outputs of the DFT Stage

| Output                          | Description                                                                 |
|---------------------------------|-----------------------------------------------------------------------------|
| `Scan-Inserted Netlist`         | Gate-level netlist modified with scan chains and test points                |
| `DFT Reports`                   | Statistics on scan chain count, lengths, coverage, and any violations       |
| `Testability Reports`           | Metrics on fault coverage, controllability, and observability               |
| `Scan Chain Definitions`        | File used for downstream ATPG and test vector generation                    |
| `Post-DFT SDF & Timing Reports` | Timing data for STA validation on scan-enabled paths                        |


---

---

# RTL with DFT Insertion 


## RTL code of MUX2to1

![image](https://github.com/user-attachments/assets/6db77298-6688-4294-8ea7-ecfe8db6113b)


---

## RTL code of Top module with DFT interface (scan clock, scan reset, test mode, scan input (SI), scan enable (SE) and scan output (SO)) 

![image](https://github.com/user-attachments/assets/d96b1951-20ea-4553-9b7f-64e3c16e7e9c)


---


## DFT internal signals


![image](https://github.com/user-attachments/assets/36772569-71a9-456e-a8e9-600f039e5680)


---


## Top module with Clocks and reset MUXed


![image](https://github.com/user-attachments/assets/343b8a1f-d548-4981-aaa2-8f6efc6e5ce5)
