library ieee;
use ieee.std_logic_1164.all;

entity crc is
port(data,clk: in std_logic;
	  crc_out: out std_logic_vector(1 downto 0));
end crc;

architecture crc of crc is 
	signal reg:std_logic_vector(1 downto 0):="00";
begin
		crc_out<=reg;
		main: process(clk) 
		begin
			if(clk='0') then
				reg(1)<=reg(0);
				reg(0)<= reg(1) xor data;
			end if;
		end process;
end crc;
