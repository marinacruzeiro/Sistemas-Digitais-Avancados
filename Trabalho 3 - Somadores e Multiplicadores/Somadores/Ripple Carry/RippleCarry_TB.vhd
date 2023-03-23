-- Ripple Carry Testbench
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY RippleCarry_TB IS
END RippleCarry_TB;

----------------------------------------------------------------------------

ARCHITECTURE behavior OF RippleCarry_TB IS

	COMPONENT RippleCarry IS

		GENERIC (N: INTEGER := 4);
		PORT (
				A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Carry_in: IN STD_LOGIC;
				Carry_out: OUT STD_LOGIC;
				result: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	END COMPONENT;
	
----------------------------------------------------------------------------

	-- Signals
	CONSTANT N : integer := 4;
	SIGNAL A_TB, B_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	SIGNAL Carry_in_TB: STD_LOGIC;
	SIGNAL Carry_out_TB: STD_LOGIC;
	SIGNAL result_TB: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	
----------------------------------------------------------------------------

	BEGIN 
	
		-- Port Map
		RippleCarryTB: RippleCarry GENERIC MAP (N => 4) 
				PORT MAP (A => A_TB, B => B_TB, Carry_in => Carry_in_TB, Carry_out => Carry_out_TB, result => result_TB);
		
		

END behavior;