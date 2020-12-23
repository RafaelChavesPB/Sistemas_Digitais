library ieee;
use ieee.std_logic_1164.all;

entity reg is
	generic(n:integer:=4);
	port(d,clk: in std_logic;
			data: out std_logic_vector(n-1 downto 0));
end reg;

architecture reg of reg is
	signal states:std_logic_vector(n-1 downto 0):=(others=>'0');
begin
	data<=states;
	process(clk)
	begin	
		if(clk='1') then
			states(n-2 downto 0)<=states(n-1 downto 1);
			states(n-1)<=d;
		end if;
	end process;
end reg;
