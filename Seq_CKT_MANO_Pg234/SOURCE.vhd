-- Morrice Mano. 4th Edition Pg No. 234 and Fig. 5.25
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:55 03/22/2014 
-- Design Name: 
-- Module Name:    SOURCE - Behavioral 
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

entity SOURCE is
	port (X : in std_logic;
			CLK : in std_logic;
			O : out std_logic :='0');
end SOURCE;

architecture Behavioral of SOURCE is

begin
	pmain : process(CLK, X)
	variable NS0, NS1, NS2 : std_logic;
	variable PS0, PS1, PS2 : std_logic :='0';
	begin
		NS2 := PS0 and (not X) and PS1;
		NS1 := PS0 or (X and (PS1 or PS2));
		NS0 := X;
		if CLK'event and CLK='1' then
			PS2 := NS2;
			PS1 := NS1;
			PS0 := NS0;
			O <= X and (PS2 or (PS0 and PS1));
		end if;
	end process;
end Behavioral;

