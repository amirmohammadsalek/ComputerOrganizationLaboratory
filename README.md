# Computer Organization Laboratory
 Experiments and Homeworks
# ALU Design in VHDL - Exp 2

## Introduction
This document provides an explanation of the VHDL code implementing an **Arithmetic Logic Unit (ALU)**. The ALU performs logical operations based on an input opcode.

## Entity Definition
The `ALU` entity is defined with the following ports:
- **A, B**: 8-bit input vectors.
- **OPCODE**: 4-bit control input.
- **Cin**: Carry input.
- **F**: 8-bit output vector.
- **Status**: 4-bit status output.

```vhdl
entity ALU is 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0); 
           B : in  STD_LOGIC_VECTOR (7 downto 0); 
           OPCODE : in  STD_LOGIC_VECTOR (3 downto 0); 
           Cin : in  STD_LOGIC; 
           F : out  STD_LOGIC_VECTOR (7 downto 0); 
           Status : out  STD_LOGIC_VECTOR (3 downto 0)); 
end ALU;
```

## Component Declaration
Several components are declared inside the architecture to implement different logical operations:
- `buff_func`: Buffer operation.
- `and_func`: AND operation.
- `or_func`: OR operation.
- `xor_func`: XOR operation.
- `not_func`: NOT operation.

Each component is declared with respective input and output signals.

Example for AND function:
```vhdl
component and_func  
    PORT ( A : IN std_logic_vector(7 downto 0);
           B : IN std_logic_vector(7 downto 0);
           op04_r : IN std_logic_vector(7 downto 0);
           f04 : OUT std_logic_vector(7 downto 0)); 
end component;
```

## Opcode Handling
Each operation is controlled using a specific opcode:
- `00`: Buffer operation.
- `04`: AND operation.
- `05`: OR operation.
- `06`: XOR operation.
- `07`: NOT operation.

Example of the AND operation:
```vhdl
op04 <= not(OPCODE(3)) and OPCODE(2) and not(OPCODE(1)) and not(OPCODE(0)); 
op04_r <= op04 & op04 & op04 & op04 & op04 & op04 & op04 & op04; 
inst_and: and_func port map (A => A, B => B, op04_r => op04_r, f04 => f04);
```

## Output Calculation
The final output is determined by OR-ing all functional outputs:
```vhdl
f_r <= f00 or f04 or f05 or f06 or f07; 
F <= f_r;
```

Status bits are set based on the result:
- `Status(3)`: Zero flag (checks if the result is zero).
- `Status(2)`: Parity flag (XOR of all bits in the result).
- `Status(1)`, `Status(0)`: Not used (set to '0').

```vhdl
Status(3) <= not(f_r(7) or f_r(6) or f_r(5) or f_r(4) or f_r(3) or f_r(2) or f_r(1) or f_r(0)); 
Status(2) <= not(f_r(7) xor f_r(6) xor f_r(5) xor f_r(4) xor f_r(3) xor f_r(2) xor f_r(1) xor f_r(0)); 
Status(1) <= '0'; 
Status(0) <= '0'; 
```

## Summary
This ALU implementation supports multiple logical operations using VHDL components. The operation is selected via an `OPCODE`, and the result is computed accordingly. The status flags provide additional information about the computed result.
