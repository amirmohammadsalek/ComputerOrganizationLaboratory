----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:04 03/01/2025 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           OPCODE : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (7 downto 0);
           Status : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is
	signal op00 : std_logic;
	signal op00_r : std_logic_vector(7 downto 0);
	signal f00 : std_logic_vector(7 downto 0);

	
	signal op04 : std_logic;
	signal op04_r : std_logic_vector(7 downto 0);
	signal f04 : std_logic_vector(7 downto 0);
	
	signal op05 : std_logic;
	signal op05_r : std_logic_vector(7 downto 0);
	signal f05 : std_logic_vector(7 downto 0);
	
	signal op06 : std_logic;
	signal op06_r : std_logic_vector(7 downto 0);
	signal f06 : std_logic_vector(7 downto 0);
	
	signal op07 : std_logic;
	signal op07_r : std_logic_vector(7 downto 0);
	signal f07 : std_logic_vector(7 downto 0);
	
	--signal C : std_logic_vector(7 downto 0);

begin
	--concatenate: C <= "0000000" & Cin;

	-- OPCODE 00 BUFFER --
	op00 <= not(OPCODE(3)) and not(OPCODE(2))  and not(OPCODE(1)) and not(OPCODE(0));
	op00_r <= op00 & op00 & op00 & op00 & op00 & op00 & op00 & op00;
	f00 <= A and op00_r;
	
	-- OPCODE 04 AND --
	op04 <= OPCODE(3) 	  and not(OPCODE(2))  and not(OPCODE(1)) and not(OPCODE(0));
	op04_r <= op04 & op04 & op04 & op04 & op04 & op04 & op04 & op04;
	f04 <= A and B and op04_r;
	
	-- OPCODE 05 OR --
	op05 <= OPCODE(3) 	  and not(OPCODE(2))  and not(OPCODE(1)) and OPCODE(0);
	op05_r <= op05 & op05 & op05 & op05 & op05 & op05 & op05 & op05;
	f05 <= (A or B) and op05_r;
	
	-- OPCODE 06 XOR --
	op06 <= OPCODE(3)		  and not(OPCODE(2))  and OPCODE(1) 	    and OPCODE(0);
	op06_r <= op06 & op06 & op06 & op06 & op06 & op06 & op06 & op06;
	f06 <= (A Xor B) and op06_r;
	
	-- OPCODE 07 NOT --
	op07 <= not(OPCODE(3)) and OPCODE(2)  	  and OPCODE(1)  	 and OPCODE(0);
	op07_r <= op07 & op07 & op07 & op07 & op07 & op07 & op07 & op07;
	f07 <= not(A) and op07_r;
	
	
	F <= f00 or f04 or f05 or f06 or f07;
end Behavioral;

