# 8-bit Pipelined MAC Unit with 16-bit Kogge–Stone Adder  
**Version 1.0** · _04 Feb 2026_

This project implements and simulates an **8-bit high-performance Multiply–Accumulate (MAC) unit** using a **2-stage pipeline**. A **16-bit Kogge–Stone prefix adder** is employed to achieve fast carry propagation in the accumulation stage.

<img width="617" height="314" alt="image" src="https://github.com/user-attachments/assets/de25b491-9c89-4cf1-9501-d1330ffdaee3" />

---


## RTL Architecture

1. 8-bit MAC unit
2. 8x8 Multiplier (Unsigned)
3. 16-bit Kogge Stone Adder

## Schematic 
### Collapsed View (Top-Level Hierarchy)
![Collapsed](docs/collapsed_schematic.png.gif)

---

## Verification and Simulation Results

- The design was verified using a Verilog testbench (`mac8bit_tb.v`) in **Vivado(2025.1)** along with monitored outputs.

  ### Monitor Output 

```
# run 1000ns
Time=0 | a=  0 b=  0 | Y=     x
Time=5000 | a=  0 b=  0 | Y=     0
Time=20000 | a=  2 b=  3 | Y=     0
Time=30000 | a=  4 b=  5 | Y=     0
Time=35000 | a=  4 b=  5 | Y=     6
Time=40000 | a=  4 b= 22 | Y=     6
Time=45000 | a=  4 b= 22 | Y=    26
Time=50000 | a= 10 b=  1 | Y=    26
Time=55000 | a= 10 b=  1 | Y=   114
Time=60000 | a= 30 b=221 | Y=   114
Time=65000 | a= 30 b=221 | Y=   124
Time=70000 | a= 10 b= 10 | Y=   124
Time=75000 | a= 10 b= 10 | Y=  6754
Time=80000 | a=  0 b=  1 | Y=  6754
Time=85000 | a=  0 b=  1 | Y=  6854
Time=90000 | a=100 b= 10 | Y=  6854
Time=100000 | a=100 b=100 | Y=  6854
Time=105000 | a=100 b=100 | Y=  7854
Time=110000 | a=200 b=200 | Y=  7854
Time=115000 | a=200 b=200 | Y= 17854
Time=125000 | a=200 b=200 | Y= 57854
Time=130000 | a=  0 b=  0 | Y= 57854
Time=135000 | a=  0 b=  0 | Y= 97854
Final Verification Y =  97854
```

  **v1.0 Simulation Results**
  <img width="1547" height="221" alt="image" src="https://github.com/user-attachments/assets/8366de5c-089d-4702-9472-c74a9355967e" />
  
---


# Progress
- v1.0 uses a line-by-line derived KS structure to ensure correctness and ease of verification. Simulation in Vivado confirms correct accumulation, reset behavior, and overflow characteristics.

# Reference 
1. [https://en.wikipedia.org/wiki/Kogge%E2%80%93Stone_adder](https://en.wikipedia.org/wiki/Kogge%E2%80%93Stone_adder)
