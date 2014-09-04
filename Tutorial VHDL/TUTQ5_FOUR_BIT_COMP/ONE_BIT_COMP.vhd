library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ONE_BIT_COMP is
	port (x, y : in std_logic;
			G: out std_logic;
			L: out std_logic;
			E: out std_logic);
end ONE_BIT_COMP;

architecture Behavioral of ONE_BIT_COMP is
begin
	G <= x and (not y);
	L <= not x and y;
	E <= x xnor y;
end Behavioral;

