-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FlipFlopD IS

		PORT (
				d, clock, load, clear : IN STD_LOGIC;
				q: OUT STD_LOGIC
				);
		
END FlipFlopD;

ARCHITECTURE comportamento OF FlipFlopD IS

	SIGNAL q_temp : STD_LOGIC;
	
	BEGIN
	
	processo1: PROCESS (clock, clear)
		
	BEGIN
	
		IF clear = '1' THEN
			
			q_temp <= '0';
		
		ELSE IF clock'EVENT AND clock = '1' THEN
			
			IF load = '1' THEN 
			
				q_temp <= d;
				--q_not <= NOT d;
				
			ELSE 
				
				q_temp <= q_temp;
				
			END IF;
			END IF;
			
		END IF;
		
	END PROCESS;
	
	q <= q_temp;
		
END comportamento;