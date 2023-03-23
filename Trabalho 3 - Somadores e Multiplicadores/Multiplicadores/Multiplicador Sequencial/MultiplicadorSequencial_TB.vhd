-- Multiplicador Sequencial Testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY MultiplicadorSequencial_TB IS
END MultiplicadorSequencial_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF MultiplicadorSequencial_TB IS

	COMPONENT MultiplicadorSequencial 
		
		GENERIC (N: INTEGER := 4);
		PORT (
				MR, MD: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				PR: OUT STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0) -- dobro de bits do que está sendo multiplicado
				);
	
	END COMPONENT;
	
----------------------------------------------------------------------------
	-- Signals
	CONSTANT N : integer := 4;
	SIGNAL MR_TB, MD_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL PR_TB: STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		CS_TB: MultiplicadorSequencial
				GENERIC MAP (N => 4) 
				PORT MAP (MR => MR_TB, MD => MD_TB, PR => PR_TB);

END behavior;