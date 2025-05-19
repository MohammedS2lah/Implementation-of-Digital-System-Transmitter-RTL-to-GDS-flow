# Implementation-of-Digital-System-Transmitter-RTL-to-GDS-flow

Full RTL-to-GDSII physical implementation of a Digital Transmitter using industry-standard Synopsys tools (Design Compiler, ICC2, StarRC, PrimeTime) and SAED 32nm Technology Library.

🎯 A complete backend digital design project implementing a **Digital System Transmitter**, progressing from RTL description to the final GDSII layout using a full industry-grade physical design flow.

---

## 📘 Overview

This project showcases the physical implementation of a custom digital transmitter using a complete **RTL-to-GDSII** flow and offers hands-on experience with leading EDA tools and modern VLSI design methodologies.

The design journey includes:
- Synthesis with **Design Compiler**
- Scan insertion and testability setup using **DFT Compiler**
- Data Setup and NDM creation
- Floorplanning, Power Planning, Placement, CTS, and Routing using **ICC2**
- Parasitic extraction with **StarRC**
- Static timing analysis using **PrimeTime**

---

## 📌 Project Structure

```bash
├── RTL/                    # SystemVerilog design and testbenches
├── Synthesis/              # Design Compiler logs and reports
├── DFT/                    # Scan chain insertion logs and setup files
├── NDM_Setup/              # LEF/Lib/Tech files, Milkyway setup
├── Floorplanning/          # Floorplan results and reports
├── PowerPlanning/          # Power rings, stripes, and checks
├── Placement/              # Placement results and reports
├── CTS/                    # Clock Tree Synthesis stage and reports
├── Routing/                # Routing congestion maps, results, and reports
├── StarRC/                 # Parasitic extraction results
└── STA_PrimeTime/          # Static Timing Analysis reports, SDF, and histogram
```

---

## 🧰 EDA Tools Used


| Tool                     | Purpose                                                |
| ------------------------ | ------------------------------------------------------ |
| Synopsys Design Compiler | RTL Synthesis                                          |
| Synopsys DFT Compiler    | Scan Insertion and Testability Setup                   |
| Synopsys ICC2            | Floorplanning, Power Planning, Placement, CTS, Routing |
| Synopsys StarRC          | Parasitic Extraction                                   |
| Synopsys PrimeTime       | Static Timing Analysis                                 |


---

## 🚀 Flow Stages and Goals

| Stage                        | Description                                                                                                                        |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 🛠️ RTL Design               | Described the digital transmitter architecture in SystemVerilog.                                                                   |
| 🔧 Synthesis                 | Generated gate-level netlist and performed basic timing checks.                                                                    |
| 🔬 DFT Insertion             | Scan chains added using DFT Compiler to enable test coverage and observability.                                                    |
| 🧾 Data Setup / NDM Creation | Created the NDM by importing LEF, technology files, and standard cell libraries. Established a unified view for downstream stages. |
| 📐 Floorplanning             | Defined block boundaries, reserved regions for macros, and cell placement areas.                                                   |
| ⚡ Power Planning             | Created power/ground rings, stripes, and checked IR drop.                                                                          |
| 🧩 Placement                 | Standard cell placement and optimization of physical layout.                                                                       |
| 🔁 Clock Tree Synthesis      | Built and balanced the clock tree while minimizing skew.                                                                           |
| 🔗 Routing                   | Connected all cells while meeting timing and avoiding DRCs.                                                                        |
| ⚡ Parasitic Extraction       | Extracted RC values for accurate delay and power estimation.                                                                       |
| ⏱️ Static Timing Analysis    | Verified setup/hold timing across slow and fast corners.                                                                           |


---

## 📩 Contact

For questions, collaboration, or feedback:
**\Mohammed Salah**
🔗 \https://www.linkedin.com/in/mohammed-aboshosha/

