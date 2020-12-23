library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dd_module is
port(bit_in,clk,reset: in std_logic;
	  bit_out: out std_logic;
	  data_out: out std_logic_vector(3 downto 0));
end dd_module;


architecture dd_module of dd_module is
	signal data: std_logic_vector(3 downto 0):="0000";
	type state is (shift,add,reset_state);
	signal current_state: state := reset_state;
	signal const: std_logic_vector(3 downto 0):="0011";
begin
	main:process(clk,reset)
	begin 
		if(reset='1') then
			current_state<=reset_state;
		elsif (clk'event and clk='0') then
			if(current_state = add) then
				current_state<=shift;
			elsif(current_state=shift and data>="0101") then
				current_state<=add;
			else
				current_state<=shift;
			end if;
		end if;
	end process;
	
	process_state: process(current_state)  
	begin
		if(current_state=reset_state) then
			data<="0000";
		elsif(current_state=shift) then
			data(3 downto 1) <= data(2 downto 0);
			data(0) <= bit_in;
		elsif(current_state = add) then 
			data<=std_logic_vector(unsigned(data)+unsigned(const));
		end if;
	end process;
	
	bit_out<= data(3);
	data_out <= data;
end dd_module;
