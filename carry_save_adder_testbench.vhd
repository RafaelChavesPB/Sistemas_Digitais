-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
end testbench;

architecture test of testbench is 

component carry_save_adder is
	generic(size: integer:=4);
    port( a,b:in std_logic_vector(size-1 downto 0);
    	  cin: in std_logic;	
    	  s:out std_logic_vector(size downto 0);
          cout:out std_logic);
end component;


signal a,b:std_logic_vector(3 downto 0);
signal s:std_logic_vector(4 downto 0);
signal cin,cout:std_logic;

begin

dut: carry_save_adder port map(a,b,cin,s,cout);

cin<= '0' after 0ns,
	  '1' after 65ns;
a<=x"0" after 0ns,
   x"1" after 10ns,
   x"2" after 20ns,
   x"3" after 30ns,
   x"4" after 40ns,
   x"5" after 50ns,
   x"6" after 60ns,
   x"0" after 70ns,
   x"1" after 80ns,
   x"2" after 90ns,
   x"3" after 100ns,
   x"4" after 110ns,
   x"5" after 120ns,
   x"8" after 130ns;
b<=x"3" after 0ns,
   x"2" after 10ns,
   x"1" after 20ns,
   x"3" after 30ns,
   x"2" after 40ns,
   x"1" after 50ns,
   x"3" after 60ns,
   x"2" after 70ns,
   x"1" after 80ns,
   x"3" after 90ns,
   x"2" after 100ns,
   x"1" after 110ns,
   x"3" after 120ns,
   x"7" after 130ns;


end test;
