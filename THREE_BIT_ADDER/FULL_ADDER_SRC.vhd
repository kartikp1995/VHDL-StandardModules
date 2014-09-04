----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:45:13 03/08/2014 
-- Design Name: 
-- Module Name:    FULL_ADDER_SRC - Behavioral 
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

entity FULL_ADDER_SRC is
	port (x,y,cin : in std_logic;
			s, cout : out std_logic);
end FULL_ADDER_SRC;

architecture Behavioral of FULL_ADDER_SRC is
	
begin
	s <= x xor y xor cin;
	cout <= (cin and (x xor y)) or (x and y);
end Behavioral;

