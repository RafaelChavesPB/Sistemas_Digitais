library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is 
	component ci74hc595 is
		port (oe_b,rclk,srclr_b,srclk,ser: in std_logic;
			q:out std_logic_vector(7 downto 0);
			qh:out std_logic);
	end component;
	
	signal oe_b: std_logic:='1';
	signal rclk: std_logic:='1';
	signal srclr_b: std_logic:='1';
	signal srclk:std_logic:='1';
	signal ser:std_logic:='0';
	signal q: std_logic_vector(7 downto 0);
	signal qh: std_logic;
	
	signal byte_teste:std_logic_vector(7 downto 0):="10110110";
begin

	dut: ci74hc595 port map (oe_b,rclk,srclr_b,srclk,ser,q,qh);
	
	testar: process 
	begin
		for i in 0 to  7 loop
			srclk<= '1';
			ser<=byte_teste(i);
			wait for 10 ns;
			srclk<= '0';
			wait for 10 ns;
		end loop;
		rclk<= '1';
		wait for 10 ns;
		rclk<= '0';
		wait for 10 ns;
		oe_b<='0';
		wait for 10 ns;
		srclr_b<= '0';
		wait;
	end process;
end test;
