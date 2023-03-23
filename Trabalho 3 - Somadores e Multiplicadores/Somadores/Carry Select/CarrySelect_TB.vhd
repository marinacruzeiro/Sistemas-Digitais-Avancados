-- Carry Select Testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY CarrySelect_TB IS
END CarrySelect_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF CarrySelect_TB IS

	COMPONENT CarrySelect IS
	
		GENERIC (N: INTEGER := 8);
		PORT (
				A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Carry_in: IN STD_LOGIC;
				Carry_out: OUT STD_LOGIC;
				S: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	
	END COMPONENT;
	
----------------------------------------------------------------------------
	-- Signals
	CONSTANT N : integer := 8;
	SIGNAL A_TB, B_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL Cin_TB: STD_LOGIC;
	SIGNAL Carry_TB: STD_LOGIC;
	SIGNAL S_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		CS_TB: CarrySelect
				GENERIC MAP (N => 8) 
				PORT MAP (A => A_TB, B => B_TB, Carry_in => Cin_TB, Carry_out => Carry_TB, S => S_TB);

END behavior;