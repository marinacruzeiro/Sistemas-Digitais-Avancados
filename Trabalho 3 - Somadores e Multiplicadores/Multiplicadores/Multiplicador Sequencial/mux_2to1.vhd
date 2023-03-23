-- Multiplicador Sequencial - Multiplexador
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mux_2to1 IS

	PORT (
			inputA, inputB: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			sel: IN STD_LOGIC;
			output: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);

END mux_2to1;

ARCHITECTURE behavior OF mux_2to1 IS

	BEGIN
	
		WITH sel SELECT
			
			output <= inputA WHEN '0',
						 inputB WHEN OTHERS;

END behavior;