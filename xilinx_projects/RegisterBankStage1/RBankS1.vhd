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

entity RBankS1 is
port( 
	b1, b2, b3, b4,ck, en: in std_logic;
	led: out std_logic_vector(7 downto 0);
	sw: in std_logic_vector(1 downto 0)
);
end RBankS1;

architecture beh of RBankS1 is
begin

process(ck) -- single-step process
begin
if ck'event and ck='1' and en='1' then
	if b1 = '1' then led(1) <= sw(1); led(0) <= sw(0); end if;
	if b2 = '1' then led(3) <= sw(1); led(2) <= sw(0); end if;
	if b3 = '1' then led(5) <= sw(1); led(4) <= sw(0); end if;
	if b4 = '1' then led(7) <= sw(1); led(6) <= sw(0); end if;
end if;
end process;

end beh;