-- Carry Select
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
LIBRARY WORK;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE work.components.all;

ENTITY CarrySelect IS
	
	GENERIC (N: INTEGER := 8);
	PORT (
			A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			Carry_in: IN STD_LOGIC;
			Carry_out: OUT STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
			);

END CarrySelect;

ARCHITECTURE behavior OF CarrySelect IS

	SIGNAL internal_Cin: STD_LOGIC_VECTOR(N/4 DOWNTO 0);

	BEGIN
		
		internal_Cin(0) <= Carry_in;
			
		--  utiliza Basic Building Blocks
		BBB: FOR i IN 0 TO N/4-1 GENERATE
	
			bbb1: BasicBuildingBlock PORT MAP (A => A(((i+1)*4)-1 DOWNTO (i*4)), B => B(((i+1)*4)-1 DOWNTO (i*4)), Cin => internal_Cin(i), Carry => internal_Cin(i+1), S => S(((i+1)*4)-1 DOWNTO (i*4)));
			
		END GENERATE;
		
		carry_out <= internal_Cin(N/4);

END behavior;