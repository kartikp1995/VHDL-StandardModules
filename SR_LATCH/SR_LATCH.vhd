----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:34 03/21/2014 
-- Design Name: 
-- Module Name:    SR_LATCH - Behavioral 
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

entity SR_LATCH is
	port ( S, R, PS: in std_logic;
			 Q : out std_logic :='0';
			 Q_bar : out std_logic :='1');
end SR_LATCH;

architecture Behavioral of SR_LATCH is
signal intq : std_logic :='0';
signal intq_bar :std_logic :='1';
begin
	p1: process (S,R, intq_bar, intq)
	begin
		intq <= S nand intq_bar;
		intq_bar <= R nand intq;
		Q <= intq;
		Q_bar <= intq_bar;
	end process;
end Behavioral;

