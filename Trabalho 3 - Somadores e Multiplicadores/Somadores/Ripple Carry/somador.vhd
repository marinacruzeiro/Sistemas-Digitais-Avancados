-- Ripple Carry - Somador
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY somador IS

	PORT (
			A, B, Cin: IN STD_LOGIC;
			saida, carry: OUT STD_LOGIC
			);

END somador;

ARCHITECTURE behavior OF somador IS

	SIGNAL and1, and2, and3, xor1: STD_LOGIC;
	
	BEGIN
	
		and1 <= B AND Cin;
		and2 <= A AND Cin;
		and3 <= A AND B;
		xor1 <= A XOR B;
		
		carry <= and1 OR and2 OR and3;
		saida <= xor1 XOR Cin;

END behavior;