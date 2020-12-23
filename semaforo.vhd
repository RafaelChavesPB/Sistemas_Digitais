library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
	generic(size: integer:= 255);
	port(red_ticks: in integer range 0 to size ;
		  yel_ticks: in integer range 0 to size ;
		  gre_ticks: in integer range 0 to size ;
		  clk: in std_logic;
		  reset: in std_logic;
		  led_red: out std_logic;
		  led_yel: out std_logic;
		  led_gre: out std_logic);
end semaforo;

architecture semaforo of semaforo is
	type state is (red,yellow,green);
	signal current_state : state:=yellow;
begin

	main: process(clk,reset)
		variable ticks: integer range 0 to size:= 0;
	begin
		if(reset='1') then 
			current_state <= yellow;
			ticks := 0 ;
		elsif (clk'event and clk ='0') then
			ticks := ticks +1;
			if( current_state = yellow and ticks = yel_ticks ) then
				current_state <= red;
				ticks := 0;
			elsif (current_state = red and ticks = red_ticks) then
				current_state <= green;
				ticks := 0;
			elsif (current_state = green and ticks = gre_ticks) then
				current_state <= green;
				ticks := 0;
			end if;
		end if;
	end process;
	
	atuador: process(current_state)
	begin
		if(current_state = red) then
			led_red <= '1';
			led_yel <= '0';
			led_gre <= '0';
		elsif (current_state = yellow) then
			led_red <= '0';
			led_yel <= '1';
			led_gre <= '0';
		elsif (current_state = green) then
			led_red <= '0';
			led_yel <= '0';
			led_gre <= '1';
		end if;
		
		
	end process;
end semaforo;
