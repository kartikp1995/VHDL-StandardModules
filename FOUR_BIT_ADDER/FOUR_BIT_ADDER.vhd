----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:52 03/04/2014 
-- Design Name: 
-- Module Name:    FULL_ADDER - Behavioral 
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

--Creating Module of 4-bit adder
entity FOUR_BIT_ADDER is
	port (a,b : in std_logic_vector (3 downto 0);
			cin : in std_logic;
			sum : out std_logic_vector (3 downto 0);
			cout: out std_logic);
	end FOUR_BIT_ADDER;

architecture FOUR_BIT_ADDER_STRUCTURE of FOUR_BIT_ADDER is
	signal c: std_logic_vector(4 downto 0);
	component FULL_ADDER_SRC
		port (x,y,cin :in std_logic;
				s,cout : out std_logic);
	end component;

	begin
		c(0) <= cin;
		FA0 : FULL_ADDER_SRC
				port map(a(0), b(0), c(0), sum(0), c(1));
		FA1 : FULL_ADDER_SRC
				port map(a(1), b(1), c(1), sum(1), c(2));
		FA2 : FULL_ADDER_SRC
				port map(a(2), b(2), c(2), sum(2), c(3));
		FA3 : FULL_ADDER_SRC
				port map(a(3), b(3), c(3), sum(3), c(4));
		cout <= c(4);
	end FOUR_BIT_ADDER_STRUCTURE;