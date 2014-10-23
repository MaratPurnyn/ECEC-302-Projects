library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exam1 is
port (ck: in std_logic;
 z: out  std_logic_vector(7 downto 0));
end exam1;

architecture Behavioral of exam1 is
 signal temp :  std_logic_vector(7 downto 0) := "10000000";
 type light_state is (t0,t1,t2,t3,t4,t5,t6,t7);
 signal light: light_state;
begin
process(ck)
	variable count : integer := 0;
	variable countDivider : integer := 99999999;
begin
	if ck='1' and ck'event then -- executes code on rising edge of clock
		if count = countDivider then -- divides clock so that LEDs can be seen
			case light is
				 when t0 =>
					temp <= "10000000"; 
					light <= t1;
					countDivider := 89999999;
				 when t1 =>
					temp <= "11000000"; 
					light <= t2;
					countDivider := 79999999;
				 when t2 =>
					temp <= "11100000"; 
					light <= t3;
					countDivider := 69999999;
				 when t3 =>
					temp <= "11110000"; 
					light <= t4;
					countDivider := 59999999;
				 when t4 =>
					temp <= "11111000"; 
					light <= t5;
					countDivider := 49999999;
				 when t5 =>
					temp <="11111100"; 
					light <= t6;
					countDivider := 39999999;
				 when t6 =>
					temp <= "11111110"; 
					light <= t7;
					countDivider := 29999999;
				 when t7 =>
					temp <= "11111111"; 
					light <= t0;
					countDivider := 19999999;
			 when others => countDivider := 99999999;
			end case;
			z <= temp;
			count := 0;
		else
			count := count + 1;
		end if;
	end if;
end process;
end Behavioral;