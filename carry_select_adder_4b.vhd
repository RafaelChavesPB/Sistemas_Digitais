library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder_4b is
	port(a,b:in std_logic_vector(3 downto 0);
    	 cin:in std_logic;
         s: out std_logic_vector(3 downto 0);
         cout: out std_logic);
end carry_select_adder_4b;

architecture csa_4b of carry_select_adder_4b is
	component ripple_carry is
		generic(n:integer:=4);
    	port(a,b: in std_logic_vector(n-1 downto 0);
    		 cin: in std_logic;
        	 s: out std_logic_vector(n-1 downto 0);		
        	 cout: out std_logic);
	end component;
    signal s_top,s_down:std_logic_vector(3 downto 0);
    signal cout_top, cout_down:std_logic;
begin
	
    top: ripple_carry port map(a,b,'0',s_top,cout_top);
    bot: ripple_carry port map(a,b,'1',s_down,cout_down);
    
    cout<=(cin and cout_down) or (not cin and cout_top);
    
    mux_saida: for it in 0 to 3 generate
    	s(it)<=(cin and s_down(it)) or (not cin and s_top(it));
    end generate;
end csa_4b; 
