library ieee;
use ieee.std_logic_1164.all;

entity rca is 
generic(tam_rca:integer:=4);
port(a,b: in std_logic_vector(tam_rca-1 downto 0);
		s: out std_logic_vector(tam_rca-1 downto 0);
		cin: in std_logic;
		cout: out std_logic);
end rca;

architecture rca of rca is
signal aux: std_logic_vector(tam_rca downto 0);
component full_adder is
	port(a,b,cin:in std_logic;
			s, cout: out std_logic);
end component;

begin	
	laco: for it in 0 to tam_rca generate
	DUT:full_adder port map(a(it), b(it), aux(it), s(it), aux(it+1));
	end generate;
	aux(0)<=cin;
	cout<=aux(tam_rca);
end rca;


	
