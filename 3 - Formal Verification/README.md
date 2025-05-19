# 🧪 Formal Verification

Formal verification is a crucial validation step performed immediately after synthesis to ensure that the design's functionality has not been altered during the transformation from RTL to gate-level netlist.

---

## 📌 Overview and Purpose

In ASIC design, synthesis introduces structural changes through logic optimizations like **retiming**, **replication**, or **restructuring**. While these transformations enhance PPA (Power, Performance, Area), they may inadvertently impact the design’s behavior if not handled correctly.

**Formal verification** bridges this gap by exhaustively proving **functional equivalence** between the RTL and the synthesized netlist, ensuring that all optimizations preserve the original design intent.

By performing this check early—before floorplanning, test insertion, and place & route—we reduce the risk of late-stage functional bugs, saving time and avoiding costly rework.

---

## 🎯 Objectives

The key targets of this stage include:

- ✅ **Functional Equivalence:** Verify that the gate-level netlist behaves identically to the RTL across all possible input combinations.
- 🔍 **Error Detection:** Pinpoint any unintended mismatches introduced during synthesis due to optimizations or incorrect constraints.
- 🏁 **Signoff Readiness:** Certify the design is functionally correct and ready to proceed with physical implementation and DFT insertion.

---

## ⚙️ EDA Tool Used

Formal verification is conducted using **Synopsys Formality**, a powerful equivalence checking tool designed for comparing RTL with synthesized netlists using mathematically complete formal methods. Unlike simulation, which checks a subset of input patterns, Formality guarantees full coverage through symbolic analysis and Boolean equivalence checking.

---

## 📥 Inputs to Formality

To perform equivalence checking, Formality requires the following inputs:

| Input                    | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `RTL Design (.v/.sv)`    | The original SystemVerilog or Verilog behavioral description.               |
| `Synthesized Netlist`    | The gate-level netlist output from Design Compiler.                         |
| `Mapped Libraries (.db)` | The technology cell libraries used during synthesis.                        |
| `Constraint File (.svf)` | Setup scripts and hierarchy mapping for design alignment within Formality.  |

---

## 📤 Outputs from Formality

After execution, Formality generates:

| Output                    | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| **Equivalence Report**    | Indicates pass/fail status of equivalence checking.                         |
| **Mismatch Report**       | Highlights any logical discrepancies and their causes.                      |
| **Session Logs**          | Detailed logs used to analyze datapath alignment and convergence.           |

---



![image](https://github.com/user-attachments/assets/9d18ae77-08a8-47a1-b9c8-48d17b63ed18)


