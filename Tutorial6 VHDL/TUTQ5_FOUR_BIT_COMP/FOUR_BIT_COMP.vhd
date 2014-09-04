library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FOUR_BIT_COMP is
	port (X3, X2, X1, X0 : in std_logic;
			Y3, Y2, Y1, Y0 : in std_logic;
			G : out std_logic;
			L : out std_logic;
			E : out std_logic);
end FOUR_BIT_COMP;

architecture Behavioral of FOUR_BIT_COMP is
begin
	G <= (X3 and (not Y3)) or ((X3 xnor Y3) and (X2 and (not Y2))) or ((X3 xnor Y3) and (X2 xnor Y2) and (X1 and (not Y1))) or ((X3 xnor Y3) and (X2 xnor Y2) and (X1 xnor Y1) and (X0 and (not Y0)));
	L <= (Y3 and (not X3)) or ((X3 xnor Y3) and (Y2 and (not X2))) or ((X3 xnor Y3) and (X2 xnor Y2) and (Y1 and (not X1))) or ((X3 xnor Y3) and (X2 xnor Y2) and (X1 xnor Y1) and (Y0 and (not X0)));
	E <= (X3 xnor Y3) and (X2 xnor Y2) and (X1 xnor Y1) and (X0 xnor Y0);
	
end Behavioral;