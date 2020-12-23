library ieee;
use ieee.std_logic_1164.all;

entity save_adder is 
	generic(n: integer :=4);
	port (a,b:in std_logic_vector(n-1 downto 0);
			s:out std_logic_vector(n downto 0);
			cin:in std_logic;
			cout:out std_logic);
end save_adder;

architecture save_adder of save_adder is
	component full_adder is
		port(a,b,cin:in std_logic; s,cout:out std_logic);
	end component;
	signal cin_top:std_logic_vector(n-1 downto 0);
	signal s_top:std_logic_vector(n downto 0);
	signal cout_top:std_logic_vector(n-1 downto 0);
	signal carry_down:std_logic_vector(n downto 0);
begin
	cin_top<=(0 => cin,others => '0');
	s_top(n)<='0';
	carry_down(0)<='0';
	cout<=carry_down(n);
	s(0)<=s_top(0);
	laco: for it in 0 to n-1 generate
		dut:full_adder port map(a(it),b(it),cin_top(it),s_top(it),cout_top(it));
		dut2:full_adder port map(s_top(it+1),cout_top(it),carry_down(it),s(it+1),carry_down(it+1));
	end generate;
end save_adder;
