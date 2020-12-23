library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is
	component crc is
		port(data,clk: in std_logic;
			  crc_out: out std_logic_vector(1 downto 0));
	end component;
	signal data: std_logic := '0';
	signal clk: std_logic := '0';
	signal crc_out: std_logic_vector(1 downto 0);
	signal data_test: std_logic_vector(7 downto 0):="11010100";
begin 
	
	dut: crc port map(data,clk,crc_out);
	teste:process
	begin
			for it in 7 downto 0 loop	
				clk<='1';
				data<=data_test(it);
				wait for 10 ns;
				clk <= '0';
				wait for 10 ns;
			end loop;
		wait for 10 ns;
		wait;
	end process;
end test;
