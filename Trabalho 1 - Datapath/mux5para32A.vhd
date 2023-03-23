-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
USE work.type_array2.all;

ENTITY mux5para32A IS

	PORT (
			sel_A: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			data_in: IN array_reg;
			data_out_A: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);

END  mux5para32A;

ARCHITECTURE comportamento OF mux5para32A IS

	signal array_data_signal : STD_LOGIC_VECTOR (7 DOWNTO 0);

	BEGIN

	WITH sel_A SELECT
		
		array_data_signal <= data_in(0) WHEN "00000",
						data_in(1) WHEN "00001",
						data_in(2) WHEN "00010",
						data_in(3) WHEN "00011",
						data_in(4) WHEN "00100",
						data_in(5) WHEN "00101",
						data_in(6) WHEN "00110",
						data_in(7) WHEN "00111",
						data_in(8) WHEN "01000",
						data_in(9) WHEN "01001",
						data_in(10) WHEN "01010",
						data_in(11) WHEN "01011",
						data_in(12) WHEN "01100",
						data_in(13) WHEN "01101",
						data_in(14) WHEN "01110",
						data_in(15) WHEN "01111",
						data_in(16) WHEN "10000",
						data_in(17) WHEN "10001",
						data_in(18) WHEN "10010",
						data_in(19) WHEN "10011",
						data_in(20) WHEN "10100",
						data_in(21) WHEN "10101",
						data_in(22) WHEN "10110",
						data_in(23) WHEN "10111",
						data_in(24) WHEN "11000",
						data_in(25) WHEN "11001",
						data_in(26) WHEN "11010",
						data_in(27) WHEN "11011",
						data_in(28) WHEN "11100",
						data_in(29) WHEN "11101",
						data_in(30) WHEN "11110",
						data_in(31) WHEN "11111";
					
		data_out_A <= array_data_signal;		

END comportamento;