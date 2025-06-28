# Placement Stage

The **Placement** stage is a key milestone in the RTL-to-GDSII physical implementation flow. It translates the synthesized gate-level netlist into actual physical positions for standard cells within the defined floorplan. Placement plays a crucial role in determining both the timing and routability of the final layout, serving as the foundation for subsequent steps like CTS and routing.

---

## 📌 Overview

In this stage, all standard cells are assigned legal, optimized locations on the die that respect:
- Floorplan boundaries.
- Power planning structures (rings, straps).
- Pre-placed macros or hard IP blocks.

The placement engine leverages physical-aware optimization to strike a balance between timing, area utilization, and congestion.

---

## 🎯 Purpose

The main purpose of placement is to:
-  **Legally position** all standard cells within the floorplan grid.
-  **Preserve logical connectivity** while optimizing net lengths.
-  **Enhance timing closure** by reducing delays across critical paths.
-  **Avoid congestion** by distributing cells efficiently.
-  **Prepare for CTS**, ensuring enough whitespace around clock sinks.

---

## 🎯 Targets

During placement, the following design goals are pursued:

| Target               | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
|  Timing Optimization | Place cells to minimize setup and hold violations                          |
|  Congestion Avoidance | Avoid dense routing areas by spreading out high-activity logic blocks      |
|  Legalization        | Ensure all cells align to placement sites and avoid forbidden areas         |
|  Power Awareness     | Maintain alignment with power grid structures and macro pin access points   |

---

## 🧾 Outcomes

A successful placement stage will result in:

| Outcome                               | Description                                                     |
|---------------------------------------|-----------------------------------------------------------------|
|  Legalized Cell Locations            | All standard cells placed on-site grid with no overlaps         |
|  Improved Connectivity               | Reduced net length and optimized logical proximity              |
|  Updated Timing Estimates           | Physical-aware timing analysis ready for CTS                    |
|  Placement DEF/NDM                  | Placement-aware design database for the next stage              |

---

## ⚙️ EDA Tool Used

| Tool                  | Role                                      |
|-----------------------|-------------------------------------------|
| **Synopsys ICC2**     | Placement optimization and legalization   |

---

## Global Timing report after Placement Stage

![image](https://github.com/user-attachments/assets/3c8143da-43ec-471b-868c-1b1559696fd0)

---

## QoR Snapshot report after Placement Stage

![image](https://github.com/user-attachments/assets/322389ee-3169-411b-902a-53fc222d5646)

---

## Placement Max Timing Report

![image](https://github.com/user-attachments/assets/9a4a28c6-4929-4c7a-9485-ca79ea079853)

---

## Placement Min Timing Report

![image](https://github.com/user-attachments/assets/fe9c6219-e1fb-44c5-8312-70edc31bc59c)

---

## ICC II GUI Showing legalized placement of Standard cells

![image](https://github.com/user-attachments/assets/396ba89f-e0be-4e73-816f-c2dbcad10bb6)

---

## ICC II GUI after Placement Stage without Power Mesh

![image](https://github.com/user-attachments/assets/b08a3d73-3929-4023-bdd2-16deb2d72d66)

---

## ICC II GUI after Placement Stage with Power Mesh

![image](https://github.com/user-attachments/assets/d3df61b5-b3ca-4a29-a4b9-4fcb5719807b)

