# Implementation-of-Digital-System-Transmitter-RTL-to-GDS-flow
Full RTL-to-GDSII physical implementation of a Digital Transmitter using industry-standard Synopsys tools (Design Compiler, ICC2, StarRC, PrimeTime).


🎯 A complete backend digital design project implementing a **Digital System Transmitter**, progressing from RTL description to the final GDSII layout using a full industry-grade physical design flow.

---

## 📘 Overview

This project showcases the physical implementation of a custom digital transmitter using a complete **RTL-to-GDSII** flow and offering hands-on experience with leading EDA tools and modern VLSI design methodologies.


The design journey includes:
- Synthesis with **Design Compiler**
- Data setup, Floorplanning, PowerPlanning, Placement, CTS, and Routing with **ICC2**
- Parasitic extraction with **StarRC**
- Static timing analysis using **PrimeTime**

---

## 📌 Project Structure

```bash
├── Synthesis/              # Design Compiler Logs and reports
├── Floorplanning/          # Floorplan results and reports
├── PowerPlanning/          # Power rings, stripes, and checks
├── Placement/              # Placement results and reports
├── CTS/                    # Clock Tree Synthesis stage and reports
├── Routing/                # Routing congestion maps, results, and reports
├── StarRC/                 # Parasitic extraction results
└── STA_PrimeTime/          # Static Timing Analysis reports and histogram
````

---

## 🧰 EDA Tools Used

| Tool               | Purpose                                               |
| ------------------ | ------------------------------------------------------|
| Synopsys DC        | RTL Synthesis                                         |
| Synopsys ICC2      | Floorplanning, Powerplanning, Placement, CTS, Routing |
| Synopsys StarRC    | Parasitic Extraction                                  |
| Synopsys PrimeTime | Static Timing Analysis                                |

---

## 🚀 Flow Stages and Goals

| Stage                      | Description                                                                                            |
| -------------------------- | ------------------------------------------------------------------------------------------------------ |
| 🛠️ RTL Design             | Described the digital transmitter architecture in SystemVerilog.                                        |
| 🔧 Synthesis              | Generated gate-level netlist and performed basic timing checks.                                         |
| 🧾 Data Setup/NDM Creation| Creation of the new data model (NDM) database by importing LEF, technology files, and cell libraries.   |  
|                            | Established the initial environment and unified view for downstream stages                             |
| 📐 Floorplanning          | Defined block boundaries, reserved regions for macros, and cell placement areas.                        |
| ⚡ Power Planning         | Created power/ground rings, stripes, and checked IR drop.                                               |
| 🧩 Placement              | Standard cell placement and optimization of physical layout.                                            |
| 🔁 Clock Tree Synthesis   | Built and balanced the clock tree while minimizing skew.                                                |
| 🔗 Routing                | Connected all cells while meeting timing and avoiding DRCs.                                             |
| ⚡ Parasitic Extraction   | Extracted RC values for accurate delay and power estimation.                                            |
| ⏱️ Static Timing Analysis | Verified setup/hold timing across slow and fast corners.                                                |


---

## 📩 Contact

For questions, collaboration, or feedback:
**\Mohammed Salah**
🔗 \https://www.linkedin.com/in/mohammed-aboshosha/

