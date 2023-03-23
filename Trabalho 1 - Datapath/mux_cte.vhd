-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mux_cte IS

	PORT (
			data_b, const : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			sel : IN STD_LOGIC;
			data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);

END mux_cte;

ARCHITECTURE comportamento OF mux_cte IS
	
	BEGIN
	
		PROCESS (data_b, const, sel)
		
		BEGIN
		
			CASE sel IS
				
				WHEN '0' => data_out <= const;
				WHEN '1' => data_out <= data_b;
			
			END CASE;
		
		END PROCESS;

END comportamento;