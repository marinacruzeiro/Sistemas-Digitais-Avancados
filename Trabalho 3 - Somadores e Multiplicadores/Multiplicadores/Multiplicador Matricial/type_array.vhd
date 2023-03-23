-- Multiplicador Matricial - Package de matrizes
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE type_array IS

	TYPE S_array IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	TYPE concat_array IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	TYPE out_and_array IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
	
END type_array;