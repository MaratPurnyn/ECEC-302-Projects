library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
generic (m : natural := 2); -- max is 4 due to # of buttons
	port( 
		s 	 : in std_logic_vector(m-1 downto 0);
		x	 : in std_logic_vector(0 to 2**m - 1);
		z	 : out std_logic
	);
end mux;
architecture beh of mux is
begin
process(s, x)
variable temp : integer;
begin

temp := 0;
for i in 0 to m-1 loop
  if s(i) = '1' then
     temp := temp + 2**i;
  end if;
end loop;

z <= x(temp);

end process;

end beh;