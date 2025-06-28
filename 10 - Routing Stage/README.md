# Routing Stage

The **Routing Stage** is a critical milestone in the digital physical design flow, transforming abstract connectivity (netlist) into real-world metal paths over silicon. Following placement and clock tree synthesis (CTS), routing physically wires together all the design components — standard cells, macros, and IOs — while adhering to electrical and geometric design constraints.

---

## 📌 Overview

Routing finalizes the physical implementation by establishing signal, power, and clock connections across designated metal layers. It directly influences timing, signal integrity, power consumption, and manufacturability. The stage includes both global routing (resource estimation and path planning) and detailed routing (precise layer/via assignment).

---

## 🎯 Purpose

The main purpose of the routing stage is to:
-  **Complete connectivity** for all nets defined in the synthesized netlist.
-  **Respect foundry design rules** for spacing, widths, and via constraints.
-  **Maintain timing integrity** by optimizing path delays and reducing parasitics.
-  **Reduce noise and crosstalk**, particularly for sensitive and critical nets.
-  **Balance metal layer usage** to prevent congestion and promote routing quality.

---

## 🎯 Targets

| Objective               | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
|  Net Connectivity     | Ensure all pins are electrically connected with no opens or shorts          |
|  DRC Compliance       | Pass all design rule checks as defined by technology constraints            |
|  Timing Closure       | Optimize routing to meet setup/hold time constraints                        |
|  Congestion Management| Spread routing evenly to avoid hot spots or routing detours                 |
|  Crosstalk Reduction  | Isolate critical nets or use shielding where needed                         |

---

## 📊 Outcomes

After routing is complete, the design achieves:

| Outcome                                | Description                                                           |
|----------------------------------------|-----------------------------------------------------------------------|
|  Fully Routed Layout                 | All signal, clock, and power nets connected through actual metal paths |
|  Accurate Interconnect Delays        | Timing updated based on physical wire RCs                             |
|  DRC-Clean Design                    | No violations against metal/via spacing, width, or enclosure rules     |
|  Optimized Via Placement             | Efficient and manufacturable via strategy across layers               |
|  GDSII-Ready Netlist                 | Final physical representation prepared for extraction and signoff     |

---

## ⚙️ EDA Tool Used

| Tool               | Role                           |
|--------------------|--------------------------------|
| **Synopsys ICC2**  | Global and detailed routing    |

---

## Routing Global Timing Report

![image](https://github.com/user-attachments/assets/8b6bca08-95c6-446b-9a09-7667e3329ce4)

---

## Routing Min Timing Report

![image](https://github.com/user-attachments/assets/ff4df1cd-0fbb-44d1-a771-e9973560f3ad)

---

## Routing Max Timing Report

![image](https://github.com/user-attachments/assets/a70bda7c-82b3-4e50-9f8a-f490319452e8)

---

## Routing QoR Snapshot Report 

![image](https://github.com/user-attachments/assets/289b37ff-af55-4b70-bf85-63d951a63d7a)

---
---

## ICC II GUI after Routing stage without Power Mesh – in details

![image](https://github.com/user-attachments/assets/304135cf-bed2-4602-996d-cb13ec218dfe)

---

## ICC II GUI after Routing stage without Power Mesh – The whole core

![image](https://github.com/user-attachments/assets/5a9e8868-ce73-499e-bfa3-ccc0995da878)

---

## Global Route Congestion map

![image](https://github.com/user-attachments/assets/c3ea01c0-572e-4c53-ab65-164ba7f4c2c2)

---

## Cell Density map

![image](https://github.com/user-attachments/assets/e39aa674-54ba-4f20-a7ab-f6a60e3131f9)

---

## Pin Density map

![image](https://github.com/user-attachments/assets/ee795bd6-5373-4ebf-b0f1-ab69d3a90cf7)

---

## Power Density map

![image](https://github.com/user-attachments/assets/b5897857-e3d6-400d-a6cf-1594e3d00707)

---

## Final Design Layout view after Routing Stage

![image](https://github.com/user-attachments/assets/5134b9a9-2957-460c-9618-dfe44b5fc003)



