# Power Planning Stage

The **Power Planning** stage is a foundational part of physical implementation, directly following floorplanning. It defines how power (VDD) and ground (VSS) are delivered across the design, ensuring a robust, reliable, and signoff-quality power distribution network (PDN). Power integrity at this stage is critical for maintaining chip functionality under all operating and process conditions.

---

## 📌 Overview

Once the physical layout from the floorplan is defined, power planning builds the infrastructure that delivers current to all logic cells, macros, and I/Os. This includes designing:
- **Power rings** around the core or macros.
- **Stripes (power rails)** spanning horizontally and vertically.
- **Vias and connections** across metal layers to ensure low impedance paths.

The plan must also account for **IR drop**, **electromigration (EM)**, and **metal layer constraints**, especially in dense or high-current regions.

---

## 🎯 Purpose and Objectives

The key objectives of the power planning stage are:

-  **Build the power grid** to evenly distribute VDD and VSS across the chip.
-  **Maintain power integrity** by avoiding IR drop and EM violations.
-  **Support power domains** and voltage islands where applicable.
-  **Connect macros and IP blocks** to the global power grid using power rings and straps.
-  **Reserve space for decap cells and tie cells** to manage switching noise and enhance stability.

---

## 🎯 Targets and Outcomes

This stage, implemented using **Synopsys IC Compiler II**, aims to:

|  Target                                  | Description                                                                 |
|------------------------------------------|-----------------------------------------------------------------------------|
|  Multi-layer Grid Design                 | Distribute VDD/VSS across top and lower metal layers                        |
|  Focus on High-Current Regions           | Provide more straps in areas with dense switching activity                  |
|  Resource-aware Planning                 | Minimize impact on signal routing while reserving wide stripes              |
|  Reduce IR Drop and EM Risk              | Ensure design meets reliability constraints over all corners and conditions |

The outcome is a **scalable and optimized power infrastructure**, ready to support standard cell placement, CTS, and full routing with minimal rework. A solid power plan ensures long-term chip stability and manufacturing robustness.

---

## ⚙️ EDA Tool Used

| Tool                        | Role                                         |
|-----------------------------|----------------------------------------------|
| **Synopsys IC Compiler II** | PDN design, power ring/strap generation, EM/IR check prep |

---

## 🧾 Power Planning Outputs

| Output Artifact               | Description                                                                 |
|-------------------------------|-----------------------------------------------------------------------------|
| `Power Straps and Rings`      | Mapped physical shapes for VDD and VSS                                      |
| `PG Connectivity Reports`     | Results of connectivity and via insertion validation                        |
| `DRC and IR Drop Check Logs`  | Used for verifying physical and electrical correctness                      |
| `Updated NDM`                 | Power-aware layout database for placement and CTS stages                    |

---

## Power Planning DRC report

![image](https://github.com/user-attachments/assets/4d4115b5-b6d4-45c2-ae9e-50697b3f0cf9)

---

## ICC II GUI after Power Planning stage

![image](https://github.com/user-attachments/assets/1968d9e4-717f-43bc-ac9b-93950c3dd747)


