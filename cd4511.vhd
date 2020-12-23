library ieee;
use ieee.std_logic_1164.all;

entity cd4511 is
	port(n:in std_logic_vector(3 downto 0);
		  le,bl,lt: in std_logic;
		  s: out std_logic_vector(6 downto 0));
end cd4511;


architecture cd4511 of cd4511 is
	signal state:std_logic_vector(3 downto 0);
	signal latch_to_decoder:std_logic_vector(3 downto 0);
	signal decoder_to_driver:std_logic_vector(6 downto 0);
begin 
	latch_to_decoder<=state;
	state<= n when le='0' else state; 
	decoder_to_driver<= "1111110" when latch_to_decoder="0000" else
							  "0110000" when latch_to_decoder="0001" else
							  "0110000" when latch_to_decoder="0001" else
end cd4511;
	
