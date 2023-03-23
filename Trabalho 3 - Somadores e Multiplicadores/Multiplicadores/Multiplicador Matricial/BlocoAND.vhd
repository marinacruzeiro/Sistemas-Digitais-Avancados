-- Multiplicador Matricial - Bloco AND
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY BlocoAND IS

	GENERIC (N: INTEGER := 32);
	PORT (
			A: IN STD_LOGIC;
			B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
			);

END BlocoAND;

ARCHITECTURE behavior OF BlocoAND IS

	BEGIN
	
		S(0) <= B(0) AND A;
		S(1) <= B(1) AND A;
		S(2) <= B(2) AND A;
		S(3) <= B(3) AND A;
		S(4) <= B(4) AND A;
		S(5) <= B(5) AND A;
		S(6) <= B(6) AND A;
		S(7) <= B(7) AND A;
		S(8) <= B(8) AND A;
		S(9) <= B(9) AND A;
		S(10) <= B(10) AND A;
		S(11) <= B(11) AND A;
		S(12) <= B(12) AND A;
		S(13) <= B(13) AND A;
		S(14) <= B(14) AND A;
		S(15) <= B(15) AND A;
		S(16) <= B(16) AND A;
		S(17) <= B(17) AND A;
		S(18) <= B(18) AND A;
		S(19) <= B(19) AND A;
		S(20) <= B(20) AND A;
		S(21) <= B(21) AND A;
		S(22) <= B(22) AND A;
		S(23) <= B(23) AND A;
		S(24) <= B(24) AND A;				
		S(25) <= B(25) AND A;				
		S(26) <= B(26) AND A;				
		S(27) <= B(27) AND A;
		S(28) <= B(28) AND A;
		S(29) <= B(29) AND A;
		S(30) <= B(30) AND A;
		S(31) <= B(31) AND A;
		
END behavior;