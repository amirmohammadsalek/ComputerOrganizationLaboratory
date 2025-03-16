----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:55:55 03/15/2025 
-- Design Name: 
-- Module Name:    buff_func - Behavioral 
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

entity buff_func is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           op00_r : in  STD_LOGIC_VECTOR (7 downto 0);
           f00 : out  STD_LOGIC_VECTOR (7 downto 0));
end buff_func;

architecture Behavioral of buff_func is

begin

	f00 <= A and op00_r;

end Behavioral;

