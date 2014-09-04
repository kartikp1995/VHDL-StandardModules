----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:18:16 03/21/2014 
-- Design Name: 
-- Module Name:    Q1_VHDL - Behavioral 
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

entity Q1_VHDL is
	port (X, Y : out std_logic;
			A : in std_logic;
			CLK : in std_logic;
			S0, S1 : out std_logic :='0');
end Q1_VHDL;

architecture Behavioral of Q1_VHDL is
signal PS0, PS1 : std_logic:='0';
signal NS0, NS1 : std_logic;
begin
	pmain : process(CLK, A)
	begin
		NS1 <= A;
		NS0 <= ((not PS0) and (not A)) or ((not PS1) and PS0) or (PS1 and A);
		X <= ((not PS1) and PS0) or (PS1 and (not PS0) and (not A));
		Y <= PS0;
		if CLK'event and CLK='1' then
			PS0 <= NS0;
			PS1 <= NS1;
			S0 <= NS0;
			S1 <= NS1;
		end if;
	end process;
end Behavioral;

