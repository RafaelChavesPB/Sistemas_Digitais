library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is
	component divisor is
		generic(size:integer :=4);
		port(a,b: in std_logic_vector(size-1 downto 0);
			clk,reset: in std_logic;
			s,r: out std_logic_vector(size-1 downto 0);
			done: out std_logic);
	end component;
	signal clk:std_logic:='0';
	signal done:std_logic;
	signal reset:std_logic:='0';
	signal a:std_logic_vector(3 downto 0):="1111";
	signal b:std_logic_vector(3 downto 0):="0011";
	signal resto:std_logic_vector(3 downto 0):=(others=>'0');
	signal resp:std_logic_vector(3 downto 0):=(others=>'0');
	
begin 
	dut: divisor port map(a,b,clk,reset,resp,resto,done);
	process 
	begin
		reset<='0';
		wait for 10ns;
		reset<='1';
		wait for 10ns;
		reset<='0';
		for i in 0 to 10 loop
			clk<='0';
			wait for 10ns;
			clk<='1';
			wait for 10ns;
		end loop;
		wait;
	end process;
end test;
