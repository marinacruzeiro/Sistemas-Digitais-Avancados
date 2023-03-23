-- Multiplicador Funcional Testbench

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY MultiplicadorFuncional_TB IS
END MultiplicadorFuncional_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF MultiplicadorFuncional_TB IS

	COMPONENT MultiplicadorFuncional IS
	
		PORT (
				A, B: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				S: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
				);
	
	END COMPONENT;
	
----------------------------------------------------------------------------
	-- Signals
	SIGNAL A_TB, B_TB: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL S_TB: STD_LOGIC_VECTOR (63 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		MF_TB: MultiplicadorFuncional 
				PORT MAP (A => A_TB, B => B_TB, S => S_TB);

END behavior;