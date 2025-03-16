--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:39:29 03/15/2025
-- Design Name:   
-- Module Name:   C:/Users/ASA/Desktop/Az Ajza/ALU/test1.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         OPCODE : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         F : OUT  std_logic_vector(7 downto 0);
         Status : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal F : std_logic_vector(7 downto 0);
   signal Status : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          OPCODE => OPCODE,
          Cin => Cin,
          F => F,
          Status => Status
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
		wait for 10 ns;
		A <= "11010111";
		B <= "00000000";
		OPCODE <= "0000";
		Cin <= '0';
		wait for 10 ns;	
		
		A <= "00000000";
		B <= "00000000";
		OPCODE <= "0000";
		Cin <= '0';
		wait for 10 ns;	
		
		A <= "01010101";
		B <= "11010110";
		OPCODE <= "0100";
		Cin <= '0';
		wait for 10 ns;	
		
		A <= "10011110";
		B <= "11000110";
		OPCODE <= "0101";
		Cin <= '0';
		wait for 10 ns;	
		
		A <= "10101010";
		B <= "11010111";
		OPCODE <= "0110";
		Cin <= '0';
		wait for 10 ns;	
		
		A <= "10101010";
		B <= "00000000";
		OPCODE <= "0111";
		Cin <= '0';
		--wait for 10 ns;
      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
