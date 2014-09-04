library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SCH_SOL is
	port (A, B, C, D, E, F: in std_logic;
		O1,O2,O3,O4,O5,O6,O7,O8: out std_logic);
end SCH_SOL;

architecture Behavioral of SCH_SOL is

begin
	O1 <= A or B or C or D;
	O2 <= A or B or (not C) or D;
	O3 <= A or B or C or (not D);
	O4 <= A or B or (not(C and D));
	O5 <= not(E and F) and (not (C or D)); 
	O6 <= not(E and F) and C and (not D);
	O7 <= not(E and F) and (not C) and D;
	O8 <= not(E and F) and C and D;
end Behavioral;

