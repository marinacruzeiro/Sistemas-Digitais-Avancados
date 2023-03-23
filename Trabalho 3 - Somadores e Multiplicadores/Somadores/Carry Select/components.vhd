LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE components IS

	COMPONENT BasicBuildingBlock IS
		PORT (
			A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cin: IN STD_LOGIC;
			Carry: OUT STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
	END COMPONENT;
	
	COMPONENT adder IS
		PORT (
			inA, inB, Cin: IN STD_LOGIC;
			output, carry: OUT STD_LOGIC
			);
	END COMPONENT;
	
	COMPONENT RippleCarry IS
		PORT (
			A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Carry_in: IN STD_LOGIC;
			Carry_out: OUT STD_LOGIC;
			output: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
	END COMPONENT;
	
	COMPONENT mux_2to1 IS
		PORT (
			inputA, inputB, sel: IN STD_LOGIC;
			output: OUT STD_LOGIC
			);
	END COMPONENT;

END components;