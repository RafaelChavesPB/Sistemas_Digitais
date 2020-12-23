library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor is
	generic(size:integer :=4);
	port(a,b: in std_logic_vector(size-1 downto 0);
			clk,reset: in std_logic;
			s,r: out std_logic_vector(size-1 downto 0);
			done: out std_logic);
end divisor;


architecture divisor of divisor is 
	signal a_in: std_logic_vector(2*size-1 downto 0):=(others =>'0'); 
	signal b_in: std_logic_vector(2*size-1 downto 0):=(others =>'0');
	signal res: std_logic_vector(size-1 downto 0):=(others =>'0');
	signal status: std_logic:='1';
begin 
	done<=status;
	main: process(clk,reset) 
	variable cont: integer :=0;
	begin
		if(reset = '1') then 
			cont:=0;
			status <='0';
			res<= (others => '0');
			a_in(size-1 downto 0)<=a;
			a_in(2*size-1 downto size)<=(others =>'0');
			b_in(size-1 downto 0)<=(others =>'0');
			b_in(2*size-1 downto size)<=b;
		elsif(clk'event and clk='0') then
			if(cont = size + 1 ) then
				status<='1';
				s<=res;
				r<=a_in(size-1 downto 0);
			else
				b_in(2*size-2 downto 0)<=b_in(2*size-1 downto 1);
				b_in(2*size-1)<='0';
				res(size-1 downto 1)<=res(size-2 downto 0);
				if(a_in >= b_in) then
					a_in <= std_logic_vector(signed(a_in)-signed(b_in));
					res(0)<='1';
				else
					res(0)<='0';
				end if;
			end if;
			cont:=cont+1;
		end if;
	end process;
end divisor;
