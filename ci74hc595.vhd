library ieee;
use ieee.std_logic_1164.all;

entity ci74hc595 is
	port (oe_b,rclk,srclr_b,srclk,ser: in std_logic;
			q:out std_logic_vector(7 downto 0);
			qh:out std_logic);
end ci74hc595;

architecture ci74hc595 of ci74hc595 is 
	signal shift:std_logic_vector(7 downto 0):=(others => '0');
	signal reg:std_logic_vector(7 downto 0):=(others => '0');
begin

	regshift: process(srclr_b,srclk) 
		begin
			if(srclr_b='0') then
				shift<=(others => '0');
			elsif (srclk'event and srclk='0') then
				shift(6 downto 0)<= shift(7 downto 1);
				shift(7)<=ser;
			end if;
	end process;
	
	regfill: process (rclk) 
	begin
		if(rclk='0') then
			reg <=shift;
		end if;
	end process;
	q<=reg when oe_b='0' else 
		(others => 'Z');
	qh<= shift(0);
	
end ci74hc595;
	
	
