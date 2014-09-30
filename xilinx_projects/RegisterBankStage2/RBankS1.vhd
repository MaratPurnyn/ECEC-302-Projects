----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:26 09/25/2014 
-- Design Name: 
-- Module Name:    seq_det - Behavioral 
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
library ieee;
use ieee.std_logic_1164.ALL;

entity RBank is
port( 
	b1, b2, b3, b4,ck, en: in std_logic;
	led: out std_logic_vector(7 downto 0);
	cath: out std_logic_vector(7 downto 0);
	anod: out std_logic_vector(3 downto 0);
	sw: in std_logic_vector(1 downto 0)
);
end RBank;

architecture beh of RBank is
signal cathSet : std_logic;
begin

process(ck) -- single-step process
begin
if ck'event and ck='1' and en='1' then
	if b1 = '1' then 
		led(1) <= sw(1); 
		led(0) <= sw(0);
		anod <= "0111";
		cathSet <= '1';
	end if;
	if b2 = '1' then 
		led(3) <= sw(1); 
		led(2) <= sw(0); 
		anod <= "1011";
		cathSet <= '1';
	end if;
	if b3 = '1' then 
		led(5) <= sw(1); 
		led(4) <= sw(0); 
		anod <= "1101";
		cathSet <= '1';
		end if;
	if b4 = '1' then 
		led(7) <= sw(1); 
		led(6) <= sw(0);
		anod <= "1110";	
		cathSet <= '1';		
	end if;
end if;
end process;
process(cathSet)
begin
if cathSet'event and cathSet = '1' then
	Case sw is 
		When "00" =>
			cath <= "11111111";
		When "01" =>
			cath <= "10011111";
		When "10" =>
			cath <= "00100101";
		When "11" =>	
			cath <= "00001101";
		When others => null;
		cathSet <= '0';
	end case;
end if;
end process;

end beh;