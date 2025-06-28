# Clock Tree Synthesis (CTS) Stage

The **Clock Tree Synthesis (CTS)** stage is a cornerstone of the physical design process. Unlike signal nets, clock nets demand meticulous planning and routing due to their direct impact on the timing of every sequential element in the design. CTS is responsible for transforming the ideal clock source into a physically balanced, low-skew distribution network across the entire chip.

---

## 📌 Overview

CTS builds the actual clock distribution tree post-placement by inserting buffers, inverters, and clock gating elements to guide the clock signal from its root (e.g., PLL or clock pad) to all flip-flops and sequential elements. It aims to maintain uniform clock arrival times while balancing power and timing budgets.

---

## 🎯 Purpose

The CTS stage is designed to:
-  **Distribute clock signals** evenly and predictably across all clock sinks.
-  **Minimize clock skew**, ensuring all flip-flops operate synchronously.
-  **Support clock gating** logic for dynamic power savings.
-  **Manage latency** to preserve setup and hold timing margins.
-  **Optimize buffer insertion** to minimize power while maintaining signal integrity.

---

## 🎯 Targets

| Objective              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
|  Skew Minimization   | Ensure uniform clock arrival times across all endpoints                    |
|  Latency Control     | Maintain optimal clock path delays to meet timing constraints              |
|  Power Optimization   | Insert minimal buffers and leverage clock gating to save dynamic power      |
|  Clock Gating Handling| Properly insert and validate clock gates for functional and power integrity |

---

## 🧾 Outcomes

Upon completion of CTS, the design achieves:

| Outcome                                | Description                                                         |
|----------------------------------------|---------------------------------------------------------------------|
|  Complete Clock Tree                 | All clock sinks connected through synthesized tree branches         |
|  Controlled Skew and Latency        | Verified clock balance across critical paths                        |
|  CTS-Ready Netlist and Layout        | Updated design ready for post-CTS timing analysis and routing       |
|  Clock QoR Reports                   | Detailed metrics for clock skew, latency, gating efficiency         |

---

## ⚙️ EDA Tool Used

| Tool               | Role                               |
|--------------------|------------------------------------|
| **Synopsys ICC2**  | Clock tree synthesis and analysis  |

---

## Clock Tree Report

![image](https://github.com/user-attachments/assets/84552328-b015-4eb9-8295-8ebe4d0b2f72)

---

## QoR Snapshot Report after CTS Stage

![image](https://github.com/user-attachments/assets/0fd98975-dcf8-4d2e-ae77-2c1363fea8a0)

---

## CTS Stage Global Timing Report

![image](https://github.com/user-attachments/assets/d79a11b6-72e4-4dd1-a0d1-ffc95af0d989)

---

## CTS Stage Min Timing Report

![image](https://github.com/user-attachments/assets/69c99add-a00a-47b5-974d-18abf20a51bf)

---

## CTS Stage Max Timing Report

![image](https://github.com/user-attachments/assets/49bd06a4-383f-40bd-8f9c-1040abfec76c)

---

## ICC II GUI after CTS without Power Mesh

![image](https://github.com/user-attachments/assets/9e44cf61-bfbf-411f-9f7a-ec7ffced5127)

---

## ICC II GUI after CTS Highlighting Clock Tree

![image](https://github.com/user-attachments/assets/59322bfd-5198-43b4-81b5-758de372e8ba)

---

## ICC II GUI after CTS with Power Mesh

![image](https://github.com/user-attachments/assets/015e615a-4957-4959-80d8-ebbab1e49ad0)

