-- Test bench para o component cg_paridade.
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is
  component g_paridade is
	generic(n:integer:=4);
	port(input: in std_logic_vector(n-1 downto 0);
    	 b_par,b_impar: out std_logic);
  end component;
  signal input:std_logic_vector(3 downto 0);
  signal b_par,b_impar:std_logic;
begin
  paridade: g_paridade port map(input,b_par,b_impar);
  input<=x"0" after 0ns,
  		 x"1" after 10ns,
         x"2" after 20ns,
         x"3" after 30ns,
         x"4" after 40ns,
         x"5" after 50ns,
         x"6" after 60ns,
         x"7" after 70ns,
         x"8" after 80ns,
         x"9" after 90ns,
         x"a" after 100ns,
         x"b" after 110ns,
         x"c" after 120ns,
         x"d" after 130ns,
         x"e" after 140ns,
         x"f" after 150ns;
  
end test;
