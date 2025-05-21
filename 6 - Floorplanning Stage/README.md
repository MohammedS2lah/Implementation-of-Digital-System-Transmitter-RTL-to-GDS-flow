# Floorplanning Stage

The Floorplanning stage initiates the physical implementation process in ASIC design. It establishes the physical structure, layout boundaries, and macro placement that the rest of the flow (placement, CTS, routing) will build upon. A strong floorplan directly improves timing, area efficiency, routability, and power delivery.

---

## 📌 Overview

**Floorplanning** is the first major physical step after the NDM setup. It involves defining:
- The **core area** and **die dimensions**
- Placement of **macros, memories, and IP blocks**
- Creation of **keep-out zones, halos**, and **blockages**
- Creation of **Site rows**, placement **well-tap cells**, and **Boundary cells**.
- Initial setup for **power grid planning**

A robust floorplan not only minimizes routing congestion and timing bottlenecks but also helps achieve better design closure across corners and modes.

---

## 🎯 Purpose and Objectives

The floorplan serves several critical purposes:

- 🧭 Define **core area and die size** based on utilization targets
- 📌 Strategically place **macros, memories, and hard IPs** to minimize timing and routing congestion
- ⚡ Prepare the design for **power planning** by defining boundaries and power domains
- 🚫 Insert **halos, keep-out margins, and blockages** to reserve space for routing and avoid overlaps
- 🔀 Enable optimal **logic-to-physical correlation** to improve proximity for critical nets and timing paths

---

## 🎯 Targets and Outcomes

During this stage, the following key targets are achieved:

| Target                                | Description                                                                 |
|---------------------------------------|-----------------------------------------------------------------------------|
| ⚖️ Area-Congestion Balance             | Maximize utilization without overloading placement and routing resources    |
| 🏁 White Space Allocation              | Leave enough space for CTS and congestion relief                            |
| ⚡ Power Grid Channels                 | Ensure open regions for robust VDD/VSS routing                              |
| 📐 Hierarchical Partitioning           | Align layout organization with netlist hierarchy                            |

Upon completion, the floorplan acts as a scaffold for the rest of the flow: **placement**, **clock tree synthesis**, and **routing**, especially under **multi-corner multi-mode (MCMM)** analysis.

---

## ⚙️ EDA Tool Used

| Tool                             | Role                                         |
|----------------------------------|----------------------------------------------|
| **Synopsys IC Compiler II (ICC2)** | Used to create and refine the floorplan layout |

---

## 🧾 Floorplan Outputs

| Output Artifact                      | Description                                                             |
|--------------------------------------|-------------------------------------------------------------------------|
| `Floorplan DEF/GDS`                  | Floorplan data defining block locations, core, IOs, halos, etc.         |
| `FP Reports`                         | Reports on core utilization, block placement, congestion maps, etc.     |
| `Updated NDM`                        | NDM now enriched with layout-level physical context                     |

---
---
---


# ICC2 GUI

## Core offset of 13.5 after Floorplanning

![image](https://github.com/user-attachments/assets/9e0fd688-e705-490e-93ce-fc31b661b1e6)

---

## Placement of I/Os

![IOs](https://github.com/user-attachments/assets/8a2960ca-7a57-45a0-a181-9c261721b455)

---

## Creation of Site Rows

![image](https://github.com/user-attachments/assets/face0a48-5b04-4aa7-af8c-67dfa2739ad4)

---

## Die Floorplanning and Initial legalized placement of cells

![image](https://github.com/user-attachments/assets/73771428-ff70-415b-8791-acbb14b42e35)

---

## Placement of well tap cells

![image](https://github.com/user-attachments/assets/a61fae53-c6a5-4bb4-81ad-bc6ed44ce2d8)

---

## Placement of Boundary cells

![image](https://github.com/user-attachments/assets/7ac2e109-0099-4d19-abb8-e2c2de1566c6)

---

## Spacing of 25 between well tap cells

![image](https://github.com/user-attachments/assets/977f0f44-7136-46f0-9f78-5c009a6d7b40)
