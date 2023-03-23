-- Multiplicador Funcional
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MultiplicadorFuncional IS

	PORT (
			A, B: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
			);

END MultiplicadorFuncional;

ARCHITECTURE behavior OF MultiplicadorFuncional IS

	signal input_a, input_b  : std_logic_vector(31 downto 0);
	signal output_a : integer;
	signal output_b : integer;
	signal output : integer;
	signal output_vector: std_logic_vector(63 downto 0);
	


	BEGIN
	
		input_a <= A;
		input_b <= B;
		
		-- This line demonstrates the unsigned case
		output_a <= to_integer(unsigned(input_a));
		output_b <= to_integer(unsigned(input_b));
	
		output <= output_a * output_b;
		
		output_vector <= std_logic_vector(to_unsigned(output, output_vector'length));

		S <= output_vector;
		
END behavior;