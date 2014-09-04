----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:21 03/10/2014 
-- Design Name: 
-- Module Name:    THREE_BIT_MULTIPLIER - Behavioral 
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

entity THREE_BIT_MULTIPLIER is
	port (a : in bit_vector(2 downto 0);
			b : in bit_vector(2 downto 0);
			p : out bit_vector(5 downto 0));
end THREE_BIT_MULTIPLIER;

architecture Behavioral of THREE_BIT_MULTIPLIER is
begin
	
	pmain : process(a, b)
		variable arr11 : bit_vector(3 downto 0);
		variable arr21 : bit_vector(3 downto 0);
		variable arr12 : bit_vector(3 downto 0);
		variable arr22 : bit_vector(3 downto 0);
		variable sum : bit_vector(3 downto 0);
		variable cout : bit;
		variable c: bit_vector(4 downto 0);
		begin
			arr11(3) := '0';
			arr21(0) := '0';
			arr22(0) := '0';
			for i in 0 to 2 loop
				arr11(i) := a(i) and b(0);
				arr21(i+1) := a(i) and b(1);
			end loop;
			
			c(0) := '0';
			sum(0) := arr11(0) xor arr21(0) xor c(0);
			
			c(1) := (c(0) and (arr11(0) xor arr21(0))) or (arr11(0) and arr21(0));
			sum(1) := arr11(1) xor arr21(1) xor c(1);
			
			c(2) := (c(1) and (arr11(1) xor arr21(1))) or (arr11(1) and arr21(1));
			sum(2) := arr11(2) xor arr21(2) xor c(2);
			
			c(3) := (c(2) and (arr11(2) xor arr21(2))) or (arr11(2) and arr21(2));
			sum(3) := arr11(3) xor arr21(3) xor c(3);
			
			c(4) := (c(3) and (arr11(3) xor arr21(3))) or (arr11(3) and arr21(3));
			cout := c(4);
			
			p(0)<=sum(0);
			
			for i in 0 to 2 loop
				arr12(i) := sum(i+1);
			end loop;
			
			arr12(3) := cout;
	
			for i in 0 to 2 loop
				arr22(i+1) := a(i) and b(2);
			end loop;
			
			c(0) := '0';
			sum(0) := arr12(0) xor arr22(0) xor c(0);
			c(1) := (c(0) and (arr12(0) xor arr22(0))) or (arr12(0) and arr22(0));
			sum(1) := arr12(1) xor arr22(1) xor c(1);
			c(2) := (c(1) and (arr12(1) xor arr22(1))) or (arr12(1) and arr22(1));
			sum(2) := arr12(2) xor arr22(2) xor c(2);
			c(3) := (c(2) and (arr12(2) xor arr22(2))) or (arr12(2) and arr22(2));
			sum(3) := arr12(3) xor arr22(3) xor c(3);
			c(4) := (c(3) and (arr12(3) xor arr22(3))) or (arr12(3) and arr22(3));
			cout := c(4);
		
			p(1)<=sum(0);
			
			for i in 1 to 3 loop
				p(i+1) <= sum(i);
			end loop;
			
			p(5) <= cout;
		end process;

end Behavioral;

