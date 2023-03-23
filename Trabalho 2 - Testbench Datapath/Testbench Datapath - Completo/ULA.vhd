-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_signed.all;

ENTITY  ULA IS

	PORT (
			data_a, data_b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			OpCode : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
			);

END ULA;

ARCHITECTURE comportamento OF ULA IS

	BEGIN
		
		WITH OpCode SELECT
		
			data_out <= 
					(data_a + data_b) WHEN "000000",
					(data_a - data_b) WHEN "000001",
					((data_a AND data_b) OR (NOT data_a)) WHEN "000010",
					(data_a AND data_b) WHEN "000011",
					(data_a OR data_b) WHEN "000100",
					(NOT data_a) WHEN "000101",
					(NOT data_b) WHEN "000110",
					"00000000" WHEN OTHERS;

END comportamento;