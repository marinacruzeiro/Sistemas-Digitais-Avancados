-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY registrador IS 

	GENERIC (N : INTEGER:= 8);
	PORT (
			D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			load, clock, clear : IN STD_LOGIC;
			Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
			);

END registrador;

ARCHITECTURE comportamento OF registrador IS

	COMPONENT FlipFlopD

		PORT (
				d, clock, load, clear : IN STD_LOGIC;
				q: OUT STD_LOGIC
				);
		
	END COMPONENT;

	BEGIN
	
		reg: FOR i IN 0 TO N-1 GENERATE 
			reg1: FlipFlopD PORT MAP (d(i), clock, load, clear, q(i));
		END GENERATE;

END comportamento;