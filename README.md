# multiplication-tables-asm
16-bit MASM program to print multiplication tables from 1 to 20 using DOS interrupts.
# Multiplication Tables in MASM

This repository contains an **8086 Assembly language program** written in **MASM** that prints multiplication tables from **1 to 20**. The program demonstrates the use of loops, multiplication, DOS interrupts for output, and procedures to print numbers.

---

## Features

- Prints multiplication tables from **1 to 20**.
- Uses **nested loops** for generating tables.
- Implements **procedures** to print 8-bit and 16-bit numbers.
- Uses **DOS interrupt 21h** for printing strings and characters.
- Each table is separated by a **new line** for better readability.

---

## How it Works

1. The program initializes the **table number** starting from `1`.
2. The **outer loop** runs from **table 1 to 20**.
3. The **inner loop** runs from **multiplier 1 to 10**.
4. For each iteration:
   - Prints the **table number**.
   - Prints the **multiplier**.
   - Computes the **product** using `mul`.
   - Prints the result in the format:  
     ```
     3 * 5 = 15
     ```
5. Uses the `print_num` procedure to print single-byte numbers and `print_ax` to print 16-bit results.
6. Ends the program gracefully using DOS interrupt `int 21h` with `ah = 4Ch`.
---

## Requirements

- **MASM/TASM** assembler
- **DOSBox** or any DOS emulator
- Basic understanding of **8086 assembly**, registers, and interrupts

---


