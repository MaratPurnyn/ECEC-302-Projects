library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink is
port (b1, b2, ck, reset: in std_logic;
 z: out std_logic);
end blink;

architecture Behavioral of blink is
 signal ck1 : std_logic;
 type blink_state is (slow, fast);
 signal blink: blink_state;
begin
process(ck, b1, b2)
variable count : integer;
variable divider : integer := 9999999;
begin
	if ck='1' and ck'event then
	 if reset = '1' then
		count := 0; ck1 <= '0'; blink <= slow; divider:=9999999;
	 else
		if count = divider then
			ck1 <= not ck1; count := 0;
		else
			count := count + 1;
		end if;
	 end if;
	 case blink is
		 when slow =>
			 if b1 = '1' then blink <= fast; divider:=999999; count := 0; ck1 <= '0'; end if;
			 
		 when fast =>
			 if b2 = '1' then blink <= slow; divider:=9999999; count := 0; ck1 <= '0'; end if;
		 when others => null;
	 end case;
	end if;
end process;
process(ck1)
	begin
		if ck1 = '1' then z <= '1';
		elsif ck1 = '0' then z <= '0';
		else null;
	end if;
end process;
end Behavioral;


---------------------
--
--architecture Behavioral of clockdivider is
--signal ck1 : std_logic;
--begin
--process(ck)
--variable count : integer;
--begin
--if ck = '1' and ck'event then
--	if reset = '1' then
--		count := 0; ck1 <= '0';
--	else
--		if count = 9999999 then
--			ck1 <= not ck1; count := 0;
--		else
--			count := count + 1;
--		end if;
--	end if;
--end if;
--end process;
--process(ck1)
--begin
--if ck1 = '1' then z <= '1';
--elsif ck1 = '0' then z <= '0';
--else null;
--end if;
--end process;
--end Behavioral;