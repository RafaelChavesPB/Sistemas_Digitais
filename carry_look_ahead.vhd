library ieee;
use ieee.std_logic_1164.all;

entity carry_look_ahead is
	port (a,b: in std_logic_vector(3 downto 0); 
			cin: in std_logic; 
			s:out std_logic_vector(3 downto 0);
			cout: out std_logic);
end carry_look_ahead;

architecture carry_look_ahead of carry_look_ahead is
	component half_adder is
	port(a,b:in std_logic; p,g: out std_logic);
	end component;
	signal g,p: std_logic_vector(3 downto 0);
	signal carry: std_logic_vector(4 downto 0);
begin
	laco: for it in 0 to 3 generate
		DUT: half_adder port map (a(it),b(it),p(it),g(it));
		s(it)<=carry(it) xor p(it);
	end generate;
	cout<=carry(4);
	carry(0)<=cin;
	carry(1)<=g(0) or (p(0)and carry(0));
	carry(2)<=g(1) or (p(1) and g(0)) or (p(1) and p(0) and carry(0));
	carry(3)<=g(2) or (p(2) and g(1)) or (p(2) and p(1) and p(0) and carry(0));
	carry(4)<=g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3)and p(2)and p(1) and g(0)) or (p(3)and p(2)and p(1) and p(0) and carry(0));
end carry_look_ahead;
	
	

