library ieee;
use ieee.std_logic_1164.ALL;

entity reg_v4 is
port( 
	z: out std_logic_vector(7 downto 0);
	Disp_en: out std_logic_vector(3 downto 0);
	SW: in std_logic_vector(4 downto 0);
	ck, reset, b0, b1, b2, b3: in std_logic
);
end reg_v4;

architecture beh of reg_v4 is
	type my_state is (s0, s1, s2, s3);
	signal n_s : my_state;
	signal CK_div : std_logic;
	signal sw_sel : std_logic_vector(0 to 3);
begin
	process(sw_sel) -- single-step process
		variable temp3 : std_logic_vector(3 downto 0);
		variable temp2 : std_logic_vector(3 downto 0);
		variable temp1 : std_logic_vector(3 downto 0);
		variable temp0 : std_logic_vector(3 downto 0);
	begin
		case sw_sel is
			when "1000" => temp3 := sw(3 downto 0);
			when "0100" => temp2 := sw(3 downto 0);
			when "0010" => temp1 := sw(3 downto 0);
			when "0001" => temp0 := sw(3 downto 0);
			when others => null;
		end case;
		if n_s = s0 then
			case temp3 is
				when "0000" => z <= "00000011";
				when "0001" => z <= "10011111";
				when "0010" => z <= "00100101";
				when "0011" => z <= "00001101";
				when "0100" => z <= "10011001";
				when "0101" => z <= "01001001";
				when "0110" => z <= "01000001";
				when "0111" => z <= "00011111";
				when "1000" => z <= "00000001";
				when "1001" => z <= "00011001";
				when "1010" => z <= "00010001";
				when "1011" => z <= "11000001";
				when "1100" => z <= "01100011";
				when "1101" => z <= "10000111";
				when "1110" => z <= "01100001";
				when "1111" => z <= "01110001";
				when others => null;
			end case;
		end if;
		if n_s = s1 then
			case temp2 is
				when "0000" => z <= "00000011";
				when "0001" => z <= "10011111";
				when "0010" => z <= "00100101";
				when "0011" => z <= "00001101";
				when "0100" => z <= "10011001";
				when "0101" => z <= "01001001";
				when "0110" => z <= "01000001";
				when "0111" => z <= "00011111";
				when "1000" => z <= "00000001";
				when "1001" => z <= "00011001";
				when "1010" => z <= "00010001";
				when "1011" => z <= "11000001";
				when "1100" => z <= "01100011";
				when "1101" => z <= "10000111";
				when "1110" => z <= "01100001";
				when "1111" => z <= "01110001";
				when others => null;
			end case;
		end if;
		if n_s = s2 then
			case temp1 is
				when "0000" => z <= "00000011";
				when "0001" => z <= "10011111";
				when "0010" => z <= "00100101";
				when "0011" => z <= "00001101";
				when "0100" => z <= "10011001";
				when "0101" => z <= "01001001";
				when "0110" => z <= "01000001";
				when "0111" => z <= "00011111";
				when "1000" => z <= "00000001";
				when "1001" => z <= "00011001";
				when "1010" => z <= "00010001";
				when "1011" => z <= "11000001";
				when "1100" => z <= "01100011";
				when "1101" => z <= "10000111";
				when "1110" => z <= "01100001";
				when "1111" => z <= "01110001";
				when others => null;
			end case;
		end if;
		if n_s = s3 then
			case temp0 is
				when "0000" => z <= "00000011";
				when "0001" => z <= "10011111";
				when "0010" => z <= "00100101";
				when "0011" => z <= "00001101";
				when "0100" => z <= "10011001";
				when "0101" => z <= "01001001";
				when "0110" => z <= "01000001";
				when "0111" => z <= "00011111";
				when "1000" => z <= "00000001";
				when "1001" => z <= "00011001";
				when "1010" => z <= "00010001";
				when "1011" => z <= "11000001";
				when "1100" => z <= "01100011";
				when "1101" => z <= "10000111";
				when "1110" => z <= "01100001";
				when "1111" => z <= "01110001";
				when others => null;
			end case;
		end if;
	end process;
	process(ck_div)
	begin
		if ck_div'event and ck_div='1' then
			if b3 = '1' then 
				sw_sel <= "1000";
			elsif b2 = '1' then 
				sw_sel <= "0100";
			elsif b1 = '1' then 
				sw_sel <= "0010";
			elsif b0 = '1' then 
				sw_sel <= "0001";
			else 
				sw_sel <= "0000";
			end if;
			case n_s is
				when s0 => disp_en <="0111";n_s <= s1;
				when s1 => disp_en <="1011";n_s <= s2;
				when s2 => disp_en <="1101";n_s <= s3;
				when s3 => disp_en <="1110";n_s <= s0;
			end case;
		end if;
	end process;
	process(ck)
		variable count : integer;
	begin
		if ck = '1' and ck'event then
			if reset = '1' then
				count := 0;
				ck_div <= '0';
			elsif reset = '0' then
				if count = 99999 then
					ck_div <= not ck_div;
					count := 0;
				else 
					count := count + 1;
				end if;
			end if;
		end if;
	end process;
end beh;