library IEEE;
use IEEE.std_logic_1164.all;

entity carry_select_adder is
	generic(size: integer:=16);
	port(a,b:in std_logic_vector(size-1 downto 0);
    	 cin:in std_logic;
         s:out std_logic_vector(size-1 downto 0);
         cout:out std_logic);
end carry_select_adder;

architecture csa of carry_select_adder is
	component carry_select_adder_4b is
		port(a,b:in std_logic_vector(3 downto 0);
    	 	cin:in std_logic;
         	s: out std_logic_vector(3 downto 0);
         	cout: out std_logic);
  	end component;
    
    component ripple_carry is
		generic(n:integer:=4);
    	port(a,b: in std_logic_vector(n-1 downto 0);
    		 cin: in std_logic;
        	 s: out std_logic_vector(n-1 downto 0);		
        	 cout: out std_logic);
	end component;
    
    signal b_aux:std_logic_vector(size-1 downto 0);
    signal cout_aux:std_logic_vector((size/4)-1 downto 0);
    
begin 
	
	comp2: for it in 0 to size-1 generate
		b_aux(it)<=b(it) xor cin;
	end generate;
	
	first_4_bits:ripple_carry port map(a(3 downto 0),b_aux(3 downto 0),cin,s(3 downto 0), cout_aux(0));
		
   others_bits: for it in 1 to (size/4)-1 generate
		cs_adders: carry_select_adder_4b port map( a(4*it+3 downto 4*it), b_aux(4*it+3 downto 4*it),cout_aux(it-1),s( 4*it+3 downto 4*it),cout_aux(it));
   end generate;
 
    cout<=cout_aux((size/4)-1);
    
end csa;
