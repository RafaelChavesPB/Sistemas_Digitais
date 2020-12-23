-- Gera o bit paridade para uma sequência de bits.
library IEEE;
use IEEE.std_logic_1164.all;

entity g_paridade is
	generic(n:integer:=4);
	port(input: in std_logic_vector(n-1 downto 0);
    	 b_par,b_impar: out std_logic);
end g_paridade;


architecture g_paridade of g_paridade is
	signal aux: std_logic_vector(n downto 0);
begin
	b_par<=aux(n);
    b_impar<= not aux(n);
	aux(0)<='0';
	laco:for it in 0 to n-1 generate
    	aux(it+1)<=input(it) xor aux(it);
    end generate;
    
end g_paridade;
