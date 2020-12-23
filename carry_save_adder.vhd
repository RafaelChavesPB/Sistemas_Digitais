--Carry save adder implementado com um ripple carry.

library IEEE;
use IEEE.std_logic_1164.all;

entity carry_save_adder is
	generic(size: integer:=4);
    port( a,b:in std_logic_vector(size-1 downto 0);
    	  cin: in std_logic;	
    	  s:out std_logic_vector(size downto 0);
          cout:out std_logic);
end carry_save_adder;AC


architecture carry_save_adder of carry_save_adder is
	
    component ripple_carry is
		generic(n:integer:=4);
    	port(a,b: in std_logic_vector(n-1 downto 0);
    	 	cin: in std_logic;
         	s: out std_logic_vector(n-1 downto 0);		
         	cout: out std_logic);
	end component;
    
    component full_adder is 
	port(a,b,cin: in std_logic;
    	 s,cout: out std_logic );
	end component;
    
    signal cin_top:std_logic_vector(size-1 downto 0);
    signal cout_top:std_logic_vector(size-1 downto 0);
    signal sum_top: std_logic_vector(size downto 0);
    
begin
 	s(0)<=sum_top(0);
    sum_top(size)<='0';
	cin_top<=(0 => cin, others => '0');
    
    top:for it in 0 to size-1 generate 
    	f_adder:full_adder port map(a(it),b(it),cin_top(it),sum_top(it),cout_top(it));
    end generate;
    
	down:ripple_carry port map(sum_top(size downto 1),cout_top,'0',s(size downto 1),cout);
end carry_save_adder;
