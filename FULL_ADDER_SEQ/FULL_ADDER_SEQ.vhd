--FULL ADDER CKT with Carry bit stored in memory.


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:07:06 03/23/2014 
-- Design Name: 
-- Module Name:    FULL_ADDER_SEQ - Behavioral 
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

entity FULL_ADDER_SEQ is
	port (X, Y : in std_logic;
			S : out std_logic_vector(4 downto 0) :="00000";
			CLK : in std_logic);
end FULL_ADDER_SEQ;

architecture Behavioral of FULL_ADDER_SEQ is
	signal PC : std_logic:='0';
	signal NC : std_logic;
	begin
		pmain : process(CLK, X, Y)
			variable i: integer:=0;
			begin
				NC <= (PC and (X xor Y)) or (X and Y);
				if CLK'event then
					case i is
						when 4 => S(i) <= NC;
						when others => S(i) <= PC xor X xor Y;
						PC <= NC;
						i:= i+1;
					end case;
				end if;
	end process;
end Behavioral;

