-- Multiplicador Matricial
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY WORK;
USE WORK.type_array.all;

ENTITY MultiplicadorMatricial IS

	GENERIC (N: INTEGER := 32);
	PORT (
			C, D: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0) -- dobro de bits do que está sendo multiplicado
			);

END MultiplicadorMatricial;

ARCHITECTURE behavior OF MultiplicadorMatricial IS

	-- Components:
	COMPONENT BlocoAND
	
		GENERIC (N: INTEGER := 32);
		PORT (
				A: IN STD_LOGIC;
				B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				S: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
					
	END COMPONENT;
	
	COMPONENT RippleCarry
		
		GENERIC (N: INTEGER := 32);
		PORT (
				A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Carry_in: IN STD_LOGIC;
				Carry_out: OUT STD_LOGIC;
				output: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	
	END COMPONENT;
---------------------------------------------------------

	-- Signals
	SIGNAL signal_carry: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL signal_S: S_array;					-- Recebe o sinal do resultado da soma
	SIGNAL signal_conc: concat_array; 		-- Recebe a concatenação do carry com o resultado até o penúltimo bit
	SIGNAL signal_out_and: out_and_array; 	-- Recebe os resultados das ANDs
	
---------------------------------------------------------
	
	BEGIN
		
		-- A multiplicação dos primeiros dois bits é feita antes para tratar do "carry" zero de entrada
		AND1: BlocoAND PORT MAP (A => C(0), B => D, S => signal_out_and(0));
		AND2: BlocoAND PORT MAP (A => C(1), B => D, S => signal_out_and(1));
		
		S(0) <= signal_out_and(0)(0); -- S(0) recebe o primeiro bit do primeiro bloco de and
		
		signal_conc(0) <= '0'& signal_out_and(0)(N-1 downto 1); -- Concatena 0 ao bit menos significativo do resultado do bloco and
		
		RC1: RippleCarry PORT MAP (A => signal_out_and(1), B => signal_conc(0), Carry_in => '0', Carry_out => signal_carry(0), output => signal_S(0));
		
		S(1) <= signal_S(0)(0); -- Recebe último bit do resultado da soma

		signal_conc(1) <= signal_carry(0) & signal_S(0)(N-1 downto 1); -- Concatena o carry out com o resultado até o penúltimo bit
		
		-- Gera as próximas multiplicações
		multi: FOR i IN 0 TO N-3 GENERATE
			
			AND3: BlocoAND PORT MAP (A => C(i+2), B => D, S => signal_out_and(i+2));
		
			RC1: RippleCarry PORT MAP (A => signal_out_and(i+2), B => signal_conc(i+1), Carry_in => '0', Carry_out => signal_carry(i+1), output => signal_S(i+1));
			
			S(i+2) <= signal_S(i+1)(0);
			signal_conc(i+2) <= signal_carry(i+1) & signal_S(i+1)(N-1 downto 1);
			
		END GENERATE;
		
		-- Designa os sinais finais para as saídas
		S(N*2-2 DOWNTO N) <= signal_S(16)(N-1 downto 1);
		S(N*2-1) <= signal_carry(16);
		
		
END behavior;