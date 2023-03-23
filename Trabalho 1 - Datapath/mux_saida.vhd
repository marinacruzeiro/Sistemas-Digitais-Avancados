-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mux_saida IS

	PORT (
			data_ula, data_ent : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			sel : IN STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);

END mux_saida;

ARCHITECTURE comportamento OF mux_saida IS

	BEGIN
	
		PROCESS (data_ula, data_ent, sel)
		
		BEGIN
		
			CASE sel IS
				
				WHEN '0' => data_out <= data_ent;
				WHEN '1' => data_out <= data_ula;
			
			END CASE;
		
		END PROCESS;

END comportamento;