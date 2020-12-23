library ieee;
use ieee.std_logic_1164.all;

entity csa_4b is 
	port (a,b: in std_logic_vector(3 downto 0);
			s:out std_logic_vector(3 downto 0);
			cin: in std_logic; 
			cout: out std_logic);
end csa_4b;

architecture csa_4b of csa_4b is
	component rca is 
		generic(tam_rca:integer:=4);
		port(a,b: in std_logic_vector(tam_rca-1 downto 0);
				s: out std_logic_vector(tam_rca-1 downto 0);
				cin: in std_logic;
				cout: out std_logic);
	end component;
	signal aux,aux2: std_logic_1164( tam_rca downto 0);
begin
	-- Criando os blocos;
	rpc: rca port map(a,b,aux(tam_rca-1 downto 0),'0',aux(tam_rca));
	rpc2: rca port map(a,b,aux2(tam_rca-1 downto 0),'1',aux2(tam_rca));
	-- Selecionando as saidas;
	laco2:for it in 0 to tam_rca-1 Generate
		s(it)<= (aux(it) and (not cin)) or  (aux2(it) and cin);
	end generate;
	cout<=(aux(tam_rca) and (not cin)) or  (aux2(tam_rca) and cin);
	
end csa_4b;


