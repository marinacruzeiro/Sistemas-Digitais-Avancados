-- Multiplicador Matricial Testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY MultiplicadorMatricial_TB IS
END MultiplicadorMatricial_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF MultiplicadorMatricial_TB IS

	COMPONENT MultiplicadorMatricial IS
	
		GENERIC (N: INTEGER := 32);
		PORT (
				C, D: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				S: OUT STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0) -- dobro de bits do que está sendo multiplicado
				);
	
	END COMPONENT;
	
----------------------------------------------------------------------------
	-- Signals
	CONSTANT N : integer := 32;
	SIGNAL C_TB, D_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	--SIGNAL Cin_TB: STD_LOGIC;
	--SIGNAL Carry_TB: STD_LOGIC;
	SIGNAL S_TB: STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		CS_TB: MultiplicadorMatricial
				GENERIC MAP (N => 32) 
				PORT MAP (C => C_TB, D => D_TB, S => S_TB);

END behavior;