-- Ripple Carry
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RippleCarry IS
	
	GENERIC (N: INTEGER := 4);
	PORT (
			A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			Carry_in: IN STD_LOGIC;
			Carry_out: OUT STD_LOGIC;
			result: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
			);

END RippleCarry;

ARCHITECTURE behavior OF RippleCarry IS

	COMPONENT somador
	
		PORT (
				A, B, Cin: IN STD_LOGIC;
				saida, carry: OUT STD_LOGIC
				);
	
	END COMPONENT;
	
	SIGNAL carry_signal: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	
	BEGIN
		
		somador01: somador PORT MAP (A => A(0), B => B(0), Cin => carry_in, saida => result(0), carry => carry_signal(0));
		
		RC_adder: FOR i IN 1 TO N-1 GENERATE
						RC: somador PORT MAP (A => A(i), B => B(i), Cin => carry_signal(i-1), saida => result(i), carry => carry_signal(i));
		END GENERATE;
		
		Carry_out <= carry_signal(N-1);
		
END behavior;