library ieee;
use ieee.std_logic_1164.all;

---0xf2310000
entity crc_16b is
	port(data, clk: in std_logic;
		  crc_out: out std_logic_vector(15 downto 0));
end crc_16b;


architecture crc_16b of crc_16b is
	signal reg:std_logic_vector(15 downto 0):=x"0000";
begin
	crc_out<=reg;
	main:process(clk)
	begin
		if(clk='0') then 
			reg(0)<=reg(15) xor data;
			for it in 15 downto 1 loop
				if(it=15 or it=2) then
					reg(it)<=reg(it-1) xor reg(15);
				else 
					reg(it)<=reg(it-1);
				end if;
			end loop;
		end if;
	end process;

end crc_16b;
