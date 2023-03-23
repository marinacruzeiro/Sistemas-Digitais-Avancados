-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
USE work.type_array2.all;

ENTITY bancoCompleto IS

	PORT (
			data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			selectC : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			clock, clear : IN STD_LOGIC;
			data_out1 : OUT array_reg
			);

END bancoCompleto;

ARCHITECTURE comportamento OF bancoCompleto IS

	COMPONENT bancoRegistradores
		PORT (
			data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			load : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			clock, clear : IN STD_LOGIC;
			data_out : OUT array_reg
			);
	END COMPONENT;
	
	COMPONENT decodificador
		PORT (
			selectC : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			to_load : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL sig_load : STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL data : std_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL data_out_sig : array_reg;
	
	BEGIN
			
		bancoD: decodificador PORT MAP (selectC => selectC, data_in => data_in, to_load => sig_load, data_out => data);
			
		bancoR: bancoRegistradores PORT MAP (data_in => data, load => sig_load, clock => clock, clear => clear, data_out => data_out_sig); 
			
		data_out1 <= data_out_sig;
						
END comportamento;