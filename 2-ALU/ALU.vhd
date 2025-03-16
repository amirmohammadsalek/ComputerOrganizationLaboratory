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
	component buff_func
			PORT (
					A : IN std_logic_vector(7 downto 0);
					op00_r : IN std_logic_vector(7 downto 0);
					f00 : OUT std_logic_vector(7 downto 0)
					);
	end component;
	signal op00 : std_logic;
	signal op00_r : std_logic_vector(7 downto 0);
	signal f00 : std_logic_vector(7 downto 0);

	component and_func
			PORT (
					A : IN std_logic_vector(7 downto 0);
					B : IN std_logic_vector(7 downto 0);
					op04_r : IN std_logic_vector(7 downto 0);
					f04 : OUT std_logic_vector(7 downto 0)
					);
	end component;
	signal op04 : std_logic;
	signal op04_r : std_logic_vector(7 downto 0);
	signal f04 : std_logic_vector(7 downto 0);
	
	component or_func
			PORT (
					A : IN std_logic_vector(7 downto 0);
					B : IN std_logic_vector(7 downto 0);
					op05_r : IN std_logic_vector(7 downto 0);
					f05 : OUT std_logic_vector(7 downto 0)
					);
	end component;
	signal op05 : std_logic;
	signal op05_r : std_logic_vector(7 downto 0);
	signal f05 : std_logic_vector(7 downto 0);
	
	component xor_func
			PORT (
					A : IN std_logic_vector(7 downto 0);
					B : IN std_logic_vector(7 downto 0);
					op06_r : IN std_logic_vector(7 downto 0);
					f06 : OUT std_logic_vector(7 downto 0)
					);
	end component;
	signal op06 : std_logic;
	signal op06_r : std_logic_vector(7 downto 0);
	signal f06 : std_logic_vector(7 downto 0);
	
	component not_func
			PORT (
					A : IN std_logic_vector(7 downto 0);
					op07_r : IN std_logic_vector(7 downto 0);
					f07 : OUT std_logic_vector(7 downto 0)
					);
	end component;
	signal op07 : std_logic;
	signal op07_r : std_logic_vector(7 downto 0);
	signal f07 : std_logic_vector(7 downto 0);
	
	signal f_r : std_logic_vector(7 downto 0);

begin

	-- OPCODE 00 BUFFER --
	op00 <= not(OPCODE(3)) and not(OPCODE(2))  and not(OPCODE(1)) and not(OPCODE(0));
	op00_r <= op00 & op00 & op00 & op00 & op00 & op00 & op00 & op00;
	inst_buffer: buff_func port map (
				A => A,
				op00_r => op00_r,
				f00 => f00
				);
	
	-- OPCODE 04 AND --
	op04 <= not(OPCODE(3)) and OPCODE(2)  and not(OPCODE(1)) and not(OPCODE(0));
	op04_r <= op04 & op04 & op04 & op04 & op04 & op04 & op04 & op04;
	inst_and: and_func port map (
				A => A,
				B => B,
				op04_r => op04_r,
				f04 => f04
				);
	
	-- OPCODE 05 OR --
	op05 <= not(OPCODE(3)) 	  and OPCODE(2)  and not(OPCODE(1)) and OPCODE(0);
	op05_r <= op05 & op05 & op05 & op05 & op05 & op05 & op05 & op05;
	inst_or: or_func port map (
				A => A,
				B => B,
				op05_r => op05_r,
				f05 => f05
				);
	
	-- OPCODE 06 XOR --
	op06 <= not(OPCODE(3))		  and OPCODE(2)  and OPCODE(1) 	    and not(OPCODE(0));
	op06_r <= op06 & op06 & op06 & op06 & op06 & op06 & op06 & op06;
	inst_xor: xor_func port map (
				A => A,
				B => B,
				op06_r => op06_r,
				f06 => f06
				);
	
	-- OPCODE 07 NOT --
	op07 <= not(OPCODE(3)) and OPCODE(2)  	  and OPCODE(1)  	 and OPCODE(0);
	op07_r <= op07 & op07 & op07 & op07 & op07 & op07 & op07 & op07;
	inst_not: not_func port map (
				A => A,
				op07_r => op07_r,
				f07 => f07
				);
	
	-- Make Output --
	f_r <= f00 or f04 or f05 or f06 or f07;
	F <= f_r;
	Status(3) <= not(f_r(7) or f_r(6) or f_r(5) or f_r(4) or f_r(3) or f_r(2) or f_r(1) or f_r(0));
	Status(2) <= not(f_r(7) xor f_r(6) xor f_r(5) xor f_r(4) xor f_r(3) xor f_r(2) xor f_r(1) xor f_r(0));
	Status(1) <= '0';
	Status(0) <= '0';	
end Behavioral;

