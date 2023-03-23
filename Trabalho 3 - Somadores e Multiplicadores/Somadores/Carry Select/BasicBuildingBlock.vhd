-- Carry Select - Basic Building Block
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
--LIBRARY WORK;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
--USE work.components.all;

ENTITY BasicBuildingBlock IS

	PORT (
			A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Cin: IN STD_LOGIC;
			Carry: OUT STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
	
END BasicBuildingBlock;

ARCHITECTURE behavior OF BasicBuildingBlock IS

	-- Signals
	SIGNAL out0, out1: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL carry_0, carry_1: STD_LOGIC;
	SIGNAL carry_out_rc: STD_LOGIC;
	signal carry_in0 : std_LOGIC_VECTOR(4 downto 0);
	signal carry_in1 : std_LOGIC_VECTOR(4 downto 0);

---------------------------------------------------------

	COMPONENT adder IS
		PORT (
			inA, inB, Cin: IN STD_LOGIC;
			output, carry: OUT STD_LOGIC
			);
	END COMPONENT;
	
	COMPONENT mux_2to1 IS
		PORT (
			inputA, inputB, sel: IN STD_LOGIC;
			output: OUT STD_LOGIC
			);
	END COMPONENT;
	
	---------------------------------------------------------
	
	BEGIN
	
		carry_in0(0) <= '0'; 
		carry_in1(0) <= '1';

	
		-- Cria os somadores para Carry in em 0 e em 1 para os 4 bits
		add: FOR i IN 0 TO 3 GENERATE
		
			add_carry_0: adder PORT MAP (inA => A(i), inB => B(i), Cin => carry_in0(i), output => out0(i), carry => carry_in0(i+1));
			
			add_carry_1: adder PORT MAP (inA => A(i), inB => B(i), Cin => carry_in1(i), output => out1(i), carry => carry_in1(i+1));
		
		END GENERATE add;
		
		-- Multiplexadores para a escolha do resultado baseado no Carry in
		muxes: FOR i IN 0 TO 3 GENERATE
		
			mux1: mux_2to1 PORT MAP (inputA => out0(i), inputB => out1(i), sel => Cin, output => S(i));
		
		END GENERATE muxes;

		-- Multiplexador para a escolha do resultado final baseado no Carry in
		mux2: mux_2to1 PORT MAP (inputA => carry_in0(4), inputB => carry_in1(4), sel => Cin, output => Carry);

END behavior;