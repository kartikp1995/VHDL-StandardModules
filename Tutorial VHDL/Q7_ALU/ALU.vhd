library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALU is
  port (SEL : in std_logic_vector(2 downto 0);
      Cin : in std_logic;
      M : in std_logic;
      A0, A1, A2, A3 : in std_logic;
      B0, B1, B2, B3 : in std_logic;
      OVR : out std_logic;
      COUT : out std_logic;
      F0, F1, F2, F3 : out std_logic);
end ALU;

architecture Behavioral of ALU is
signal c0, c1, c2, c3 : std_logic;
begin
  pmain : process(M, A0, A1, A2, A3, B0, B1, B2, B3, SEL, Cin)
  begin
    if SEL="000" and M='0' then
      if Cin='1' then
        F0 <= A0;
        F1 <= A1;
        F2 <= A2;
        F3  <= A3;
        OVR <= '0';
        COUT <= '0';
      elsif Cin='0' then
        F0 <= not A0;
        c0 <= A0;
        F1 <= A1 xnor A0;
        c1 <= A1 or A0;
        F2 <= A2 xnor (A1 or A0);
        c2 <= A2 or (A1 or A0);
        F3 <= A3 xnor (A2 or (A1 or A0));
        c3 <= A3 or (A2 or (A1 or A0));
        OVR <= (A3 or (A2 or (A1 or A0))) xor (A2 or (A1 or A0));
        COUT <= A3 or (A2 or (A1 or A0));
      end if;
    elsif SEL="000" and M='1' then
      F0 <= not A0;
      F1 <= not A1;
      F2 <= not A2;
      F3 <= not A3;
      COUT <= '0';
      OVR <= '0';
    elsif SEL="001" and M='0' then
      c0 <= (A0 and B0) or Cin;
      F0 <= (A0 and B0) xnor Cin;
      c1 <= (A1 and B1) or c0;
      F1 <= (A1 and B1) xnor c0;
      c2 <= (A2 and B2) or c1;
      F2 <= (A2 and B2) xnor c1;
      c3 <= (A3 and B3) or c2;
      F3 <= (A3 and B3) xnor c2;
      COUT <= c3;
      OVR <= '1';
    elsif SEL="001" and M='1' then
      F0 <= not (A0 and B0);
      F1 <= not (A1 and B1);
      F2 <= not (A2 and B2);
      F3 <= not (A3 and B3);
      COUT <= '0';
      OVR <= '0';
    elsif SEL="010" and M='0' then
      c0 <= (A0 and (not B0)) or Cin;
      F0 <= (A0 and (not B0)) xnor Cin;
      c1 <= (A1 and (not B1)) or c0;
      F1 <= (A1 and (not B1)) xnor c0;
      c2 <= (A2 and (not B2)) or c1;
      F2 <= (A2 and (not B2)) xnor c1;
      c3 <= (A3 and (not B3)) or c2;
      F3 <= (A3 and (not B3)) xnor c2;
      COUT <= c3;
      OVR <= c3 xor c2;
    elsif SEL="010" and M='1' then
      F0 <= not (A0 and (not B0));
      F1 <= not (A1 and (not B1));
      F2 <= not (A2 and (not B2));
      F3 <= not (A3 and (not B3));
      COUT <= '0';
      OVR <= '0';
    elsif SEL="011" and M='0' then
      if Cin = '0' then
        F0 <= '1';
        F1 <= '1';
        F2 <= '1';
        F3 <= '1';
        COUT <= '0';
        OVR <= '0';
      elsif Cin = '1' then
        F0 <= '0';
        F1 <= '0';
        F2 <= '0';
        F3 <= '0';
        COUT <= '1';
        OVR <= '1';
      end if;
    elsif SEL="011" and M='1' then
      F0 <= '1';
      F1 <= '1';
      F2 <= '1';
      F3 <= '1';
      COUT <= '0';
      OVR <= '0';
    elsif SEL="100" and M='0' then
      F0 <= (A0 xnor B0) xor Cin;
      c0 <= (Cin and (A0 xnor B0)) or (A0 and (not B0)) or A0;
      F1 <= (A1 xnor B1) xor c0;
      c1 <= (c0 and (A1 xnor B1)) or (A1 and (not B1)) or A0;
      F2 <= (A2 xnor B2) xor c1;
      c2 <= (c1 and (A2 xnor B2)) or (A2 and (not B2)) or A0;
      F3 <= (A3 xnor B3) xor c2;
      c3 <= (c2 and (A3 xnor B3)) or (A3 and (not B3)) or A0;
      COUT <= c3;
      OVR <= c3 xor c2;
    elsif SEL="100" and M='1' then
      F0 <= not (A0 or B0);
      F1 <= not (A1 or B1);
      F2 <= not (A2 or B2);
      F3 <= not (A3 or B3);
      COUT <= '0';
      OVR <= '0';
    elsif SEL="101" and M='0' then
      F0 <= (A0 or (not B0)) xor Cin;
      c0 <= (Cin and (A0 or (not B0))) or (A0 and B0);
      F1 <= (A1 or (not B1)) xor c0;
      c1 <= (c0 and (A1 or (not B1))) or (A1 and B1);
      F2 <= (A2 or (not B2)) xor c1;
      c2 <= (c1 and (A2 or (not B2))) or (A2 and B2);
      F3 <= (A3 or (not B3)) xor c2;
      c3 <= (c2 and (A3 or (not B3))) or (A3 and B3);
      COUT <= c3;
      OVR <= c3 xor c2;
    elsif SEL="101" and M='1' then
      F0 <= not B0;
      F1 <= not B1;
      F2 <= not B2;
      F3 <= not B3;
      COUT <= '0';
      OVR <= '0';
    elsif SEL="110" and M='1' then
      F0 <= A0 xor (not B0);
      F1 <= A1 xor (not B1);
      F2 <= A2 xor (not B2);
      F3 <= A3 xor (not B3);
    elsif SEL="110" and M='0' then
      F0 <= (A0 xor (not B0)) xor Cin;
	   c0 <= (Cin and (A0 or (not B0))) or (A0 and B0);
      F1 <= (A1 or (not B1)) xor c0;
      c1 <= (c0 and (A1 or (not B1))) or (A1 and B1);
      F2 <= (A2 or (not B2)) xor c1;
      c2 <= (c1 and (A2 or (not B2))) or (A2 and B2);
      F3 <= (A3 or (not B3)) xor c2;
      c3 <= (c2 and (A3 or (not B3))) or (A3 and B3);
      COUT <= c3;
      OVR <= c3 xor c2; 
    elsif SEL="111" and M='1' then
      F0 <= (A0 or (not B0));
      F1 <= A1 or (not B1);
      F2 <= A2 or (not B2);
      F3 <= A3 or (not B3);
    elsif SEL="111" and M='0' then
      F0 <= (A0 xor (not B0)) xor Cin;
  	   c0 <= (Cin and (A0 or (not B0))) or (A0 and B0);
      F1 <= (A1 or (not B1)) xor c0;
      c1 <= (c0 and (A1 or (not B1))) or (A1 and B1);
      F2 <= (A2 or (not B2)) xor c1;
      c2 <= (c1 and (A2 or (not B2))) or (A2 and B2);
      F3 <= (A3 or (not B3)) xor c2;
      c3 <= (c2 and (A3 or (not B3))) or (A3 and B3);
      COUT <= c3;
      OVR <= c3 xor c2;   
	 end if;	 
  end process;
end Behavioral;