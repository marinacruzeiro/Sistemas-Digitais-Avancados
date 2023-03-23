-- Basic Building Block Testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY BBB_TB IS
END BBB_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF BBB_TB IS

	COMPONENT BasicBuildingBlock IS

		PORT (
			A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cin: IN STD_LOGIC;
			Carry: OUT STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
	
	END COMPONENT;
	
----------------------------------------------------------------------------

	-- Signals
	SIGNAL A_TB, B_TB: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL Cin_TB: STD_LOGIC;
	SIGNAL Carry_TB: STD_LOGIC;
	SIGNAL S_TB: STD_LOGIC_VECTOR (3 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		BBBTB: BasicBuildingBlock
				PORT MAP (A => A_TB, B => B_TB, Cin => Cin_TB, Carry => Carry_TB, S => S_TB);

END behavior;