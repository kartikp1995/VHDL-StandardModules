library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FOUR_BIT_COMB_ADDSUB is
	port ( a0, a1, a2, a3 : in std_logic;
			b0, b1, b2, b3 : in std_logic;
			 m : in std_logic;
			 cout : out std_logic;
			 sum0, sum1, sum2, sum3 : out std_logic := '0';
			 overflow : out std_logic);
end FOUR_BIT_COMB_ADDSUB;

architecture Behavioral of FOUR_BIT_COMB_ADDSUB is
signal c0, c1, c2, c3, c4 : std_logic;
signal bsig : std_logic_vector(3 downto 0);
begin
	c0 <= m;
	process(b0, b1, b2, b3, m)
	begin
		if m='1' then
			bsig(0) <= not b0;
			bsig(1) <= not b1;
			bsig(2) <= not b2;
			bsig(3) <= not b3;
		elsif m='0' then
			bsig(0) <= b0;
			bsig(1) <= b1;
			bsig(2) <= b2;
			bsig(3) <= b3;
		end if;
	end process;		
	sum0 <= (a0 xor bsig(0)) xor c0;
	c1 <= (c0 and (a0 xor bsig(0))) or (a0 and bsig(0));
	sum1 <= (a1 xor bsig(1)) xor c1;
	c2 <= (c1 and (a1 xor bsig(1))) or (a1 and bsig(1));
	sum2 <= (a2 xor bsig(2)) xor c2;
	c3 <= (c2 and (a2 xor bsig(2))) or (a2 and bsig(2));
	sum3 <= (a3 xor bsig(3)) xor c3;
	c4 <= (c3 and (a3 xor bsig(3))) or (a3 and bsig(3));
	cout <= c4;
	overflow <= (c3 xor c4);	
end Behavioral;

