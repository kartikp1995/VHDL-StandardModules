----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:38 03/16/2014 
-- Design Name: 
-- Module Name:    ONE_BIT_COMP - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ONE_BIT_COMP is
	port (x, y : in std_logic;
			G: out std_logic;
			S: out std_logic;
			E: out std_logic);
end ONE_BIT_COMP;

architecture Behavioral of ONE_BIT_COMP is
begin
	G <= x and (not y);
	S <= not x and y;
	E <= x xnor y;
end Behavioral;

