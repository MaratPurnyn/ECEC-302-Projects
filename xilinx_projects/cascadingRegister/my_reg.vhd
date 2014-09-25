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
		X 		: in  std_logic_vector(3 downto 0);
		Z1		: out std_logic_vector(3 downto 0);
		Z2		: out std_logic_vector(3 downto 0);
		A, B, en, ck 	: in std_logic
);
end my_reg;
architecture Behavioral of my_reg is
Type my_state is (READY, ONE_EN, NOT_READY);
signal next_state: my_state;
signal ck1: std_logic;
signal temp1, temp2 : std_logic_vector(3 downto 0);
begin
process(ck)
begin
if ck='1' and ck'event then
	case next_state is
		When READY =>
			ck1 <= '0';
			if A = '1' then next_state <= ONE_EN; end if;
		When ONE_EN =>
			ck1 <= '1';
			next_state <= NOT_READY;
		When NOT_READY =>
			ck1 <= '0';
			if B = '1' then Next_state <= READY; end if;
	end case;
end if;
end process;
process(ck1)
begin
if CK1='1' and ck1'event then
--my added code
	if en='1' then
		temp1 <= X;
		temp2 <= temp1;
	end if;
end if;
end process;
Z1 <= temp1; Z2 <= temp2;
end Behavioral;