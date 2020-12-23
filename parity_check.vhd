library ieee;
use ieee.std_logic_1164.all;


entity parity_check is
	generic(n:integer:=4);
	port(input: in std_logic_vector(n downto 0); 
    	 error: out std_logic);
end parity_check;

architecture parity_check of parity_check is
	component g_paridade is
		generic(n:integer:=4);
		port(input: in std_logic_vector(n-1 downto 0);
    		 b_par,b_impar: out std_logic);
	end component;
    
    signal b_par,b_impar:std_logic;
begin
	
	laco: g_paridade port map(input(3 downto 0),b_par,b_impar);
	error<=b_par xnor input(n);

end parity_check;
