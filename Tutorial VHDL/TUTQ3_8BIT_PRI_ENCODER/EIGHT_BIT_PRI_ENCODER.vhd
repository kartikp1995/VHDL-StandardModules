library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EIGHT_BIT_PRI_ENCODER is
  port ( EI : in std_logic;
       I0 : in std_logic;
       I1 : in std_logic;
       I2 : in std_logic;
       I3 : in std_logic;
       I4 : in std_logic;
       I5 : in std_logic;
       I6 : in std_logic;
       I7 : in std_logic;
       A2 : out std_logic := '0';
       A1 : out std_logic := '0';
       A0 : out std_logic := '0';
       EO : out std_logic := '1';
       GS : out std_logic := '0');
end EIGHT_BIT_PRI_ENCODER;

architecture Behavioral of EIGHT_BIT_PRI_ENCODER is
begin
  p1: process(EI, I0, I1, I2, I3, I4, I5, I6, I7)
  begin
    if EI = '1' then
      A2 <= '1';
      A1 <= '1';
      A0 <= '1';
      GS <= '1';
      EO <= '1';
    elsif I7 = '0' then
      A2 <= '0';
      A1 <= '0';
      A0 <= '0';
      GS <= '0';
      EO <= '1';
    elsif I6 = '0' then
      A2 <= '0';
      A1 <= '0';
      A0 <= '1';
      GS <= '0';
      EO <= '1';
    elsif I5 = '0' then
      A2 <= '0';
      A1 <= '1';
      A0 <= '0';
      GS <= '0';
      EO <= '1';
    elsif I4 = '0' then
      A2 <= '0';
      A1 <= '1';
      A0 <= '1';
      GS <= '0';
      EO <= '1';
    elsif I3 = '0' then
      A2 <= '1';
      A1 <= '0';
      A0 <= '0';
      GS <= '0';
      EO <= '1';
    elsif I2 = '0' then
      A2 <= '1';
      A1 <= '0';
      A0 <= '1';
      GS <= '0';
      EO <= '1';
    elsif I1 = '0' then
      A2 <= '1';
      A1 <= '1';
      A0 <= '0';
      GS <= '0';
      EO <= '1';
    elsif I0 = '0' then
      A2 <= '1';
      A1 <= '1';
      A0 <= '1';
      GS <= '0';
      EO <= '1';
    else
      A2 <= '1';
      A1 <= '1';
      A0 <= '1';
      GS <= '1';
      EO <= '0'; 
    end if;
  end process;
end Behavioral;