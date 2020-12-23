library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is
	component carry_select_adder is
		generic(size: integer:=8);
		port(a,b:in std_logic_vector(size-1 downto 0);
    		 cin:in std_logic;
        	 s:out std_logic_vector(size-1 downto 0);
        	 cout:out std_logic);
	end	component;
    signal a,b,s:std_logic_vector(7 downto 0);
    signal cin,cout:std_logic;
begin
	
    dut: carry_select_adder port map(a,b,cin,s,cout);
    cin<= '0' after 0ns,
	  '1' after 65ns;
a<=x"10" after 0ns,
   x"11" after 10ns,
   x"12" after 20ns,
   x"13" after 30ns,
   x"14" after 40ns,
   x"15" after 50ns,
   x"16" after 60ns,
   x"10" after 70ns,
   x"11" after 80ns,
   x"12" after 90ns,
   x"13" after 100ns,
   x"14" after 110ns,
   x"15" after 120ns,
   x"1f" after 130ns;
b<=x"13" after 0ns,
   x"12" after 10ns,
   x"11" after 20ns,
   x"13" after 30ns,
   x"12" after 40ns,
   x"11" after 50ns,
   x"13" after 60ns,
   x"12" after 70ns,
   x"11" after 80ns,
   x"13" after 90ns,
   x"12" after 100ns,
   x"11" after 110ns,
   x"13" after 120ns,
   x"81" after 130ns;
end test;
