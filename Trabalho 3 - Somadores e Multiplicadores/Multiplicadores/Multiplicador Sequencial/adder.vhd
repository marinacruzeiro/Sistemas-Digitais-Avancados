-- Multiplicador Sequencial - Somador
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder IS

	PORT (
			inA, inB, Cin: IN STD_LOGIC;
			output, carry: OUT STD_LOGIC
			);

END adder;

ARCHITECTURE behavior OF adder IS

	SIGNAL and1, and2, and3, xor1: STD_LOGIC;
	
	BEGIN
	
		and1 <= inB AND Cin;
		and2 <= inA AND Cin;
		and3 <= inA AND inB;
		xor1 <= inA XOR inB;
		
		carry <= and1 OR and2 OR and3;
		output <= xor1 XOR Cin;

END behavior;