# Data Setup and NDM Creation Stage

This stage marks the transition from front-end design (RTL/synthesis) to back-end physical implementation. It establishes a unified design environment in the form of an **NDM (New Data Model)**, enabling smooth execution of the upcoming Place & Route phases within **Synopsys IC Compiler II (ICC2)**.

---

## 📌 Overview

The **Data Setup and NDM Creation** stage is responsible for importing, and translating all design data into the ICC2 flow. This includes netlists, constraints, technology libraries, and physical abstracts. The unified NDM database created during this stage forms the backbone for accurate floorplanning, powerplanning, placement, clock tree synthesis (CTS), and routing.

---

## 🎯 Purpose and Objectives

The key goals of this stage are:

- 🔄 **Front-End Data Translation**: Convert RTL and synthesis outputs into ICC2-ready inputs.
- 📥 **Library & Abstract Import**: Load and align Liberty, Milkyway, and LEF/DEF views.
- 🧱 **NDM Initialization**: Create a hierarchical or flat design database in NDM format.
- 🧪 **Cross-View Validation**: Ensure logical, physical, and timing views are synchronized for MCMM analysis.

---

## ⚙️ EDA Tool Used

| Tool                               | Role                                                                       |
|------------------------------------|----------------------------------------------------------------------------|
| **Synopsys IC Compiler II (ICC2)** | Main tool used for physical design implementation and database management. |
| **Synopsys ICC2 Library Manager**  | Specific utility within ICC2 used to create and manage the NDM database.   |

---

## 📥 Inputs

| Input Type                     | Description                                                                      |
|--------------------------------|----------------------------------------------------------------------------------|
| `Gate-level Netlist (*.v)`     | Synthesized design netlist from Design Compiler                                 |
| `Timing Constraints (*.sdc)`   | SDC file containing timing definitions, clocks, and I/O constraints             |
| `Milkyway Libraries`           | Physical and technology views of standard cell libraries in Milkyway format     |
| `Liberty Files (*.lib)`        | Timing libraries with delay and power models                                    |
| `LEF/Tech LEF`                 | Physical abstracts describing cell dimensions and metal layer rules              |
| `DEF Floorplan (optional)`     | Early floorplan definition (if created beforehand)                              |

---

## 📤 Outputs

| Output Type                       | Description                                                                          |
|-----------------------------------|--------------------------------------------------------------------------------------|
| `NDM Database (*.ndm)`            | Unified ICC2-compatible design database for physical design                          |
| `Resolved Library References`     | Correct mapping of logical cells to physical abstracts and technology views          |
| `Validated Design Environment`    | Setup ready for floorplanning, powrplanning, placement, CTS, and routing within ICC2 |



---

## IC Compiler II GUI after Data Setup stage


![image](https://github.com/user-attachments/assets/b5473455-e943-4c77-b586-b991b505338d)

