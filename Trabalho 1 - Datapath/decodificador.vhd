-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY decodificador IS

	PORT (
			selectC : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			to_load : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);

END decodificador;

ARCHITECTURE comportamento OF decodificador IS

	BEGIN
	
		data_out <= data_in;
		
		PROCESS (selectC)
		
		BEGIN
		
		CASE selectC IS
			
			WHEN "00000" => to_load <= "00000000000000000000000000000001";
			WHEN "00001" => to_load <= "00000000000000000000000000000010";
			WHEN "00010" => to_load <= "00000000000000000000000000000100";
			WHEN "00011" => to_load <= "00000000000000000000000000001000";
			WHEN "00100" => to_load <= "00000000000000000000000000010000";
			WHEN "00101" => to_load <= "00000000000000000000000000100000";
			WHEN "00110" => to_load <= "00000000000000000000000001000000";
			WHEN "00111" => to_load <= "00000000000000000000000010000000";
			WHEN "01000" => to_load <= "00000000000000000000000100000000";
			WHEN "01001" => to_load <= "00000000000000000000001000000000";
			WHEN "01010" => to_load <= "00000000000000000000010000000000";
			WHEN "01011" => to_load <= "00000000000000000000100000000000";
			WHEN "01100" => to_load <= "00000000000000000001000000000000";
			WHEN "01101" => to_load <= "00000000000000000010000000000000";
			WHEN "01110" => to_load <= "00000000000000000100000000000000";
			WHEN "01111" => to_load <= "00000000000000001000000000000000";
			WHEN "10000" => to_load <= "00000000000000010000000000000000";
			WHEN "10001" => to_load <= "00000000000000100000000000000000";
			WHEN "10010" => to_load <= "00000000000001000000000000000000";
			WHEN "10011" => to_load <= "00000000000010000000000000000000";
			WHEN "10100" => to_load <= "00000000000100000000000000000000";
			WHEN "10101" => to_load <= "00000000001000000000000000000000";
			WHEN "10110" => to_load <= "00000000010000000000000000000000";
			WHEN "10111" => to_load <= "00000000100000000000000000000000";
			WHEN "11000" => to_load <= "00000001000000000000000000000000";
			WHEN "11001" => to_load <= "00000010000000000000000000000000";
			WHEN "11010" => to_load <= "00000100000000000000000000000000";
			WHEN "11011" => to_load <= "00001000000000000000000000000000";
			WHEN "11100" => to_load <= "00010000000000000000000000000000";
			WHEN "11101" => to_load <= "00100000000000000000000000000000";
			WHEN "11110" => to_load <= "01000000000000000000000000000000";
			WHEN "11111" => to_load <= "10000000000000000000000000000000";
			
		END CASE;
		
		END PROCESS;
END comportamento;