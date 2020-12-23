library ieee;
use ieee.std_logic_1164.all;

--Unidade de lógica e aritimética.

entity ula is
	generic(n:integer:=4);
    port(a,b: in std_logic_vector(n-1 downto 0);
    --O sinal m seleciona o modo da operação:
    --m<=1, a ula subtrai os valores;
    --m<=0, a ula realiza uma soma.
    	   m: in std_logic;
         s: out std_logic_vector(n-1 downto 0);		
         cout: out std_logic);
end ula;

architecture ula of ula is
	component full_adder is 
		port(a,b,cin: in std_logic;
    		 s,cout: out std_logic );
	end component;
    
    signal aux:std_logic_vector(n downto 0);
	 signal new_b:std_logic_vector(n-1 downto 0);
begin
	laco: for it in 0 to n-1 generate
		new_b(it)<=b(it)xor m;
    	adders: full_adder port map(a(it),new_b(it),aux(it),s(it),aux(it+1));
    end generate;
    aux(0)<=m;
    cout<=aux(n);
end ula;
