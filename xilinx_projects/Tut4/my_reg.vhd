----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:11:34 09/23/2014 
-- Design Name: 
-- Module Name:    my_reg - Behavioral 
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

entity my_reg is
port(
		X 			: in  std_logic_vector(3 downto 0);
		Z 			: out std_logic_vector(3 downto 0);
		en, ck 	: in std_logic
);
end my_reg;
architecture Behavioral of my_reg is
signal temp : std_logic_vector(3 downto 0);
begin
process(ck)
begin
if ck='1'and ck'event then
	if en = '1' then temp <= X;
	end if;
end if;
end process;
Z <= temp;
end Behavioral;