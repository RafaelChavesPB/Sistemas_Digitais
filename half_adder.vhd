library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is 
	port(a,b: in std_logic;
    	 s,cout: out std_logic );
end half_adder;

architecture half_adder  of half_adder is
begin
	s<= a xor b ;
    cout<= a and b; 
end half_adder;
