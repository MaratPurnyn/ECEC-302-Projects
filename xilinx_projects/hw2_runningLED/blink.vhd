library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity knight_rider is
port (sel, ck: in std_logic;
 z: out  std_logic_vector(7 downto 0));
end knight_rider;

architecture Behavioral of knight_rider is
 signal temp :  std_logic_vector(7 downto 0) := "00000001";
 type direction_state is (left, right);
 signal direction: direction_state;
begin
process(ck)
	variable count : integer := 0;
begin
	if ck='1' and ck'event then -- executes code on rising edge of clock
		if count = 9999999 then -- divides clock so that LEDs can be seen
			z <= temp; -- sets LEDs to register stored in memory
			count := 0;
		else
			count := count + 1;
		end if;
		 
		 case direction is
			 when left =>
				if sel = '1' then 
						direction <= right;
				else
					if count = 9999998 then
						temp <= temp(6 downto 0) & temp(7); -- bitshift temp to the left
					end if;
				end if;
			 when right =>
				 if sel = '0' then 
						direction <= left;
				else
				   if count = 9999998 then
						temp <= temp(0) & temp(7 downto 1); --bitshift temp to the right
					end if;
				 end if;
			 when others => null;
		 end case;
	 end if;
end process;
end Behavioral;