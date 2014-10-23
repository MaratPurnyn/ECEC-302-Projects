library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate is 
generic (n: natural := 7); 
port(sw: in std_logic_vector(1 to n); 
 z: out std_logic);
end OR_gate;

architecture Behavioral of OR_gate is
begin
process(sw)
variable temp : integer := 0;
begin
	temp := 0;
	for I in 1 to n loop
		if (sw(I) = '1') then
			temp := temp + 1;
		end if;
	end loop;
	if temp > 0 then
		z <= '1';
	else
		z <= '0';
	end if;
end process;
end Behavioral;