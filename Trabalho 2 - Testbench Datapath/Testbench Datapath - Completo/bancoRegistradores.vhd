-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY work;
USE work.type_array2.all;

ENTITY bancoRegistradores IS

-- 32 registradores de 8 bits cada
	PORT (
			data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			load : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			clock, clear : IN STD_LOGIC;
			data_out : OUT array_reg
			);

END bancoRegistradores;

ARCHITECTURE comportamento OF bancoRegistradores IS
	
	COMPONENT registrador 
		GENERIC (N : INTEGER:= 8);
		PORT (
				D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				load, clock, clear : IN STD_LOGIC;
				Q : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	END COMPONENT; 
	
	BEGIN
	
-- Gerar M-1 (32) registradores de 8 bits cada
		banco_reg: FOR i IN 0 TO 31 GENERATE
				regs: registrador	PORT MAP (d => data_in, load => load(i), clock => clock, clear => clear, Q => data_out(i));
		
		END GENERATE;
	
END comportamento;