
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier is 
	generic (size: integer:=4);
	port(a,b: in std_logic_vector(size-1 downto 0);
    	 s: out std_logic_vector(2*size-1 downto 0));
end multiplier;

architecture multiplier of multiplier is
	component ripple_carry is
	generic(n:integer:=4);
    	port(a,b: in std_logic_vector(n-1 downto 0);
    		 cin: in std_logic;
         	 s: out std_logic_vector(n-1 downto 0);		
        	 cout: out std_logic);
	end component;
	type grid_in is array(0 to size-1) of std_logic_vector(size-1 downto 0);
    type grid_aux is array(0 to size-1) of std_logic_vector(size downto 0);
    signal a_and_b: grid_in;
    signal aux: grid_aux;
begin
	-- Atribuindo o valor inicial da primeira linha para a matriz que auziliará nas operações com os somadores;
	aux(0)(size-1 downto 0)<=a_and_b(0);
    aux(0)(size)<='0';
    -- Atribuindo a saida do ultimo somador aos ultimos bits da saída;
    s(2*size-1 downto size-1)<=aux(size-1);
    
    -- Laco utilizado para criar as ligações que farão as operações and entre todos os bits de A e B;
	laco:for i in 0 to size-1 generate
    	laco2:for j in 0 to size-1 generate
        	a_and_b(i)(j)<= a(i) and b(j);
        end generate;
	end generate;
    --Laço utilizado para instanciar todos os somadores e atribuir o primeiro bit de cada somador para a saida;
    
    laco3: for i in 0 to size-2 generate
    	soma: ripple_carry port map(a_and_b(i+1),aux(i)(size downto 1),'0',aux(i+1)(size-1 downto 0),aux(i+1)(size));
        s(i)<=aux(i)(0);
    end generate;
    		
end multiplier;
