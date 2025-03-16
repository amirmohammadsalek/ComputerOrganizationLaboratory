----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:15 03/16/2025 
-- Design Name: 
-- Module Name:    not_func - Behavioral 
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

entity not_func is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           op07_r : in  STD_LOGIC_VECTOR (7 downto 0);
           f07 : out  STD_LOGIC_VECTOR (7 downto 0));
end not_func;

architecture Behavioral of not_func is

begin

	f07 <= not(A) and op07_r;

end Behavioral;

