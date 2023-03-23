-- Multiplicador Sequencial - Package de matrizes
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE type_array IS

	TYPE output_mux IS ARRAY (4 DOWNTO 0) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	TYPE half_product IS ARRAY (3 DOWNTO 0) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	TYPE out_and_array IS ARRAY (4 DOWNTO 0) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	
	TYPE concatenated IS ARRAY (3 DOWNTO 0) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	TYPE MR_concatenated IS ARRAY (4 DOWNTO 0) OF STD_LOGIC_VECTOR (3 DOWNTO 0);
	
END type_array;