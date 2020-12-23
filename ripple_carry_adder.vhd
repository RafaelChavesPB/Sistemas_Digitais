library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry is
	generic(n:integer:=4);
    port(a,b: in std_logic_vector(n-1 downto 0);
    	 cin: in std_logic;
         s: out std_logic_vector(n-1 downto 0);		
         cout: out std_logic);
end ripple_carry;

architecture ripple_carry of ripple_carry is
	component full_adder is 
		port(a,b,cin: in std_logic;
    		 s,cout: out std_logic );
	end component;
    
    signal aux:std_logic_vector(n downto 0);
begin
	laco: for it in 0 to n-1 generate
    	adders: full_adder port map(a(it),b(it),aux(it),s(it),aux(it+1));
    end generate;
    aux(0)<=cin;
    cout<=aux(n);
end ripple_carry;
