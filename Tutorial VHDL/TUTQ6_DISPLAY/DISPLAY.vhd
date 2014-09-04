library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DISPLAY is
  port( EN: in std_logic;
      X3, X2, X1, X0 : in std_logic;
      a, b, c, d, e, f, g : out std_logic);
end DISPLAY;

architecture Behavioral of DISPLAY is
begin
  a <= (not EN) and (((X3 xnor X1) and (X2 xnor X0)) or X3 or X1);
  b <= (not EN) and ((not X2) or (X1 xnor X0));
  c <= (not EN) and (X2 or (not X1) or X0);
  d <= (not EN) and (X3 or (X1 and (not X0)) or ((not X0) and (not X2)) or ((not X3) and X0 and (X2 xor X1)));
  e <= (not EN) and ((not X0) and (X1 or (not X2)));
  f <= (not EN) and (((not X1) and ((not X0) or X2)) or ((not X0) and X2) or X3);
  g <= (not EN) and ((X3 and (not X2)) or (X1 and (not X0)) or (X1 xor X2));
end Behavioral;