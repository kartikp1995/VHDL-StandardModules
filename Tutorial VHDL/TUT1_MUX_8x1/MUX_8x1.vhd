library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8x1 is
  port (input7 : in std_logic;
      input6 : in std_logic;
      input5 : in std_logic;
      input4 : in std_logic;
      input3 : in std_logic;
      input2 : in std_logic;
      input1 : in std_logic;
      input0 : in std_logic;
      EN_L : in std_logic;
      SEL : in BIT_vector(2 downto 0);
      output : out std_logic := '0');
end MUX_8x1;

architecture Behavioral of MUX_8x1 is

begin
  p1 : process(SEL, EN_L, input0, input1, input2, input3, input4, input5, input6, input7)
    begin
      if EN_L = '0' then
        case SEL is
          when "000" => output<=input0;
          when "001" => output<=input1;
          when "010" => output<=input2;
          when "011" => output<=input3;
          when "100" => output<=input4;
          when "101" => output<=input5;
          when "110" => output<=input6;
          when "111" => output<=input7;
        end case;
      end if;
    end process;
end Behavioral;